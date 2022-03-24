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

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_657577 - BLOCK
    )
    :vars
    (
      ?auto_657578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657577 ?auto_657578 ) ( CLEAR ?auto_657577 ) ( HAND-EMPTY ) ( not ( = ?auto_657577 ?auto_657578 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_657577 ?auto_657578 )
      ( !PUTDOWN ?auto_657577 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_657584 - BLOCK
      ?auto_657585 - BLOCK
    )
    :vars
    (
      ?auto_657586 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_657584 ) ( ON ?auto_657585 ?auto_657586 ) ( CLEAR ?auto_657585 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_657584 ) ( not ( = ?auto_657584 ?auto_657585 ) ) ( not ( = ?auto_657584 ?auto_657586 ) ) ( not ( = ?auto_657585 ?auto_657586 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_657585 ?auto_657586 )
      ( !STACK ?auto_657585 ?auto_657584 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_657594 - BLOCK
      ?auto_657595 - BLOCK
    )
    :vars
    (
      ?auto_657596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657595 ?auto_657596 ) ( not ( = ?auto_657594 ?auto_657595 ) ) ( not ( = ?auto_657594 ?auto_657596 ) ) ( not ( = ?auto_657595 ?auto_657596 ) ) ( ON ?auto_657594 ?auto_657595 ) ( CLEAR ?auto_657594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_657594 )
      ( MAKE-2PILE ?auto_657594 ?auto_657595 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_657605 - BLOCK
      ?auto_657606 - BLOCK
      ?auto_657607 - BLOCK
    )
    :vars
    (
      ?auto_657608 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_657606 ) ( ON ?auto_657607 ?auto_657608 ) ( CLEAR ?auto_657607 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_657605 ) ( ON ?auto_657606 ?auto_657605 ) ( not ( = ?auto_657605 ?auto_657606 ) ) ( not ( = ?auto_657605 ?auto_657607 ) ) ( not ( = ?auto_657605 ?auto_657608 ) ) ( not ( = ?auto_657606 ?auto_657607 ) ) ( not ( = ?auto_657606 ?auto_657608 ) ) ( not ( = ?auto_657607 ?auto_657608 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_657607 ?auto_657608 )
      ( !STACK ?auto_657607 ?auto_657606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_657619 - BLOCK
      ?auto_657620 - BLOCK
      ?auto_657621 - BLOCK
    )
    :vars
    (
      ?auto_657622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657621 ?auto_657622 ) ( ON-TABLE ?auto_657619 ) ( not ( = ?auto_657619 ?auto_657620 ) ) ( not ( = ?auto_657619 ?auto_657621 ) ) ( not ( = ?auto_657619 ?auto_657622 ) ) ( not ( = ?auto_657620 ?auto_657621 ) ) ( not ( = ?auto_657620 ?auto_657622 ) ) ( not ( = ?auto_657621 ?auto_657622 ) ) ( CLEAR ?auto_657619 ) ( ON ?auto_657620 ?auto_657621 ) ( CLEAR ?auto_657620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_657619 ?auto_657620 )
      ( MAKE-3PILE ?auto_657619 ?auto_657620 ?auto_657621 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_657633 - BLOCK
      ?auto_657634 - BLOCK
      ?auto_657635 - BLOCK
    )
    :vars
    (
      ?auto_657636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657635 ?auto_657636 ) ( not ( = ?auto_657633 ?auto_657634 ) ) ( not ( = ?auto_657633 ?auto_657635 ) ) ( not ( = ?auto_657633 ?auto_657636 ) ) ( not ( = ?auto_657634 ?auto_657635 ) ) ( not ( = ?auto_657634 ?auto_657636 ) ) ( not ( = ?auto_657635 ?auto_657636 ) ) ( ON ?auto_657634 ?auto_657635 ) ( ON ?auto_657633 ?auto_657634 ) ( CLEAR ?auto_657633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_657633 )
      ( MAKE-3PILE ?auto_657633 ?auto_657634 ?auto_657635 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_657648 - BLOCK
      ?auto_657649 - BLOCK
      ?auto_657650 - BLOCK
      ?auto_657651 - BLOCK
    )
    :vars
    (
      ?auto_657652 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_657650 ) ( ON ?auto_657651 ?auto_657652 ) ( CLEAR ?auto_657651 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_657648 ) ( ON ?auto_657649 ?auto_657648 ) ( ON ?auto_657650 ?auto_657649 ) ( not ( = ?auto_657648 ?auto_657649 ) ) ( not ( = ?auto_657648 ?auto_657650 ) ) ( not ( = ?auto_657648 ?auto_657651 ) ) ( not ( = ?auto_657648 ?auto_657652 ) ) ( not ( = ?auto_657649 ?auto_657650 ) ) ( not ( = ?auto_657649 ?auto_657651 ) ) ( not ( = ?auto_657649 ?auto_657652 ) ) ( not ( = ?auto_657650 ?auto_657651 ) ) ( not ( = ?auto_657650 ?auto_657652 ) ) ( not ( = ?auto_657651 ?auto_657652 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_657651 ?auto_657652 )
      ( !STACK ?auto_657651 ?auto_657650 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_657666 - BLOCK
      ?auto_657667 - BLOCK
      ?auto_657668 - BLOCK
      ?auto_657669 - BLOCK
    )
    :vars
    (
      ?auto_657670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657669 ?auto_657670 ) ( ON-TABLE ?auto_657666 ) ( ON ?auto_657667 ?auto_657666 ) ( not ( = ?auto_657666 ?auto_657667 ) ) ( not ( = ?auto_657666 ?auto_657668 ) ) ( not ( = ?auto_657666 ?auto_657669 ) ) ( not ( = ?auto_657666 ?auto_657670 ) ) ( not ( = ?auto_657667 ?auto_657668 ) ) ( not ( = ?auto_657667 ?auto_657669 ) ) ( not ( = ?auto_657667 ?auto_657670 ) ) ( not ( = ?auto_657668 ?auto_657669 ) ) ( not ( = ?auto_657668 ?auto_657670 ) ) ( not ( = ?auto_657669 ?auto_657670 ) ) ( CLEAR ?auto_657667 ) ( ON ?auto_657668 ?auto_657669 ) ( CLEAR ?auto_657668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_657666 ?auto_657667 ?auto_657668 )
      ( MAKE-4PILE ?auto_657666 ?auto_657667 ?auto_657668 ?auto_657669 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_657684 - BLOCK
      ?auto_657685 - BLOCK
      ?auto_657686 - BLOCK
      ?auto_657687 - BLOCK
    )
    :vars
    (
      ?auto_657688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657687 ?auto_657688 ) ( ON-TABLE ?auto_657684 ) ( not ( = ?auto_657684 ?auto_657685 ) ) ( not ( = ?auto_657684 ?auto_657686 ) ) ( not ( = ?auto_657684 ?auto_657687 ) ) ( not ( = ?auto_657684 ?auto_657688 ) ) ( not ( = ?auto_657685 ?auto_657686 ) ) ( not ( = ?auto_657685 ?auto_657687 ) ) ( not ( = ?auto_657685 ?auto_657688 ) ) ( not ( = ?auto_657686 ?auto_657687 ) ) ( not ( = ?auto_657686 ?auto_657688 ) ) ( not ( = ?auto_657687 ?auto_657688 ) ) ( ON ?auto_657686 ?auto_657687 ) ( CLEAR ?auto_657684 ) ( ON ?auto_657685 ?auto_657686 ) ( CLEAR ?auto_657685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_657684 ?auto_657685 )
      ( MAKE-4PILE ?auto_657684 ?auto_657685 ?auto_657686 ?auto_657687 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_657702 - BLOCK
      ?auto_657703 - BLOCK
      ?auto_657704 - BLOCK
      ?auto_657705 - BLOCK
    )
    :vars
    (
      ?auto_657706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657705 ?auto_657706 ) ( not ( = ?auto_657702 ?auto_657703 ) ) ( not ( = ?auto_657702 ?auto_657704 ) ) ( not ( = ?auto_657702 ?auto_657705 ) ) ( not ( = ?auto_657702 ?auto_657706 ) ) ( not ( = ?auto_657703 ?auto_657704 ) ) ( not ( = ?auto_657703 ?auto_657705 ) ) ( not ( = ?auto_657703 ?auto_657706 ) ) ( not ( = ?auto_657704 ?auto_657705 ) ) ( not ( = ?auto_657704 ?auto_657706 ) ) ( not ( = ?auto_657705 ?auto_657706 ) ) ( ON ?auto_657704 ?auto_657705 ) ( ON ?auto_657703 ?auto_657704 ) ( ON ?auto_657702 ?auto_657703 ) ( CLEAR ?auto_657702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_657702 )
      ( MAKE-4PILE ?auto_657702 ?auto_657703 ?auto_657704 ?auto_657705 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_657721 - BLOCK
      ?auto_657722 - BLOCK
      ?auto_657723 - BLOCK
      ?auto_657724 - BLOCK
      ?auto_657725 - BLOCK
    )
    :vars
    (
      ?auto_657726 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_657724 ) ( ON ?auto_657725 ?auto_657726 ) ( CLEAR ?auto_657725 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_657721 ) ( ON ?auto_657722 ?auto_657721 ) ( ON ?auto_657723 ?auto_657722 ) ( ON ?auto_657724 ?auto_657723 ) ( not ( = ?auto_657721 ?auto_657722 ) ) ( not ( = ?auto_657721 ?auto_657723 ) ) ( not ( = ?auto_657721 ?auto_657724 ) ) ( not ( = ?auto_657721 ?auto_657725 ) ) ( not ( = ?auto_657721 ?auto_657726 ) ) ( not ( = ?auto_657722 ?auto_657723 ) ) ( not ( = ?auto_657722 ?auto_657724 ) ) ( not ( = ?auto_657722 ?auto_657725 ) ) ( not ( = ?auto_657722 ?auto_657726 ) ) ( not ( = ?auto_657723 ?auto_657724 ) ) ( not ( = ?auto_657723 ?auto_657725 ) ) ( not ( = ?auto_657723 ?auto_657726 ) ) ( not ( = ?auto_657724 ?auto_657725 ) ) ( not ( = ?auto_657724 ?auto_657726 ) ) ( not ( = ?auto_657725 ?auto_657726 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_657725 ?auto_657726 )
      ( !STACK ?auto_657725 ?auto_657724 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_657743 - BLOCK
      ?auto_657744 - BLOCK
      ?auto_657745 - BLOCK
      ?auto_657746 - BLOCK
      ?auto_657747 - BLOCK
    )
    :vars
    (
      ?auto_657748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657747 ?auto_657748 ) ( ON-TABLE ?auto_657743 ) ( ON ?auto_657744 ?auto_657743 ) ( ON ?auto_657745 ?auto_657744 ) ( not ( = ?auto_657743 ?auto_657744 ) ) ( not ( = ?auto_657743 ?auto_657745 ) ) ( not ( = ?auto_657743 ?auto_657746 ) ) ( not ( = ?auto_657743 ?auto_657747 ) ) ( not ( = ?auto_657743 ?auto_657748 ) ) ( not ( = ?auto_657744 ?auto_657745 ) ) ( not ( = ?auto_657744 ?auto_657746 ) ) ( not ( = ?auto_657744 ?auto_657747 ) ) ( not ( = ?auto_657744 ?auto_657748 ) ) ( not ( = ?auto_657745 ?auto_657746 ) ) ( not ( = ?auto_657745 ?auto_657747 ) ) ( not ( = ?auto_657745 ?auto_657748 ) ) ( not ( = ?auto_657746 ?auto_657747 ) ) ( not ( = ?auto_657746 ?auto_657748 ) ) ( not ( = ?auto_657747 ?auto_657748 ) ) ( CLEAR ?auto_657745 ) ( ON ?auto_657746 ?auto_657747 ) ( CLEAR ?auto_657746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_657743 ?auto_657744 ?auto_657745 ?auto_657746 )
      ( MAKE-5PILE ?auto_657743 ?auto_657744 ?auto_657745 ?auto_657746 ?auto_657747 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_657765 - BLOCK
      ?auto_657766 - BLOCK
      ?auto_657767 - BLOCK
      ?auto_657768 - BLOCK
      ?auto_657769 - BLOCK
    )
    :vars
    (
      ?auto_657770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657769 ?auto_657770 ) ( ON-TABLE ?auto_657765 ) ( ON ?auto_657766 ?auto_657765 ) ( not ( = ?auto_657765 ?auto_657766 ) ) ( not ( = ?auto_657765 ?auto_657767 ) ) ( not ( = ?auto_657765 ?auto_657768 ) ) ( not ( = ?auto_657765 ?auto_657769 ) ) ( not ( = ?auto_657765 ?auto_657770 ) ) ( not ( = ?auto_657766 ?auto_657767 ) ) ( not ( = ?auto_657766 ?auto_657768 ) ) ( not ( = ?auto_657766 ?auto_657769 ) ) ( not ( = ?auto_657766 ?auto_657770 ) ) ( not ( = ?auto_657767 ?auto_657768 ) ) ( not ( = ?auto_657767 ?auto_657769 ) ) ( not ( = ?auto_657767 ?auto_657770 ) ) ( not ( = ?auto_657768 ?auto_657769 ) ) ( not ( = ?auto_657768 ?auto_657770 ) ) ( not ( = ?auto_657769 ?auto_657770 ) ) ( ON ?auto_657768 ?auto_657769 ) ( CLEAR ?auto_657766 ) ( ON ?auto_657767 ?auto_657768 ) ( CLEAR ?auto_657767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_657765 ?auto_657766 ?auto_657767 )
      ( MAKE-5PILE ?auto_657765 ?auto_657766 ?auto_657767 ?auto_657768 ?auto_657769 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_657787 - BLOCK
      ?auto_657788 - BLOCK
      ?auto_657789 - BLOCK
      ?auto_657790 - BLOCK
      ?auto_657791 - BLOCK
    )
    :vars
    (
      ?auto_657792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657791 ?auto_657792 ) ( ON-TABLE ?auto_657787 ) ( not ( = ?auto_657787 ?auto_657788 ) ) ( not ( = ?auto_657787 ?auto_657789 ) ) ( not ( = ?auto_657787 ?auto_657790 ) ) ( not ( = ?auto_657787 ?auto_657791 ) ) ( not ( = ?auto_657787 ?auto_657792 ) ) ( not ( = ?auto_657788 ?auto_657789 ) ) ( not ( = ?auto_657788 ?auto_657790 ) ) ( not ( = ?auto_657788 ?auto_657791 ) ) ( not ( = ?auto_657788 ?auto_657792 ) ) ( not ( = ?auto_657789 ?auto_657790 ) ) ( not ( = ?auto_657789 ?auto_657791 ) ) ( not ( = ?auto_657789 ?auto_657792 ) ) ( not ( = ?auto_657790 ?auto_657791 ) ) ( not ( = ?auto_657790 ?auto_657792 ) ) ( not ( = ?auto_657791 ?auto_657792 ) ) ( ON ?auto_657790 ?auto_657791 ) ( ON ?auto_657789 ?auto_657790 ) ( CLEAR ?auto_657787 ) ( ON ?auto_657788 ?auto_657789 ) ( CLEAR ?auto_657788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_657787 ?auto_657788 )
      ( MAKE-5PILE ?auto_657787 ?auto_657788 ?auto_657789 ?auto_657790 ?auto_657791 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_657809 - BLOCK
      ?auto_657810 - BLOCK
      ?auto_657811 - BLOCK
      ?auto_657812 - BLOCK
      ?auto_657813 - BLOCK
    )
    :vars
    (
      ?auto_657814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657813 ?auto_657814 ) ( not ( = ?auto_657809 ?auto_657810 ) ) ( not ( = ?auto_657809 ?auto_657811 ) ) ( not ( = ?auto_657809 ?auto_657812 ) ) ( not ( = ?auto_657809 ?auto_657813 ) ) ( not ( = ?auto_657809 ?auto_657814 ) ) ( not ( = ?auto_657810 ?auto_657811 ) ) ( not ( = ?auto_657810 ?auto_657812 ) ) ( not ( = ?auto_657810 ?auto_657813 ) ) ( not ( = ?auto_657810 ?auto_657814 ) ) ( not ( = ?auto_657811 ?auto_657812 ) ) ( not ( = ?auto_657811 ?auto_657813 ) ) ( not ( = ?auto_657811 ?auto_657814 ) ) ( not ( = ?auto_657812 ?auto_657813 ) ) ( not ( = ?auto_657812 ?auto_657814 ) ) ( not ( = ?auto_657813 ?auto_657814 ) ) ( ON ?auto_657812 ?auto_657813 ) ( ON ?auto_657811 ?auto_657812 ) ( ON ?auto_657810 ?auto_657811 ) ( ON ?auto_657809 ?auto_657810 ) ( CLEAR ?auto_657809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_657809 )
      ( MAKE-5PILE ?auto_657809 ?auto_657810 ?auto_657811 ?auto_657812 ?auto_657813 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_657832 - BLOCK
      ?auto_657833 - BLOCK
      ?auto_657834 - BLOCK
      ?auto_657835 - BLOCK
      ?auto_657836 - BLOCK
      ?auto_657837 - BLOCK
    )
    :vars
    (
      ?auto_657838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_657836 ) ( ON ?auto_657837 ?auto_657838 ) ( CLEAR ?auto_657837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_657832 ) ( ON ?auto_657833 ?auto_657832 ) ( ON ?auto_657834 ?auto_657833 ) ( ON ?auto_657835 ?auto_657834 ) ( ON ?auto_657836 ?auto_657835 ) ( not ( = ?auto_657832 ?auto_657833 ) ) ( not ( = ?auto_657832 ?auto_657834 ) ) ( not ( = ?auto_657832 ?auto_657835 ) ) ( not ( = ?auto_657832 ?auto_657836 ) ) ( not ( = ?auto_657832 ?auto_657837 ) ) ( not ( = ?auto_657832 ?auto_657838 ) ) ( not ( = ?auto_657833 ?auto_657834 ) ) ( not ( = ?auto_657833 ?auto_657835 ) ) ( not ( = ?auto_657833 ?auto_657836 ) ) ( not ( = ?auto_657833 ?auto_657837 ) ) ( not ( = ?auto_657833 ?auto_657838 ) ) ( not ( = ?auto_657834 ?auto_657835 ) ) ( not ( = ?auto_657834 ?auto_657836 ) ) ( not ( = ?auto_657834 ?auto_657837 ) ) ( not ( = ?auto_657834 ?auto_657838 ) ) ( not ( = ?auto_657835 ?auto_657836 ) ) ( not ( = ?auto_657835 ?auto_657837 ) ) ( not ( = ?auto_657835 ?auto_657838 ) ) ( not ( = ?auto_657836 ?auto_657837 ) ) ( not ( = ?auto_657836 ?auto_657838 ) ) ( not ( = ?auto_657837 ?auto_657838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_657837 ?auto_657838 )
      ( !STACK ?auto_657837 ?auto_657836 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_657858 - BLOCK
      ?auto_657859 - BLOCK
      ?auto_657860 - BLOCK
      ?auto_657861 - BLOCK
      ?auto_657862 - BLOCK
      ?auto_657863 - BLOCK
    )
    :vars
    (
      ?auto_657864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657863 ?auto_657864 ) ( ON-TABLE ?auto_657858 ) ( ON ?auto_657859 ?auto_657858 ) ( ON ?auto_657860 ?auto_657859 ) ( ON ?auto_657861 ?auto_657860 ) ( not ( = ?auto_657858 ?auto_657859 ) ) ( not ( = ?auto_657858 ?auto_657860 ) ) ( not ( = ?auto_657858 ?auto_657861 ) ) ( not ( = ?auto_657858 ?auto_657862 ) ) ( not ( = ?auto_657858 ?auto_657863 ) ) ( not ( = ?auto_657858 ?auto_657864 ) ) ( not ( = ?auto_657859 ?auto_657860 ) ) ( not ( = ?auto_657859 ?auto_657861 ) ) ( not ( = ?auto_657859 ?auto_657862 ) ) ( not ( = ?auto_657859 ?auto_657863 ) ) ( not ( = ?auto_657859 ?auto_657864 ) ) ( not ( = ?auto_657860 ?auto_657861 ) ) ( not ( = ?auto_657860 ?auto_657862 ) ) ( not ( = ?auto_657860 ?auto_657863 ) ) ( not ( = ?auto_657860 ?auto_657864 ) ) ( not ( = ?auto_657861 ?auto_657862 ) ) ( not ( = ?auto_657861 ?auto_657863 ) ) ( not ( = ?auto_657861 ?auto_657864 ) ) ( not ( = ?auto_657862 ?auto_657863 ) ) ( not ( = ?auto_657862 ?auto_657864 ) ) ( not ( = ?auto_657863 ?auto_657864 ) ) ( CLEAR ?auto_657861 ) ( ON ?auto_657862 ?auto_657863 ) ( CLEAR ?auto_657862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_657858 ?auto_657859 ?auto_657860 ?auto_657861 ?auto_657862 )
      ( MAKE-6PILE ?auto_657858 ?auto_657859 ?auto_657860 ?auto_657861 ?auto_657862 ?auto_657863 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_657884 - BLOCK
      ?auto_657885 - BLOCK
      ?auto_657886 - BLOCK
      ?auto_657887 - BLOCK
      ?auto_657888 - BLOCK
      ?auto_657889 - BLOCK
    )
    :vars
    (
      ?auto_657890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657889 ?auto_657890 ) ( ON-TABLE ?auto_657884 ) ( ON ?auto_657885 ?auto_657884 ) ( ON ?auto_657886 ?auto_657885 ) ( not ( = ?auto_657884 ?auto_657885 ) ) ( not ( = ?auto_657884 ?auto_657886 ) ) ( not ( = ?auto_657884 ?auto_657887 ) ) ( not ( = ?auto_657884 ?auto_657888 ) ) ( not ( = ?auto_657884 ?auto_657889 ) ) ( not ( = ?auto_657884 ?auto_657890 ) ) ( not ( = ?auto_657885 ?auto_657886 ) ) ( not ( = ?auto_657885 ?auto_657887 ) ) ( not ( = ?auto_657885 ?auto_657888 ) ) ( not ( = ?auto_657885 ?auto_657889 ) ) ( not ( = ?auto_657885 ?auto_657890 ) ) ( not ( = ?auto_657886 ?auto_657887 ) ) ( not ( = ?auto_657886 ?auto_657888 ) ) ( not ( = ?auto_657886 ?auto_657889 ) ) ( not ( = ?auto_657886 ?auto_657890 ) ) ( not ( = ?auto_657887 ?auto_657888 ) ) ( not ( = ?auto_657887 ?auto_657889 ) ) ( not ( = ?auto_657887 ?auto_657890 ) ) ( not ( = ?auto_657888 ?auto_657889 ) ) ( not ( = ?auto_657888 ?auto_657890 ) ) ( not ( = ?auto_657889 ?auto_657890 ) ) ( ON ?auto_657888 ?auto_657889 ) ( CLEAR ?auto_657886 ) ( ON ?auto_657887 ?auto_657888 ) ( CLEAR ?auto_657887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_657884 ?auto_657885 ?auto_657886 ?auto_657887 )
      ( MAKE-6PILE ?auto_657884 ?auto_657885 ?auto_657886 ?auto_657887 ?auto_657888 ?auto_657889 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_657910 - BLOCK
      ?auto_657911 - BLOCK
      ?auto_657912 - BLOCK
      ?auto_657913 - BLOCK
      ?auto_657914 - BLOCK
      ?auto_657915 - BLOCK
    )
    :vars
    (
      ?auto_657916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657915 ?auto_657916 ) ( ON-TABLE ?auto_657910 ) ( ON ?auto_657911 ?auto_657910 ) ( not ( = ?auto_657910 ?auto_657911 ) ) ( not ( = ?auto_657910 ?auto_657912 ) ) ( not ( = ?auto_657910 ?auto_657913 ) ) ( not ( = ?auto_657910 ?auto_657914 ) ) ( not ( = ?auto_657910 ?auto_657915 ) ) ( not ( = ?auto_657910 ?auto_657916 ) ) ( not ( = ?auto_657911 ?auto_657912 ) ) ( not ( = ?auto_657911 ?auto_657913 ) ) ( not ( = ?auto_657911 ?auto_657914 ) ) ( not ( = ?auto_657911 ?auto_657915 ) ) ( not ( = ?auto_657911 ?auto_657916 ) ) ( not ( = ?auto_657912 ?auto_657913 ) ) ( not ( = ?auto_657912 ?auto_657914 ) ) ( not ( = ?auto_657912 ?auto_657915 ) ) ( not ( = ?auto_657912 ?auto_657916 ) ) ( not ( = ?auto_657913 ?auto_657914 ) ) ( not ( = ?auto_657913 ?auto_657915 ) ) ( not ( = ?auto_657913 ?auto_657916 ) ) ( not ( = ?auto_657914 ?auto_657915 ) ) ( not ( = ?auto_657914 ?auto_657916 ) ) ( not ( = ?auto_657915 ?auto_657916 ) ) ( ON ?auto_657914 ?auto_657915 ) ( ON ?auto_657913 ?auto_657914 ) ( CLEAR ?auto_657911 ) ( ON ?auto_657912 ?auto_657913 ) ( CLEAR ?auto_657912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_657910 ?auto_657911 ?auto_657912 )
      ( MAKE-6PILE ?auto_657910 ?auto_657911 ?auto_657912 ?auto_657913 ?auto_657914 ?auto_657915 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_657936 - BLOCK
      ?auto_657937 - BLOCK
      ?auto_657938 - BLOCK
      ?auto_657939 - BLOCK
      ?auto_657940 - BLOCK
      ?auto_657941 - BLOCK
    )
    :vars
    (
      ?auto_657942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657941 ?auto_657942 ) ( ON-TABLE ?auto_657936 ) ( not ( = ?auto_657936 ?auto_657937 ) ) ( not ( = ?auto_657936 ?auto_657938 ) ) ( not ( = ?auto_657936 ?auto_657939 ) ) ( not ( = ?auto_657936 ?auto_657940 ) ) ( not ( = ?auto_657936 ?auto_657941 ) ) ( not ( = ?auto_657936 ?auto_657942 ) ) ( not ( = ?auto_657937 ?auto_657938 ) ) ( not ( = ?auto_657937 ?auto_657939 ) ) ( not ( = ?auto_657937 ?auto_657940 ) ) ( not ( = ?auto_657937 ?auto_657941 ) ) ( not ( = ?auto_657937 ?auto_657942 ) ) ( not ( = ?auto_657938 ?auto_657939 ) ) ( not ( = ?auto_657938 ?auto_657940 ) ) ( not ( = ?auto_657938 ?auto_657941 ) ) ( not ( = ?auto_657938 ?auto_657942 ) ) ( not ( = ?auto_657939 ?auto_657940 ) ) ( not ( = ?auto_657939 ?auto_657941 ) ) ( not ( = ?auto_657939 ?auto_657942 ) ) ( not ( = ?auto_657940 ?auto_657941 ) ) ( not ( = ?auto_657940 ?auto_657942 ) ) ( not ( = ?auto_657941 ?auto_657942 ) ) ( ON ?auto_657940 ?auto_657941 ) ( ON ?auto_657939 ?auto_657940 ) ( ON ?auto_657938 ?auto_657939 ) ( CLEAR ?auto_657936 ) ( ON ?auto_657937 ?auto_657938 ) ( CLEAR ?auto_657937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_657936 ?auto_657937 )
      ( MAKE-6PILE ?auto_657936 ?auto_657937 ?auto_657938 ?auto_657939 ?auto_657940 ?auto_657941 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_657962 - BLOCK
      ?auto_657963 - BLOCK
      ?auto_657964 - BLOCK
      ?auto_657965 - BLOCK
      ?auto_657966 - BLOCK
      ?auto_657967 - BLOCK
    )
    :vars
    (
      ?auto_657968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657967 ?auto_657968 ) ( not ( = ?auto_657962 ?auto_657963 ) ) ( not ( = ?auto_657962 ?auto_657964 ) ) ( not ( = ?auto_657962 ?auto_657965 ) ) ( not ( = ?auto_657962 ?auto_657966 ) ) ( not ( = ?auto_657962 ?auto_657967 ) ) ( not ( = ?auto_657962 ?auto_657968 ) ) ( not ( = ?auto_657963 ?auto_657964 ) ) ( not ( = ?auto_657963 ?auto_657965 ) ) ( not ( = ?auto_657963 ?auto_657966 ) ) ( not ( = ?auto_657963 ?auto_657967 ) ) ( not ( = ?auto_657963 ?auto_657968 ) ) ( not ( = ?auto_657964 ?auto_657965 ) ) ( not ( = ?auto_657964 ?auto_657966 ) ) ( not ( = ?auto_657964 ?auto_657967 ) ) ( not ( = ?auto_657964 ?auto_657968 ) ) ( not ( = ?auto_657965 ?auto_657966 ) ) ( not ( = ?auto_657965 ?auto_657967 ) ) ( not ( = ?auto_657965 ?auto_657968 ) ) ( not ( = ?auto_657966 ?auto_657967 ) ) ( not ( = ?auto_657966 ?auto_657968 ) ) ( not ( = ?auto_657967 ?auto_657968 ) ) ( ON ?auto_657966 ?auto_657967 ) ( ON ?auto_657965 ?auto_657966 ) ( ON ?auto_657964 ?auto_657965 ) ( ON ?auto_657963 ?auto_657964 ) ( ON ?auto_657962 ?auto_657963 ) ( CLEAR ?auto_657962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_657962 )
      ( MAKE-6PILE ?auto_657962 ?auto_657963 ?auto_657964 ?auto_657965 ?auto_657966 ?auto_657967 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_657989 - BLOCK
      ?auto_657990 - BLOCK
      ?auto_657991 - BLOCK
      ?auto_657992 - BLOCK
      ?auto_657993 - BLOCK
      ?auto_657994 - BLOCK
      ?auto_657995 - BLOCK
    )
    :vars
    (
      ?auto_657996 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_657994 ) ( ON ?auto_657995 ?auto_657996 ) ( CLEAR ?auto_657995 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_657989 ) ( ON ?auto_657990 ?auto_657989 ) ( ON ?auto_657991 ?auto_657990 ) ( ON ?auto_657992 ?auto_657991 ) ( ON ?auto_657993 ?auto_657992 ) ( ON ?auto_657994 ?auto_657993 ) ( not ( = ?auto_657989 ?auto_657990 ) ) ( not ( = ?auto_657989 ?auto_657991 ) ) ( not ( = ?auto_657989 ?auto_657992 ) ) ( not ( = ?auto_657989 ?auto_657993 ) ) ( not ( = ?auto_657989 ?auto_657994 ) ) ( not ( = ?auto_657989 ?auto_657995 ) ) ( not ( = ?auto_657989 ?auto_657996 ) ) ( not ( = ?auto_657990 ?auto_657991 ) ) ( not ( = ?auto_657990 ?auto_657992 ) ) ( not ( = ?auto_657990 ?auto_657993 ) ) ( not ( = ?auto_657990 ?auto_657994 ) ) ( not ( = ?auto_657990 ?auto_657995 ) ) ( not ( = ?auto_657990 ?auto_657996 ) ) ( not ( = ?auto_657991 ?auto_657992 ) ) ( not ( = ?auto_657991 ?auto_657993 ) ) ( not ( = ?auto_657991 ?auto_657994 ) ) ( not ( = ?auto_657991 ?auto_657995 ) ) ( not ( = ?auto_657991 ?auto_657996 ) ) ( not ( = ?auto_657992 ?auto_657993 ) ) ( not ( = ?auto_657992 ?auto_657994 ) ) ( not ( = ?auto_657992 ?auto_657995 ) ) ( not ( = ?auto_657992 ?auto_657996 ) ) ( not ( = ?auto_657993 ?auto_657994 ) ) ( not ( = ?auto_657993 ?auto_657995 ) ) ( not ( = ?auto_657993 ?auto_657996 ) ) ( not ( = ?auto_657994 ?auto_657995 ) ) ( not ( = ?auto_657994 ?auto_657996 ) ) ( not ( = ?auto_657995 ?auto_657996 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_657995 ?auto_657996 )
      ( !STACK ?auto_657995 ?auto_657994 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_658019 - BLOCK
      ?auto_658020 - BLOCK
      ?auto_658021 - BLOCK
      ?auto_658022 - BLOCK
      ?auto_658023 - BLOCK
      ?auto_658024 - BLOCK
      ?auto_658025 - BLOCK
    )
    :vars
    (
      ?auto_658026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658025 ?auto_658026 ) ( ON-TABLE ?auto_658019 ) ( ON ?auto_658020 ?auto_658019 ) ( ON ?auto_658021 ?auto_658020 ) ( ON ?auto_658022 ?auto_658021 ) ( ON ?auto_658023 ?auto_658022 ) ( not ( = ?auto_658019 ?auto_658020 ) ) ( not ( = ?auto_658019 ?auto_658021 ) ) ( not ( = ?auto_658019 ?auto_658022 ) ) ( not ( = ?auto_658019 ?auto_658023 ) ) ( not ( = ?auto_658019 ?auto_658024 ) ) ( not ( = ?auto_658019 ?auto_658025 ) ) ( not ( = ?auto_658019 ?auto_658026 ) ) ( not ( = ?auto_658020 ?auto_658021 ) ) ( not ( = ?auto_658020 ?auto_658022 ) ) ( not ( = ?auto_658020 ?auto_658023 ) ) ( not ( = ?auto_658020 ?auto_658024 ) ) ( not ( = ?auto_658020 ?auto_658025 ) ) ( not ( = ?auto_658020 ?auto_658026 ) ) ( not ( = ?auto_658021 ?auto_658022 ) ) ( not ( = ?auto_658021 ?auto_658023 ) ) ( not ( = ?auto_658021 ?auto_658024 ) ) ( not ( = ?auto_658021 ?auto_658025 ) ) ( not ( = ?auto_658021 ?auto_658026 ) ) ( not ( = ?auto_658022 ?auto_658023 ) ) ( not ( = ?auto_658022 ?auto_658024 ) ) ( not ( = ?auto_658022 ?auto_658025 ) ) ( not ( = ?auto_658022 ?auto_658026 ) ) ( not ( = ?auto_658023 ?auto_658024 ) ) ( not ( = ?auto_658023 ?auto_658025 ) ) ( not ( = ?auto_658023 ?auto_658026 ) ) ( not ( = ?auto_658024 ?auto_658025 ) ) ( not ( = ?auto_658024 ?auto_658026 ) ) ( not ( = ?auto_658025 ?auto_658026 ) ) ( CLEAR ?auto_658023 ) ( ON ?auto_658024 ?auto_658025 ) ( CLEAR ?auto_658024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_658019 ?auto_658020 ?auto_658021 ?auto_658022 ?auto_658023 ?auto_658024 )
      ( MAKE-7PILE ?auto_658019 ?auto_658020 ?auto_658021 ?auto_658022 ?auto_658023 ?auto_658024 ?auto_658025 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_658049 - BLOCK
      ?auto_658050 - BLOCK
      ?auto_658051 - BLOCK
      ?auto_658052 - BLOCK
      ?auto_658053 - BLOCK
      ?auto_658054 - BLOCK
      ?auto_658055 - BLOCK
    )
    :vars
    (
      ?auto_658056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658055 ?auto_658056 ) ( ON-TABLE ?auto_658049 ) ( ON ?auto_658050 ?auto_658049 ) ( ON ?auto_658051 ?auto_658050 ) ( ON ?auto_658052 ?auto_658051 ) ( not ( = ?auto_658049 ?auto_658050 ) ) ( not ( = ?auto_658049 ?auto_658051 ) ) ( not ( = ?auto_658049 ?auto_658052 ) ) ( not ( = ?auto_658049 ?auto_658053 ) ) ( not ( = ?auto_658049 ?auto_658054 ) ) ( not ( = ?auto_658049 ?auto_658055 ) ) ( not ( = ?auto_658049 ?auto_658056 ) ) ( not ( = ?auto_658050 ?auto_658051 ) ) ( not ( = ?auto_658050 ?auto_658052 ) ) ( not ( = ?auto_658050 ?auto_658053 ) ) ( not ( = ?auto_658050 ?auto_658054 ) ) ( not ( = ?auto_658050 ?auto_658055 ) ) ( not ( = ?auto_658050 ?auto_658056 ) ) ( not ( = ?auto_658051 ?auto_658052 ) ) ( not ( = ?auto_658051 ?auto_658053 ) ) ( not ( = ?auto_658051 ?auto_658054 ) ) ( not ( = ?auto_658051 ?auto_658055 ) ) ( not ( = ?auto_658051 ?auto_658056 ) ) ( not ( = ?auto_658052 ?auto_658053 ) ) ( not ( = ?auto_658052 ?auto_658054 ) ) ( not ( = ?auto_658052 ?auto_658055 ) ) ( not ( = ?auto_658052 ?auto_658056 ) ) ( not ( = ?auto_658053 ?auto_658054 ) ) ( not ( = ?auto_658053 ?auto_658055 ) ) ( not ( = ?auto_658053 ?auto_658056 ) ) ( not ( = ?auto_658054 ?auto_658055 ) ) ( not ( = ?auto_658054 ?auto_658056 ) ) ( not ( = ?auto_658055 ?auto_658056 ) ) ( ON ?auto_658054 ?auto_658055 ) ( CLEAR ?auto_658052 ) ( ON ?auto_658053 ?auto_658054 ) ( CLEAR ?auto_658053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_658049 ?auto_658050 ?auto_658051 ?auto_658052 ?auto_658053 )
      ( MAKE-7PILE ?auto_658049 ?auto_658050 ?auto_658051 ?auto_658052 ?auto_658053 ?auto_658054 ?auto_658055 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_658079 - BLOCK
      ?auto_658080 - BLOCK
      ?auto_658081 - BLOCK
      ?auto_658082 - BLOCK
      ?auto_658083 - BLOCK
      ?auto_658084 - BLOCK
      ?auto_658085 - BLOCK
    )
    :vars
    (
      ?auto_658086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658085 ?auto_658086 ) ( ON-TABLE ?auto_658079 ) ( ON ?auto_658080 ?auto_658079 ) ( ON ?auto_658081 ?auto_658080 ) ( not ( = ?auto_658079 ?auto_658080 ) ) ( not ( = ?auto_658079 ?auto_658081 ) ) ( not ( = ?auto_658079 ?auto_658082 ) ) ( not ( = ?auto_658079 ?auto_658083 ) ) ( not ( = ?auto_658079 ?auto_658084 ) ) ( not ( = ?auto_658079 ?auto_658085 ) ) ( not ( = ?auto_658079 ?auto_658086 ) ) ( not ( = ?auto_658080 ?auto_658081 ) ) ( not ( = ?auto_658080 ?auto_658082 ) ) ( not ( = ?auto_658080 ?auto_658083 ) ) ( not ( = ?auto_658080 ?auto_658084 ) ) ( not ( = ?auto_658080 ?auto_658085 ) ) ( not ( = ?auto_658080 ?auto_658086 ) ) ( not ( = ?auto_658081 ?auto_658082 ) ) ( not ( = ?auto_658081 ?auto_658083 ) ) ( not ( = ?auto_658081 ?auto_658084 ) ) ( not ( = ?auto_658081 ?auto_658085 ) ) ( not ( = ?auto_658081 ?auto_658086 ) ) ( not ( = ?auto_658082 ?auto_658083 ) ) ( not ( = ?auto_658082 ?auto_658084 ) ) ( not ( = ?auto_658082 ?auto_658085 ) ) ( not ( = ?auto_658082 ?auto_658086 ) ) ( not ( = ?auto_658083 ?auto_658084 ) ) ( not ( = ?auto_658083 ?auto_658085 ) ) ( not ( = ?auto_658083 ?auto_658086 ) ) ( not ( = ?auto_658084 ?auto_658085 ) ) ( not ( = ?auto_658084 ?auto_658086 ) ) ( not ( = ?auto_658085 ?auto_658086 ) ) ( ON ?auto_658084 ?auto_658085 ) ( ON ?auto_658083 ?auto_658084 ) ( CLEAR ?auto_658081 ) ( ON ?auto_658082 ?auto_658083 ) ( CLEAR ?auto_658082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_658079 ?auto_658080 ?auto_658081 ?auto_658082 )
      ( MAKE-7PILE ?auto_658079 ?auto_658080 ?auto_658081 ?auto_658082 ?auto_658083 ?auto_658084 ?auto_658085 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_658109 - BLOCK
      ?auto_658110 - BLOCK
      ?auto_658111 - BLOCK
      ?auto_658112 - BLOCK
      ?auto_658113 - BLOCK
      ?auto_658114 - BLOCK
      ?auto_658115 - BLOCK
    )
    :vars
    (
      ?auto_658116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658115 ?auto_658116 ) ( ON-TABLE ?auto_658109 ) ( ON ?auto_658110 ?auto_658109 ) ( not ( = ?auto_658109 ?auto_658110 ) ) ( not ( = ?auto_658109 ?auto_658111 ) ) ( not ( = ?auto_658109 ?auto_658112 ) ) ( not ( = ?auto_658109 ?auto_658113 ) ) ( not ( = ?auto_658109 ?auto_658114 ) ) ( not ( = ?auto_658109 ?auto_658115 ) ) ( not ( = ?auto_658109 ?auto_658116 ) ) ( not ( = ?auto_658110 ?auto_658111 ) ) ( not ( = ?auto_658110 ?auto_658112 ) ) ( not ( = ?auto_658110 ?auto_658113 ) ) ( not ( = ?auto_658110 ?auto_658114 ) ) ( not ( = ?auto_658110 ?auto_658115 ) ) ( not ( = ?auto_658110 ?auto_658116 ) ) ( not ( = ?auto_658111 ?auto_658112 ) ) ( not ( = ?auto_658111 ?auto_658113 ) ) ( not ( = ?auto_658111 ?auto_658114 ) ) ( not ( = ?auto_658111 ?auto_658115 ) ) ( not ( = ?auto_658111 ?auto_658116 ) ) ( not ( = ?auto_658112 ?auto_658113 ) ) ( not ( = ?auto_658112 ?auto_658114 ) ) ( not ( = ?auto_658112 ?auto_658115 ) ) ( not ( = ?auto_658112 ?auto_658116 ) ) ( not ( = ?auto_658113 ?auto_658114 ) ) ( not ( = ?auto_658113 ?auto_658115 ) ) ( not ( = ?auto_658113 ?auto_658116 ) ) ( not ( = ?auto_658114 ?auto_658115 ) ) ( not ( = ?auto_658114 ?auto_658116 ) ) ( not ( = ?auto_658115 ?auto_658116 ) ) ( ON ?auto_658114 ?auto_658115 ) ( ON ?auto_658113 ?auto_658114 ) ( ON ?auto_658112 ?auto_658113 ) ( CLEAR ?auto_658110 ) ( ON ?auto_658111 ?auto_658112 ) ( CLEAR ?auto_658111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_658109 ?auto_658110 ?auto_658111 )
      ( MAKE-7PILE ?auto_658109 ?auto_658110 ?auto_658111 ?auto_658112 ?auto_658113 ?auto_658114 ?auto_658115 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_658139 - BLOCK
      ?auto_658140 - BLOCK
      ?auto_658141 - BLOCK
      ?auto_658142 - BLOCK
      ?auto_658143 - BLOCK
      ?auto_658144 - BLOCK
      ?auto_658145 - BLOCK
    )
    :vars
    (
      ?auto_658146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658145 ?auto_658146 ) ( ON-TABLE ?auto_658139 ) ( not ( = ?auto_658139 ?auto_658140 ) ) ( not ( = ?auto_658139 ?auto_658141 ) ) ( not ( = ?auto_658139 ?auto_658142 ) ) ( not ( = ?auto_658139 ?auto_658143 ) ) ( not ( = ?auto_658139 ?auto_658144 ) ) ( not ( = ?auto_658139 ?auto_658145 ) ) ( not ( = ?auto_658139 ?auto_658146 ) ) ( not ( = ?auto_658140 ?auto_658141 ) ) ( not ( = ?auto_658140 ?auto_658142 ) ) ( not ( = ?auto_658140 ?auto_658143 ) ) ( not ( = ?auto_658140 ?auto_658144 ) ) ( not ( = ?auto_658140 ?auto_658145 ) ) ( not ( = ?auto_658140 ?auto_658146 ) ) ( not ( = ?auto_658141 ?auto_658142 ) ) ( not ( = ?auto_658141 ?auto_658143 ) ) ( not ( = ?auto_658141 ?auto_658144 ) ) ( not ( = ?auto_658141 ?auto_658145 ) ) ( not ( = ?auto_658141 ?auto_658146 ) ) ( not ( = ?auto_658142 ?auto_658143 ) ) ( not ( = ?auto_658142 ?auto_658144 ) ) ( not ( = ?auto_658142 ?auto_658145 ) ) ( not ( = ?auto_658142 ?auto_658146 ) ) ( not ( = ?auto_658143 ?auto_658144 ) ) ( not ( = ?auto_658143 ?auto_658145 ) ) ( not ( = ?auto_658143 ?auto_658146 ) ) ( not ( = ?auto_658144 ?auto_658145 ) ) ( not ( = ?auto_658144 ?auto_658146 ) ) ( not ( = ?auto_658145 ?auto_658146 ) ) ( ON ?auto_658144 ?auto_658145 ) ( ON ?auto_658143 ?auto_658144 ) ( ON ?auto_658142 ?auto_658143 ) ( ON ?auto_658141 ?auto_658142 ) ( CLEAR ?auto_658139 ) ( ON ?auto_658140 ?auto_658141 ) ( CLEAR ?auto_658140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_658139 ?auto_658140 )
      ( MAKE-7PILE ?auto_658139 ?auto_658140 ?auto_658141 ?auto_658142 ?auto_658143 ?auto_658144 ?auto_658145 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_658169 - BLOCK
      ?auto_658170 - BLOCK
      ?auto_658171 - BLOCK
      ?auto_658172 - BLOCK
      ?auto_658173 - BLOCK
      ?auto_658174 - BLOCK
      ?auto_658175 - BLOCK
    )
    :vars
    (
      ?auto_658176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658175 ?auto_658176 ) ( not ( = ?auto_658169 ?auto_658170 ) ) ( not ( = ?auto_658169 ?auto_658171 ) ) ( not ( = ?auto_658169 ?auto_658172 ) ) ( not ( = ?auto_658169 ?auto_658173 ) ) ( not ( = ?auto_658169 ?auto_658174 ) ) ( not ( = ?auto_658169 ?auto_658175 ) ) ( not ( = ?auto_658169 ?auto_658176 ) ) ( not ( = ?auto_658170 ?auto_658171 ) ) ( not ( = ?auto_658170 ?auto_658172 ) ) ( not ( = ?auto_658170 ?auto_658173 ) ) ( not ( = ?auto_658170 ?auto_658174 ) ) ( not ( = ?auto_658170 ?auto_658175 ) ) ( not ( = ?auto_658170 ?auto_658176 ) ) ( not ( = ?auto_658171 ?auto_658172 ) ) ( not ( = ?auto_658171 ?auto_658173 ) ) ( not ( = ?auto_658171 ?auto_658174 ) ) ( not ( = ?auto_658171 ?auto_658175 ) ) ( not ( = ?auto_658171 ?auto_658176 ) ) ( not ( = ?auto_658172 ?auto_658173 ) ) ( not ( = ?auto_658172 ?auto_658174 ) ) ( not ( = ?auto_658172 ?auto_658175 ) ) ( not ( = ?auto_658172 ?auto_658176 ) ) ( not ( = ?auto_658173 ?auto_658174 ) ) ( not ( = ?auto_658173 ?auto_658175 ) ) ( not ( = ?auto_658173 ?auto_658176 ) ) ( not ( = ?auto_658174 ?auto_658175 ) ) ( not ( = ?auto_658174 ?auto_658176 ) ) ( not ( = ?auto_658175 ?auto_658176 ) ) ( ON ?auto_658174 ?auto_658175 ) ( ON ?auto_658173 ?auto_658174 ) ( ON ?auto_658172 ?auto_658173 ) ( ON ?auto_658171 ?auto_658172 ) ( ON ?auto_658170 ?auto_658171 ) ( ON ?auto_658169 ?auto_658170 ) ( CLEAR ?auto_658169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_658169 )
      ( MAKE-7PILE ?auto_658169 ?auto_658170 ?auto_658171 ?auto_658172 ?auto_658173 ?auto_658174 ?auto_658175 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_658200 - BLOCK
      ?auto_658201 - BLOCK
      ?auto_658202 - BLOCK
      ?auto_658203 - BLOCK
      ?auto_658204 - BLOCK
      ?auto_658205 - BLOCK
      ?auto_658206 - BLOCK
      ?auto_658207 - BLOCK
    )
    :vars
    (
      ?auto_658208 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_658206 ) ( ON ?auto_658207 ?auto_658208 ) ( CLEAR ?auto_658207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_658200 ) ( ON ?auto_658201 ?auto_658200 ) ( ON ?auto_658202 ?auto_658201 ) ( ON ?auto_658203 ?auto_658202 ) ( ON ?auto_658204 ?auto_658203 ) ( ON ?auto_658205 ?auto_658204 ) ( ON ?auto_658206 ?auto_658205 ) ( not ( = ?auto_658200 ?auto_658201 ) ) ( not ( = ?auto_658200 ?auto_658202 ) ) ( not ( = ?auto_658200 ?auto_658203 ) ) ( not ( = ?auto_658200 ?auto_658204 ) ) ( not ( = ?auto_658200 ?auto_658205 ) ) ( not ( = ?auto_658200 ?auto_658206 ) ) ( not ( = ?auto_658200 ?auto_658207 ) ) ( not ( = ?auto_658200 ?auto_658208 ) ) ( not ( = ?auto_658201 ?auto_658202 ) ) ( not ( = ?auto_658201 ?auto_658203 ) ) ( not ( = ?auto_658201 ?auto_658204 ) ) ( not ( = ?auto_658201 ?auto_658205 ) ) ( not ( = ?auto_658201 ?auto_658206 ) ) ( not ( = ?auto_658201 ?auto_658207 ) ) ( not ( = ?auto_658201 ?auto_658208 ) ) ( not ( = ?auto_658202 ?auto_658203 ) ) ( not ( = ?auto_658202 ?auto_658204 ) ) ( not ( = ?auto_658202 ?auto_658205 ) ) ( not ( = ?auto_658202 ?auto_658206 ) ) ( not ( = ?auto_658202 ?auto_658207 ) ) ( not ( = ?auto_658202 ?auto_658208 ) ) ( not ( = ?auto_658203 ?auto_658204 ) ) ( not ( = ?auto_658203 ?auto_658205 ) ) ( not ( = ?auto_658203 ?auto_658206 ) ) ( not ( = ?auto_658203 ?auto_658207 ) ) ( not ( = ?auto_658203 ?auto_658208 ) ) ( not ( = ?auto_658204 ?auto_658205 ) ) ( not ( = ?auto_658204 ?auto_658206 ) ) ( not ( = ?auto_658204 ?auto_658207 ) ) ( not ( = ?auto_658204 ?auto_658208 ) ) ( not ( = ?auto_658205 ?auto_658206 ) ) ( not ( = ?auto_658205 ?auto_658207 ) ) ( not ( = ?auto_658205 ?auto_658208 ) ) ( not ( = ?auto_658206 ?auto_658207 ) ) ( not ( = ?auto_658206 ?auto_658208 ) ) ( not ( = ?auto_658207 ?auto_658208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_658207 ?auto_658208 )
      ( !STACK ?auto_658207 ?auto_658206 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_658234 - BLOCK
      ?auto_658235 - BLOCK
      ?auto_658236 - BLOCK
      ?auto_658237 - BLOCK
      ?auto_658238 - BLOCK
      ?auto_658239 - BLOCK
      ?auto_658240 - BLOCK
      ?auto_658241 - BLOCK
    )
    :vars
    (
      ?auto_658242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658241 ?auto_658242 ) ( ON-TABLE ?auto_658234 ) ( ON ?auto_658235 ?auto_658234 ) ( ON ?auto_658236 ?auto_658235 ) ( ON ?auto_658237 ?auto_658236 ) ( ON ?auto_658238 ?auto_658237 ) ( ON ?auto_658239 ?auto_658238 ) ( not ( = ?auto_658234 ?auto_658235 ) ) ( not ( = ?auto_658234 ?auto_658236 ) ) ( not ( = ?auto_658234 ?auto_658237 ) ) ( not ( = ?auto_658234 ?auto_658238 ) ) ( not ( = ?auto_658234 ?auto_658239 ) ) ( not ( = ?auto_658234 ?auto_658240 ) ) ( not ( = ?auto_658234 ?auto_658241 ) ) ( not ( = ?auto_658234 ?auto_658242 ) ) ( not ( = ?auto_658235 ?auto_658236 ) ) ( not ( = ?auto_658235 ?auto_658237 ) ) ( not ( = ?auto_658235 ?auto_658238 ) ) ( not ( = ?auto_658235 ?auto_658239 ) ) ( not ( = ?auto_658235 ?auto_658240 ) ) ( not ( = ?auto_658235 ?auto_658241 ) ) ( not ( = ?auto_658235 ?auto_658242 ) ) ( not ( = ?auto_658236 ?auto_658237 ) ) ( not ( = ?auto_658236 ?auto_658238 ) ) ( not ( = ?auto_658236 ?auto_658239 ) ) ( not ( = ?auto_658236 ?auto_658240 ) ) ( not ( = ?auto_658236 ?auto_658241 ) ) ( not ( = ?auto_658236 ?auto_658242 ) ) ( not ( = ?auto_658237 ?auto_658238 ) ) ( not ( = ?auto_658237 ?auto_658239 ) ) ( not ( = ?auto_658237 ?auto_658240 ) ) ( not ( = ?auto_658237 ?auto_658241 ) ) ( not ( = ?auto_658237 ?auto_658242 ) ) ( not ( = ?auto_658238 ?auto_658239 ) ) ( not ( = ?auto_658238 ?auto_658240 ) ) ( not ( = ?auto_658238 ?auto_658241 ) ) ( not ( = ?auto_658238 ?auto_658242 ) ) ( not ( = ?auto_658239 ?auto_658240 ) ) ( not ( = ?auto_658239 ?auto_658241 ) ) ( not ( = ?auto_658239 ?auto_658242 ) ) ( not ( = ?auto_658240 ?auto_658241 ) ) ( not ( = ?auto_658240 ?auto_658242 ) ) ( not ( = ?auto_658241 ?auto_658242 ) ) ( CLEAR ?auto_658239 ) ( ON ?auto_658240 ?auto_658241 ) ( CLEAR ?auto_658240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_658234 ?auto_658235 ?auto_658236 ?auto_658237 ?auto_658238 ?auto_658239 ?auto_658240 )
      ( MAKE-8PILE ?auto_658234 ?auto_658235 ?auto_658236 ?auto_658237 ?auto_658238 ?auto_658239 ?auto_658240 ?auto_658241 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_658268 - BLOCK
      ?auto_658269 - BLOCK
      ?auto_658270 - BLOCK
      ?auto_658271 - BLOCK
      ?auto_658272 - BLOCK
      ?auto_658273 - BLOCK
      ?auto_658274 - BLOCK
      ?auto_658275 - BLOCK
    )
    :vars
    (
      ?auto_658276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658275 ?auto_658276 ) ( ON-TABLE ?auto_658268 ) ( ON ?auto_658269 ?auto_658268 ) ( ON ?auto_658270 ?auto_658269 ) ( ON ?auto_658271 ?auto_658270 ) ( ON ?auto_658272 ?auto_658271 ) ( not ( = ?auto_658268 ?auto_658269 ) ) ( not ( = ?auto_658268 ?auto_658270 ) ) ( not ( = ?auto_658268 ?auto_658271 ) ) ( not ( = ?auto_658268 ?auto_658272 ) ) ( not ( = ?auto_658268 ?auto_658273 ) ) ( not ( = ?auto_658268 ?auto_658274 ) ) ( not ( = ?auto_658268 ?auto_658275 ) ) ( not ( = ?auto_658268 ?auto_658276 ) ) ( not ( = ?auto_658269 ?auto_658270 ) ) ( not ( = ?auto_658269 ?auto_658271 ) ) ( not ( = ?auto_658269 ?auto_658272 ) ) ( not ( = ?auto_658269 ?auto_658273 ) ) ( not ( = ?auto_658269 ?auto_658274 ) ) ( not ( = ?auto_658269 ?auto_658275 ) ) ( not ( = ?auto_658269 ?auto_658276 ) ) ( not ( = ?auto_658270 ?auto_658271 ) ) ( not ( = ?auto_658270 ?auto_658272 ) ) ( not ( = ?auto_658270 ?auto_658273 ) ) ( not ( = ?auto_658270 ?auto_658274 ) ) ( not ( = ?auto_658270 ?auto_658275 ) ) ( not ( = ?auto_658270 ?auto_658276 ) ) ( not ( = ?auto_658271 ?auto_658272 ) ) ( not ( = ?auto_658271 ?auto_658273 ) ) ( not ( = ?auto_658271 ?auto_658274 ) ) ( not ( = ?auto_658271 ?auto_658275 ) ) ( not ( = ?auto_658271 ?auto_658276 ) ) ( not ( = ?auto_658272 ?auto_658273 ) ) ( not ( = ?auto_658272 ?auto_658274 ) ) ( not ( = ?auto_658272 ?auto_658275 ) ) ( not ( = ?auto_658272 ?auto_658276 ) ) ( not ( = ?auto_658273 ?auto_658274 ) ) ( not ( = ?auto_658273 ?auto_658275 ) ) ( not ( = ?auto_658273 ?auto_658276 ) ) ( not ( = ?auto_658274 ?auto_658275 ) ) ( not ( = ?auto_658274 ?auto_658276 ) ) ( not ( = ?auto_658275 ?auto_658276 ) ) ( ON ?auto_658274 ?auto_658275 ) ( CLEAR ?auto_658272 ) ( ON ?auto_658273 ?auto_658274 ) ( CLEAR ?auto_658273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_658268 ?auto_658269 ?auto_658270 ?auto_658271 ?auto_658272 ?auto_658273 )
      ( MAKE-8PILE ?auto_658268 ?auto_658269 ?auto_658270 ?auto_658271 ?auto_658272 ?auto_658273 ?auto_658274 ?auto_658275 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_658302 - BLOCK
      ?auto_658303 - BLOCK
      ?auto_658304 - BLOCK
      ?auto_658305 - BLOCK
      ?auto_658306 - BLOCK
      ?auto_658307 - BLOCK
      ?auto_658308 - BLOCK
      ?auto_658309 - BLOCK
    )
    :vars
    (
      ?auto_658310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658309 ?auto_658310 ) ( ON-TABLE ?auto_658302 ) ( ON ?auto_658303 ?auto_658302 ) ( ON ?auto_658304 ?auto_658303 ) ( ON ?auto_658305 ?auto_658304 ) ( not ( = ?auto_658302 ?auto_658303 ) ) ( not ( = ?auto_658302 ?auto_658304 ) ) ( not ( = ?auto_658302 ?auto_658305 ) ) ( not ( = ?auto_658302 ?auto_658306 ) ) ( not ( = ?auto_658302 ?auto_658307 ) ) ( not ( = ?auto_658302 ?auto_658308 ) ) ( not ( = ?auto_658302 ?auto_658309 ) ) ( not ( = ?auto_658302 ?auto_658310 ) ) ( not ( = ?auto_658303 ?auto_658304 ) ) ( not ( = ?auto_658303 ?auto_658305 ) ) ( not ( = ?auto_658303 ?auto_658306 ) ) ( not ( = ?auto_658303 ?auto_658307 ) ) ( not ( = ?auto_658303 ?auto_658308 ) ) ( not ( = ?auto_658303 ?auto_658309 ) ) ( not ( = ?auto_658303 ?auto_658310 ) ) ( not ( = ?auto_658304 ?auto_658305 ) ) ( not ( = ?auto_658304 ?auto_658306 ) ) ( not ( = ?auto_658304 ?auto_658307 ) ) ( not ( = ?auto_658304 ?auto_658308 ) ) ( not ( = ?auto_658304 ?auto_658309 ) ) ( not ( = ?auto_658304 ?auto_658310 ) ) ( not ( = ?auto_658305 ?auto_658306 ) ) ( not ( = ?auto_658305 ?auto_658307 ) ) ( not ( = ?auto_658305 ?auto_658308 ) ) ( not ( = ?auto_658305 ?auto_658309 ) ) ( not ( = ?auto_658305 ?auto_658310 ) ) ( not ( = ?auto_658306 ?auto_658307 ) ) ( not ( = ?auto_658306 ?auto_658308 ) ) ( not ( = ?auto_658306 ?auto_658309 ) ) ( not ( = ?auto_658306 ?auto_658310 ) ) ( not ( = ?auto_658307 ?auto_658308 ) ) ( not ( = ?auto_658307 ?auto_658309 ) ) ( not ( = ?auto_658307 ?auto_658310 ) ) ( not ( = ?auto_658308 ?auto_658309 ) ) ( not ( = ?auto_658308 ?auto_658310 ) ) ( not ( = ?auto_658309 ?auto_658310 ) ) ( ON ?auto_658308 ?auto_658309 ) ( ON ?auto_658307 ?auto_658308 ) ( CLEAR ?auto_658305 ) ( ON ?auto_658306 ?auto_658307 ) ( CLEAR ?auto_658306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_658302 ?auto_658303 ?auto_658304 ?auto_658305 ?auto_658306 )
      ( MAKE-8PILE ?auto_658302 ?auto_658303 ?auto_658304 ?auto_658305 ?auto_658306 ?auto_658307 ?auto_658308 ?auto_658309 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_658336 - BLOCK
      ?auto_658337 - BLOCK
      ?auto_658338 - BLOCK
      ?auto_658339 - BLOCK
      ?auto_658340 - BLOCK
      ?auto_658341 - BLOCK
      ?auto_658342 - BLOCK
      ?auto_658343 - BLOCK
    )
    :vars
    (
      ?auto_658344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658343 ?auto_658344 ) ( ON-TABLE ?auto_658336 ) ( ON ?auto_658337 ?auto_658336 ) ( ON ?auto_658338 ?auto_658337 ) ( not ( = ?auto_658336 ?auto_658337 ) ) ( not ( = ?auto_658336 ?auto_658338 ) ) ( not ( = ?auto_658336 ?auto_658339 ) ) ( not ( = ?auto_658336 ?auto_658340 ) ) ( not ( = ?auto_658336 ?auto_658341 ) ) ( not ( = ?auto_658336 ?auto_658342 ) ) ( not ( = ?auto_658336 ?auto_658343 ) ) ( not ( = ?auto_658336 ?auto_658344 ) ) ( not ( = ?auto_658337 ?auto_658338 ) ) ( not ( = ?auto_658337 ?auto_658339 ) ) ( not ( = ?auto_658337 ?auto_658340 ) ) ( not ( = ?auto_658337 ?auto_658341 ) ) ( not ( = ?auto_658337 ?auto_658342 ) ) ( not ( = ?auto_658337 ?auto_658343 ) ) ( not ( = ?auto_658337 ?auto_658344 ) ) ( not ( = ?auto_658338 ?auto_658339 ) ) ( not ( = ?auto_658338 ?auto_658340 ) ) ( not ( = ?auto_658338 ?auto_658341 ) ) ( not ( = ?auto_658338 ?auto_658342 ) ) ( not ( = ?auto_658338 ?auto_658343 ) ) ( not ( = ?auto_658338 ?auto_658344 ) ) ( not ( = ?auto_658339 ?auto_658340 ) ) ( not ( = ?auto_658339 ?auto_658341 ) ) ( not ( = ?auto_658339 ?auto_658342 ) ) ( not ( = ?auto_658339 ?auto_658343 ) ) ( not ( = ?auto_658339 ?auto_658344 ) ) ( not ( = ?auto_658340 ?auto_658341 ) ) ( not ( = ?auto_658340 ?auto_658342 ) ) ( not ( = ?auto_658340 ?auto_658343 ) ) ( not ( = ?auto_658340 ?auto_658344 ) ) ( not ( = ?auto_658341 ?auto_658342 ) ) ( not ( = ?auto_658341 ?auto_658343 ) ) ( not ( = ?auto_658341 ?auto_658344 ) ) ( not ( = ?auto_658342 ?auto_658343 ) ) ( not ( = ?auto_658342 ?auto_658344 ) ) ( not ( = ?auto_658343 ?auto_658344 ) ) ( ON ?auto_658342 ?auto_658343 ) ( ON ?auto_658341 ?auto_658342 ) ( ON ?auto_658340 ?auto_658341 ) ( CLEAR ?auto_658338 ) ( ON ?auto_658339 ?auto_658340 ) ( CLEAR ?auto_658339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_658336 ?auto_658337 ?auto_658338 ?auto_658339 )
      ( MAKE-8PILE ?auto_658336 ?auto_658337 ?auto_658338 ?auto_658339 ?auto_658340 ?auto_658341 ?auto_658342 ?auto_658343 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_658370 - BLOCK
      ?auto_658371 - BLOCK
      ?auto_658372 - BLOCK
      ?auto_658373 - BLOCK
      ?auto_658374 - BLOCK
      ?auto_658375 - BLOCK
      ?auto_658376 - BLOCK
      ?auto_658377 - BLOCK
    )
    :vars
    (
      ?auto_658378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658377 ?auto_658378 ) ( ON-TABLE ?auto_658370 ) ( ON ?auto_658371 ?auto_658370 ) ( not ( = ?auto_658370 ?auto_658371 ) ) ( not ( = ?auto_658370 ?auto_658372 ) ) ( not ( = ?auto_658370 ?auto_658373 ) ) ( not ( = ?auto_658370 ?auto_658374 ) ) ( not ( = ?auto_658370 ?auto_658375 ) ) ( not ( = ?auto_658370 ?auto_658376 ) ) ( not ( = ?auto_658370 ?auto_658377 ) ) ( not ( = ?auto_658370 ?auto_658378 ) ) ( not ( = ?auto_658371 ?auto_658372 ) ) ( not ( = ?auto_658371 ?auto_658373 ) ) ( not ( = ?auto_658371 ?auto_658374 ) ) ( not ( = ?auto_658371 ?auto_658375 ) ) ( not ( = ?auto_658371 ?auto_658376 ) ) ( not ( = ?auto_658371 ?auto_658377 ) ) ( not ( = ?auto_658371 ?auto_658378 ) ) ( not ( = ?auto_658372 ?auto_658373 ) ) ( not ( = ?auto_658372 ?auto_658374 ) ) ( not ( = ?auto_658372 ?auto_658375 ) ) ( not ( = ?auto_658372 ?auto_658376 ) ) ( not ( = ?auto_658372 ?auto_658377 ) ) ( not ( = ?auto_658372 ?auto_658378 ) ) ( not ( = ?auto_658373 ?auto_658374 ) ) ( not ( = ?auto_658373 ?auto_658375 ) ) ( not ( = ?auto_658373 ?auto_658376 ) ) ( not ( = ?auto_658373 ?auto_658377 ) ) ( not ( = ?auto_658373 ?auto_658378 ) ) ( not ( = ?auto_658374 ?auto_658375 ) ) ( not ( = ?auto_658374 ?auto_658376 ) ) ( not ( = ?auto_658374 ?auto_658377 ) ) ( not ( = ?auto_658374 ?auto_658378 ) ) ( not ( = ?auto_658375 ?auto_658376 ) ) ( not ( = ?auto_658375 ?auto_658377 ) ) ( not ( = ?auto_658375 ?auto_658378 ) ) ( not ( = ?auto_658376 ?auto_658377 ) ) ( not ( = ?auto_658376 ?auto_658378 ) ) ( not ( = ?auto_658377 ?auto_658378 ) ) ( ON ?auto_658376 ?auto_658377 ) ( ON ?auto_658375 ?auto_658376 ) ( ON ?auto_658374 ?auto_658375 ) ( ON ?auto_658373 ?auto_658374 ) ( CLEAR ?auto_658371 ) ( ON ?auto_658372 ?auto_658373 ) ( CLEAR ?auto_658372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_658370 ?auto_658371 ?auto_658372 )
      ( MAKE-8PILE ?auto_658370 ?auto_658371 ?auto_658372 ?auto_658373 ?auto_658374 ?auto_658375 ?auto_658376 ?auto_658377 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_658404 - BLOCK
      ?auto_658405 - BLOCK
      ?auto_658406 - BLOCK
      ?auto_658407 - BLOCK
      ?auto_658408 - BLOCK
      ?auto_658409 - BLOCK
      ?auto_658410 - BLOCK
      ?auto_658411 - BLOCK
    )
    :vars
    (
      ?auto_658412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658411 ?auto_658412 ) ( ON-TABLE ?auto_658404 ) ( not ( = ?auto_658404 ?auto_658405 ) ) ( not ( = ?auto_658404 ?auto_658406 ) ) ( not ( = ?auto_658404 ?auto_658407 ) ) ( not ( = ?auto_658404 ?auto_658408 ) ) ( not ( = ?auto_658404 ?auto_658409 ) ) ( not ( = ?auto_658404 ?auto_658410 ) ) ( not ( = ?auto_658404 ?auto_658411 ) ) ( not ( = ?auto_658404 ?auto_658412 ) ) ( not ( = ?auto_658405 ?auto_658406 ) ) ( not ( = ?auto_658405 ?auto_658407 ) ) ( not ( = ?auto_658405 ?auto_658408 ) ) ( not ( = ?auto_658405 ?auto_658409 ) ) ( not ( = ?auto_658405 ?auto_658410 ) ) ( not ( = ?auto_658405 ?auto_658411 ) ) ( not ( = ?auto_658405 ?auto_658412 ) ) ( not ( = ?auto_658406 ?auto_658407 ) ) ( not ( = ?auto_658406 ?auto_658408 ) ) ( not ( = ?auto_658406 ?auto_658409 ) ) ( not ( = ?auto_658406 ?auto_658410 ) ) ( not ( = ?auto_658406 ?auto_658411 ) ) ( not ( = ?auto_658406 ?auto_658412 ) ) ( not ( = ?auto_658407 ?auto_658408 ) ) ( not ( = ?auto_658407 ?auto_658409 ) ) ( not ( = ?auto_658407 ?auto_658410 ) ) ( not ( = ?auto_658407 ?auto_658411 ) ) ( not ( = ?auto_658407 ?auto_658412 ) ) ( not ( = ?auto_658408 ?auto_658409 ) ) ( not ( = ?auto_658408 ?auto_658410 ) ) ( not ( = ?auto_658408 ?auto_658411 ) ) ( not ( = ?auto_658408 ?auto_658412 ) ) ( not ( = ?auto_658409 ?auto_658410 ) ) ( not ( = ?auto_658409 ?auto_658411 ) ) ( not ( = ?auto_658409 ?auto_658412 ) ) ( not ( = ?auto_658410 ?auto_658411 ) ) ( not ( = ?auto_658410 ?auto_658412 ) ) ( not ( = ?auto_658411 ?auto_658412 ) ) ( ON ?auto_658410 ?auto_658411 ) ( ON ?auto_658409 ?auto_658410 ) ( ON ?auto_658408 ?auto_658409 ) ( ON ?auto_658407 ?auto_658408 ) ( ON ?auto_658406 ?auto_658407 ) ( CLEAR ?auto_658404 ) ( ON ?auto_658405 ?auto_658406 ) ( CLEAR ?auto_658405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_658404 ?auto_658405 )
      ( MAKE-8PILE ?auto_658404 ?auto_658405 ?auto_658406 ?auto_658407 ?auto_658408 ?auto_658409 ?auto_658410 ?auto_658411 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_658438 - BLOCK
      ?auto_658439 - BLOCK
      ?auto_658440 - BLOCK
      ?auto_658441 - BLOCK
      ?auto_658442 - BLOCK
      ?auto_658443 - BLOCK
      ?auto_658444 - BLOCK
      ?auto_658445 - BLOCK
    )
    :vars
    (
      ?auto_658446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658445 ?auto_658446 ) ( not ( = ?auto_658438 ?auto_658439 ) ) ( not ( = ?auto_658438 ?auto_658440 ) ) ( not ( = ?auto_658438 ?auto_658441 ) ) ( not ( = ?auto_658438 ?auto_658442 ) ) ( not ( = ?auto_658438 ?auto_658443 ) ) ( not ( = ?auto_658438 ?auto_658444 ) ) ( not ( = ?auto_658438 ?auto_658445 ) ) ( not ( = ?auto_658438 ?auto_658446 ) ) ( not ( = ?auto_658439 ?auto_658440 ) ) ( not ( = ?auto_658439 ?auto_658441 ) ) ( not ( = ?auto_658439 ?auto_658442 ) ) ( not ( = ?auto_658439 ?auto_658443 ) ) ( not ( = ?auto_658439 ?auto_658444 ) ) ( not ( = ?auto_658439 ?auto_658445 ) ) ( not ( = ?auto_658439 ?auto_658446 ) ) ( not ( = ?auto_658440 ?auto_658441 ) ) ( not ( = ?auto_658440 ?auto_658442 ) ) ( not ( = ?auto_658440 ?auto_658443 ) ) ( not ( = ?auto_658440 ?auto_658444 ) ) ( not ( = ?auto_658440 ?auto_658445 ) ) ( not ( = ?auto_658440 ?auto_658446 ) ) ( not ( = ?auto_658441 ?auto_658442 ) ) ( not ( = ?auto_658441 ?auto_658443 ) ) ( not ( = ?auto_658441 ?auto_658444 ) ) ( not ( = ?auto_658441 ?auto_658445 ) ) ( not ( = ?auto_658441 ?auto_658446 ) ) ( not ( = ?auto_658442 ?auto_658443 ) ) ( not ( = ?auto_658442 ?auto_658444 ) ) ( not ( = ?auto_658442 ?auto_658445 ) ) ( not ( = ?auto_658442 ?auto_658446 ) ) ( not ( = ?auto_658443 ?auto_658444 ) ) ( not ( = ?auto_658443 ?auto_658445 ) ) ( not ( = ?auto_658443 ?auto_658446 ) ) ( not ( = ?auto_658444 ?auto_658445 ) ) ( not ( = ?auto_658444 ?auto_658446 ) ) ( not ( = ?auto_658445 ?auto_658446 ) ) ( ON ?auto_658444 ?auto_658445 ) ( ON ?auto_658443 ?auto_658444 ) ( ON ?auto_658442 ?auto_658443 ) ( ON ?auto_658441 ?auto_658442 ) ( ON ?auto_658440 ?auto_658441 ) ( ON ?auto_658439 ?auto_658440 ) ( ON ?auto_658438 ?auto_658439 ) ( CLEAR ?auto_658438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_658438 )
      ( MAKE-8PILE ?auto_658438 ?auto_658439 ?auto_658440 ?auto_658441 ?auto_658442 ?auto_658443 ?auto_658444 ?auto_658445 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_658473 - BLOCK
      ?auto_658474 - BLOCK
      ?auto_658475 - BLOCK
      ?auto_658476 - BLOCK
      ?auto_658477 - BLOCK
      ?auto_658478 - BLOCK
      ?auto_658479 - BLOCK
      ?auto_658480 - BLOCK
      ?auto_658481 - BLOCK
    )
    :vars
    (
      ?auto_658482 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_658480 ) ( ON ?auto_658481 ?auto_658482 ) ( CLEAR ?auto_658481 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_658473 ) ( ON ?auto_658474 ?auto_658473 ) ( ON ?auto_658475 ?auto_658474 ) ( ON ?auto_658476 ?auto_658475 ) ( ON ?auto_658477 ?auto_658476 ) ( ON ?auto_658478 ?auto_658477 ) ( ON ?auto_658479 ?auto_658478 ) ( ON ?auto_658480 ?auto_658479 ) ( not ( = ?auto_658473 ?auto_658474 ) ) ( not ( = ?auto_658473 ?auto_658475 ) ) ( not ( = ?auto_658473 ?auto_658476 ) ) ( not ( = ?auto_658473 ?auto_658477 ) ) ( not ( = ?auto_658473 ?auto_658478 ) ) ( not ( = ?auto_658473 ?auto_658479 ) ) ( not ( = ?auto_658473 ?auto_658480 ) ) ( not ( = ?auto_658473 ?auto_658481 ) ) ( not ( = ?auto_658473 ?auto_658482 ) ) ( not ( = ?auto_658474 ?auto_658475 ) ) ( not ( = ?auto_658474 ?auto_658476 ) ) ( not ( = ?auto_658474 ?auto_658477 ) ) ( not ( = ?auto_658474 ?auto_658478 ) ) ( not ( = ?auto_658474 ?auto_658479 ) ) ( not ( = ?auto_658474 ?auto_658480 ) ) ( not ( = ?auto_658474 ?auto_658481 ) ) ( not ( = ?auto_658474 ?auto_658482 ) ) ( not ( = ?auto_658475 ?auto_658476 ) ) ( not ( = ?auto_658475 ?auto_658477 ) ) ( not ( = ?auto_658475 ?auto_658478 ) ) ( not ( = ?auto_658475 ?auto_658479 ) ) ( not ( = ?auto_658475 ?auto_658480 ) ) ( not ( = ?auto_658475 ?auto_658481 ) ) ( not ( = ?auto_658475 ?auto_658482 ) ) ( not ( = ?auto_658476 ?auto_658477 ) ) ( not ( = ?auto_658476 ?auto_658478 ) ) ( not ( = ?auto_658476 ?auto_658479 ) ) ( not ( = ?auto_658476 ?auto_658480 ) ) ( not ( = ?auto_658476 ?auto_658481 ) ) ( not ( = ?auto_658476 ?auto_658482 ) ) ( not ( = ?auto_658477 ?auto_658478 ) ) ( not ( = ?auto_658477 ?auto_658479 ) ) ( not ( = ?auto_658477 ?auto_658480 ) ) ( not ( = ?auto_658477 ?auto_658481 ) ) ( not ( = ?auto_658477 ?auto_658482 ) ) ( not ( = ?auto_658478 ?auto_658479 ) ) ( not ( = ?auto_658478 ?auto_658480 ) ) ( not ( = ?auto_658478 ?auto_658481 ) ) ( not ( = ?auto_658478 ?auto_658482 ) ) ( not ( = ?auto_658479 ?auto_658480 ) ) ( not ( = ?auto_658479 ?auto_658481 ) ) ( not ( = ?auto_658479 ?auto_658482 ) ) ( not ( = ?auto_658480 ?auto_658481 ) ) ( not ( = ?auto_658480 ?auto_658482 ) ) ( not ( = ?auto_658481 ?auto_658482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_658481 ?auto_658482 )
      ( !STACK ?auto_658481 ?auto_658480 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_658511 - BLOCK
      ?auto_658512 - BLOCK
      ?auto_658513 - BLOCK
      ?auto_658514 - BLOCK
      ?auto_658515 - BLOCK
      ?auto_658516 - BLOCK
      ?auto_658517 - BLOCK
      ?auto_658518 - BLOCK
      ?auto_658519 - BLOCK
    )
    :vars
    (
      ?auto_658520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658519 ?auto_658520 ) ( ON-TABLE ?auto_658511 ) ( ON ?auto_658512 ?auto_658511 ) ( ON ?auto_658513 ?auto_658512 ) ( ON ?auto_658514 ?auto_658513 ) ( ON ?auto_658515 ?auto_658514 ) ( ON ?auto_658516 ?auto_658515 ) ( ON ?auto_658517 ?auto_658516 ) ( not ( = ?auto_658511 ?auto_658512 ) ) ( not ( = ?auto_658511 ?auto_658513 ) ) ( not ( = ?auto_658511 ?auto_658514 ) ) ( not ( = ?auto_658511 ?auto_658515 ) ) ( not ( = ?auto_658511 ?auto_658516 ) ) ( not ( = ?auto_658511 ?auto_658517 ) ) ( not ( = ?auto_658511 ?auto_658518 ) ) ( not ( = ?auto_658511 ?auto_658519 ) ) ( not ( = ?auto_658511 ?auto_658520 ) ) ( not ( = ?auto_658512 ?auto_658513 ) ) ( not ( = ?auto_658512 ?auto_658514 ) ) ( not ( = ?auto_658512 ?auto_658515 ) ) ( not ( = ?auto_658512 ?auto_658516 ) ) ( not ( = ?auto_658512 ?auto_658517 ) ) ( not ( = ?auto_658512 ?auto_658518 ) ) ( not ( = ?auto_658512 ?auto_658519 ) ) ( not ( = ?auto_658512 ?auto_658520 ) ) ( not ( = ?auto_658513 ?auto_658514 ) ) ( not ( = ?auto_658513 ?auto_658515 ) ) ( not ( = ?auto_658513 ?auto_658516 ) ) ( not ( = ?auto_658513 ?auto_658517 ) ) ( not ( = ?auto_658513 ?auto_658518 ) ) ( not ( = ?auto_658513 ?auto_658519 ) ) ( not ( = ?auto_658513 ?auto_658520 ) ) ( not ( = ?auto_658514 ?auto_658515 ) ) ( not ( = ?auto_658514 ?auto_658516 ) ) ( not ( = ?auto_658514 ?auto_658517 ) ) ( not ( = ?auto_658514 ?auto_658518 ) ) ( not ( = ?auto_658514 ?auto_658519 ) ) ( not ( = ?auto_658514 ?auto_658520 ) ) ( not ( = ?auto_658515 ?auto_658516 ) ) ( not ( = ?auto_658515 ?auto_658517 ) ) ( not ( = ?auto_658515 ?auto_658518 ) ) ( not ( = ?auto_658515 ?auto_658519 ) ) ( not ( = ?auto_658515 ?auto_658520 ) ) ( not ( = ?auto_658516 ?auto_658517 ) ) ( not ( = ?auto_658516 ?auto_658518 ) ) ( not ( = ?auto_658516 ?auto_658519 ) ) ( not ( = ?auto_658516 ?auto_658520 ) ) ( not ( = ?auto_658517 ?auto_658518 ) ) ( not ( = ?auto_658517 ?auto_658519 ) ) ( not ( = ?auto_658517 ?auto_658520 ) ) ( not ( = ?auto_658518 ?auto_658519 ) ) ( not ( = ?auto_658518 ?auto_658520 ) ) ( not ( = ?auto_658519 ?auto_658520 ) ) ( CLEAR ?auto_658517 ) ( ON ?auto_658518 ?auto_658519 ) ( CLEAR ?auto_658518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_658511 ?auto_658512 ?auto_658513 ?auto_658514 ?auto_658515 ?auto_658516 ?auto_658517 ?auto_658518 )
      ( MAKE-9PILE ?auto_658511 ?auto_658512 ?auto_658513 ?auto_658514 ?auto_658515 ?auto_658516 ?auto_658517 ?auto_658518 ?auto_658519 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_658549 - BLOCK
      ?auto_658550 - BLOCK
      ?auto_658551 - BLOCK
      ?auto_658552 - BLOCK
      ?auto_658553 - BLOCK
      ?auto_658554 - BLOCK
      ?auto_658555 - BLOCK
      ?auto_658556 - BLOCK
      ?auto_658557 - BLOCK
    )
    :vars
    (
      ?auto_658558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658557 ?auto_658558 ) ( ON-TABLE ?auto_658549 ) ( ON ?auto_658550 ?auto_658549 ) ( ON ?auto_658551 ?auto_658550 ) ( ON ?auto_658552 ?auto_658551 ) ( ON ?auto_658553 ?auto_658552 ) ( ON ?auto_658554 ?auto_658553 ) ( not ( = ?auto_658549 ?auto_658550 ) ) ( not ( = ?auto_658549 ?auto_658551 ) ) ( not ( = ?auto_658549 ?auto_658552 ) ) ( not ( = ?auto_658549 ?auto_658553 ) ) ( not ( = ?auto_658549 ?auto_658554 ) ) ( not ( = ?auto_658549 ?auto_658555 ) ) ( not ( = ?auto_658549 ?auto_658556 ) ) ( not ( = ?auto_658549 ?auto_658557 ) ) ( not ( = ?auto_658549 ?auto_658558 ) ) ( not ( = ?auto_658550 ?auto_658551 ) ) ( not ( = ?auto_658550 ?auto_658552 ) ) ( not ( = ?auto_658550 ?auto_658553 ) ) ( not ( = ?auto_658550 ?auto_658554 ) ) ( not ( = ?auto_658550 ?auto_658555 ) ) ( not ( = ?auto_658550 ?auto_658556 ) ) ( not ( = ?auto_658550 ?auto_658557 ) ) ( not ( = ?auto_658550 ?auto_658558 ) ) ( not ( = ?auto_658551 ?auto_658552 ) ) ( not ( = ?auto_658551 ?auto_658553 ) ) ( not ( = ?auto_658551 ?auto_658554 ) ) ( not ( = ?auto_658551 ?auto_658555 ) ) ( not ( = ?auto_658551 ?auto_658556 ) ) ( not ( = ?auto_658551 ?auto_658557 ) ) ( not ( = ?auto_658551 ?auto_658558 ) ) ( not ( = ?auto_658552 ?auto_658553 ) ) ( not ( = ?auto_658552 ?auto_658554 ) ) ( not ( = ?auto_658552 ?auto_658555 ) ) ( not ( = ?auto_658552 ?auto_658556 ) ) ( not ( = ?auto_658552 ?auto_658557 ) ) ( not ( = ?auto_658552 ?auto_658558 ) ) ( not ( = ?auto_658553 ?auto_658554 ) ) ( not ( = ?auto_658553 ?auto_658555 ) ) ( not ( = ?auto_658553 ?auto_658556 ) ) ( not ( = ?auto_658553 ?auto_658557 ) ) ( not ( = ?auto_658553 ?auto_658558 ) ) ( not ( = ?auto_658554 ?auto_658555 ) ) ( not ( = ?auto_658554 ?auto_658556 ) ) ( not ( = ?auto_658554 ?auto_658557 ) ) ( not ( = ?auto_658554 ?auto_658558 ) ) ( not ( = ?auto_658555 ?auto_658556 ) ) ( not ( = ?auto_658555 ?auto_658557 ) ) ( not ( = ?auto_658555 ?auto_658558 ) ) ( not ( = ?auto_658556 ?auto_658557 ) ) ( not ( = ?auto_658556 ?auto_658558 ) ) ( not ( = ?auto_658557 ?auto_658558 ) ) ( ON ?auto_658556 ?auto_658557 ) ( CLEAR ?auto_658554 ) ( ON ?auto_658555 ?auto_658556 ) ( CLEAR ?auto_658555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_658549 ?auto_658550 ?auto_658551 ?auto_658552 ?auto_658553 ?auto_658554 ?auto_658555 )
      ( MAKE-9PILE ?auto_658549 ?auto_658550 ?auto_658551 ?auto_658552 ?auto_658553 ?auto_658554 ?auto_658555 ?auto_658556 ?auto_658557 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_658587 - BLOCK
      ?auto_658588 - BLOCK
      ?auto_658589 - BLOCK
      ?auto_658590 - BLOCK
      ?auto_658591 - BLOCK
      ?auto_658592 - BLOCK
      ?auto_658593 - BLOCK
      ?auto_658594 - BLOCK
      ?auto_658595 - BLOCK
    )
    :vars
    (
      ?auto_658596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658595 ?auto_658596 ) ( ON-TABLE ?auto_658587 ) ( ON ?auto_658588 ?auto_658587 ) ( ON ?auto_658589 ?auto_658588 ) ( ON ?auto_658590 ?auto_658589 ) ( ON ?auto_658591 ?auto_658590 ) ( not ( = ?auto_658587 ?auto_658588 ) ) ( not ( = ?auto_658587 ?auto_658589 ) ) ( not ( = ?auto_658587 ?auto_658590 ) ) ( not ( = ?auto_658587 ?auto_658591 ) ) ( not ( = ?auto_658587 ?auto_658592 ) ) ( not ( = ?auto_658587 ?auto_658593 ) ) ( not ( = ?auto_658587 ?auto_658594 ) ) ( not ( = ?auto_658587 ?auto_658595 ) ) ( not ( = ?auto_658587 ?auto_658596 ) ) ( not ( = ?auto_658588 ?auto_658589 ) ) ( not ( = ?auto_658588 ?auto_658590 ) ) ( not ( = ?auto_658588 ?auto_658591 ) ) ( not ( = ?auto_658588 ?auto_658592 ) ) ( not ( = ?auto_658588 ?auto_658593 ) ) ( not ( = ?auto_658588 ?auto_658594 ) ) ( not ( = ?auto_658588 ?auto_658595 ) ) ( not ( = ?auto_658588 ?auto_658596 ) ) ( not ( = ?auto_658589 ?auto_658590 ) ) ( not ( = ?auto_658589 ?auto_658591 ) ) ( not ( = ?auto_658589 ?auto_658592 ) ) ( not ( = ?auto_658589 ?auto_658593 ) ) ( not ( = ?auto_658589 ?auto_658594 ) ) ( not ( = ?auto_658589 ?auto_658595 ) ) ( not ( = ?auto_658589 ?auto_658596 ) ) ( not ( = ?auto_658590 ?auto_658591 ) ) ( not ( = ?auto_658590 ?auto_658592 ) ) ( not ( = ?auto_658590 ?auto_658593 ) ) ( not ( = ?auto_658590 ?auto_658594 ) ) ( not ( = ?auto_658590 ?auto_658595 ) ) ( not ( = ?auto_658590 ?auto_658596 ) ) ( not ( = ?auto_658591 ?auto_658592 ) ) ( not ( = ?auto_658591 ?auto_658593 ) ) ( not ( = ?auto_658591 ?auto_658594 ) ) ( not ( = ?auto_658591 ?auto_658595 ) ) ( not ( = ?auto_658591 ?auto_658596 ) ) ( not ( = ?auto_658592 ?auto_658593 ) ) ( not ( = ?auto_658592 ?auto_658594 ) ) ( not ( = ?auto_658592 ?auto_658595 ) ) ( not ( = ?auto_658592 ?auto_658596 ) ) ( not ( = ?auto_658593 ?auto_658594 ) ) ( not ( = ?auto_658593 ?auto_658595 ) ) ( not ( = ?auto_658593 ?auto_658596 ) ) ( not ( = ?auto_658594 ?auto_658595 ) ) ( not ( = ?auto_658594 ?auto_658596 ) ) ( not ( = ?auto_658595 ?auto_658596 ) ) ( ON ?auto_658594 ?auto_658595 ) ( ON ?auto_658593 ?auto_658594 ) ( CLEAR ?auto_658591 ) ( ON ?auto_658592 ?auto_658593 ) ( CLEAR ?auto_658592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_658587 ?auto_658588 ?auto_658589 ?auto_658590 ?auto_658591 ?auto_658592 )
      ( MAKE-9PILE ?auto_658587 ?auto_658588 ?auto_658589 ?auto_658590 ?auto_658591 ?auto_658592 ?auto_658593 ?auto_658594 ?auto_658595 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_658625 - BLOCK
      ?auto_658626 - BLOCK
      ?auto_658627 - BLOCK
      ?auto_658628 - BLOCK
      ?auto_658629 - BLOCK
      ?auto_658630 - BLOCK
      ?auto_658631 - BLOCK
      ?auto_658632 - BLOCK
      ?auto_658633 - BLOCK
    )
    :vars
    (
      ?auto_658634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658633 ?auto_658634 ) ( ON-TABLE ?auto_658625 ) ( ON ?auto_658626 ?auto_658625 ) ( ON ?auto_658627 ?auto_658626 ) ( ON ?auto_658628 ?auto_658627 ) ( not ( = ?auto_658625 ?auto_658626 ) ) ( not ( = ?auto_658625 ?auto_658627 ) ) ( not ( = ?auto_658625 ?auto_658628 ) ) ( not ( = ?auto_658625 ?auto_658629 ) ) ( not ( = ?auto_658625 ?auto_658630 ) ) ( not ( = ?auto_658625 ?auto_658631 ) ) ( not ( = ?auto_658625 ?auto_658632 ) ) ( not ( = ?auto_658625 ?auto_658633 ) ) ( not ( = ?auto_658625 ?auto_658634 ) ) ( not ( = ?auto_658626 ?auto_658627 ) ) ( not ( = ?auto_658626 ?auto_658628 ) ) ( not ( = ?auto_658626 ?auto_658629 ) ) ( not ( = ?auto_658626 ?auto_658630 ) ) ( not ( = ?auto_658626 ?auto_658631 ) ) ( not ( = ?auto_658626 ?auto_658632 ) ) ( not ( = ?auto_658626 ?auto_658633 ) ) ( not ( = ?auto_658626 ?auto_658634 ) ) ( not ( = ?auto_658627 ?auto_658628 ) ) ( not ( = ?auto_658627 ?auto_658629 ) ) ( not ( = ?auto_658627 ?auto_658630 ) ) ( not ( = ?auto_658627 ?auto_658631 ) ) ( not ( = ?auto_658627 ?auto_658632 ) ) ( not ( = ?auto_658627 ?auto_658633 ) ) ( not ( = ?auto_658627 ?auto_658634 ) ) ( not ( = ?auto_658628 ?auto_658629 ) ) ( not ( = ?auto_658628 ?auto_658630 ) ) ( not ( = ?auto_658628 ?auto_658631 ) ) ( not ( = ?auto_658628 ?auto_658632 ) ) ( not ( = ?auto_658628 ?auto_658633 ) ) ( not ( = ?auto_658628 ?auto_658634 ) ) ( not ( = ?auto_658629 ?auto_658630 ) ) ( not ( = ?auto_658629 ?auto_658631 ) ) ( not ( = ?auto_658629 ?auto_658632 ) ) ( not ( = ?auto_658629 ?auto_658633 ) ) ( not ( = ?auto_658629 ?auto_658634 ) ) ( not ( = ?auto_658630 ?auto_658631 ) ) ( not ( = ?auto_658630 ?auto_658632 ) ) ( not ( = ?auto_658630 ?auto_658633 ) ) ( not ( = ?auto_658630 ?auto_658634 ) ) ( not ( = ?auto_658631 ?auto_658632 ) ) ( not ( = ?auto_658631 ?auto_658633 ) ) ( not ( = ?auto_658631 ?auto_658634 ) ) ( not ( = ?auto_658632 ?auto_658633 ) ) ( not ( = ?auto_658632 ?auto_658634 ) ) ( not ( = ?auto_658633 ?auto_658634 ) ) ( ON ?auto_658632 ?auto_658633 ) ( ON ?auto_658631 ?auto_658632 ) ( ON ?auto_658630 ?auto_658631 ) ( CLEAR ?auto_658628 ) ( ON ?auto_658629 ?auto_658630 ) ( CLEAR ?auto_658629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_658625 ?auto_658626 ?auto_658627 ?auto_658628 ?auto_658629 )
      ( MAKE-9PILE ?auto_658625 ?auto_658626 ?auto_658627 ?auto_658628 ?auto_658629 ?auto_658630 ?auto_658631 ?auto_658632 ?auto_658633 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_658663 - BLOCK
      ?auto_658664 - BLOCK
      ?auto_658665 - BLOCK
      ?auto_658666 - BLOCK
      ?auto_658667 - BLOCK
      ?auto_658668 - BLOCK
      ?auto_658669 - BLOCK
      ?auto_658670 - BLOCK
      ?auto_658671 - BLOCK
    )
    :vars
    (
      ?auto_658672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658671 ?auto_658672 ) ( ON-TABLE ?auto_658663 ) ( ON ?auto_658664 ?auto_658663 ) ( ON ?auto_658665 ?auto_658664 ) ( not ( = ?auto_658663 ?auto_658664 ) ) ( not ( = ?auto_658663 ?auto_658665 ) ) ( not ( = ?auto_658663 ?auto_658666 ) ) ( not ( = ?auto_658663 ?auto_658667 ) ) ( not ( = ?auto_658663 ?auto_658668 ) ) ( not ( = ?auto_658663 ?auto_658669 ) ) ( not ( = ?auto_658663 ?auto_658670 ) ) ( not ( = ?auto_658663 ?auto_658671 ) ) ( not ( = ?auto_658663 ?auto_658672 ) ) ( not ( = ?auto_658664 ?auto_658665 ) ) ( not ( = ?auto_658664 ?auto_658666 ) ) ( not ( = ?auto_658664 ?auto_658667 ) ) ( not ( = ?auto_658664 ?auto_658668 ) ) ( not ( = ?auto_658664 ?auto_658669 ) ) ( not ( = ?auto_658664 ?auto_658670 ) ) ( not ( = ?auto_658664 ?auto_658671 ) ) ( not ( = ?auto_658664 ?auto_658672 ) ) ( not ( = ?auto_658665 ?auto_658666 ) ) ( not ( = ?auto_658665 ?auto_658667 ) ) ( not ( = ?auto_658665 ?auto_658668 ) ) ( not ( = ?auto_658665 ?auto_658669 ) ) ( not ( = ?auto_658665 ?auto_658670 ) ) ( not ( = ?auto_658665 ?auto_658671 ) ) ( not ( = ?auto_658665 ?auto_658672 ) ) ( not ( = ?auto_658666 ?auto_658667 ) ) ( not ( = ?auto_658666 ?auto_658668 ) ) ( not ( = ?auto_658666 ?auto_658669 ) ) ( not ( = ?auto_658666 ?auto_658670 ) ) ( not ( = ?auto_658666 ?auto_658671 ) ) ( not ( = ?auto_658666 ?auto_658672 ) ) ( not ( = ?auto_658667 ?auto_658668 ) ) ( not ( = ?auto_658667 ?auto_658669 ) ) ( not ( = ?auto_658667 ?auto_658670 ) ) ( not ( = ?auto_658667 ?auto_658671 ) ) ( not ( = ?auto_658667 ?auto_658672 ) ) ( not ( = ?auto_658668 ?auto_658669 ) ) ( not ( = ?auto_658668 ?auto_658670 ) ) ( not ( = ?auto_658668 ?auto_658671 ) ) ( not ( = ?auto_658668 ?auto_658672 ) ) ( not ( = ?auto_658669 ?auto_658670 ) ) ( not ( = ?auto_658669 ?auto_658671 ) ) ( not ( = ?auto_658669 ?auto_658672 ) ) ( not ( = ?auto_658670 ?auto_658671 ) ) ( not ( = ?auto_658670 ?auto_658672 ) ) ( not ( = ?auto_658671 ?auto_658672 ) ) ( ON ?auto_658670 ?auto_658671 ) ( ON ?auto_658669 ?auto_658670 ) ( ON ?auto_658668 ?auto_658669 ) ( ON ?auto_658667 ?auto_658668 ) ( CLEAR ?auto_658665 ) ( ON ?auto_658666 ?auto_658667 ) ( CLEAR ?auto_658666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_658663 ?auto_658664 ?auto_658665 ?auto_658666 )
      ( MAKE-9PILE ?auto_658663 ?auto_658664 ?auto_658665 ?auto_658666 ?auto_658667 ?auto_658668 ?auto_658669 ?auto_658670 ?auto_658671 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_658701 - BLOCK
      ?auto_658702 - BLOCK
      ?auto_658703 - BLOCK
      ?auto_658704 - BLOCK
      ?auto_658705 - BLOCK
      ?auto_658706 - BLOCK
      ?auto_658707 - BLOCK
      ?auto_658708 - BLOCK
      ?auto_658709 - BLOCK
    )
    :vars
    (
      ?auto_658710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658709 ?auto_658710 ) ( ON-TABLE ?auto_658701 ) ( ON ?auto_658702 ?auto_658701 ) ( not ( = ?auto_658701 ?auto_658702 ) ) ( not ( = ?auto_658701 ?auto_658703 ) ) ( not ( = ?auto_658701 ?auto_658704 ) ) ( not ( = ?auto_658701 ?auto_658705 ) ) ( not ( = ?auto_658701 ?auto_658706 ) ) ( not ( = ?auto_658701 ?auto_658707 ) ) ( not ( = ?auto_658701 ?auto_658708 ) ) ( not ( = ?auto_658701 ?auto_658709 ) ) ( not ( = ?auto_658701 ?auto_658710 ) ) ( not ( = ?auto_658702 ?auto_658703 ) ) ( not ( = ?auto_658702 ?auto_658704 ) ) ( not ( = ?auto_658702 ?auto_658705 ) ) ( not ( = ?auto_658702 ?auto_658706 ) ) ( not ( = ?auto_658702 ?auto_658707 ) ) ( not ( = ?auto_658702 ?auto_658708 ) ) ( not ( = ?auto_658702 ?auto_658709 ) ) ( not ( = ?auto_658702 ?auto_658710 ) ) ( not ( = ?auto_658703 ?auto_658704 ) ) ( not ( = ?auto_658703 ?auto_658705 ) ) ( not ( = ?auto_658703 ?auto_658706 ) ) ( not ( = ?auto_658703 ?auto_658707 ) ) ( not ( = ?auto_658703 ?auto_658708 ) ) ( not ( = ?auto_658703 ?auto_658709 ) ) ( not ( = ?auto_658703 ?auto_658710 ) ) ( not ( = ?auto_658704 ?auto_658705 ) ) ( not ( = ?auto_658704 ?auto_658706 ) ) ( not ( = ?auto_658704 ?auto_658707 ) ) ( not ( = ?auto_658704 ?auto_658708 ) ) ( not ( = ?auto_658704 ?auto_658709 ) ) ( not ( = ?auto_658704 ?auto_658710 ) ) ( not ( = ?auto_658705 ?auto_658706 ) ) ( not ( = ?auto_658705 ?auto_658707 ) ) ( not ( = ?auto_658705 ?auto_658708 ) ) ( not ( = ?auto_658705 ?auto_658709 ) ) ( not ( = ?auto_658705 ?auto_658710 ) ) ( not ( = ?auto_658706 ?auto_658707 ) ) ( not ( = ?auto_658706 ?auto_658708 ) ) ( not ( = ?auto_658706 ?auto_658709 ) ) ( not ( = ?auto_658706 ?auto_658710 ) ) ( not ( = ?auto_658707 ?auto_658708 ) ) ( not ( = ?auto_658707 ?auto_658709 ) ) ( not ( = ?auto_658707 ?auto_658710 ) ) ( not ( = ?auto_658708 ?auto_658709 ) ) ( not ( = ?auto_658708 ?auto_658710 ) ) ( not ( = ?auto_658709 ?auto_658710 ) ) ( ON ?auto_658708 ?auto_658709 ) ( ON ?auto_658707 ?auto_658708 ) ( ON ?auto_658706 ?auto_658707 ) ( ON ?auto_658705 ?auto_658706 ) ( ON ?auto_658704 ?auto_658705 ) ( CLEAR ?auto_658702 ) ( ON ?auto_658703 ?auto_658704 ) ( CLEAR ?auto_658703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_658701 ?auto_658702 ?auto_658703 )
      ( MAKE-9PILE ?auto_658701 ?auto_658702 ?auto_658703 ?auto_658704 ?auto_658705 ?auto_658706 ?auto_658707 ?auto_658708 ?auto_658709 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_658739 - BLOCK
      ?auto_658740 - BLOCK
      ?auto_658741 - BLOCK
      ?auto_658742 - BLOCK
      ?auto_658743 - BLOCK
      ?auto_658744 - BLOCK
      ?auto_658745 - BLOCK
      ?auto_658746 - BLOCK
      ?auto_658747 - BLOCK
    )
    :vars
    (
      ?auto_658748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658747 ?auto_658748 ) ( ON-TABLE ?auto_658739 ) ( not ( = ?auto_658739 ?auto_658740 ) ) ( not ( = ?auto_658739 ?auto_658741 ) ) ( not ( = ?auto_658739 ?auto_658742 ) ) ( not ( = ?auto_658739 ?auto_658743 ) ) ( not ( = ?auto_658739 ?auto_658744 ) ) ( not ( = ?auto_658739 ?auto_658745 ) ) ( not ( = ?auto_658739 ?auto_658746 ) ) ( not ( = ?auto_658739 ?auto_658747 ) ) ( not ( = ?auto_658739 ?auto_658748 ) ) ( not ( = ?auto_658740 ?auto_658741 ) ) ( not ( = ?auto_658740 ?auto_658742 ) ) ( not ( = ?auto_658740 ?auto_658743 ) ) ( not ( = ?auto_658740 ?auto_658744 ) ) ( not ( = ?auto_658740 ?auto_658745 ) ) ( not ( = ?auto_658740 ?auto_658746 ) ) ( not ( = ?auto_658740 ?auto_658747 ) ) ( not ( = ?auto_658740 ?auto_658748 ) ) ( not ( = ?auto_658741 ?auto_658742 ) ) ( not ( = ?auto_658741 ?auto_658743 ) ) ( not ( = ?auto_658741 ?auto_658744 ) ) ( not ( = ?auto_658741 ?auto_658745 ) ) ( not ( = ?auto_658741 ?auto_658746 ) ) ( not ( = ?auto_658741 ?auto_658747 ) ) ( not ( = ?auto_658741 ?auto_658748 ) ) ( not ( = ?auto_658742 ?auto_658743 ) ) ( not ( = ?auto_658742 ?auto_658744 ) ) ( not ( = ?auto_658742 ?auto_658745 ) ) ( not ( = ?auto_658742 ?auto_658746 ) ) ( not ( = ?auto_658742 ?auto_658747 ) ) ( not ( = ?auto_658742 ?auto_658748 ) ) ( not ( = ?auto_658743 ?auto_658744 ) ) ( not ( = ?auto_658743 ?auto_658745 ) ) ( not ( = ?auto_658743 ?auto_658746 ) ) ( not ( = ?auto_658743 ?auto_658747 ) ) ( not ( = ?auto_658743 ?auto_658748 ) ) ( not ( = ?auto_658744 ?auto_658745 ) ) ( not ( = ?auto_658744 ?auto_658746 ) ) ( not ( = ?auto_658744 ?auto_658747 ) ) ( not ( = ?auto_658744 ?auto_658748 ) ) ( not ( = ?auto_658745 ?auto_658746 ) ) ( not ( = ?auto_658745 ?auto_658747 ) ) ( not ( = ?auto_658745 ?auto_658748 ) ) ( not ( = ?auto_658746 ?auto_658747 ) ) ( not ( = ?auto_658746 ?auto_658748 ) ) ( not ( = ?auto_658747 ?auto_658748 ) ) ( ON ?auto_658746 ?auto_658747 ) ( ON ?auto_658745 ?auto_658746 ) ( ON ?auto_658744 ?auto_658745 ) ( ON ?auto_658743 ?auto_658744 ) ( ON ?auto_658742 ?auto_658743 ) ( ON ?auto_658741 ?auto_658742 ) ( CLEAR ?auto_658739 ) ( ON ?auto_658740 ?auto_658741 ) ( CLEAR ?auto_658740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_658739 ?auto_658740 )
      ( MAKE-9PILE ?auto_658739 ?auto_658740 ?auto_658741 ?auto_658742 ?auto_658743 ?auto_658744 ?auto_658745 ?auto_658746 ?auto_658747 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_658777 - BLOCK
      ?auto_658778 - BLOCK
      ?auto_658779 - BLOCK
      ?auto_658780 - BLOCK
      ?auto_658781 - BLOCK
      ?auto_658782 - BLOCK
      ?auto_658783 - BLOCK
      ?auto_658784 - BLOCK
      ?auto_658785 - BLOCK
    )
    :vars
    (
      ?auto_658786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658785 ?auto_658786 ) ( not ( = ?auto_658777 ?auto_658778 ) ) ( not ( = ?auto_658777 ?auto_658779 ) ) ( not ( = ?auto_658777 ?auto_658780 ) ) ( not ( = ?auto_658777 ?auto_658781 ) ) ( not ( = ?auto_658777 ?auto_658782 ) ) ( not ( = ?auto_658777 ?auto_658783 ) ) ( not ( = ?auto_658777 ?auto_658784 ) ) ( not ( = ?auto_658777 ?auto_658785 ) ) ( not ( = ?auto_658777 ?auto_658786 ) ) ( not ( = ?auto_658778 ?auto_658779 ) ) ( not ( = ?auto_658778 ?auto_658780 ) ) ( not ( = ?auto_658778 ?auto_658781 ) ) ( not ( = ?auto_658778 ?auto_658782 ) ) ( not ( = ?auto_658778 ?auto_658783 ) ) ( not ( = ?auto_658778 ?auto_658784 ) ) ( not ( = ?auto_658778 ?auto_658785 ) ) ( not ( = ?auto_658778 ?auto_658786 ) ) ( not ( = ?auto_658779 ?auto_658780 ) ) ( not ( = ?auto_658779 ?auto_658781 ) ) ( not ( = ?auto_658779 ?auto_658782 ) ) ( not ( = ?auto_658779 ?auto_658783 ) ) ( not ( = ?auto_658779 ?auto_658784 ) ) ( not ( = ?auto_658779 ?auto_658785 ) ) ( not ( = ?auto_658779 ?auto_658786 ) ) ( not ( = ?auto_658780 ?auto_658781 ) ) ( not ( = ?auto_658780 ?auto_658782 ) ) ( not ( = ?auto_658780 ?auto_658783 ) ) ( not ( = ?auto_658780 ?auto_658784 ) ) ( not ( = ?auto_658780 ?auto_658785 ) ) ( not ( = ?auto_658780 ?auto_658786 ) ) ( not ( = ?auto_658781 ?auto_658782 ) ) ( not ( = ?auto_658781 ?auto_658783 ) ) ( not ( = ?auto_658781 ?auto_658784 ) ) ( not ( = ?auto_658781 ?auto_658785 ) ) ( not ( = ?auto_658781 ?auto_658786 ) ) ( not ( = ?auto_658782 ?auto_658783 ) ) ( not ( = ?auto_658782 ?auto_658784 ) ) ( not ( = ?auto_658782 ?auto_658785 ) ) ( not ( = ?auto_658782 ?auto_658786 ) ) ( not ( = ?auto_658783 ?auto_658784 ) ) ( not ( = ?auto_658783 ?auto_658785 ) ) ( not ( = ?auto_658783 ?auto_658786 ) ) ( not ( = ?auto_658784 ?auto_658785 ) ) ( not ( = ?auto_658784 ?auto_658786 ) ) ( not ( = ?auto_658785 ?auto_658786 ) ) ( ON ?auto_658784 ?auto_658785 ) ( ON ?auto_658783 ?auto_658784 ) ( ON ?auto_658782 ?auto_658783 ) ( ON ?auto_658781 ?auto_658782 ) ( ON ?auto_658780 ?auto_658781 ) ( ON ?auto_658779 ?auto_658780 ) ( ON ?auto_658778 ?auto_658779 ) ( ON ?auto_658777 ?auto_658778 ) ( CLEAR ?auto_658777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_658777 )
      ( MAKE-9PILE ?auto_658777 ?auto_658778 ?auto_658779 ?auto_658780 ?auto_658781 ?auto_658782 ?auto_658783 ?auto_658784 ?auto_658785 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_658816 - BLOCK
      ?auto_658817 - BLOCK
      ?auto_658818 - BLOCK
      ?auto_658819 - BLOCK
      ?auto_658820 - BLOCK
      ?auto_658821 - BLOCK
      ?auto_658822 - BLOCK
      ?auto_658823 - BLOCK
      ?auto_658824 - BLOCK
      ?auto_658825 - BLOCK
    )
    :vars
    (
      ?auto_658826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_658824 ) ( ON ?auto_658825 ?auto_658826 ) ( CLEAR ?auto_658825 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_658816 ) ( ON ?auto_658817 ?auto_658816 ) ( ON ?auto_658818 ?auto_658817 ) ( ON ?auto_658819 ?auto_658818 ) ( ON ?auto_658820 ?auto_658819 ) ( ON ?auto_658821 ?auto_658820 ) ( ON ?auto_658822 ?auto_658821 ) ( ON ?auto_658823 ?auto_658822 ) ( ON ?auto_658824 ?auto_658823 ) ( not ( = ?auto_658816 ?auto_658817 ) ) ( not ( = ?auto_658816 ?auto_658818 ) ) ( not ( = ?auto_658816 ?auto_658819 ) ) ( not ( = ?auto_658816 ?auto_658820 ) ) ( not ( = ?auto_658816 ?auto_658821 ) ) ( not ( = ?auto_658816 ?auto_658822 ) ) ( not ( = ?auto_658816 ?auto_658823 ) ) ( not ( = ?auto_658816 ?auto_658824 ) ) ( not ( = ?auto_658816 ?auto_658825 ) ) ( not ( = ?auto_658816 ?auto_658826 ) ) ( not ( = ?auto_658817 ?auto_658818 ) ) ( not ( = ?auto_658817 ?auto_658819 ) ) ( not ( = ?auto_658817 ?auto_658820 ) ) ( not ( = ?auto_658817 ?auto_658821 ) ) ( not ( = ?auto_658817 ?auto_658822 ) ) ( not ( = ?auto_658817 ?auto_658823 ) ) ( not ( = ?auto_658817 ?auto_658824 ) ) ( not ( = ?auto_658817 ?auto_658825 ) ) ( not ( = ?auto_658817 ?auto_658826 ) ) ( not ( = ?auto_658818 ?auto_658819 ) ) ( not ( = ?auto_658818 ?auto_658820 ) ) ( not ( = ?auto_658818 ?auto_658821 ) ) ( not ( = ?auto_658818 ?auto_658822 ) ) ( not ( = ?auto_658818 ?auto_658823 ) ) ( not ( = ?auto_658818 ?auto_658824 ) ) ( not ( = ?auto_658818 ?auto_658825 ) ) ( not ( = ?auto_658818 ?auto_658826 ) ) ( not ( = ?auto_658819 ?auto_658820 ) ) ( not ( = ?auto_658819 ?auto_658821 ) ) ( not ( = ?auto_658819 ?auto_658822 ) ) ( not ( = ?auto_658819 ?auto_658823 ) ) ( not ( = ?auto_658819 ?auto_658824 ) ) ( not ( = ?auto_658819 ?auto_658825 ) ) ( not ( = ?auto_658819 ?auto_658826 ) ) ( not ( = ?auto_658820 ?auto_658821 ) ) ( not ( = ?auto_658820 ?auto_658822 ) ) ( not ( = ?auto_658820 ?auto_658823 ) ) ( not ( = ?auto_658820 ?auto_658824 ) ) ( not ( = ?auto_658820 ?auto_658825 ) ) ( not ( = ?auto_658820 ?auto_658826 ) ) ( not ( = ?auto_658821 ?auto_658822 ) ) ( not ( = ?auto_658821 ?auto_658823 ) ) ( not ( = ?auto_658821 ?auto_658824 ) ) ( not ( = ?auto_658821 ?auto_658825 ) ) ( not ( = ?auto_658821 ?auto_658826 ) ) ( not ( = ?auto_658822 ?auto_658823 ) ) ( not ( = ?auto_658822 ?auto_658824 ) ) ( not ( = ?auto_658822 ?auto_658825 ) ) ( not ( = ?auto_658822 ?auto_658826 ) ) ( not ( = ?auto_658823 ?auto_658824 ) ) ( not ( = ?auto_658823 ?auto_658825 ) ) ( not ( = ?auto_658823 ?auto_658826 ) ) ( not ( = ?auto_658824 ?auto_658825 ) ) ( not ( = ?auto_658824 ?auto_658826 ) ) ( not ( = ?auto_658825 ?auto_658826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_658825 ?auto_658826 )
      ( !STACK ?auto_658825 ?auto_658824 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_658858 - BLOCK
      ?auto_658859 - BLOCK
      ?auto_658860 - BLOCK
      ?auto_658861 - BLOCK
      ?auto_658862 - BLOCK
      ?auto_658863 - BLOCK
      ?auto_658864 - BLOCK
      ?auto_658865 - BLOCK
      ?auto_658866 - BLOCK
      ?auto_658867 - BLOCK
    )
    :vars
    (
      ?auto_658868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658867 ?auto_658868 ) ( ON-TABLE ?auto_658858 ) ( ON ?auto_658859 ?auto_658858 ) ( ON ?auto_658860 ?auto_658859 ) ( ON ?auto_658861 ?auto_658860 ) ( ON ?auto_658862 ?auto_658861 ) ( ON ?auto_658863 ?auto_658862 ) ( ON ?auto_658864 ?auto_658863 ) ( ON ?auto_658865 ?auto_658864 ) ( not ( = ?auto_658858 ?auto_658859 ) ) ( not ( = ?auto_658858 ?auto_658860 ) ) ( not ( = ?auto_658858 ?auto_658861 ) ) ( not ( = ?auto_658858 ?auto_658862 ) ) ( not ( = ?auto_658858 ?auto_658863 ) ) ( not ( = ?auto_658858 ?auto_658864 ) ) ( not ( = ?auto_658858 ?auto_658865 ) ) ( not ( = ?auto_658858 ?auto_658866 ) ) ( not ( = ?auto_658858 ?auto_658867 ) ) ( not ( = ?auto_658858 ?auto_658868 ) ) ( not ( = ?auto_658859 ?auto_658860 ) ) ( not ( = ?auto_658859 ?auto_658861 ) ) ( not ( = ?auto_658859 ?auto_658862 ) ) ( not ( = ?auto_658859 ?auto_658863 ) ) ( not ( = ?auto_658859 ?auto_658864 ) ) ( not ( = ?auto_658859 ?auto_658865 ) ) ( not ( = ?auto_658859 ?auto_658866 ) ) ( not ( = ?auto_658859 ?auto_658867 ) ) ( not ( = ?auto_658859 ?auto_658868 ) ) ( not ( = ?auto_658860 ?auto_658861 ) ) ( not ( = ?auto_658860 ?auto_658862 ) ) ( not ( = ?auto_658860 ?auto_658863 ) ) ( not ( = ?auto_658860 ?auto_658864 ) ) ( not ( = ?auto_658860 ?auto_658865 ) ) ( not ( = ?auto_658860 ?auto_658866 ) ) ( not ( = ?auto_658860 ?auto_658867 ) ) ( not ( = ?auto_658860 ?auto_658868 ) ) ( not ( = ?auto_658861 ?auto_658862 ) ) ( not ( = ?auto_658861 ?auto_658863 ) ) ( not ( = ?auto_658861 ?auto_658864 ) ) ( not ( = ?auto_658861 ?auto_658865 ) ) ( not ( = ?auto_658861 ?auto_658866 ) ) ( not ( = ?auto_658861 ?auto_658867 ) ) ( not ( = ?auto_658861 ?auto_658868 ) ) ( not ( = ?auto_658862 ?auto_658863 ) ) ( not ( = ?auto_658862 ?auto_658864 ) ) ( not ( = ?auto_658862 ?auto_658865 ) ) ( not ( = ?auto_658862 ?auto_658866 ) ) ( not ( = ?auto_658862 ?auto_658867 ) ) ( not ( = ?auto_658862 ?auto_658868 ) ) ( not ( = ?auto_658863 ?auto_658864 ) ) ( not ( = ?auto_658863 ?auto_658865 ) ) ( not ( = ?auto_658863 ?auto_658866 ) ) ( not ( = ?auto_658863 ?auto_658867 ) ) ( not ( = ?auto_658863 ?auto_658868 ) ) ( not ( = ?auto_658864 ?auto_658865 ) ) ( not ( = ?auto_658864 ?auto_658866 ) ) ( not ( = ?auto_658864 ?auto_658867 ) ) ( not ( = ?auto_658864 ?auto_658868 ) ) ( not ( = ?auto_658865 ?auto_658866 ) ) ( not ( = ?auto_658865 ?auto_658867 ) ) ( not ( = ?auto_658865 ?auto_658868 ) ) ( not ( = ?auto_658866 ?auto_658867 ) ) ( not ( = ?auto_658866 ?auto_658868 ) ) ( not ( = ?auto_658867 ?auto_658868 ) ) ( CLEAR ?auto_658865 ) ( ON ?auto_658866 ?auto_658867 ) ( CLEAR ?auto_658866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_658858 ?auto_658859 ?auto_658860 ?auto_658861 ?auto_658862 ?auto_658863 ?auto_658864 ?auto_658865 ?auto_658866 )
      ( MAKE-10PILE ?auto_658858 ?auto_658859 ?auto_658860 ?auto_658861 ?auto_658862 ?auto_658863 ?auto_658864 ?auto_658865 ?auto_658866 ?auto_658867 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_658900 - BLOCK
      ?auto_658901 - BLOCK
      ?auto_658902 - BLOCK
      ?auto_658903 - BLOCK
      ?auto_658904 - BLOCK
      ?auto_658905 - BLOCK
      ?auto_658906 - BLOCK
      ?auto_658907 - BLOCK
      ?auto_658908 - BLOCK
      ?auto_658909 - BLOCK
    )
    :vars
    (
      ?auto_658910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658909 ?auto_658910 ) ( ON-TABLE ?auto_658900 ) ( ON ?auto_658901 ?auto_658900 ) ( ON ?auto_658902 ?auto_658901 ) ( ON ?auto_658903 ?auto_658902 ) ( ON ?auto_658904 ?auto_658903 ) ( ON ?auto_658905 ?auto_658904 ) ( ON ?auto_658906 ?auto_658905 ) ( not ( = ?auto_658900 ?auto_658901 ) ) ( not ( = ?auto_658900 ?auto_658902 ) ) ( not ( = ?auto_658900 ?auto_658903 ) ) ( not ( = ?auto_658900 ?auto_658904 ) ) ( not ( = ?auto_658900 ?auto_658905 ) ) ( not ( = ?auto_658900 ?auto_658906 ) ) ( not ( = ?auto_658900 ?auto_658907 ) ) ( not ( = ?auto_658900 ?auto_658908 ) ) ( not ( = ?auto_658900 ?auto_658909 ) ) ( not ( = ?auto_658900 ?auto_658910 ) ) ( not ( = ?auto_658901 ?auto_658902 ) ) ( not ( = ?auto_658901 ?auto_658903 ) ) ( not ( = ?auto_658901 ?auto_658904 ) ) ( not ( = ?auto_658901 ?auto_658905 ) ) ( not ( = ?auto_658901 ?auto_658906 ) ) ( not ( = ?auto_658901 ?auto_658907 ) ) ( not ( = ?auto_658901 ?auto_658908 ) ) ( not ( = ?auto_658901 ?auto_658909 ) ) ( not ( = ?auto_658901 ?auto_658910 ) ) ( not ( = ?auto_658902 ?auto_658903 ) ) ( not ( = ?auto_658902 ?auto_658904 ) ) ( not ( = ?auto_658902 ?auto_658905 ) ) ( not ( = ?auto_658902 ?auto_658906 ) ) ( not ( = ?auto_658902 ?auto_658907 ) ) ( not ( = ?auto_658902 ?auto_658908 ) ) ( not ( = ?auto_658902 ?auto_658909 ) ) ( not ( = ?auto_658902 ?auto_658910 ) ) ( not ( = ?auto_658903 ?auto_658904 ) ) ( not ( = ?auto_658903 ?auto_658905 ) ) ( not ( = ?auto_658903 ?auto_658906 ) ) ( not ( = ?auto_658903 ?auto_658907 ) ) ( not ( = ?auto_658903 ?auto_658908 ) ) ( not ( = ?auto_658903 ?auto_658909 ) ) ( not ( = ?auto_658903 ?auto_658910 ) ) ( not ( = ?auto_658904 ?auto_658905 ) ) ( not ( = ?auto_658904 ?auto_658906 ) ) ( not ( = ?auto_658904 ?auto_658907 ) ) ( not ( = ?auto_658904 ?auto_658908 ) ) ( not ( = ?auto_658904 ?auto_658909 ) ) ( not ( = ?auto_658904 ?auto_658910 ) ) ( not ( = ?auto_658905 ?auto_658906 ) ) ( not ( = ?auto_658905 ?auto_658907 ) ) ( not ( = ?auto_658905 ?auto_658908 ) ) ( not ( = ?auto_658905 ?auto_658909 ) ) ( not ( = ?auto_658905 ?auto_658910 ) ) ( not ( = ?auto_658906 ?auto_658907 ) ) ( not ( = ?auto_658906 ?auto_658908 ) ) ( not ( = ?auto_658906 ?auto_658909 ) ) ( not ( = ?auto_658906 ?auto_658910 ) ) ( not ( = ?auto_658907 ?auto_658908 ) ) ( not ( = ?auto_658907 ?auto_658909 ) ) ( not ( = ?auto_658907 ?auto_658910 ) ) ( not ( = ?auto_658908 ?auto_658909 ) ) ( not ( = ?auto_658908 ?auto_658910 ) ) ( not ( = ?auto_658909 ?auto_658910 ) ) ( ON ?auto_658908 ?auto_658909 ) ( CLEAR ?auto_658906 ) ( ON ?auto_658907 ?auto_658908 ) ( CLEAR ?auto_658907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_658900 ?auto_658901 ?auto_658902 ?auto_658903 ?auto_658904 ?auto_658905 ?auto_658906 ?auto_658907 )
      ( MAKE-10PILE ?auto_658900 ?auto_658901 ?auto_658902 ?auto_658903 ?auto_658904 ?auto_658905 ?auto_658906 ?auto_658907 ?auto_658908 ?auto_658909 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_658942 - BLOCK
      ?auto_658943 - BLOCK
      ?auto_658944 - BLOCK
      ?auto_658945 - BLOCK
      ?auto_658946 - BLOCK
      ?auto_658947 - BLOCK
      ?auto_658948 - BLOCK
      ?auto_658949 - BLOCK
      ?auto_658950 - BLOCK
      ?auto_658951 - BLOCK
    )
    :vars
    (
      ?auto_658952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658951 ?auto_658952 ) ( ON-TABLE ?auto_658942 ) ( ON ?auto_658943 ?auto_658942 ) ( ON ?auto_658944 ?auto_658943 ) ( ON ?auto_658945 ?auto_658944 ) ( ON ?auto_658946 ?auto_658945 ) ( ON ?auto_658947 ?auto_658946 ) ( not ( = ?auto_658942 ?auto_658943 ) ) ( not ( = ?auto_658942 ?auto_658944 ) ) ( not ( = ?auto_658942 ?auto_658945 ) ) ( not ( = ?auto_658942 ?auto_658946 ) ) ( not ( = ?auto_658942 ?auto_658947 ) ) ( not ( = ?auto_658942 ?auto_658948 ) ) ( not ( = ?auto_658942 ?auto_658949 ) ) ( not ( = ?auto_658942 ?auto_658950 ) ) ( not ( = ?auto_658942 ?auto_658951 ) ) ( not ( = ?auto_658942 ?auto_658952 ) ) ( not ( = ?auto_658943 ?auto_658944 ) ) ( not ( = ?auto_658943 ?auto_658945 ) ) ( not ( = ?auto_658943 ?auto_658946 ) ) ( not ( = ?auto_658943 ?auto_658947 ) ) ( not ( = ?auto_658943 ?auto_658948 ) ) ( not ( = ?auto_658943 ?auto_658949 ) ) ( not ( = ?auto_658943 ?auto_658950 ) ) ( not ( = ?auto_658943 ?auto_658951 ) ) ( not ( = ?auto_658943 ?auto_658952 ) ) ( not ( = ?auto_658944 ?auto_658945 ) ) ( not ( = ?auto_658944 ?auto_658946 ) ) ( not ( = ?auto_658944 ?auto_658947 ) ) ( not ( = ?auto_658944 ?auto_658948 ) ) ( not ( = ?auto_658944 ?auto_658949 ) ) ( not ( = ?auto_658944 ?auto_658950 ) ) ( not ( = ?auto_658944 ?auto_658951 ) ) ( not ( = ?auto_658944 ?auto_658952 ) ) ( not ( = ?auto_658945 ?auto_658946 ) ) ( not ( = ?auto_658945 ?auto_658947 ) ) ( not ( = ?auto_658945 ?auto_658948 ) ) ( not ( = ?auto_658945 ?auto_658949 ) ) ( not ( = ?auto_658945 ?auto_658950 ) ) ( not ( = ?auto_658945 ?auto_658951 ) ) ( not ( = ?auto_658945 ?auto_658952 ) ) ( not ( = ?auto_658946 ?auto_658947 ) ) ( not ( = ?auto_658946 ?auto_658948 ) ) ( not ( = ?auto_658946 ?auto_658949 ) ) ( not ( = ?auto_658946 ?auto_658950 ) ) ( not ( = ?auto_658946 ?auto_658951 ) ) ( not ( = ?auto_658946 ?auto_658952 ) ) ( not ( = ?auto_658947 ?auto_658948 ) ) ( not ( = ?auto_658947 ?auto_658949 ) ) ( not ( = ?auto_658947 ?auto_658950 ) ) ( not ( = ?auto_658947 ?auto_658951 ) ) ( not ( = ?auto_658947 ?auto_658952 ) ) ( not ( = ?auto_658948 ?auto_658949 ) ) ( not ( = ?auto_658948 ?auto_658950 ) ) ( not ( = ?auto_658948 ?auto_658951 ) ) ( not ( = ?auto_658948 ?auto_658952 ) ) ( not ( = ?auto_658949 ?auto_658950 ) ) ( not ( = ?auto_658949 ?auto_658951 ) ) ( not ( = ?auto_658949 ?auto_658952 ) ) ( not ( = ?auto_658950 ?auto_658951 ) ) ( not ( = ?auto_658950 ?auto_658952 ) ) ( not ( = ?auto_658951 ?auto_658952 ) ) ( ON ?auto_658950 ?auto_658951 ) ( ON ?auto_658949 ?auto_658950 ) ( CLEAR ?auto_658947 ) ( ON ?auto_658948 ?auto_658949 ) ( CLEAR ?auto_658948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_658942 ?auto_658943 ?auto_658944 ?auto_658945 ?auto_658946 ?auto_658947 ?auto_658948 )
      ( MAKE-10PILE ?auto_658942 ?auto_658943 ?auto_658944 ?auto_658945 ?auto_658946 ?auto_658947 ?auto_658948 ?auto_658949 ?auto_658950 ?auto_658951 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_658984 - BLOCK
      ?auto_658985 - BLOCK
      ?auto_658986 - BLOCK
      ?auto_658987 - BLOCK
      ?auto_658988 - BLOCK
      ?auto_658989 - BLOCK
      ?auto_658990 - BLOCK
      ?auto_658991 - BLOCK
      ?auto_658992 - BLOCK
      ?auto_658993 - BLOCK
    )
    :vars
    (
      ?auto_658994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_658993 ?auto_658994 ) ( ON-TABLE ?auto_658984 ) ( ON ?auto_658985 ?auto_658984 ) ( ON ?auto_658986 ?auto_658985 ) ( ON ?auto_658987 ?auto_658986 ) ( ON ?auto_658988 ?auto_658987 ) ( not ( = ?auto_658984 ?auto_658985 ) ) ( not ( = ?auto_658984 ?auto_658986 ) ) ( not ( = ?auto_658984 ?auto_658987 ) ) ( not ( = ?auto_658984 ?auto_658988 ) ) ( not ( = ?auto_658984 ?auto_658989 ) ) ( not ( = ?auto_658984 ?auto_658990 ) ) ( not ( = ?auto_658984 ?auto_658991 ) ) ( not ( = ?auto_658984 ?auto_658992 ) ) ( not ( = ?auto_658984 ?auto_658993 ) ) ( not ( = ?auto_658984 ?auto_658994 ) ) ( not ( = ?auto_658985 ?auto_658986 ) ) ( not ( = ?auto_658985 ?auto_658987 ) ) ( not ( = ?auto_658985 ?auto_658988 ) ) ( not ( = ?auto_658985 ?auto_658989 ) ) ( not ( = ?auto_658985 ?auto_658990 ) ) ( not ( = ?auto_658985 ?auto_658991 ) ) ( not ( = ?auto_658985 ?auto_658992 ) ) ( not ( = ?auto_658985 ?auto_658993 ) ) ( not ( = ?auto_658985 ?auto_658994 ) ) ( not ( = ?auto_658986 ?auto_658987 ) ) ( not ( = ?auto_658986 ?auto_658988 ) ) ( not ( = ?auto_658986 ?auto_658989 ) ) ( not ( = ?auto_658986 ?auto_658990 ) ) ( not ( = ?auto_658986 ?auto_658991 ) ) ( not ( = ?auto_658986 ?auto_658992 ) ) ( not ( = ?auto_658986 ?auto_658993 ) ) ( not ( = ?auto_658986 ?auto_658994 ) ) ( not ( = ?auto_658987 ?auto_658988 ) ) ( not ( = ?auto_658987 ?auto_658989 ) ) ( not ( = ?auto_658987 ?auto_658990 ) ) ( not ( = ?auto_658987 ?auto_658991 ) ) ( not ( = ?auto_658987 ?auto_658992 ) ) ( not ( = ?auto_658987 ?auto_658993 ) ) ( not ( = ?auto_658987 ?auto_658994 ) ) ( not ( = ?auto_658988 ?auto_658989 ) ) ( not ( = ?auto_658988 ?auto_658990 ) ) ( not ( = ?auto_658988 ?auto_658991 ) ) ( not ( = ?auto_658988 ?auto_658992 ) ) ( not ( = ?auto_658988 ?auto_658993 ) ) ( not ( = ?auto_658988 ?auto_658994 ) ) ( not ( = ?auto_658989 ?auto_658990 ) ) ( not ( = ?auto_658989 ?auto_658991 ) ) ( not ( = ?auto_658989 ?auto_658992 ) ) ( not ( = ?auto_658989 ?auto_658993 ) ) ( not ( = ?auto_658989 ?auto_658994 ) ) ( not ( = ?auto_658990 ?auto_658991 ) ) ( not ( = ?auto_658990 ?auto_658992 ) ) ( not ( = ?auto_658990 ?auto_658993 ) ) ( not ( = ?auto_658990 ?auto_658994 ) ) ( not ( = ?auto_658991 ?auto_658992 ) ) ( not ( = ?auto_658991 ?auto_658993 ) ) ( not ( = ?auto_658991 ?auto_658994 ) ) ( not ( = ?auto_658992 ?auto_658993 ) ) ( not ( = ?auto_658992 ?auto_658994 ) ) ( not ( = ?auto_658993 ?auto_658994 ) ) ( ON ?auto_658992 ?auto_658993 ) ( ON ?auto_658991 ?auto_658992 ) ( ON ?auto_658990 ?auto_658991 ) ( CLEAR ?auto_658988 ) ( ON ?auto_658989 ?auto_658990 ) ( CLEAR ?auto_658989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_658984 ?auto_658985 ?auto_658986 ?auto_658987 ?auto_658988 ?auto_658989 )
      ( MAKE-10PILE ?auto_658984 ?auto_658985 ?auto_658986 ?auto_658987 ?auto_658988 ?auto_658989 ?auto_658990 ?auto_658991 ?auto_658992 ?auto_658993 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_659026 - BLOCK
      ?auto_659027 - BLOCK
      ?auto_659028 - BLOCK
      ?auto_659029 - BLOCK
      ?auto_659030 - BLOCK
      ?auto_659031 - BLOCK
      ?auto_659032 - BLOCK
      ?auto_659033 - BLOCK
      ?auto_659034 - BLOCK
      ?auto_659035 - BLOCK
    )
    :vars
    (
      ?auto_659036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659035 ?auto_659036 ) ( ON-TABLE ?auto_659026 ) ( ON ?auto_659027 ?auto_659026 ) ( ON ?auto_659028 ?auto_659027 ) ( ON ?auto_659029 ?auto_659028 ) ( not ( = ?auto_659026 ?auto_659027 ) ) ( not ( = ?auto_659026 ?auto_659028 ) ) ( not ( = ?auto_659026 ?auto_659029 ) ) ( not ( = ?auto_659026 ?auto_659030 ) ) ( not ( = ?auto_659026 ?auto_659031 ) ) ( not ( = ?auto_659026 ?auto_659032 ) ) ( not ( = ?auto_659026 ?auto_659033 ) ) ( not ( = ?auto_659026 ?auto_659034 ) ) ( not ( = ?auto_659026 ?auto_659035 ) ) ( not ( = ?auto_659026 ?auto_659036 ) ) ( not ( = ?auto_659027 ?auto_659028 ) ) ( not ( = ?auto_659027 ?auto_659029 ) ) ( not ( = ?auto_659027 ?auto_659030 ) ) ( not ( = ?auto_659027 ?auto_659031 ) ) ( not ( = ?auto_659027 ?auto_659032 ) ) ( not ( = ?auto_659027 ?auto_659033 ) ) ( not ( = ?auto_659027 ?auto_659034 ) ) ( not ( = ?auto_659027 ?auto_659035 ) ) ( not ( = ?auto_659027 ?auto_659036 ) ) ( not ( = ?auto_659028 ?auto_659029 ) ) ( not ( = ?auto_659028 ?auto_659030 ) ) ( not ( = ?auto_659028 ?auto_659031 ) ) ( not ( = ?auto_659028 ?auto_659032 ) ) ( not ( = ?auto_659028 ?auto_659033 ) ) ( not ( = ?auto_659028 ?auto_659034 ) ) ( not ( = ?auto_659028 ?auto_659035 ) ) ( not ( = ?auto_659028 ?auto_659036 ) ) ( not ( = ?auto_659029 ?auto_659030 ) ) ( not ( = ?auto_659029 ?auto_659031 ) ) ( not ( = ?auto_659029 ?auto_659032 ) ) ( not ( = ?auto_659029 ?auto_659033 ) ) ( not ( = ?auto_659029 ?auto_659034 ) ) ( not ( = ?auto_659029 ?auto_659035 ) ) ( not ( = ?auto_659029 ?auto_659036 ) ) ( not ( = ?auto_659030 ?auto_659031 ) ) ( not ( = ?auto_659030 ?auto_659032 ) ) ( not ( = ?auto_659030 ?auto_659033 ) ) ( not ( = ?auto_659030 ?auto_659034 ) ) ( not ( = ?auto_659030 ?auto_659035 ) ) ( not ( = ?auto_659030 ?auto_659036 ) ) ( not ( = ?auto_659031 ?auto_659032 ) ) ( not ( = ?auto_659031 ?auto_659033 ) ) ( not ( = ?auto_659031 ?auto_659034 ) ) ( not ( = ?auto_659031 ?auto_659035 ) ) ( not ( = ?auto_659031 ?auto_659036 ) ) ( not ( = ?auto_659032 ?auto_659033 ) ) ( not ( = ?auto_659032 ?auto_659034 ) ) ( not ( = ?auto_659032 ?auto_659035 ) ) ( not ( = ?auto_659032 ?auto_659036 ) ) ( not ( = ?auto_659033 ?auto_659034 ) ) ( not ( = ?auto_659033 ?auto_659035 ) ) ( not ( = ?auto_659033 ?auto_659036 ) ) ( not ( = ?auto_659034 ?auto_659035 ) ) ( not ( = ?auto_659034 ?auto_659036 ) ) ( not ( = ?auto_659035 ?auto_659036 ) ) ( ON ?auto_659034 ?auto_659035 ) ( ON ?auto_659033 ?auto_659034 ) ( ON ?auto_659032 ?auto_659033 ) ( ON ?auto_659031 ?auto_659032 ) ( CLEAR ?auto_659029 ) ( ON ?auto_659030 ?auto_659031 ) ( CLEAR ?auto_659030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_659026 ?auto_659027 ?auto_659028 ?auto_659029 ?auto_659030 )
      ( MAKE-10PILE ?auto_659026 ?auto_659027 ?auto_659028 ?auto_659029 ?auto_659030 ?auto_659031 ?auto_659032 ?auto_659033 ?auto_659034 ?auto_659035 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_659068 - BLOCK
      ?auto_659069 - BLOCK
      ?auto_659070 - BLOCK
      ?auto_659071 - BLOCK
      ?auto_659072 - BLOCK
      ?auto_659073 - BLOCK
      ?auto_659074 - BLOCK
      ?auto_659075 - BLOCK
      ?auto_659076 - BLOCK
      ?auto_659077 - BLOCK
    )
    :vars
    (
      ?auto_659078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659077 ?auto_659078 ) ( ON-TABLE ?auto_659068 ) ( ON ?auto_659069 ?auto_659068 ) ( ON ?auto_659070 ?auto_659069 ) ( not ( = ?auto_659068 ?auto_659069 ) ) ( not ( = ?auto_659068 ?auto_659070 ) ) ( not ( = ?auto_659068 ?auto_659071 ) ) ( not ( = ?auto_659068 ?auto_659072 ) ) ( not ( = ?auto_659068 ?auto_659073 ) ) ( not ( = ?auto_659068 ?auto_659074 ) ) ( not ( = ?auto_659068 ?auto_659075 ) ) ( not ( = ?auto_659068 ?auto_659076 ) ) ( not ( = ?auto_659068 ?auto_659077 ) ) ( not ( = ?auto_659068 ?auto_659078 ) ) ( not ( = ?auto_659069 ?auto_659070 ) ) ( not ( = ?auto_659069 ?auto_659071 ) ) ( not ( = ?auto_659069 ?auto_659072 ) ) ( not ( = ?auto_659069 ?auto_659073 ) ) ( not ( = ?auto_659069 ?auto_659074 ) ) ( not ( = ?auto_659069 ?auto_659075 ) ) ( not ( = ?auto_659069 ?auto_659076 ) ) ( not ( = ?auto_659069 ?auto_659077 ) ) ( not ( = ?auto_659069 ?auto_659078 ) ) ( not ( = ?auto_659070 ?auto_659071 ) ) ( not ( = ?auto_659070 ?auto_659072 ) ) ( not ( = ?auto_659070 ?auto_659073 ) ) ( not ( = ?auto_659070 ?auto_659074 ) ) ( not ( = ?auto_659070 ?auto_659075 ) ) ( not ( = ?auto_659070 ?auto_659076 ) ) ( not ( = ?auto_659070 ?auto_659077 ) ) ( not ( = ?auto_659070 ?auto_659078 ) ) ( not ( = ?auto_659071 ?auto_659072 ) ) ( not ( = ?auto_659071 ?auto_659073 ) ) ( not ( = ?auto_659071 ?auto_659074 ) ) ( not ( = ?auto_659071 ?auto_659075 ) ) ( not ( = ?auto_659071 ?auto_659076 ) ) ( not ( = ?auto_659071 ?auto_659077 ) ) ( not ( = ?auto_659071 ?auto_659078 ) ) ( not ( = ?auto_659072 ?auto_659073 ) ) ( not ( = ?auto_659072 ?auto_659074 ) ) ( not ( = ?auto_659072 ?auto_659075 ) ) ( not ( = ?auto_659072 ?auto_659076 ) ) ( not ( = ?auto_659072 ?auto_659077 ) ) ( not ( = ?auto_659072 ?auto_659078 ) ) ( not ( = ?auto_659073 ?auto_659074 ) ) ( not ( = ?auto_659073 ?auto_659075 ) ) ( not ( = ?auto_659073 ?auto_659076 ) ) ( not ( = ?auto_659073 ?auto_659077 ) ) ( not ( = ?auto_659073 ?auto_659078 ) ) ( not ( = ?auto_659074 ?auto_659075 ) ) ( not ( = ?auto_659074 ?auto_659076 ) ) ( not ( = ?auto_659074 ?auto_659077 ) ) ( not ( = ?auto_659074 ?auto_659078 ) ) ( not ( = ?auto_659075 ?auto_659076 ) ) ( not ( = ?auto_659075 ?auto_659077 ) ) ( not ( = ?auto_659075 ?auto_659078 ) ) ( not ( = ?auto_659076 ?auto_659077 ) ) ( not ( = ?auto_659076 ?auto_659078 ) ) ( not ( = ?auto_659077 ?auto_659078 ) ) ( ON ?auto_659076 ?auto_659077 ) ( ON ?auto_659075 ?auto_659076 ) ( ON ?auto_659074 ?auto_659075 ) ( ON ?auto_659073 ?auto_659074 ) ( ON ?auto_659072 ?auto_659073 ) ( CLEAR ?auto_659070 ) ( ON ?auto_659071 ?auto_659072 ) ( CLEAR ?auto_659071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_659068 ?auto_659069 ?auto_659070 ?auto_659071 )
      ( MAKE-10PILE ?auto_659068 ?auto_659069 ?auto_659070 ?auto_659071 ?auto_659072 ?auto_659073 ?auto_659074 ?auto_659075 ?auto_659076 ?auto_659077 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_659110 - BLOCK
      ?auto_659111 - BLOCK
      ?auto_659112 - BLOCK
      ?auto_659113 - BLOCK
      ?auto_659114 - BLOCK
      ?auto_659115 - BLOCK
      ?auto_659116 - BLOCK
      ?auto_659117 - BLOCK
      ?auto_659118 - BLOCK
      ?auto_659119 - BLOCK
    )
    :vars
    (
      ?auto_659120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659119 ?auto_659120 ) ( ON-TABLE ?auto_659110 ) ( ON ?auto_659111 ?auto_659110 ) ( not ( = ?auto_659110 ?auto_659111 ) ) ( not ( = ?auto_659110 ?auto_659112 ) ) ( not ( = ?auto_659110 ?auto_659113 ) ) ( not ( = ?auto_659110 ?auto_659114 ) ) ( not ( = ?auto_659110 ?auto_659115 ) ) ( not ( = ?auto_659110 ?auto_659116 ) ) ( not ( = ?auto_659110 ?auto_659117 ) ) ( not ( = ?auto_659110 ?auto_659118 ) ) ( not ( = ?auto_659110 ?auto_659119 ) ) ( not ( = ?auto_659110 ?auto_659120 ) ) ( not ( = ?auto_659111 ?auto_659112 ) ) ( not ( = ?auto_659111 ?auto_659113 ) ) ( not ( = ?auto_659111 ?auto_659114 ) ) ( not ( = ?auto_659111 ?auto_659115 ) ) ( not ( = ?auto_659111 ?auto_659116 ) ) ( not ( = ?auto_659111 ?auto_659117 ) ) ( not ( = ?auto_659111 ?auto_659118 ) ) ( not ( = ?auto_659111 ?auto_659119 ) ) ( not ( = ?auto_659111 ?auto_659120 ) ) ( not ( = ?auto_659112 ?auto_659113 ) ) ( not ( = ?auto_659112 ?auto_659114 ) ) ( not ( = ?auto_659112 ?auto_659115 ) ) ( not ( = ?auto_659112 ?auto_659116 ) ) ( not ( = ?auto_659112 ?auto_659117 ) ) ( not ( = ?auto_659112 ?auto_659118 ) ) ( not ( = ?auto_659112 ?auto_659119 ) ) ( not ( = ?auto_659112 ?auto_659120 ) ) ( not ( = ?auto_659113 ?auto_659114 ) ) ( not ( = ?auto_659113 ?auto_659115 ) ) ( not ( = ?auto_659113 ?auto_659116 ) ) ( not ( = ?auto_659113 ?auto_659117 ) ) ( not ( = ?auto_659113 ?auto_659118 ) ) ( not ( = ?auto_659113 ?auto_659119 ) ) ( not ( = ?auto_659113 ?auto_659120 ) ) ( not ( = ?auto_659114 ?auto_659115 ) ) ( not ( = ?auto_659114 ?auto_659116 ) ) ( not ( = ?auto_659114 ?auto_659117 ) ) ( not ( = ?auto_659114 ?auto_659118 ) ) ( not ( = ?auto_659114 ?auto_659119 ) ) ( not ( = ?auto_659114 ?auto_659120 ) ) ( not ( = ?auto_659115 ?auto_659116 ) ) ( not ( = ?auto_659115 ?auto_659117 ) ) ( not ( = ?auto_659115 ?auto_659118 ) ) ( not ( = ?auto_659115 ?auto_659119 ) ) ( not ( = ?auto_659115 ?auto_659120 ) ) ( not ( = ?auto_659116 ?auto_659117 ) ) ( not ( = ?auto_659116 ?auto_659118 ) ) ( not ( = ?auto_659116 ?auto_659119 ) ) ( not ( = ?auto_659116 ?auto_659120 ) ) ( not ( = ?auto_659117 ?auto_659118 ) ) ( not ( = ?auto_659117 ?auto_659119 ) ) ( not ( = ?auto_659117 ?auto_659120 ) ) ( not ( = ?auto_659118 ?auto_659119 ) ) ( not ( = ?auto_659118 ?auto_659120 ) ) ( not ( = ?auto_659119 ?auto_659120 ) ) ( ON ?auto_659118 ?auto_659119 ) ( ON ?auto_659117 ?auto_659118 ) ( ON ?auto_659116 ?auto_659117 ) ( ON ?auto_659115 ?auto_659116 ) ( ON ?auto_659114 ?auto_659115 ) ( ON ?auto_659113 ?auto_659114 ) ( CLEAR ?auto_659111 ) ( ON ?auto_659112 ?auto_659113 ) ( CLEAR ?auto_659112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_659110 ?auto_659111 ?auto_659112 )
      ( MAKE-10PILE ?auto_659110 ?auto_659111 ?auto_659112 ?auto_659113 ?auto_659114 ?auto_659115 ?auto_659116 ?auto_659117 ?auto_659118 ?auto_659119 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_659152 - BLOCK
      ?auto_659153 - BLOCK
      ?auto_659154 - BLOCK
      ?auto_659155 - BLOCK
      ?auto_659156 - BLOCK
      ?auto_659157 - BLOCK
      ?auto_659158 - BLOCK
      ?auto_659159 - BLOCK
      ?auto_659160 - BLOCK
      ?auto_659161 - BLOCK
    )
    :vars
    (
      ?auto_659162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659161 ?auto_659162 ) ( ON-TABLE ?auto_659152 ) ( not ( = ?auto_659152 ?auto_659153 ) ) ( not ( = ?auto_659152 ?auto_659154 ) ) ( not ( = ?auto_659152 ?auto_659155 ) ) ( not ( = ?auto_659152 ?auto_659156 ) ) ( not ( = ?auto_659152 ?auto_659157 ) ) ( not ( = ?auto_659152 ?auto_659158 ) ) ( not ( = ?auto_659152 ?auto_659159 ) ) ( not ( = ?auto_659152 ?auto_659160 ) ) ( not ( = ?auto_659152 ?auto_659161 ) ) ( not ( = ?auto_659152 ?auto_659162 ) ) ( not ( = ?auto_659153 ?auto_659154 ) ) ( not ( = ?auto_659153 ?auto_659155 ) ) ( not ( = ?auto_659153 ?auto_659156 ) ) ( not ( = ?auto_659153 ?auto_659157 ) ) ( not ( = ?auto_659153 ?auto_659158 ) ) ( not ( = ?auto_659153 ?auto_659159 ) ) ( not ( = ?auto_659153 ?auto_659160 ) ) ( not ( = ?auto_659153 ?auto_659161 ) ) ( not ( = ?auto_659153 ?auto_659162 ) ) ( not ( = ?auto_659154 ?auto_659155 ) ) ( not ( = ?auto_659154 ?auto_659156 ) ) ( not ( = ?auto_659154 ?auto_659157 ) ) ( not ( = ?auto_659154 ?auto_659158 ) ) ( not ( = ?auto_659154 ?auto_659159 ) ) ( not ( = ?auto_659154 ?auto_659160 ) ) ( not ( = ?auto_659154 ?auto_659161 ) ) ( not ( = ?auto_659154 ?auto_659162 ) ) ( not ( = ?auto_659155 ?auto_659156 ) ) ( not ( = ?auto_659155 ?auto_659157 ) ) ( not ( = ?auto_659155 ?auto_659158 ) ) ( not ( = ?auto_659155 ?auto_659159 ) ) ( not ( = ?auto_659155 ?auto_659160 ) ) ( not ( = ?auto_659155 ?auto_659161 ) ) ( not ( = ?auto_659155 ?auto_659162 ) ) ( not ( = ?auto_659156 ?auto_659157 ) ) ( not ( = ?auto_659156 ?auto_659158 ) ) ( not ( = ?auto_659156 ?auto_659159 ) ) ( not ( = ?auto_659156 ?auto_659160 ) ) ( not ( = ?auto_659156 ?auto_659161 ) ) ( not ( = ?auto_659156 ?auto_659162 ) ) ( not ( = ?auto_659157 ?auto_659158 ) ) ( not ( = ?auto_659157 ?auto_659159 ) ) ( not ( = ?auto_659157 ?auto_659160 ) ) ( not ( = ?auto_659157 ?auto_659161 ) ) ( not ( = ?auto_659157 ?auto_659162 ) ) ( not ( = ?auto_659158 ?auto_659159 ) ) ( not ( = ?auto_659158 ?auto_659160 ) ) ( not ( = ?auto_659158 ?auto_659161 ) ) ( not ( = ?auto_659158 ?auto_659162 ) ) ( not ( = ?auto_659159 ?auto_659160 ) ) ( not ( = ?auto_659159 ?auto_659161 ) ) ( not ( = ?auto_659159 ?auto_659162 ) ) ( not ( = ?auto_659160 ?auto_659161 ) ) ( not ( = ?auto_659160 ?auto_659162 ) ) ( not ( = ?auto_659161 ?auto_659162 ) ) ( ON ?auto_659160 ?auto_659161 ) ( ON ?auto_659159 ?auto_659160 ) ( ON ?auto_659158 ?auto_659159 ) ( ON ?auto_659157 ?auto_659158 ) ( ON ?auto_659156 ?auto_659157 ) ( ON ?auto_659155 ?auto_659156 ) ( ON ?auto_659154 ?auto_659155 ) ( CLEAR ?auto_659152 ) ( ON ?auto_659153 ?auto_659154 ) ( CLEAR ?auto_659153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_659152 ?auto_659153 )
      ( MAKE-10PILE ?auto_659152 ?auto_659153 ?auto_659154 ?auto_659155 ?auto_659156 ?auto_659157 ?auto_659158 ?auto_659159 ?auto_659160 ?auto_659161 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_659194 - BLOCK
      ?auto_659195 - BLOCK
      ?auto_659196 - BLOCK
      ?auto_659197 - BLOCK
      ?auto_659198 - BLOCK
      ?auto_659199 - BLOCK
      ?auto_659200 - BLOCK
      ?auto_659201 - BLOCK
      ?auto_659202 - BLOCK
      ?auto_659203 - BLOCK
    )
    :vars
    (
      ?auto_659204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659203 ?auto_659204 ) ( not ( = ?auto_659194 ?auto_659195 ) ) ( not ( = ?auto_659194 ?auto_659196 ) ) ( not ( = ?auto_659194 ?auto_659197 ) ) ( not ( = ?auto_659194 ?auto_659198 ) ) ( not ( = ?auto_659194 ?auto_659199 ) ) ( not ( = ?auto_659194 ?auto_659200 ) ) ( not ( = ?auto_659194 ?auto_659201 ) ) ( not ( = ?auto_659194 ?auto_659202 ) ) ( not ( = ?auto_659194 ?auto_659203 ) ) ( not ( = ?auto_659194 ?auto_659204 ) ) ( not ( = ?auto_659195 ?auto_659196 ) ) ( not ( = ?auto_659195 ?auto_659197 ) ) ( not ( = ?auto_659195 ?auto_659198 ) ) ( not ( = ?auto_659195 ?auto_659199 ) ) ( not ( = ?auto_659195 ?auto_659200 ) ) ( not ( = ?auto_659195 ?auto_659201 ) ) ( not ( = ?auto_659195 ?auto_659202 ) ) ( not ( = ?auto_659195 ?auto_659203 ) ) ( not ( = ?auto_659195 ?auto_659204 ) ) ( not ( = ?auto_659196 ?auto_659197 ) ) ( not ( = ?auto_659196 ?auto_659198 ) ) ( not ( = ?auto_659196 ?auto_659199 ) ) ( not ( = ?auto_659196 ?auto_659200 ) ) ( not ( = ?auto_659196 ?auto_659201 ) ) ( not ( = ?auto_659196 ?auto_659202 ) ) ( not ( = ?auto_659196 ?auto_659203 ) ) ( not ( = ?auto_659196 ?auto_659204 ) ) ( not ( = ?auto_659197 ?auto_659198 ) ) ( not ( = ?auto_659197 ?auto_659199 ) ) ( not ( = ?auto_659197 ?auto_659200 ) ) ( not ( = ?auto_659197 ?auto_659201 ) ) ( not ( = ?auto_659197 ?auto_659202 ) ) ( not ( = ?auto_659197 ?auto_659203 ) ) ( not ( = ?auto_659197 ?auto_659204 ) ) ( not ( = ?auto_659198 ?auto_659199 ) ) ( not ( = ?auto_659198 ?auto_659200 ) ) ( not ( = ?auto_659198 ?auto_659201 ) ) ( not ( = ?auto_659198 ?auto_659202 ) ) ( not ( = ?auto_659198 ?auto_659203 ) ) ( not ( = ?auto_659198 ?auto_659204 ) ) ( not ( = ?auto_659199 ?auto_659200 ) ) ( not ( = ?auto_659199 ?auto_659201 ) ) ( not ( = ?auto_659199 ?auto_659202 ) ) ( not ( = ?auto_659199 ?auto_659203 ) ) ( not ( = ?auto_659199 ?auto_659204 ) ) ( not ( = ?auto_659200 ?auto_659201 ) ) ( not ( = ?auto_659200 ?auto_659202 ) ) ( not ( = ?auto_659200 ?auto_659203 ) ) ( not ( = ?auto_659200 ?auto_659204 ) ) ( not ( = ?auto_659201 ?auto_659202 ) ) ( not ( = ?auto_659201 ?auto_659203 ) ) ( not ( = ?auto_659201 ?auto_659204 ) ) ( not ( = ?auto_659202 ?auto_659203 ) ) ( not ( = ?auto_659202 ?auto_659204 ) ) ( not ( = ?auto_659203 ?auto_659204 ) ) ( ON ?auto_659202 ?auto_659203 ) ( ON ?auto_659201 ?auto_659202 ) ( ON ?auto_659200 ?auto_659201 ) ( ON ?auto_659199 ?auto_659200 ) ( ON ?auto_659198 ?auto_659199 ) ( ON ?auto_659197 ?auto_659198 ) ( ON ?auto_659196 ?auto_659197 ) ( ON ?auto_659195 ?auto_659196 ) ( ON ?auto_659194 ?auto_659195 ) ( CLEAR ?auto_659194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_659194 )
      ( MAKE-10PILE ?auto_659194 ?auto_659195 ?auto_659196 ?auto_659197 ?auto_659198 ?auto_659199 ?auto_659200 ?auto_659201 ?auto_659202 ?auto_659203 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_659237 - BLOCK
      ?auto_659238 - BLOCK
      ?auto_659239 - BLOCK
      ?auto_659240 - BLOCK
      ?auto_659241 - BLOCK
      ?auto_659242 - BLOCK
      ?auto_659243 - BLOCK
      ?auto_659244 - BLOCK
      ?auto_659245 - BLOCK
      ?auto_659246 - BLOCK
      ?auto_659247 - BLOCK
    )
    :vars
    (
      ?auto_659248 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_659246 ) ( ON ?auto_659247 ?auto_659248 ) ( CLEAR ?auto_659247 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_659237 ) ( ON ?auto_659238 ?auto_659237 ) ( ON ?auto_659239 ?auto_659238 ) ( ON ?auto_659240 ?auto_659239 ) ( ON ?auto_659241 ?auto_659240 ) ( ON ?auto_659242 ?auto_659241 ) ( ON ?auto_659243 ?auto_659242 ) ( ON ?auto_659244 ?auto_659243 ) ( ON ?auto_659245 ?auto_659244 ) ( ON ?auto_659246 ?auto_659245 ) ( not ( = ?auto_659237 ?auto_659238 ) ) ( not ( = ?auto_659237 ?auto_659239 ) ) ( not ( = ?auto_659237 ?auto_659240 ) ) ( not ( = ?auto_659237 ?auto_659241 ) ) ( not ( = ?auto_659237 ?auto_659242 ) ) ( not ( = ?auto_659237 ?auto_659243 ) ) ( not ( = ?auto_659237 ?auto_659244 ) ) ( not ( = ?auto_659237 ?auto_659245 ) ) ( not ( = ?auto_659237 ?auto_659246 ) ) ( not ( = ?auto_659237 ?auto_659247 ) ) ( not ( = ?auto_659237 ?auto_659248 ) ) ( not ( = ?auto_659238 ?auto_659239 ) ) ( not ( = ?auto_659238 ?auto_659240 ) ) ( not ( = ?auto_659238 ?auto_659241 ) ) ( not ( = ?auto_659238 ?auto_659242 ) ) ( not ( = ?auto_659238 ?auto_659243 ) ) ( not ( = ?auto_659238 ?auto_659244 ) ) ( not ( = ?auto_659238 ?auto_659245 ) ) ( not ( = ?auto_659238 ?auto_659246 ) ) ( not ( = ?auto_659238 ?auto_659247 ) ) ( not ( = ?auto_659238 ?auto_659248 ) ) ( not ( = ?auto_659239 ?auto_659240 ) ) ( not ( = ?auto_659239 ?auto_659241 ) ) ( not ( = ?auto_659239 ?auto_659242 ) ) ( not ( = ?auto_659239 ?auto_659243 ) ) ( not ( = ?auto_659239 ?auto_659244 ) ) ( not ( = ?auto_659239 ?auto_659245 ) ) ( not ( = ?auto_659239 ?auto_659246 ) ) ( not ( = ?auto_659239 ?auto_659247 ) ) ( not ( = ?auto_659239 ?auto_659248 ) ) ( not ( = ?auto_659240 ?auto_659241 ) ) ( not ( = ?auto_659240 ?auto_659242 ) ) ( not ( = ?auto_659240 ?auto_659243 ) ) ( not ( = ?auto_659240 ?auto_659244 ) ) ( not ( = ?auto_659240 ?auto_659245 ) ) ( not ( = ?auto_659240 ?auto_659246 ) ) ( not ( = ?auto_659240 ?auto_659247 ) ) ( not ( = ?auto_659240 ?auto_659248 ) ) ( not ( = ?auto_659241 ?auto_659242 ) ) ( not ( = ?auto_659241 ?auto_659243 ) ) ( not ( = ?auto_659241 ?auto_659244 ) ) ( not ( = ?auto_659241 ?auto_659245 ) ) ( not ( = ?auto_659241 ?auto_659246 ) ) ( not ( = ?auto_659241 ?auto_659247 ) ) ( not ( = ?auto_659241 ?auto_659248 ) ) ( not ( = ?auto_659242 ?auto_659243 ) ) ( not ( = ?auto_659242 ?auto_659244 ) ) ( not ( = ?auto_659242 ?auto_659245 ) ) ( not ( = ?auto_659242 ?auto_659246 ) ) ( not ( = ?auto_659242 ?auto_659247 ) ) ( not ( = ?auto_659242 ?auto_659248 ) ) ( not ( = ?auto_659243 ?auto_659244 ) ) ( not ( = ?auto_659243 ?auto_659245 ) ) ( not ( = ?auto_659243 ?auto_659246 ) ) ( not ( = ?auto_659243 ?auto_659247 ) ) ( not ( = ?auto_659243 ?auto_659248 ) ) ( not ( = ?auto_659244 ?auto_659245 ) ) ( not ( = ?auto_659244 ?auto_659246 ) ) ( not ( = ?auto_659244 ?auto_659247 ) ) ( not ( = ?auto_659244 ?auto_659248 ) ) ( not ( = ?auto_659245 ?auto_659246 ) ) ( not ( = ?auto_659245 ?auto_659247 ) ) ( not ( = ?auto_659245 ?auto_659248 ) ) ( not ( = ?auto_659246 ?auto_659247 ) ) ( not ( = ?auto_659246 ?auto_659248 ) ) ( not ( = ?auto_659247 ?auto_659248 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_659247 ?auto_659248 )
      ( !STACK ?auto_659247 ?auto_659246 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_659283 - BLOCK
      ?auto_659284 - BLOCK
      ?auto_659285 - BLOCK
      ?auto_659286 - BLOCK
      ?auto_659287 - BLOCK
      ?auto_659288 - BLOCK
      ?auto_659289 - BLOCK
      ?auto_659290 - BLOCK
      ?auto_659291 - BLOCK
      ?auto_659292 - BLOCK
      ?auto_659293 - BLOCK
    )
    :vars
    (
      ?auto_659294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659293 ?auto_659294 ) ( ON-TABLE ?auto_659283 ) ( ON ?auto_659284 ?auto_659283 ) ( ON ?auto_659285 ?auto_659284 ) ( ON ?auto_659286 ?auto_659285 ) ( ON ?auto_659287 ?auto_659286 ) ( ON ?auto_659288 ?auto_659287 ) ( ON ?auto_659289 ?auto_659288 ) ( ON ?auto_659290 ?auto_659289 ) ( ON ?auto_659291 ?auto_659290 ) ( not ( = ?auto_659283 ?auto_659284 ) ) ( not ( = ?auto_659283 ?auto_659285 ) ) ( not ( = ?auto_659283 ?auto_659286 ) ) ( not ( = ?auto_659283 ?auto_659287 ) ) ( not ( = ?auto_659283 ?auto_659288 ) ) ( not ( = ?auto_659283 ?auto_659289 ) ) ( not ( = ?auto_659283 ?auto_659290 ) ) ( not ( = ?auto_659283 ?auto_659291 ) ) ( not ( = ?auto_659283 ?auto_659292 ) ) ( not ( = ?auto_659283 ?auto_659293 ) ) ( not ( = ?auto_659283 ?auto_659294 ) ) ( not ( = ?auto_659284 ?auto_659285 ) ) ( not ( = ?auto_659284 ?auto_659286 ) ) ( not ( = ?auto_659284 ?auto_659287 ) ) ( not ( = ?auto_659284 ?auto_659288 ) ) ( not ( = ?auto_659284 ?auto_659289 ) ) ( not ( = ?auto_659284 ?auto_659290 ) ) ( not ( = ?auto_659284 ?auto_659291 ) ) ( not ( = ?auto_659284 ?auto_659292 ) ) ( not ( = ?auto_659284 ?auto_659293 ) ) ( not ( = ?auto_659284 ?auto_659294 ) ) ( not ( = ?auto_659285 ?auto_659286 ) ) ( not ( = ?auto_659285 ?auto_659287 ) ) ( not ( = ?auto_659285 ?auto_659288 ) ) ( not ( = ?auto_659285 ?auto_659289 ) ) ( not ( = ?auto_659285 ?auto_659290 ) ) ( not ( = ?auto_659285 ?auto_659291 ) ) ( not ( = ?auto_659285 ?auto_659292 ) ) ( not ( = ?auto_659285 ?auto_659293 ) ) ( not ( = ?auto_659285 ?auto_659294 ) ) ( not ( = ?auto_659286 ?auto_659287 ) ) ( not ( = ?auto_659286 ?auto_659288 ) ) ( not ( = ?auto_659286 ?auto_659289 ) ) ( not ( = ?auto_659286 ?auto_659290 ) ) ( not ( = ?auto_659286 ?auto_659291 ) ) ( not ( = ?auto_659286 ?auto_659292 ) ) ( not ( = ?auto_659286 ?auto_659293 ) ) ( not ( = ?auto_659286 ?auto_659294 ) ) ( not ( = ?auto_659287 ?auto_659288 ) ) ( not ( = ?auto_659287 ?auto_659289 ) ) ( not ( = ?auto_659287 ?auto_659290 ) ) ( not ( = ?auto_659287 ?auto_659291 ) ) ( not ( = ?auto_659287 ?auto_659292 ) ) ( not ( = ?auto_659287 ?auto_659293 ) ) ( not ( = ?auto_659287 ?auto_659294 ) ) ( not ( = ?auto_659288 ?auto_659289 ) ) ( not ( = ?auto_659288 ?auto_659290 ) ) ( not ( = ?auto_659288 ?auto_659291 ) ) ( not ( = ?auto_659288 ?auto_659292 ) ) ( not ( = ?auto_659288 ?auto_659293 ) ) ( not ( = ?auto_659288 ?auto_659294 ) ) ( not ( = ?auto_659289 ?auto_659290 ) ) ( not ( = ?auto_659289 ?auto_659291 ) ) ( not ( = ?auto_659289 ?auto_659292 ) ) ( not ( = ?auto_659289 ?auto_659293 ) ) ( not ( = ?auto_659289 ?auto_659294 ) ) ( not ( = ?auto_659290 ?auto_659291 ) ) ( not ( = ?auto_659290 ?auto_659292 ) ) ( not ( = ?auto_659290 ?auto_659293 ) ) ( not ( = ?auto_659290 ?auto_659294 ) ) ( not ( = ?auto_659291 ?auto_659292 ) ) ( not ( = ?auto_659291 ?auto_659293 ) ) ( not ( = ?auto_659291 ?auto_659294 ) ) ( not ( = ?auto_659292 ?auto_659293 ) ) ( not ( = ?auto_659292 ?auto_659294 ) ) ( not ( = ?auto_659293 ?auto_659294 ) ) ( CLEAR ?auto_659291 ) ( ON ?auto_659292 ?auto_659293 ) ( CLEAR ?auto_659292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_659283 ?auto_659284 ?auto_659285 ?auto_659286 ?auto_659287 ?auto_659288 ?auto_659289 ?auto_659290 ?auto_659291 ?auto_659292 )
      ( MAKE-11PILE ?auto_659283 ?auto_659284 ?auto_659285 ?auto_659286 ?auto_659287 ?auto_659288 ?auto_659289 ?auto_659290 ?auto_659291 ?auto_659292 ?auto_659293 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_659329 - BLOCK
      ?auto_659330 - BLOCK
      ?auto_659331 - BLOCK
      ?auto_659332 - BLOCK
      ?auto_659333 - BLOCK
      ?auto_659334 - BLOCK
      ?auto_659335 - BLOCK
      ?auto_659336 - BLOCK
      ?auto_659337 - BLOCK
      ?auto_659338 - BLOCK
      ?auto_659339 - BLOCK
    )
    :vars
    (
      ?auto_659340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659339 ?auto_659340 ) ( ON-TABLE ?auto_659329 ) ( ON ?auto_659330 ?auto_659329 ) ( ON ?auto_659331 ?auto_659330 ) ( ON ?auto_659332 ?auto_659331 ) ( ON ?auto_659333 ?auto_659332 ) ( ON ?auto_659334 ?auto_659333 ) ( ON ?auto_659335 ?auto_659334 ) ( ON ?auto_659336 ?auto_659335 ) ( not ( = ?auto_659329 ?auto_659330 ) ) ( not ( = ?auto_659329 ?auto_659331 ) ) ( not ( = ?auto_659329 ?auto_659332 ) ) ( not ( = ?auto_659329 ?auto_659333 ) ) ( not ( = ?auto_659329 ?auto_659334 ) ) ( not ( = ?auto_659329 ?auto_659335 ) ) ( not ( = ?auto_659329 ?auto_659336 ) ) ( not ( = ?auto_659329 ?auto_659337 ) ) ( not ( = ?auto_659329 ?auto_659338 ) ) ( not ( = ?auto_659329 ?auto_659339 ) ) ( not ( = ?auto_659329 ?auto_659340 ) ) ( not ( = ?auto_659330 ?auto_659331 ) ) ( not ( = ?auto_659330 ?auto_659332 ) ) ( not ( = ?auto_659330 ?auto_659333 ) ) ( not ( = ?auto_659330 ?auto_659334 ) ) ( not ( = ?auto_659330 ?auto_659335 ) ) ( not ( = ?auto_659330 ?auto_659336 ) ) ( not ( = ?auto_659330 ?auto_659337 ) ) ( not ( = ?auto_659330 ?auto_659338 ) ) ( not ( = ?auto_659330 ?auto_659339 ) ) ( not ( = ?auto_659330 ?auto_659340 ) ) ( not ( = ?auto_659331 ?auto_659332 ) ) ( not ( = ?auto_659331 ?auto_659333 ) ) ( not ( = ?auto_659331 ?auto_659334 ) ) ( not ( = ?auto_659331 ?auto_659335 ) ) ( not ( = ?auto_659331 ?auto_659336 ) ) ( not ( = ?auto_659331 ?auto_659337 ) ) ( not ( = ?auto_659331 ?auto_659338 ) ) ( not ( = ?auto_659331 ?auto_659339 ) ) ( not ( = ?auto_659331 ?auto_659340 ) ) ( not ( = ?auto_659332 ?auto_659333 ) ) ( not ( = ?auto_659332 ?auto_659334 ) ) ( not ( = ?auto_659332 ?auto_659335 ) ) ( not ( = ?auto_659332 ?auto_659336 ) ) ( not ( = ?auto_659332 ?auto_659337 ) ) ( not ( = ?auto_659332 ?auto_659338 ) ) ( not ( = ?auto_659332 ?auto_659339 ) ) ( not ( = ?auto_659332 ?auto_659340 ) ) ( not ( = ?auto_659333 ?auto_659334 ) ) ( not ( = ?auto_659333 ?auto_659335 ) ) ( not ( = ?auto_659333 ?auto_659336 ) ) ( not ( = ?auto_659333 ?auto_659337 ) ) ( not ( = ?auto_659333 ?auto_659338 ) ) ( not ( = ?auto_659333 ?auto_659339 ) ) ( not ( = ?auto_659333 ?auto_659340 ) ) ( not ( = ?auto_659334 ?auto_659335 ) ) ( not ( = ?auto_659334 ?auto_659336 ) ) ( not ( = ?auto_659334 ?auto_659337 ) ) ( not ( = ?auto_659334 ?auto_659338 ) ) ( not ( = ?auto_659334 ?auto_659339 ) ) ( not ( = ?auto_659334 ?auto_659340 ) ) ( not ( = ?auto_659335 ?auto_659336 ) ) ( not ( = ?auto_659335 ?auto_659337 ) ) ( not ( = ?auto_659335 ?auto_659338 ) ) ( not ( = ?auto_659335 ?auto_659339 ) ) ( not ( = ?auto_659335 ?auto_659340 ) ) ( not ( = ?auto_659336 ?auto_659337 ) ) ( not ( = ?auto_659336 ?auto_659338 ) ) ( not ( = ?auto_659336 ?auto_659339 ) ) ( not ( = ?auto_659336 ?auto_659340 ) ) ( not ( = ?auto_659337 ?auto_659338 ) ) ( not ( = ?auto_659337 ?auto_659339 ) ) ( not ( = ?auto_659337 ?auto_659340 ) ) ( not ( = ?auto_659338 ?auto_659339 ) ) ( not ( = ?auto_659338 ?auto_659340 ) ) ( not ( = ?auto_659339 ?auto_659340 ) ) ( ON ?auto_659338 ?auto_659339 ) ( CLEAR ?auto_659336 ) ( ON ?auto_659337 ?auto_659338 ) ( CLEAR ?auto_659337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_659329 ?auto_659330 ?auto_659331 ?auto_659332 ?auto_659333 ?auto_659334 ?auto_659335 ?auto_659336 ?auto_659337 )
      ( MAKE-11PILE ?auto_659329 ?auto_659330 ?auto_659331 ?auto_659332 ?auto_659333 ?auto_659334 ?auto_659335 ?auto_659336 ?auto_659337 ?auto_659338 ?auto_659339 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_659375 - BLOCK
      ?auto_659376 - BLOCK
      ?auto_659377 - BLOCK
      ?auto_659378 - BLOCK
      ?auto_659379 - BLOCK
      ?auto_659380 - BLOCK
      ?auto_659381 - BLOCK
      ?auto_659382 - BLOCK
      ?auto_659383 - BLOCK
      ?auto_659384 - BLOCK
      ?auto_659385 - BLOCK
    )
    :vars
    (
      ?auto_659386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659385 ?auto_659386 ) ( ON-TABLE ?auto_659375 ) ( ON ?auto_659376 ?auto_659375 ) ( ON ?auto_659377 ?auto_659376 ) ( ON ?auto_659378 ?auto_659377 ) ( ON ?auto_659379 ?auto_659378 ) ( ON ?auto_659380 ?auto_659379 ) ( ON ?auto_659381 ?auto_659380 ) ( not ( = ?auto_659375 ?auto_659376 ) ) ( not ( = ?auto_659375 ?auto_659377 ) ) ( not ( = ?auto_659375 ?auto_659378 ) ) ( not ( = ?auto_659375 ?auto_659379 ) ) ( not ( = ?auto_659375 ?auto_659380 ) ) ( not ( = ?auto_659375 ?auto_659381 ) ) ( not ( = ?auto_659375 ?auto_659382 ) ) ( not ( = ?auto_659375 ?auto_659383 ) ) ( not ( = ?auto_659375 ?auto_659384 ) ) ( not ( = ?auto_659375 ?auto_659385 ) ) ( not ( = ?auto_659375 ?auto_659386 ) ) ( not ( = ?auto_659376 ?auto_659377 ) ) ( not ( = ?auto_659376 ?auto_659378 ) ) ( not ( = ?auto_659376 ?auto_659379 ) ) ( not ( = ?auto_659376 ?auto_659380 ) ) ( not ( = ?auto_659376 ?auto_659381 ) ) ( not ( = ?auto_659376 ?auto_659382 ) ) ( not ( = ?auto_659376 ?auto_659383 ) ) ( not ( = ?auto_659376 ?auto_659384 ) ) ( not ( = ?auto_659376 ?auto_659385 ) ) ( not ( = ?auto_659376 ?auto_659386 ) ) ( not ( = ?auto_659377 ?auto_659378 ) ) ( not ( = ?auto_659377 ?auto_659379 ) ) ( not ( = ?auto_659377 ?auto_659380 ) ) ( not ( = ?auto_659377 ?auto_659381 ) ) ( not ( = ?auto_659377 ?auto_659382 ) ) ( not ( = ?auto_659377 ?auto_659383 ) ) ( not ( = ?auto_659377 ?auto_659384 ) ) ( not ( = ?auto_659377 ?auto_659385 ) ) ( not ( = ?auto_659377 ?auto_659386 ) ) ( not ( = ?auto_659378 ?auto_659379 ) ) ( not ( = ?auto_659378 ?auto_659380 ) ) ( not ( = ?auto_659378 ?auto_659381 ) ) ( not ( = ?auto_659378 ?auto_659382 ) ) ( not ( = ?auto_659378 ?auto_659383 ) ) ( not ( = ?auto_659378 ?auto_659384 ) ) ( not ( = ?auto_659378 ?auto_659385 ) ) ( not ( = ?auto_659378 ?auto_659386 ) ) ( not ( = ?auto_659379 ?auto_659380 ) ) ( not ( = ?auto_659379 ?auto_659381 ) ) ( not ( = ?auto_659379 ?auto_659382 ) ) ( not ( = ?auto_659379 ?auto_659383 ) ) ( not ( = ?auto_659379 ?auto_659384 ) ) ( not ( = ?auto_659379 ?auto_659385 ) ) ( not ( = ?auto_659379 ?auto_659386 ) ) ( not ( = ?auto_659380 ?auto_659381 ) ) ( not ( = ?auto_659380 ?auto_659382 ) ) ( not ( = ?auto_659380 ?auto_659383 ) ) ( not ( = ?auto_659380 ?auto_659384 ) ) ( not ( = ?auto_659380 ?auto_659385 ) ) ( not ( = ?auto_659380 ?auto_659386 ) ) ( not ( = ?auto_659381 ?auto_659382 ) ) ( not ( = ?auto_659381 ?auto_659383 ) ) ( not ( = ?auto_659381 ?auto_659384 ) ) ( not ( = ?auto_659381 ?auto_659385 ) ) ( not ( = ?auto_659381 ?auto_659386 ) ) ( not ( = ?auto_659382 ?auto_659383 ) ) ( not ( = ?auto_659382 ?auto_659384 ) ) ( not ( = ?auto_659382 ?auto_659385 ) ) ( not ( = ?auto_659382 ?auto_659386 ) ) ( not ( = ?auto_659383 ?auto_659384 ) ) ( not ( = ?auto_659383 ?auto_659385 ) ) ( not ( = ?auto_659383 ?auto_659386 ) ) ( not ( = ?auto_659384 ?auto_659385 ) ) ( not ( = ?auto_659384 ?auto_659386 ) ) ( not ( = ?auto_659385 ?auto_659386 ) ) ( ON ?auto_659384 ?auto_659385 ) ( ON ?auto_659383 ?auto_659384 ) ( CLEAR ?auto_659381 ) ( ON ?auto_659382 ?auto_659383 ) ( CLEAR ?auto_659382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_659375 ?auto_659376 ?auto_659377 ?auto_659378 ?auto_659379 ?auto_659380 ?auto_659381 ?auto_659382 )
      ( MAKE-11PILE ?auto_659375 ?auto_659376 ?auto_659377 ?auto_659378 ?auto_659379 ?auto_659380 ?auto_659381 ?auto_659382 ?auto_659383 ?auto_659384 ?auto_659385 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_659421 - BLOCK
      ?auto_659422 - BLOCK
      ?auto_659423 - BLOCK
      ?auto_659424 - BLOCK
      ?auto_659425 - BLOCK
      ?auto_659426 - BLOCK
      ?auto_659427 - BLOCK
      ?auto_659428 - BLOCK
      ?auto_659429 - BLOCK
      ?auto_659430 - BLOCK
      ?auto_659431 - BLOCK
    )
    :vars
    (
      ?auto_659432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659431 ?auto_659432 ) ( ON-TABLE ?auto_659421 ) ( ON ?auto_659422 ?auto_659421 ) ( ON ?auto_659423 ?auto_659422 ) ( ON ?auto_659424 ?auto_659423 ) ( ON ?auto_659425 ?auto_659424 ) ( ON ?auto_659426 ?auto_659425 ) ( not ( = ?auto_659421 ?auto_659422 ) ) ( not ( = ?auto_659421 ?auto_659423 ) ) ( not ( = ?auto_659421 ?auto_659424 ) ) ( not ( = ?auto_659421 ?auto_659425 ) ) ( not ( = ?auto_659421 ?auto_659426 ) ) ( not ( = ?auto_659421 ?auto_659427 ) ) ( not ( = ?auto_659421 ?auto_659428 ) ) ( not ( = ?auto_659421 ?auto_659429 ) ) ( not ( = ?auto_659421 ?auto_659430 ) ) ( not ( = ?auto_659421 ?auto_659431 ) ) ( not ( = ?auto_659421 ?auto_659432 ) ) ( not ( = ?auto_659422 ?auto_659423 ) ) ( not ( = ?auto_659422 ?auto_659424 ) ) ( not ( = ?auto_659422 ?auto_659425 ) ) ( not ( = ?auto_659422 ?auto_659426 ) ) ( not ( = ?auto_659422 ?auto_659427 ) ) ( not ( = ?auto_659422 ?auto_659428 ) ) ( not ( = ?auto_659422 ?auto_659429 ) ) ( not ( = ?auto_659422 ?auto_659430 ) ) ( not ( = ?auto_659422 ?auto_659431 ) ) ( not ( = ?auto_659422 ?auto_659432 ) ) ( not ( = ?auto_659423 ?auto_659424 ) ) ( not ( = ?auto_659423 ?auto_659425 ) ) ( not ( = ?auto_659423 ?auto_659426 ) ) ( not ( = ?auto_659423 ?auto_659427 ) ) ( not ( = ?auto_659423 ?auto_659428 ) ) ( not ( = ?auto_659423 ?auto_659429 ) ) ( not ( = ?auto_659423 ?auto_659430 ) ) ( not ( = ?auto_659423 ?auto_659431 ) ) ( not ( = ?auto_659423 ?auto_659432 ) ) ( not ( = ?auto_659424 ?auto_659425 ) ) ( not ( = ?auto_659424 ?auto_659426 ) ) ( not ( = ?auto_659424 ?auto_659427 ) ) ( not ( = ?auto_659424 ?auto_659428 ) ) ( not ( = ?auto_659424 ?auto_659429 ) ) ( not ( = ?auto_659424 ?auto_659430 ) ) ( not ( = ?auto_659424 ?auto_659431 ) ) ( not ( = ?auto_659424 ?auto_659432 ) ) ( not ( = ?auto_659425 ?auto_659426 ) ) ( not ( = ?auto_659425 ?auto_659427 ) ) ( not ( = ?auto_659425 ?auto_659428 ) ) ( not ( = ?auto_659425 ?auto_659429 ) ) ( not ( = ?auto_659425 ?auto_659430 ) ) ( not ( = ?auto_659425 ?auto_659431 ) ) ( not ( = ?auto_659425 ?auto_659432 ) ) ( not ( = ?auto_659426 ?auto_659427 ) ) ( not ( = ?auto_659426 ?auto_659428 ) ) ( not ( = ?auto_659426 ?auto_659429 ) ) ( not ( = ?auto_659426 ?auto_659430 ) ) ( not ( = ?auto_659426 ?auto_659431 ) ) ( not ( = ?auto_659426 ?auto_659432 ) ) ( not ( = ?auto_659427 ?auto_659428 ) ) ( not ( = ?auto_659427 ?auto_659429 ) ) ( not ( = ?auto_659427 ?auto_659430 ) ) ( not ( = ?auto_659427 ?auto_659431 ) ) ( not ( = ?auto_659427 ?auto_659432 ) ) ( not ( = ?auto_659428 ?auto_659429 ) ) ( not ( = ?auto_659428 ?auto_659430 ) ) ( not ( = ?auto_659428 ?auto_659431 ) ) ( not ( = ?auto_659428 ?auto_659432 ) ) ( not ( = ?auto_659429 ?auto_659430 ) ) ( not ( = ?auto_659429 ?auto_659431 ) ) ( not ( = ?auto_659429 ?auto_659432 ) ) ( not ( = ?auto_659430 ?auto_659431 ) ) ( not ( = ?auto_659430 ?auto_659432 ) ) ( not ( = ?auto_659431 ?auto_659432 ) ) ( ON ?auto_659430 ?auto_659431 ) ( ON ?auto_659429 ?auto_659430 ) ( ON ?auto_659428 ?auto_659429 ) ( CLEAR ?auto_659426 ) ( ON ?auto_659427 ?auto_659428 ) ( CLEAR ?auto_659427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_659421 ?auto_659422 ?auto_659423 ?auto_659424 ?auto_659425 ?auto_659426 ?auto_659427 )
      ( MAKE-11PILE ?auto_659421 ?auto_659422 ?auto_659423 ?auto_659424 ?auto_659425 ?auto_659426 ?auto_659427 ?auto_659428 ?auto_659429 ?auto_659430 ?auto_659431 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_659467 - BLOCK
      ?auto_659468 - BLOCK
      ?auto_659469 - BLOCK
      ?auto_659470 - BLOCK
      ?auto_659471 - BLOCK
      ?auto_659472 - BLOCK
      ?auto_659473 - BLOCK
      ?auto_659474 - BLOCK
      ?auto_659475 - BLOCK
      ?auto_659476 - BLOCK
      ?auto_659477 - BLOCK
    )
    :vars
    (
      ?auto_659478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659477 ?auto_659478 ) ( ON-TABLE ?auto_659467 ) ( ON ?auto_659468 ?auto_659467 ) ( ON ?auto_659469 ?auto_659468 ) ( ON ?auto_659470 ?auto_659469 ) ( ON ?auto_659471 ?auto_659470 ) ( not ( = ?auto_659467 ?auto_659468 ) ) ( not ( = ?auto_659467 ?auto_659469 ) ) ( not ( = ?auto_659467 ?auto_659470 ) ) ( not ( = ?auto_659467 ?auto_659471 ) ) ( not ( = ?auto_659467 ?auto_659472 ) ) ( not ( = ?auto_659467 ?auto_659473 ) ) ( not ( = ?auto_659467 ?auto_659474 ) ) ( not ( = ?auto_659467 ?auto_659475 ) ) ( not ( = ?auto_659467 ?auto_659476 ) ) ( not ( = ?auto_659467 ?auto_659477 ) ) ( not ( = ?auto_659467 ?auto_659478 ) ) ( not ( = ?auto_659468 ?auto_659469 ) ) ( not ( = ?auto_659468 ?auto_659470 ) ) ( not ( = ?auto_659468 ?auto_659471 ) ) ( not ( = ?auto_659468 ?auto_659472 ) ) ( not ( = ?auto_659468 ?auto_659473 ) ) ( not ( = ?auto_659468 ?auto_659474 ) ) ( not ( = ?auto_659468 ?auto_659475 ) ) ( not ( = ?auto_659468 ?auto_659476 ) ) ( not ( = ?auto_659468 ?auto_659477 ) ) ( not ( = ?auto_659468 ?auto_659478 ) ) ( not ( = ?auto_659469 ?auto_659470 ) ) ( not ( = ?auto_659469 ?auto_659471 ) ) ( not ( = ?auto_659469 ?auto_659472 ) ) ( not ( = ?auto_659469 ?auto_659473 ) ) ( not ( = ?auto_659469 ?auto_659474 ) ) ( not ( = ?auto_659469 ?auto_659475 ) ) ( not ( = ?auto_659469 ?auto_659476 ) ) ( not ( = ?auto_659469 ?auto_659477 ) ) ( not ( = ?auto_659469 ?auto_659478 ) ) ( not ( = ?auto_659470 ?auto_659471 ) ) ( not ( = ?auto_659470 ?auto_659472 ) ) ( not ( = ?auto_659470 ?auto_659473 ) ) ( not ( = ?auto_659470 ?auto_659474 ) ) ( not ( = ?auto_659470 ?auto_659475 ) ) ( not ( = ?auto_659470 ?auto_659476 ) ) ( not ( = ?auto_659470 ?auto_659477 ) ) ( not ( = ?auto_659470 ?auto_659478 ) ) ( not ( = ?auto_659471 ?auto_659472 ) ) ( not ( = ?auto_659471 ?auto_659473 ) ) ( not ( = ?auto_659471 ?auto_659474 ) ) ( not ( = ?auto_659471 ?auto_659475 ) ) ( not ( = ?auto_659471 ?auto_659476 ) ) ( not ( = ?auto_659471 ?auto_659477 ) ) ( not ( = ?auto_659471 ?auto_659478 ) ) ( not ( = ?auto_659472 ?auto_659473 ) ) ( not ( = ?auto_659472 ?auto_659474 ) ) ( not ( = ?auto_659472 ?auto_659475 ) ) ( not ( = ?auto_659472 ?auto_659476 ) ) ( not ( = ?auto_659472 ?auto_659477 ) ) ( not ( = ?auto_659472 ?auto_659478 ) ) ( not ( = ?auto_659473 ?auto_659474 ) ) ( not ( = ?auto_659473 ?auto_659475 ) ) ( not ( = ?auto_659473 ?auto_659476 ) ) ( not ( = ?auto_659473 ?auto_659477 ) ) ( not ( = ?auto_659473 ?auto_659478 ) ) ( not ( = ?auto_659474 ?auto_659475 ) ) ( not ( = ?auto_659474 ?auto_659476 ) ) ( not ( = ?auto_659474 ?auto_659477 ) ) ( not ( = ?auto_659474 ?auto_659478 ) ) ( not ( = ?auto_659475 ?auto_659476 ) ) ( not ( = ?auto_659475 ?auto_659477 ) ) ( not ( = ?auto_659475 ?auto_659478 ) ) ( not ( = ?auto_659476 ?auto_659477 ) ) ( not ( = ?auto_659476 ?auto_659478 ) ) ( not ( = ?auto_659477 ?auto_659478 ) ) ( ON ?auto_659476 ?auto_659477 ) ( ON ?auto_659475 ?auto_659476 ) ( ON ?auto_659474 ?auto_659475 ) ( ON ?auto_659473 ?auto_659474 ) ( CLEAR ?auto_659471 ) ( ON ?auto_659472 ?auto_659473 ) ( CLEAR ?auto_659472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_659467 ?auto_659468 ?auto_659469 ?auto_659470 ?auto_659471 ?auto_659472 )
      ( MAKE-11PILE ?auto_659467 ?auto_659468 ?auto_659469 ?auto_659470 ?auto_659471 ?auto_659472 ?auto_659473 ?auto_659474 ?auto_659475 ?auto_659476 ?auto_659477 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_659513 - BLOCK
      ?auto_659514 - BLOCK
      ?auto_659515 - BLOCK
      ?auto_659516 - BLOCK
      ?auto_659517 - BLOCK
      ?auto_659518 - BLOCK
      ?auto_659519 - BLOCK
      ?auto_659520 - BLOCK
      ?auto_659521 - BLOCK
      ?auto_659522 - BLOCK
      ?auto_659523 - BLOCK
    )
    :vars
    (
      ?auto_659524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659523 ?auto_659524 ) ( ON-TABLE ?auto_659513 ) ( ON ?auto_659514 ?auto_659513 ) ( ON ?auto_659515 ?auto_659514 ) ( ON ?auto_659516 ?auto_659515 ) ( not ( = ?auto_659513 ?auto_659514 ) ) ( not ( = ?auto_659513 ?auto_659515 ) ) ( not ( = ?auto_659513 ?auto_659516 ) ) ( not ( = ?auto_659513 ?auto_659517 ) ) ( not ( = ?auto_659513 ?auto_659518 ) ) ( not ( = ?auto_659513 ?auto_659519 ) ) ( not ( = ?auto_659513 ?auto_659520 ) ) ( not ( = ?auto_659513 ?auto_659521 ) ) ( not ( = ?auto_659513 ?auto_659522 ) ) ( not ( = ?auto_659513 ?auto_659523 ) ) ( not ( = ?auto_659513 ?auto_659524 ) ) ( not ( = ?auto_659514 ?auto_659515 ) ) ( not ( = ?auto_659514 ?auto_659516 ) ) ( not ( = ?auto_659514 ?auto_659517 ) ) ( not ( = ?auto_659514 ?auto_659518 ) ) ( not ( = ?auto_659514 ?auto_659519 ) ) ( not ( = ?auto_659514 ?auto_659520 ) ) ( not ( = ?auto_659514 ?auto_659521 ) ) ( not ( = ?auto_659514 ?auto_659522 ) ) ( not ( = ?auto_659514 ?auto_659523 ) ) ( not ( = ?auto_659514 ?auto_659524 ) ) ( not ( = ?auto_659515 ?auto_659516 ) ) ( not ( = ?auto_659515 ?auto_659517 ) ) ( not ( = ?auto_659515 ?auto_659518 ) ) ( not ( = ?auto_659515 ?auto_659519 ) ) ( not ( = ?auto_659515 ?auto_659520 ) ) ( not ( = ?auto_659515 ?auto_659521 ) ) ( not ( = ?auto_659515 ?auto_659522 ) ) ( not ( = ?auto_659515 ?auto_659523 ) ) ( not ( = ?auto_659515 ?auto_659524 ) ) ( not ( = ?auto_659516 ?auto_659517 ) ) ( not ( = ?auto_659516 ?auto_659518 ) ) ( not ( = ?auto_659516 ?auto_659519 ) ) ( not ( = ?auto_659516 ?auto_659520 ) ) ( not ( = ?auto_659516 ?auto_659521 ) ) ( not ( = ?auto_659516 ?auto_659522 ) ) ( not ( = ?auto_659516 ?auto_659523 ) ) ( not ( = ?auto_659516 ?auto_659524 ) ) ( not ( = ?auto_659517 ?auto_659518 ) ) ( not ( = ?auto_659517 ?auto_659519 ) ) ( not ( = ?auto_659517 ?auto_659520 ) ) ( not ( = ?auto_659517 ?auto_659521 ) ) ( not ( = ?auto_659517 ?auto_659522 ) ) ( not ( = ?auto_659517 ?auto_659523 ) ) ( not ( = ?auto_659517 ?auto_659524 ) ) ( not ( = ?auto_659518 ?auto_659519 ) ) ( not ( = ?auto_659518 ?auto_659520 ) ) ( not ( = ?auto_659518 ?auto_659521 ) ) ( not ( = ?auto_659518 ?auto_659522 ) ) ( not ( = ?auto_659518 ?auto_659523 ) ) ( not ( = ?auto_659518 ?auto_659524 ) ) ( not ( = ?auto_659519 ?auto_659520 ) ) ( not ( = ?auto_659519 ?auto_659521 ) ) ( not ( = ?auto_659519 ?auto_659522 ) ) ( not ( = ?auto_659519 ?auto_659523 ) ) ( not ( = ?auto_659519 ?auto_659524 ) ) ( not ( = ?auto_659520 ?auto_659521 ) ) ( not ( = ?auto_659520 ?auto_659522 ) ) ( not ( = ?auto_659520 ?auto_659523 ) ) ( not ( = ?auto_659520 ?auto_659524 ) ) ( not ( = ?auto_659521 ?auto_659522 ) ) ( not ( = ?auto_659521 ?auto_659523 ) ) ( not ( = ?auto_659521 ?auto_659524 ) ) ( not ( = ?auto_659522 ?auto_659523 ) ) ( not ( = ?auto_659522 ?auto_659524 ) ) ( not ( = ?auto_659523 ?auto_659524 ) ) ( ON ?auto_659522 ?auto_659523 ) ( ON ?auto_659521 ?auto_659522 ) ( ON ?auto_659520 ?auto_659521 ) ( ON ?auto_659519 ?auto_659520 ) ( ON ?auto_659518 ?auto_659519 ) ( CLEAR ?auto_659516 ) ( ON ?auto_659517 ?auto_659518 ) ( CLEAR ?auto_659517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_659513 ?auto_659514 ?auto_659515 ?auto_659516 ?auto_659517 )
      ( MAKE-11PILE ?auto_659513 ?auto_659514 ?auto_659515 ?auto_659516 ?auto_659517 ?auto_659518 ?auto_659519 ?auto_659520 ?auto_659521 ?auto_659522 ?auto_659523 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_659559 - BLOCK
      ?auto_659560 - BLOCK
      ?auto_659561 - BLOCK
      ?auto_659562 - BLOCK
      ?auto_659563 - BLOCK
      ?auto_659564 - BLOCK
      ?auto_659565 - BLOCK
      ?auto_659566 - BLOCK
      ?auto_659567 - BLOCK
      ?auto_659568 - BLOCK
      ?auto_659569 - BLOCK
    )
    :vars
    (
      ?auto_659570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659569 ?auto_659570 ) ( ON-TABLE ?auto_659559 ) ( ON ?auto_659560 ?auto_659559 ) ( ON ?auto_659561 ?auto_659560 ) ( not ( = ?auto_659559 ?auto_659560 ) ) ( not ( = ?auto_659559 ?auto_659561 ) ) ( not ( = ?auto_659559 ?auto_659562 ) ) ( not ( = ?auto_659559 ?auto_659563 ) ) ( not ( = ?auto_659559 ?auto_659564 ) ) ( not ( = ?auto_659559 ?auto_659565 ) ) ( not ( = ?auto_659559 ?auto_659566 ) ) ( not ( = ?auto_659559 ?auto_659567 ) ) ( not ( = ?auto_659559 ?auto_659568 ) ) ( not ( = ?auto_659559 ?auto_659569 ) ) ( not ( = ?auto_659559 ?auto_659570 ) ) ( not ( = ?auto_659560 ?auto_659561 ) ) ( not ( = ?auto_659560 ?auto_659562 ) ) ( not ( = ?auto_659560 ?auto_659563 ) ) ( not ( = ?auto_659560 ?auto_659564 ) ) ( not ( = ?auto_659560 ?auto_659565 ) ) ( not ( = ?auto_659560 ?auto_659566 ) ) ( not ( = ?auto_659560 ?auto_659567 ) ) ( not ( = ?auto_659560 ?auto_659568 ) ) ( not ( = ?auto_659560 ?auto_659569 ) ) ( not ( = ?auto_659560 ?auto_659570 ) ) ( not ( = ?auto_659561 ?auto_659562 ) ) ( not ( = ?auto_659561 ?auto_659563 ) ) ( not ( = ?auto_659561 ?auto_659564 ) ) ( not ( = ?auto_659561 ?auto_659565 ) ) ( not ( = ?auto_659561 ?auto_659566 ) ) ( not ( = ?auto_659561 ?auto_659567 ) ) ( not ( = ?auto_659561 ?auto_659568 ) ) ( not ( = ?auto_659561 ?auto_659569 ) ) ( not ( = ?auto_659561 ?auto_659570 ) ) ( not ( = ?auto_659562 ?auto_659563 ) ) ( not ( = ?auto_659562 ?auto_659564 ) ) ( not ( = ?auto_659562 ?auto_659565 ) ) ( not ( = ?auto_659562 ?auto_659566 ) ) ( not ( = ?auto_659562 ?auto_659567 ) ) ( not ( = ?auto_659562 ?auto_659568 ) ) ( not ( = ?auto_659562 ?auto_659569 ) ) ( not ( = ?auto_659562 ?auto_659570 ) ) ( not ( = ?auto_659563 ?auto_659564 ) ) ( not ( = ?auto_659563 ?auto_659565 ) ) ( not ( = ?auto_659563 ?auto_659566 ) ) ( not ( = ?auto_659563 ?auto_659567 ) ) ( not ( = ?auto_659563 ?auto_659568 ) ) ( not ( = ?auto_659563 ?auto_659569 ) ) ( not ( = ?auto_659563 ?auto_659570 ) ) ( not ( = ?auto_659564 ?auto_659565 ) ) ( not ( = ?auto_659564 ?auto_659566 ) ) ( not ( = ?auto_659564 ?auto_659567 ) ) ( not ( = ?auto_659564 ?auto_659568 ) ) ( not ( = ?auto_659564 ?auto_659569 ) ) ( not ( = ?auto_659564 ?auto_659570 ) ) ( not ( = ?auto_659565 ?auto_659566 ) ) ( not ( = ?auto_659565 ?auto_659567 ) ) ( not ( = ?auto_659565 ?auto_659568 ) ) ( not ( = ?auto_659565 ?auto_659569 ) ) ( not ( = ?auto_659565 ?auto_659570 ) ) ( not ( = ?auto_659566 ?auto_659567 ) ) ( not ( = ?auto_659566 ?auto_659568 ) ) ( not ( = ?auto_659566 ?auto_659569 ) ) ( not ( = ?auto_659566 ?auto_659570 ) ) ( not ( = ?auto_659567 ?auto_659568 ) ) ( not ( = ?auto_659567 ?auto_659569 ) ) ( not ( = ?auto_659567 ?auto_659570 ) ) ( not ( = ?auto_659568 ?auto_659569 ) ) ( not ( = ?auto_659568 ?auto_659570 ) ) ( not ( = ?auto_659569 ?auto_659570 ) ) ( ON ?auto_659568 ?auto_659569 ) ( ON ?auto_659567 ?auto_659568 ) ( ON ?auto_659566 ?auto_659567 ) ( ON ?auto_659565 ?auto_659566 ) ( ON ?auto_659564 ?auto_659565 ) ( ON ?auto_659563 ?auto_659564 ) ( CLEAR ?auto_659561 ) ( ON ?auto_659562 ?auto_659563 ) ( CLEAR ?auto_659562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_659559 ?auto_659560 ?auto_659561 ?auto_659562 )
      ( MAKE-11PILE ?auto_659559 ?auto_659560 ?auto_659561 ?auto_659562 ?auto_659563 ?auto_659564 ?auto_659565 ?auto_659566 ?auto_659567 ?auto_659568 ?auto_659569 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_659605 - BLOCK
      ?auto_659606 - BLOCK
      ?auto_659607 - BLOCK
      ?auto_659608 - BLOCK
      ?auto_659609 - BLOCK
      ?auto_659610 - BLOCK
      ?auto_659611 - BLOCK
      ?auto_659612 - BLOCK
      ?auto_659613 - BLOCK
      ?auto_659614 - BLOCK
      ?auto_659615 - BLOCK
    )
    :vars
    (
      ?auto_659616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659615 ?auto_659616 ) ( ON-TABLE ?auto_659605 ) ( ON ?auto_659606 ?auto_659605 ) ( not ( = ?auto_659605 ?auto_659606 ) ) ( not ( = ?auto_659605 ?auto_659607 ) ) ( not ( = ?auto_659605 ?auto_659608 ) ) ( not ( = ?auto_659605 ?auto_659609 ) ) ( not ( = ?auto_659605 ?auto_659610 ) ) ( not ( = ?auto_659605 ?auto_659611 ) ) ( not ( = ?auto_659605 ?auto_659612 ) ) ( not ( = ?auto_659605 ?auto_659613 ) ) ( not ( = ?auto_659605 ?auto_659614 ) ) ( not ( = ?auto_659605 ?auto_659615 ) ) ( not ( = ?auto_659605 ?auto_659616 ) ) ( not ( = ?auto_659606 ?auto_659607 ) ) ( not ( = ?auto_659606 ?auto_659608 ) ) ( not ( = ?auto_659606 ?auto_659609 ) ) ( not ( = ?auto_659606 ?auto_659610 ) ) ( not ( = ?auto_659606 ?auto_659611 ) ) ( not ( = ?auto_659606 ?auto_659612 ) ) ( not ( = ?auto_659606 ?auto_659613 ) ) ( not ( = ?auto_659606 ?auto_659614 ) ) ( not ( = ?auto_659606 ?auto_659615 ) ) ( not ( = ?auto_659606 ?auto_659616 ) ) ( not ( = ?auto_659607 ?auto_659608 ) ) ( not ( = ?auto_659607 ?auto_659609 ) ) ( not ( = ?auto_659607 ?auto_659610 ) ) ( not ( = ?auto_659607 ?auto_659611 ) ) ( not ( = ?auto_659607 ?auto_659612 ) ) ( not ( = ?auto_659607 ?auto_659613 ) ) ( not ( = ?auto_659607 ?auto_659614 ) ) ( not ( = ?auto_659607 ?auto_659615 ) ) ( not ( = ?auto_659607 ?auto_659616 ) ) ( not ( = ?auto_659608 ?auto_659609 ) ) ( not ( = ?auto_659608 ?auto_659610 ) ) ( not ( = ?auto_659608 ?auto_659611 ) ) ( not ( = ?auto_659608 ?auto_659612 ) ) ( not ( = ?auto_659608 ?auto_659613 ) ) ( not ( = ?auto_659608 ?auto_659614 ) ) ( not ( = ?auto_659608 ?auto_659615 ) ) ( not ( = ?auto_659608 ?auto_659616 ) ) ( not ( = ?auto_659609 ?auto_659610 ) ) ( not ( = ?auto_659609 ?auto_659611 ) ) ( not ( = ?auto_659609 ?auto_659612 ) ) ( not ( = ?auto_659609 ?auto_659613 ) ) ( not ( = ?auto_659609 ?auto_659614 ) ) ( not ( = ?auto_659609 ?auto_659615 ) ) ( not ( = ?auto_659609 ?auto_659616 ) ) ( not ( = ?auto_659610 ?auto_659611 ) ) ( not ( = ?auto_659610 ?auto_659612 ) ) ( not ( = ?auto_659610 ?auto_659613 ) ) ( not ( = ?auto_659610 ?auto_659614 ) ) ( not ( = ?auto_659610 ?auto_659615 ) ) ( not ( = ?auto_659610 ?auto_659616 ) ) ( not ( = ?auto_659611 ?auto_659612 ) ) ( not ( = ?auto_659611 ?auto_659613 ) ) ( not ( = ?auto_659611 ?auto_659614 ) ) ( not ( = ?auto_659611 ?auto_659615 ) ) ( not ( = ?auto_659611 ?auto_659616 ) ) ( not ( = ?auto_659612 ?auto_659613 ) ) ( not ( = ?auto_659612 ?auto_659614 ) ) ( not ( = ?auto_659612 ?auto_659615 ) ) ( not ( = ?auto_659612 ?auto_659616 ) ) ( not ( = ?auto_659613 ?auto_659614 ) ) ( not ( = ?auto_659613 ?auto_659615 ) ) ( not ( = ?auto_659613 ?auto_659616 ) ) ( not ( = ?auto_659614 ?auto_659615 ) ) ( not ( = ?auto_659614 ?auto_659616 ) ) ( not ( = ?auto_659615 ?auto_659616 ) ) ( ON ?auto_659614 ?auto_659615 ) ( ON ?auto_659613 ?auto_659614 ) ( ON ?auto_659612 ?auto_659613 ) ( ON ?auto_659611 ?auto_659612 ) ( ON ?auto_659610 ?auto_659611 ) ( ON ?auto_659609 ?auto_659610 ) ( ON ?auto_659608 ?auto_659609 ) ( CLEAR ?auto_659606 ) ( ON ?auto_659607 ?auto_659608 ) ( CLEAR ?auto_659607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_659605 ?auto_659606 ?auto_659607 )
      ( MAKE-11PILE ?auto_659605 ?auto_659606 ?auto_659607 ?auto_659608 ?auto_659609 ?auto_659610 ?auto_659611 ?auto_659612 ?auto_659613 ?auto_659614 ?auto_659615 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_659651 - BLOCK
      ?auto_659652 - BLOCK
      ?auto_659653 - BLOCK
      ?auto_659654 - BLOCK
      ?auto_659655 - BLOCK
      ?auto_659656 - BLOCK
      ?auto_659657 - BLOCK
      ?auto_659658 - BLOCK
      ?auto_659659 - BLOCK
      ?auto_659660 - BLOCK
      ?auto_659661 - BLOCK
    )
    :vars
    (
      ?auto_659662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659661 ?auto_659662 ) ( ON-TABLE ?auto_659651 ) ( not ( = ?auto_659651 ?auto_659652 ) ) ( not ( = ?auto_659651 ?auto_659653 ) ) ( not ( = ?auto_659651 ?auto_659654 ) ) ( not ( = ?auto_659651 ?auto_659655 ) ) ( not ( = ?auto_659651 ?auto_659656 ) ) ( not ( = ?auto_659651 ?auto_659657 ) ) ( not ( = ?auto_659651 ?auto_659658 ) ) ( not ( = ?auto_659651 ?auto_659659 ) ) ( not ( = ?auto_659651 ?auto_659660 ) ) ( not ( = ?auto_659651 ?auto_659661 ) ) ( not ( = ?auto_659651 ?auto_659662 ) ) ( not ( = ?auto_659652 ?auto_659653 ) ) ( not ( = ?auto_659652 ?auto_659654 ) ) ( not ( = ?auto_659652 ?auto_659655 ) ) ( not ( = ?auto_659652 ?auto_659656 ) ) ( not ( = ?auto_659652 ?auto_659657 ) ) ( not ( = ?auto_659652 ?auto_659658 ) ) ( not ( = ?auto_659652 ?auto_659659 ) ) ( not ( = ?auto_659652 ?auto_659660 ) ) ( not ( = ?auto_659652 ?auto_659661 ) ) ( not ( = ?auto_659652 ?auto_659662 ) ) ( not ( = ?auto_659653 ?auto_659654 ) ) ( not ( = ?auto_659653 ?auto_659655 ) ) ( not ( = ?auto_659653 ?auto_659656 ) ) ( not ( = ?auto_659653 ?auto_659657 ) ) ( not ( = ?auto_659653 ?auto_659658 ) ) ( not ( = ?auto_659653 ?auto_659659 ) ) ( not ( = ?auto_659653 ?auto_659660 ) ) ( not ( = ?auto_659653 ?auto_659661 ) ) ( not ( = ?auto_659653 ?auto_659662 ) ) ( not ( = ?auto_659654 ?auto_659655 ) ) ( not ( = ?auto_659654 ?auto_659656 ) ) ( not ( = ?auto_659654 ?auto_659657 ) ) ( not ( = ?auto_659654 ?auto_659658 ) ) ( not ( = ?auto_659654 ?auto_659659 ) ) ( not ( = ?auto_659654 ?auto_659660 ) ) ( not ( = ?auto_659654 ?auto_659661 ) ) ( not ( = ?auto_659654 ?auto_659662 ) ) ( not ( = ?auto_659655 ?auto_659656 ) ) ( not ( = ?auto_659655 ?auto_659657 ) ) ( not ( = ?auto_659655 ?auto_659658 ) ) ( not ( = ?auto_659655 ?auto_659659 ) ) ( not ( = ?auto_659655 ?auto_659660 ) ) ( not ( = ?auto_659655 ?auto_659661 ) ) ( not ( = ?auto_659655 ?auto_659662 ) ) ( not ( = ?auto_659656 ?auto_659657 ) ) ( not ( = ?auto_659656 ?auto_659658 ) ) ( not ( = ?auto_659656 ?auto_659659 ) ) ( not ( = ?auto_659656 ?auto_659660 ) ) ( not ( = ?auto_659656 ?auto_659661 ) ) ( not ( = ?auto_659656 ?auto_659662 ) ) ( not ( = ?auto_659657 ?auto_659658 ) ) ( not ( = ?auto_659657 ?auto_659659 ) ) ( not ( = ?auto_659657 ?auto_659660 ) ) ( not ( = ?auto_659657 ?auto_659661 ) ) ( not ( = ?auto_659657 ?auto_659662 ) ) ( not ( = ?auto_659658 ?auto_659659 ) ) ( not ( = ?auto_659658 ?auto_659660 ) ) ( not ( = ?auto_659658 ?auto_659661 ) ) ( not ( = ?auto_659658 ?auto_659662 ) ) ( not ( = ?auto_659659 ?auto_659660 ) ) ( not ( = ?auto_659659 ?auto_659661 ) ) ( not ( = ?auto_659659 ?auto_659662 ) ) ( not ( = ?auto_659660 ?auto_659661 ) ) ( not ( = ?auto_659660 ?auto_659662 ) ) ( not ( = ?auto_659661 ?auto_659662 ) ) ( ON ?auto_659660 ?auto_659661 ) ( ON ?auto_659659 ?auto_659660 ) ( ON ?auto_659658 ?auto_659659 ) ( ON ?auto_659657 ?auto_659658 ) ( ON ?auto_659656 ?auto_659657 ) ( ON ?auto_659655 ?auto_659656 ) ( ON ?auto_659654 ?auto_659655 ) ( ON ?auto_659653 ?auto_659654 ) ( CLEAR ?auto_659651 ) ( ON ?auto_659652 ?auto_659653 ) ( CLEAR ?auto_659652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_659651 ?auto_659652 )
      ( MAKE-11PILE ?auto_659651 ?auto_659652 ?auto_659653 ?auto_659654 ?auto_659655 ?auto_659656 ?auto_659657 ?auto_659658 ?auto_659659 ?auto_659660 ?auto_659661 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_659697 - BLOCK
      ?auto_659698 - BLOCK
      ?auto_659699 - BLOCK
      ?auto_659700 - BLOCK
      ?auto_659701 - BLOCK
      ?auto_659702 - BLOCK
      ?auto_659703 - BLOCK
      ?auto_659704 - BLOCK
      ?auto_659705 - BLOCK
      ?auto_659706 - BLOCK
      ?auto_659707 - BLOCK
    )
    :vars
    (
      ?auto_659708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659707 ?auto_659708 ) ( not ( = ?auto_659697 ?auto_659698 ) ) ( not ( = ?auto_659697 ?auto_659699 ) ) ( not ( = ?auto_659697 ?auto_659700 ) ) ( not ( = ?auto_659697 ?auto_659701 ) ) ( not ( = ?auto_659697 ?auto_659702 ) ) ( not ( = ?auto_659697 ?auto_659703 ) ) ( not ( = ?auto_659697 ?auto_659704 ) ) ( not ( = ?auto_659697 ?auto_659705 ) ) ( not ( = ?auto_659697 ?auto_659706 ) ) ( not ( = ?auto_659697 ?auto_659707 ) ) ( not ( = ?auto_659697 ?auto_659708 ) ) ( not ( = ?auto_659698 ?auto_659699 ) ) ( not ( = ?auto_659698 ?auto_659700 ) ) ( not ( = ?auto_659698 ?auto_659701 ) ) ( not ( = ?auto_659698 ?auto_659702 ) ) ( not ( = ?auto_659698 ?auto_659703 ) ) ( not ( = ?auto_659698 ?auto_659704 ) ) ( not ( = ?auto_659698 ?auto_659705 ) ) ( not ( = ?auto_659698 ?auto_659706 ) ) ( not ( = ?auto_659698 ?auto_659707 ) ) ( not ( = ?auto_659698 ?auto_659708 ) ) ( not ( = ?auto_659699 ?auto_659700 ) ) ( not ( = ?auto_659699 ?auto_659701 ) ) ( not ( = ?auto_659699 ?auto_659702 ) ) ( not ( = ?auto_659699 ?auto_659703 ) ) ( not ( = ?auto_659699 ?auto_659704 ) ) ( not ( = ?auto_659699 ?auto_659705 ) ) ( not ( = ?auto_659699 ?auto_659706 ) ) ( not ( = ?auto_659699 ?auto_659707 ) ) ( not ( = ?auto_659699 ?auto_659708 ) ) ( not ( = ?auto_659700 ?auto_659701 ) ) ( not ( = ?auto_659700 ?auto_659702 ) ) ( not ( = ?auto_659700 ?auto_659703 ) ) ( not ( = ?auto_659700 ?auto_659704 ) ) ( not ( = ?auto_659700 ?auto_659705 ) ) ( not ( = ?auto_659700 ?auto_659706 ) ) ( not ( = ?auto_659700 ?auto_659707 ) ) ( not ( = ?auto_659700 ?auto_659708 ) ) ( not ( = ?auto_659701 ?auto_659702 ) ) ( not ( = ?auto_659701 ?auto_659703 ) ) ( not ( = ?auto_659701 ?auto_659704 ) ) ( not ( = ?auto_659701 ?auto_659705 ) ) ( not ( = ?auto_659701 ?auto_659706 ) ) ( not ( = ?auto_659701 ?auto_659707 ) ) ( not ( = ?auto_659701 ?auto_659708 ) ) ( not ( = ?auto_659702 ?auto_659703 ) ) ( not ( = ?auto_659702 ?auto_659704 ) ) ( not ( = ?auto_659702 ?auto_659705 ) ) ( not ( = ?auto_659702 ?auto_659706 ) ) ( not ( = ?auto_659702 ?auto_659707 ) ) ( not ( = ?auto_659702 ?auto_659708 ) ) ( not ( = ?auto_659703 ?auto_659704 ) ) ( not ( = ?auto_659703 ?auto_659705 ) ) ( not ( = ?auto_659703 ?auto_659706 ) ) ( not ( = ?auto_659703 ?auto_659707 ) ) ( not ( = ?auto_659703 ?auto_659708 ) ) ( not ( = ?auto_659704 ?auto_659705 ) ) ( not ( = ?auto_659704 ?auto_659706 ) ) ( not ( = ?auto_659704 ?auto_659707 ) ) ( not ( = ?auto_659704 ?auto_659708 ) ) ( not ( = ?auto_659705 ?auto_659706 ) ) ( not ( = ?auto_659705 ?auto_659707 ) ) ( not ( = ?auto_659705 ?auto_659708 ) ) ( not ( = ?auto_659706 ?auto_659707 ) ) ( not ( = ?auto_659706 ?auto_659708 ) ) ( not ( = ?auto_659707 ?auto_659708 ) ) ( ON ?auto_659706 ?auto_659707 ) ( ON ?auto_659705 ?auto_659706 ) ( ON ?auto_659704 ?auto_659705 ) ( ON ?auto_659703 ?auto_659704 ) ( ON ?auto_659702 ?auto_659703 ) ( ON ?auto_659701 ?auto_659702 ) ( ON ?auto_659700 ?auto_659701 ) ( ON ?auto_659699 ?auto_659700 ) ( ON ?auto_659698 ?auto_659699 ) ( ON ?auto_659697 ?auto_659698 ) ( CLEAR ?auto_659697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_659697 )
      ( MAKE-11PILE ?auto_659697 ?auto_659698 ?auto_659699 ?auto_659700 ?auto_659701 ?auto_659702 ?auto_659703 ?auto_659704 ?auto_659705 ?auto_659706 ?auto_659707 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_659744 - BLOCK
      ?auto_659745 - BLOCK
      ?auto_659746 - BLOCK
      ?auto_659747 - BLOCK
      ?auto_659748 - BLOCK
      ?auto_659749 - BLOCK
      ?auto_659750 - BLOCK
      ?auto_659751 - BLOCK
      ?auto_659752 - BLOCK
      ?auto_659753 - BLOCK
      ?auto_659754 - BLOCK
      ?auto_659755 - BLOCK
    )
    :vars
    (
      ?auto_659756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_659754 ) ( ON ?auto_659755 ?auto_659756 ) ( CLEAR ?auto_659755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_659744 ) ( ON ?auto_659745 ?auto_659744 ) ( ON ?auto_659746 ?auto_659745 ) ( ON ?auto_659747 ?auto_659746 ) ( ON ?auto_659748 ?auto_659747 ) ( ON ?auto_659749 ?auto_659748 ) ( ON ?auto_659750 ?auto_659749 ) ( ON ?auto_659751 ?auto_659750 ) ( ON ?auto_659752 ?auto_659751 ) ( ON ?auto_659753 ?auto_659752 ) ( ON ?auto_659754 ?auto_659753 ) ( not ( = ?auto_659744 ?auto_659745 ) ) ( not ( = ?auto_659744 ?auto_659746 ) ) ( not ( = ?auto_659744 ?auto_659747 ) ) ( not ( = ?auto_659744 ?auto_659748 ) ) ( not ( = ?auto_659744 ?auto_659749 ) ) ( not ( = ?auto_659744 ?auto_659750 ) ) ( not ( = ?auto_659744 ?auto_659751 ) ) ( not ( = ?auto_659744 ?auto_659752 ) ) ( not ( = ?auto_659744 ?auto_659753 ) ) ( not ( = ?auto_659744 ?auto_659754 ) ) ( not ( = ?auto_659744 ?auto_659755 ) ) ( not ( = ?auto_659744 ?auto_659756 ) ) ( not ( = ?auto_659745 ?auto_659746 ) ) ( not ( = ?auto_659745 ?auto_659747 ) ) ( not ( = ?auto_659745 ?auto_659748 ) ) ( not ( = ?auto_659745 ?auto_659749 ) ) ( not ( = ?auto_659745 ?auto_659750 ) ) ( not ( = ?auto_659745 ?auto_659751 ) ) ( not ( = ?auto_659745 ?auto_659752 ) ) ( not ( = ?auto_659745 ?auto_659753 ) ) ( not ( = ?auto_659745 ?auto_659754 ) ) ( not ( = ?auto_659745 ?auto_659755 ) ) ( not ( = ?auto_659745 ?auto_659756 ) ) ( not ( = ?auto_659746 ?auto_659747 ) ) ( not ( = ?auto_659746 ?auto_659748 ) ) ( not ( = ?auto_659746 ?auto_659749 ) ) ( not ( = ?auto_659746 ?auto_659750 ) ) ( not ( = ?auto_659746 ?auto_659751 ) ) ( not ( = ?auto_659746 ?auto_659752 ) ) ( not ( = ?auto_659746 ?auto_659753 ) ) ( not ( = ?auto_659746 ?auto_659754 ) ) ( not ( = ?auto_659746 ?auto_659755 ) ) ( not ( = ?auto_659746 ?auto_659756 ) ) ( not ( = ?auto_659747 ?auto_659748 ) ) ( not ( = ?auto_659747 ?auto_659749 ) ) ( not ( = ?auto_659747 ?auto_659750 ) ) ( not ( = ?auto_659747 ?auto_659751 ) ) ( not ( = ?auto_659747 ?auto_659752 ) ) ( not ( = ?auto_659747 ?auto_659753 ) ) ( not ( = ?auto_659747 ?auto_659754 ) ) ( not ( = ?auto_659747 ?auto_659755 ) ) ( not ( = ?auto_659747 ?auto_659756 ) ) ( not ( = ?auto_659748 ?auto_659749 ) ) ( not ( = ?auto_659748 ?auto_659750 ) ) ( not ( = ?auto_659748 ?auto_659751 ) ) ( not ( = ?auto_659748 ?auto_659752 ) ) ( not ( = ?auto_659748 ?auto_659753 ) ) ( not ( = ?auto_659748 ?auto_659754 ) ) ( not ( = ?auto_659748 ?auto_659755 ) ) ( not ( = ?auto_659748 ?auto_659756 ) ) ( not ( = ?auto_659749 ?auto_659750 ) ) ( not ( = ?auto_659749 ?auto_659751 ) ) ( not ( = ?auto_659749 ?auto_659752 ) ) ( not ( = ?auto_659749 ?auto_659753 ) ) ( not ( = ?auto_659749 ?auto_659754 ) ) ( not ( = ?auto_659749 ?auto_659755 ) ) ( not ( = ?auto_659749 ?auto_659756 ) ) ( not ( = ?auto_659750 ?auto_659751 ) ) ( not ( = ?auto_659750 ?auto_659752 ) ) ( not ( = ?auto_659750 ?auto_659753 ) ) ( not ( = ?auto_659750 ?auto_659754 ) ) ( not ( = ?auto_659750 ?auto_659755 ) ) ( not ( = ?auto_659750 ?auto_659756 ) ) ( not ( = ?auto_659751 ?auto_659752 ) ) ( not ( = ?auto_659751 ?auto_659753 ) ) ( not ( = ?auto_659751 ?auto_659754 ) ) ( not ( = ?auto_659751 ?auto_659755 ) ) ( not ( = ?auto_659751 ?auto_659756 ) ) ( not ( = ?auto_659752 ?auto_659753 ) ) ( not ( = ?auto_659752 ?auto_659754 ) ) ( not ( = ?auto_659752 ?auto_659755 ) ) ( not ( = ?auto_659752 ?auto_659756 ) ) ( not ( = ?auto_659753 ?auto_659754 ) ) ( not ( = ?auto_659753 ?auto_659755 ) ) ( not ( = ?auto_659753 ?auto_659756 ) ) ( not ( = ?auto_659754 ?auto_659755 ) ) ( not ( = ?auto_659754 ?auto_659756 ) ) ( not ( = ?auto_659755 ?auto_659756 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_659755 ?auto_659756 )
      ( !STACK ?auto_659755 ?auto_659754 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_659794 - BLOCK
      ?auto_659795 - BLOCK
      ?auto_659796 - BLOCK
      ?auto_659797 - BLOCK
      ?auto_659798 - BLOCK
      ?auto_659799 - BLOCK
      ?auto_659800 - BLOCK
      ?auto_659801 - BLOCK
      ?auto_659802 - BLOCK
      ?auto_659803 - BLOCK
      ?auto_659804 - BLOCK
      ?auto_659805 - BLOCK
    )
    :vars
    (
      ?auto_659806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659805 ?auto_659806 ) ( ON-TABLE ?auto_659794 ) ( ON ?auto_659795 ?auto_659794 ) ( ON ?auto_659796 ?auto_659795 ) ( ON ?auto_659797 ?auto_659796 ) ( ON ?auto_659798 ?auto_659797 ) ( ON ?auto_659799 ?auto_659798 ) ( ON ?auto_659800 ?auto_659799 ) ( ON ?auto_659801 ?auto_659800 ) ( ON ?auto_659802 ?auto_659801 ) ( ON ?auto_659803 ?auto_659802 ) ( not ( = ?auto_659794 ?auto_659795 ) ) ( not ( = ?auto_659794 ?auto_659796 ) ) ( not ( = ?auto_659794 ?auto_659797 ) ) ( not ( = ?auto_659794 ?auto_659798 ) ) ( not ( = ?auto_659794 ?auto_659799 ) ) ( not ( = ?auto_659794 ?auto_659800 ) ) ( not ( = ?auto_659794 ?auto_659801 ) ) ( not ( = ?auto_659794 ?auto_659802 ) ) ( not ( = ?auto_659794 ?auto_659803 ) ) ( not ( = ?auto_659794 ?auto_659804 ) ) ( not ( = ?auto_659794 ?auto_659805 ) ) ( not ( = ?auto_659794 ?auto_659806 ) ) ( not ( = ?auto_659795 ?auto_659796 ) ) ( not ( = ?auto_659795 ?auto_659797 ) ) ( not ( = ?auto_659795 ?auto_659798 ) ) ( not ( = ?auto_659795 ?auto_659799 ) ) ( not ( = ?auto_659795 ?auto_659800 ) ) ( not ( = ?auto_659795 ?auto_659801 ) ) ( not ( = ?auto_659795 ?auto_659802 ) ) ( not ( = ?auto_659795 ?auto_659803 ) ) ( not ( = ?auto_659795 ?auto_659804 ) ) ( not ( = ?auto_659795 ?auto_659805 ) ) ( not ( = ?auto_659795 ?auto_659806 ) ) ( not ( = ?auto_659796 ?auto_659797 ) ) ( not ( = ?auto_659796 ?auto_659798 ) ) ( not ( = ?auto_659796 ?auto_659799 ) ) ( not ( = ?auto_659796 ?auto_659800 ) ) ( not ( = ?auto_659796 ?auto_659801 ) ) ( not ( = ?auto_659796 ?auto_659802 ) ) ( not ( = ?auto_659796 ?auto_659803 ) ) ( not ( = ?auto_659796 ?auto_659804 ) ) ( not ( = ?auto_659796 ?auto_659805 ) ) ( not ( = ?auto_659796 ?auto_659806 ) ) ( not ( = ?auto_659797 ?auto_659798 ) ) ( not ( = ?auto_659797 ?auto_659799 ) ) ( not ( = ?auto_659797 ?auto_659800 ) ) ( not ( = ?auto_659797 ?auto_659801 ) ) ( not ( = ?auto_659797 ?auto_659802 ) ) ( not ( = ?auto_659797 ?auto_659803 ) ) ( not ( = ?auto_659797 ?auto_659804 ) ) ( not ( = ?auto_659797 ?auto_659805 ) ) ( not ( = ?auto_659797 ?auto_659806 ) ) ( not ( = ?auto_659798 ?auto_659799 ) ) ( not ( = ?auto_659798 ?auto_659800 ) ) ( not ( = ?auto_659798 ?auto_659801 ) ) ( not ( = ?auto_659798 ?auto_659802 ) ) ( not ( = ?auto_659798 ?auto_659803 ) ) ( not ( = ?auto_659798 ?auto_659804 ) ) ( not ( = ?auto_659798 ?auto_659805 ) ) ( not ( = ?auto_659798 ?auto_659806 ) ) ( not ( = ?auto_659799 ?auto_659800 ) ) ( not ( = ?auto_659799 ?auto_659801 ) ) ( not ( = ?auto_659799 ?auto_659802 ) ) ( not ( = ?auto_659799 ?auto_659803 ) ) ( not ( = ?auto_659799 ?auto_659804 ) ) ( not ( = ?auto_659799 ?auto_659805 ) ) ( not ( = ?auto_659799 ?auto_659806 ) ) ( not ( = ?auto_659800 ?auto_659801 ) ) ( not ( = ?auto_659800 ?auto_659802 ) ) ( not ( = ?auto_659800 ?auto_659803 ) ) ( not ( = ?auto_659800 ?auto_659804 ) ) ( not ( = ?auto_659800 ?auto_659805 ) ) ( not ( = ?auto_659800 ?auto_659806 ) ) ( not ( = ?auto_659801 ?auto_659802 ) ) ( not ( = ?auto_659801 ?auto_659803 ) ) ( not ( = ?auto_659801 ?auto_659804 ) ) ( not ( = ?auto_659801 ?auto_659805 ) ) ( not ( = ?auto_659801 ?auto_659806 ) ) ( not ( = ?auto_659802 ?auto_659803 ) ) ( not ( = ?auto_659802 ?auto_659804 ) ) ( not ( = ?auto_659802 ?auto_659805 ) ) ( not ( = ?auto_659802 ?auto_659806 ) ) ( not ( = ?auto_659803 ?auto_659804 ) ) ( not ( = ?auto_659803 ?auto_659805 ) ) ( not ( = ?auto_659803 ?auto_659806 ) ) ( not ( = ?auto_659804 ?auto_659805 ) ) ( not ( = ?auto_659804 ?auto_659806 ) ) ( not ( = ?auto_659805 ?auto_659806 ) ) ( CLEAR ?auto_659803 ) ( ON ?auto_659804 ?auto_659805 ) ( CLEAR ?auto_659804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_659794 ?auto_659795 ?auto_659796 ?auto_659797 ?auto_659798 ?auto_659799 ?auto_659800 ?auto_659801 ?auto_659802 ?auto_659803 ?auto_659804 )
      ( MAKE-12PILE ?auto_659794 ?auto_659795 ?auto_659796 ?auto_659797 ?auto_659798 ?auto_659799 ?auto_659800 ?auto_659801 ?auto_659802 ?auto_659803 ?auto_659804 ?auto_659805 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_659844 - BLOCK
      ?auto_659845 - BLOCK
      ?auto_659846 - BLOCK
      ?auto_659847 - BLOCK
      ?auto_659848 - BLOCK
      ?auto_659849 - BLOCK
      ?auto_659850 - BLOCK
      ?auto_659851 - BLOCK
      ?auto_659852 - BLOCK
      ?auto_659853 - BLOCK
      ?auto_659854 - BLOCK
      ?auto_659855 - BLOCK
    )
    :vars
    (
      ?auto_659856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659855 ?auto_659856 ) ( ON-TABLE ?auto_659844 ) ( ON ?auto_659845 ?auto_659844 ) ( ON ?auto_659846 ?auto_659845 ) ( ON ?auto_659847 ?auto_659846 ) ( ON ?auto_659848 ?auto_659847 ) ( ON ?auto_659849 ?auto_659848 ) ( ON ?auto_659850 ?auto_659849 ) ( ON ?auto_659851 ?auto_659850 ) ( ON ?auto_659852 ?auto_659851 ) ( not ( = ?auto_659844 ?auto_659845 ) ) ( not ( = ?auto_659844 ?auto_659846 ) ) ( not ( = ?auto_659844 ?auto_659847 ) ) ( not ( = ?auto_659844 ?auto_659848 ) ) ( not ( = ?auto_659844 ?auto_659849 ) ) ( not ( = ?auto_659844 ?auto_659850 ) ) ( not ( = ?auto_659844 ?auto_659851 ) ) ( not ( = ?auto_659844 ?auto_659852 ) ) ( not ( = ?auto_659844 ?auto_659853 ) ) ( not ( = ?auto_659844 ?auto_659854 ) ) ( not ( = ?auto_659844 ?auto_659855 ) ) ( not ( = ?auto_659844 ?auto_659856 ) ) ( not ( = ?auto_659845 ?auto_659846 ) ) ( not ( = ?auto_659845 ?auto_659847 ) ) ( not ( = ?auto_659845 ?auto_659848 ) ) ( not ( = ?auto_659845 ?auto_659849 ) ) ( not ( = ?auto_659845 ?auto_659850 ) ) ( not ( = ?auto_659845 ?auto_659851 ) ) ( not ( = ?auto_659845 ?auto_659852 ) ) ( not ( = ?auto_659845 ?auto_659853 ) ) ( not ( = ?auto_659845 ?auto_659854 ) ) ( not ( = ?auto_659845 ?auto_659855 ) ) ( not ( = ?auto_659845 ?auto_659856 ) ) ( not ( = ?auto_659846 ?auto_659847 ) ) ( not ( = ?auto_659846 ?auto_659848 ) ) ( not ( = ?auto_659846 ?auto_659849 ) ) ( not ( = ?auto_659846 ?auto_659850 ) ) ( not ( = ?auto_659846 ?auto_659851 ) ) ( not ( = ?auto_659846 ?auto_659852 ) ) ( not ( = ?auto_659846 ?auto_659853 ) ) ( not ( = ?auto_659846 ?auto_659854 ) ) ( not ( = ?auto_659846 ?auto_659855 ) ) ( not ( = ?auto_659846 ?auto_659856 ) ) ( not ( = ?auto_659847 ?auto_659848 ) ) ( not ( = ?auto_659847 ?auto_659849 ) ) ( not ( = ?auto_659847 ?auto_659850 ) ) ( not ( = ?auto_659847 ?auto_659851 ) ) ( not ( = ?auto_659847 ?auto_659852 ) ) ( not ( = ?auto_659847 ?auto_659853 ) ) ( not ( = ?auto_659847 ?auto_659854 ) ) ( not ( = ?auto_659847 ?auto_659855 ) ) ( not ( = ?auto_659847 ?auto_659856 ) ) ( not ( = ?auto_659848 ?auto_659849 ) ) ( not ( = ?auto_659848 ?auto_659850 ) ) ( not ( = ?auto_659848 ?auto_659851 ) ) ( not ( = ?auto_659848 ?auto_659852 ) ) ( not ( = ?auto_659848 ?auto_659853 ) ) ( not ( = ?auto_659848 ?auto_659854 ) ) ( not ( = ?auto_659848 ?auto_659855 ) ) ( not ( = ?auto_659848 ?auto_659856 ) ) ( not ( = ?auto_659849 ?auto_659850 ) ) ( not ( = ?auto_659849 ?auto_659851 ) ) ( not ( = ?auto_659849 ?auto_659852 ) ) ( not ( = ?auto_659849 ?auto_659853 ) ) ( not ( = ?auto_659849 ?auto_659854 ) ) ( not ( = ?auto_659849 ?auto_659855 ) ) ( not ( = ?auto_659849 ?auto_659856 ) ) ( not ( = ?auto_659850 ?auto_659851 ) ) ( not ( = ?auto_659850 ?auto_659852 ) ) ( not ( = ?auto_659850 ?auto_659853 ) ) ( not ( = ?auto_659850 ?auto_659854 ) ) ( not ( = ?auto_659850 ?auto_659855 ) ) ( not ( = ?auto_659850 ?auto_659856 ) ) ( not ( = ?auto_659851 ?auto_659852 ) ) ( not ( = ?auto_659851 ?auto_659853 ) ) ( not ( = ?auto_659851 ?auto_659854 ) ) ( not ( = ?auto_659851 ?auto_659855 ) ) ( not ( = ?auto_659851 ?auto_659856 ) ) ( not ( = ?auto_659852 ?auto_659853 ) ) ( not ( = ?auto_659852 ?auto_659854 ) ) ( not ( = ?auto_659852 ?auto_659855 ) ) ( not ( = ?auto_659852 ?auto_659856 ) ) ( not ( = ?auto_659853 ?auto_659854 ) ) ( not ( = ?auto_659853 ?auto_659855 ) ) ( not ( = ?auto_659853 ?auto_659856 ) ) ( not ( = ?auto_659854 ?auto_659855 ) ) ( not ( = ?auto_659854 ?auto_659856 ) ) ( not ( = ?auto_659855 ?auto_659856 ) ) ( ON ?auto_659854 ?auto_659855 ) ( CLEAR ?auto_659852 ) ( ON ?auto_659853 ?auto_659854 ) ( CLEAR ?auto_659853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_659844 ?auto_659845 ?auto_659846 ?auto_659847 ?auto_659848 ?auto_659849 ?auto_659850 ?auto_659851 ?auto_659852 ?auto_659853 )
      ( MAKE-12PILE ?auto_659844 ?auto_659845 ?auto_659846 ?auto_659847 ?auto_659848 ?auto_659849 ?auto_659850 ?auto_659851 ?auto_659852 ?auto_659853 ?auto_659854 ?auto_659855 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_659894 - BLOCK
      ?auto_659895 - BLOCK
      ?auto_659896 - BLOCK
      ?auto_659897 - BLOCK
      ?auto_659898 - BLOCK
      ?auto_659899 - BLOCK
      ?auto_659900 - BLOCK
      ?auto_659901 - BLOCK
      ?auto_659902 - BLOCK
      ?auto_659903 - BLOCK
      ?auto_659904 - BLOCK
      ?auto_659905 - BLOCK
    )
    :vars
    (
      ?auto_659906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659905 ?auto_659906 ) ( ON-TABLE ?auto_659894 ) ( ON ?auto_659895 ?auto_659894 ) ( ON ?auto_659896 ?auto_659895 ) ( ON ?auto_659897 ?auto_659896 ) ( ON ?auto_659898 ?auto_659897 ) ( ON ?auto_659899 ?auto_659898 ) ( ON ?auto_659900 ?auto_659899 ) ( ON ?auto_659901 ?auto_659900 ) ( not ( = ?auto_659894 ?auto_659895 ) ) ( not ( = ?auto_659894 ?auto_659896 ) ) ( not ( = ?auto_659894 ?auto_659897 ) ) ( not ( = ?auto_659894 ?auto_659898 ) ) ( not ( = ?auto_659894 ?auto_659899 ) ) ( not ( = ?auto_659894 ?auto_659900 ) ) ( not ( = ?auto_659894 ?auto_659901 ) ) ( not ( = ?auto_659894 ?auto_659902 ) ) ( not ( = ?auto_659894 ?auto_659903 ) ) ( not ( = ?auto_659894 ?auto_659904 ) ) ( not ( = ?auto_659894 ?auto_659905 ) ) ( not ( = ?auto_659894 ?auto_659906 ) ) ( not ( = ?auto_659895 ?auto_659896 ) ) ( not ( = ?auto_659895 ?auto_659897 ) ) ( not ( = ?auto_659895 ?auto_659898 ) ) ( not ( = ?auto_659895 ?auto_659899 ) ) ( not ( = ?auto_659895 ?auto_659900 ) ) ( not ( = ?auto_659895 ?auto_659901 ) ) ( not ( = ?auto_659895 ?auto_659902 ) ) ( not ( = ?auto_659895 ?auto_659903 ) ) ( not ( = ?auto_659895 ?auto_659904 ) ) ( not ( = ?auto_659895 ?auto_659905 ) ) ( not ( = ?auto_659895 ?auto_659906 ) ) ( not ( = ?auto_659896 ?auto_659897 ) ) ( not ( = ?auto_659896 ?auto_659898 ) ) ( not ( = ?auto_659896 ?auto_659899 ) ) ( not ( = ?auto_659896 ?auto_659900 ) ) ( not ( = ?auto_659896 ?auto_659901 ) ) ( not ( = ?auto_659896 ?auto_659902 ) ) ( not ( = ?auto_659896 ?auto_659903 ) ) ( not ( = ?auto_659896 ?auto_659904 ) ) ( not ( = ?auto_659896 ?auto_659905 ) ) ( not ( = ?auto_659896 ?auto_659906 ) ) ( not ( = ?auto_659897 ?auto_659898 ) ) ( not ( = ?auto_659897 ?auto_659899 ) ) ( not ( = ?auto_659897 ?auto_659900 ) ) ( not ( = ?auto_659897 ?auto_659901 ) ) ( not ( = ?auto_659897 ?auto_659902 ) ) ( not ( = ?auto_659897 ?auto_659903 ) ) ( not ( = ?auto_659897 ?auto_659904 ) ) ( not ( = ?auto_659897 ?auto_659905 ) ) ( not ( = ?auto_659897 ?auto_659906 ) ) ( not ( = ?auto_659898 ?auto_659899 ) ) ( not ( = ?auto_659898 ?auto_659900 ) ) ( not ( = ?auto_659898 ?auto_659901 ) ) ( not ( = ?auto_659898 ?auto_659902 ) ) ( not ( = ?auto_659898 ?auto_659903 ) ) ( not ( = ?auto_659898 ?auto_659904 ) ) ( not ( = ?auto_659898 ?auto_659905 ) ) ( not ( = ?auto_659898 ?auto_659906 ) ) ( not ( = ?auto_659899 ?auto_659900 ) ) ( not ( = ?auto_659899 ?auto_659901 ) ) ( not ( = ?auto_659899 ?auto_659902 ) ) ( not ( = ?auto_659899 ?auto_659903 ) ) ( not ( = ?auto_659899 ?auto_659904 ) ) ( not ( = ?auto_659899 ?auto_659905 ) ) ( not ( = ?auto_659899 ?auto_659906 ) ) ( not ( = ?auto_659900 ?auto_659901 ) ) ( not ( = ?auto_659900 ?auto_659902 ) ) ( not ( = ?auto_659900 ?auto_659903 ) ) ( not ( = ?auto_659900 ?auto_659904 ) ) ( not ( = ?auto_659900 ?auto_659905 ) ) ( not ( = ?auto_659900 ?auto_659906 ) ) ( not ( = ?auto_659901 ?auto_659902 ) ) ( not ( = ?auto_659901 ?auto_659903 ) ) ( not ( = ?auto_659901 ?auto_659904 ) ) ( not ( = ?auto_659901 ?auto_659905 ) ) ( not ( = ?auto_659901 ?auto_659906 ) ) ( not ( = ?auto_659902 ?auto_659903 ) ) ( not ( = ?auto_659902 ?auto_659904 ) ) ( not ( = ?auto_659902 ?auto_659905 ) ) ( not ( = ?auto_659902 ?auto_659906 ) ) ( not ( = ?auto_659903 ?auto_659904 ) ) ( not ( = ?auto_659903 ?auto_659905 ) ) ( not ( = ?auto_659903 ?auto_659906 ) ) ( not ( = ?auto_659904 ?auto_659905 ) ) ( not ( = ?auto_659904 ?auto_659906 ) ) ( not ( = ?auto_659905 ?auto_659906 ) ) ( ON ?auto_659904 ?auto_659905 ) ( ON ?auto_659903 ?auto_659904 ) ( CLEAR ?auto_659901 ) ( ON ?auto_659902 ?auto_659903 ) ( CLEAR ?auto_659902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_659894 ?auto_659895 ?auto_659896 ?auto_659897 ?auto_659898 ?auto_659899 ?auto_659900 ?auto_659901 ?auto_659902 )
      ( MAKE-12PILE ?auto_659894 ?auto_659895 ?auto_659896 ?auto_659897 ?auto_659898 ?auto_659899 ?auto_659900 ?auto_659901 ?auto_659902 ?auto_659903 ?auto_659904 ?auto_659905 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_659944 - BLOCK
      ?auto_659945 - BLOCK
      ?auto_659946 - BLOCK
      ?auto_659947 - BLOCK
      ?auto_659948 - BLOCK
      ?auto_659949 - BLOCK
      ?auto_659950 - BLOCK
      ?auto_659951 - BLOCK
      ?auto_659952 - BLOCK
      ?auto_659953 - BLOCK
      ?auto_659954 - BLOCK
      ?auto_659955 - BLOCK
    )
    :vars
    (
      ?auto_659956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659955 ?auto_659956 ) ( ON-TABLE ?auto_659944 ) ( ON ?auto_659945 ?auto_659944 ) ( ON ?auto_659946 ?auto_659945 ) ( ON ?auto_659947 ?auto_659946 ) ( ON ?auto_659948 ?auto_659947 ) ( ON ?auto_659949 ?auto_659948 ) ( ON ?auto_659950 ?auto_659949 ) ( not ( = ?auto_659944 ?auto_659945 ) ) ( not ( = ?auto_659944 ?auto_659946 ) ) ( not ( = ?auto_659944 ?auto_659947 ) ) ( not ( = ?auto_659944 ?auto_659948 ) ) ( not ( = ?auto_659944 ?auto_659949 ) ) ( not ( = ?auto_659944 ?auto_659950 ) ) ( not ( = ?auto_659944 ?auto_659951 ) ) ( not ( = ?auto_659944 ?auto_659952 ) ) ( not ( = ?auto_659944 ?auto_659953 ) ) ( not ( = ?auto_659944 ?auto_659954 ) ) ( not ( = ?auto_659944 ?auto_659955 ) ) ( not ( = ?auto_659944 ?auto_659956 ) ) ( not ( = ?auto_659945 ?auto_659946 ) ) ( not ( = ?auto_659945 ?auto_659947 ) ) ( not ( = ?auto_659945 ?auto_659948 ) ) ( not ( = ?auto_659945 ?auto_659949 ) ) ( not ( = ?auto_659945 ?auto_659950 ) ) ( not ( = ?auto_659945 ?auto_659951 ) ) ( not ( = ?auto_659945 ?auto_659952 ) ) ( not ( = ?auto_659945 ?auto_659953 ) ) ( not ( = ?auto_659945 ?auto_659954 ) ) ( not ( = ?auto_659945 ?auto_659955 ) ) ( not ( = ?auto_659945 ?auto_659956 ) ) ( not ( = ?auto_659946 ?auto_659947 ) ) ( not ( = ?auto_659946 ?auto_659948 ) ) ( not ( = ?auto_659946 ?auto_659949 ) ) ( not ( = ?auto_659946 ?auto_659950 ) ) ( not ( = ?auto_659946 ?auto_659951 ) ) ( not ( = ?auto_659946 ?auto_659952 ) ) ( not ( = ?auto_659946 ?auto_659953 ) ) ( not ( = ?auto_659946 ?auto_659954 ) ) ( not ( = ?auto_659946 ?auto_659955 ) ) ( not ( = ?auto_659946 ?auto_659956 ) ) ( not ( = ?auto_659947 ?auto_659948 ) ) ( not ( = ?auto_659947 ?auto_659949 ) ) ( not ( = ?auto_659947 ?auto_659950 ) ) ( not ( = ?auto_659947 ?auto_659951 ) ) ( not ( = ?auto_659947 ?auto_659952 ) ) ( not ( = ?auto_659947 ?auto_659953 ) ) ( not ( = ?auto_659947 ?auto_659954 ) ) ( not ( = ?auto_659947 ?auto_659955 ) ) ( not ( = ?auto_659947 ?auto_659956 ) ) ( not ( = ?auto_659948 ?auto_659949 ) ) ( not ( = ?auto_659948 ?auto_659950 ) ) ( not ( = ?auto_659948 ?auto_659951 ) ) ( not ( = ?auto_659948 ?auto_659952 ) ) ( not ( = ?auto_659948 ?auto_659953 ) ) ( not ( = ?auto_659948 ?auto_659954 ) ) ( not ( = ?auto_659948 ?auto_659955 ) ) ( not ( = ?auto_659948 ?auto_659956 ) ) ( not ( = ?auto_659949 ?auto_659950 ) ) ( not ( = ?auto_659949 ?auto_659951 ) ) ( not ( = ?auto_659949 ?auto_659952 ) ) ( not ( = ?auto_659949 ?auto_659953 ) ) ( not ( = ?auto_659949 ?auto_659954 ) ) ( not ( = ?auto_659949 ?auto_659955 ) ) ( not ( = ?auto_659949 ?auto_659956 ) ) ( not ( = ?auto_659950 ?auto_659951 ) ) ( not ( = ?auto_659950 ?auto_659952 ) ) ( not ( = ?auto_659950 ?auto_659953 ) ) ( not ( = ?auto_659950 ?auto_659954 ) ) ( not ( = ?auto_659950 ?auto_659955 ) ) ( not ( = ?auto_659950 ?auto_659956 ) ) ( not ( = ?auto_659951 ?auto_659952 ) ) ( not ( = ?auto_659951 ?auto_659953 ) ) ( not ( = ?auto_659951 ?auto_659954 ) ) ( not ( = ?auto_659951 ?auto_659955 ) ) ( not ( = ?auto_659951 ?auto_659956 ) ) ( not ( = ?auto_659952 ?auto_659953 ) ) ( not ( = ?auto_659952 ?auto_659954 ) ) ( not ( = ?auto_659952 ?auto_659955 ) ) ( not ( = ?auto_659952 ?auto_659956 ) ) ( not ( = ?auto_659953 ?auto_659954 ) ) ( not ( = ?auto_659953 ?auto_659955 ) ) ( not ( = ?auto_659953 ?auto_659956 ) ) ( not ( = ?auto_659954 ?auto_659955 ) ) ( not ( = ?auto_659954 ?auto_659956 ) ) ( not ( = ?auto_659955 ?auto_659956 ) ) ( ON ?auto_659954 ?auto_659955 ) ( ON ?auto_659953 ?auto_659954 ) ( ON ?auto_659952 ?auto_659953 ) ( CLEAR ?auto_659950 ) ( ON ?auto_659951 ?auto_659952 ) ( CLEAR ?auto_659951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_659944 ?auto_659945 ?auto_659946 ?auto_659947 ?auto_659948 ?auto_659949 ?auto_659950 ?auto_659951 )
      ( MAKE-12PILE ?auto_659944 ?auto_659945 ?auto_659946 ?auto_659947 ?auto_659948 ?auto_659949 ?auto_659950 ?auto_659951 ?auto_659952 ?auto_659953 ?auto_659954 ?auto_659955 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_659994 - BLOCK
      ?auto_659995 - BLOCK
      ?auto_659996 - BLOCK
      ?auto_659997 - BLOCK
      ?auto_659998 - BLOCK
      ?auto_659999 - BLOCK
      ?auto_660000 - BLOCK
      ?auto_660001 - BLOCK
      ?auto_660002 - BLOCK
      ?auto_660003 - BLOCK
      ?auto_660004 - BLOCK
      ?auto_660005 - BLOCK
    )
    :vars
    (
      ?auto_660006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660005 ?auto_660006 ) ( ON-TABLE ?auto_659994 ) ( ON ?auto_659995 ?auto_659994 ) ( ON ?auto_659996 ?auto_659995 ) ( ON ?auto_659997 ?auto_659996 ) ( ON ?auto_659998 ?auto_659997 ) ( ON ?auto_659999 ?auto_659998 ) ( not ( = ?auto_659994 ?auto_659995 ) ) ( not ( = ?auto_659994 ?auto_659996 ) ) ( not ( = ?auto_659994 ?auto_659997 ) ) ( not ( = ?auto_659994 ?auto_659998 ) ) ( not ( = ?auto_659994 ?auto_659999 ) ) ( not ( = ?auto_659994 ?auto_660000 ) ) ( not ( = ?auto_659994 ?auto_660001 ) ) ( not ( = ?auto_659994 ?auto_660002 ) ) ( not ( = ?auto_659994 ?auto_660003 ) ) ( not ( = ?auto_659994 ?auto_660004 ) ) ( not ( = ?auto_659994 ?auto_660005 ) ) ( not ( = ?auto_659994 ?auto_660006 ) ) ( not ( = ?auto_659995 ?auto_659996 ) ) ( not ( = ?auto_659995 ?auto_659997 ) ) ( not ( = ?auto_659995 ?auto_659998 ) ) ( not ( = ?auto_659995 ?auto_659999 ) ) ( not ( = ?auto_659995 ?auto_660000 ) ) ( not ( = ?auto_659995 ?auto_660001 ) ) ( not ( = ?auto_659995 ?auto_660002 ) ) ( not ( = ?auto_659995 ?auto_660003 ) ) ( not ( = ?auto_659995 ?auto_660004 ) ) ( not ( = ?auto_659995 ?auto_660005 ) ) ( not ( = ?auto_659995 ?auto_660006 ) ) ( not ( = ?auto_659996 ?auto_659997 ) ) ( not ( = ?auto_659996 ?auto_659998 ) ) ( not ( = ?auto_659996 ?auto_659999 ) ) ( not ( = ?auto_659996 ?auto_660000 ) ) ( not ( = ?auto_659996 ?auto_660001 ) ) ( not ( = ?auto_659996 ?auto_660002 ) ) ( not ( = ?auto_659996 ?auto_660003 ) ) ( not ( = ?auto_659996 ?auto_660004 ) ) ( not ( = ?auto_659996 ?auto_660005 ) ) ( not ( = ?auto_659996 ?auto_660006 ) ) ( not ( = ?auto_659997 ?auto_659998 ) ) ( not ( = ?auto_659997 ?auto_659999 ) ) ( not ( = ?auto_659997 ?auto_660000 ) ) ( not ( = ?auto_659997 ?auto_660001 ) ) ( not ( = ?auto_659997 ?auto_660002 ) ) ( not ( = ?auto_659997 ?auto_660003 ) ) ( not ( = ?auto_659997 ?auto_660004 ) ) ( not ( = ?auto_659997 ?auto_660005 ) ) ( not ( = ?auto_659997 ?auto_660006 ) ) ( not ( = ?auto_659998 ?auto_659999 ) ) ( not ( = ?auto_659998 ?auto_660000 ) ) ( not ( = ?auto_659998 ?auto_660001 ) ) ( not ( = ?auto_659998 ?auto_660002 ) ) ( not ( = ?auto_659998 ?auto_660003 ) ) ( not ( = ?auto_659998 ?auto_660004 ) ) ( not ( = ?auto_659998 ?auto_660005 ) ) ( not ( = ?auto_659998 ?auto_660006 ) ) ( not ( = ?auto_659999 ?auto_660000 ) ) ( not ( = ?auto_659999 ?auto_660001 ) ) ( not ( = ?auto_659999 ?auto_660002 ) ) ( not ( = ?auto_659999 ?auto_660003 ) ) ( not ( = ?auto_659999 ?auto_660004 ) ) ( not ( = ?auto_659999 ?auto_660005 ) ) ( not ( = ?auto_659999 ?auto_660006 ) ) ( not ( = ?auto_660000 ?auto_660001 ) ) ( not ( = ?auto_660000 ?auto_660002 ) ) ( not ( = ?auto_660000 ?auto_660003 ) ) ( not ( = ?auto_660000 ?auto_660004 ) ) ( not ( = ?auto_660000 ?auto_660005 ) ) ( not ( = ?auto_660000 ?auto_660006 ) ) ( not ( = ?auto_660001 ?auto_660002 ) ) ( not ( = ?auto_660001 ?auto_660003 ) ) ( not ( = ?auto_660001 ?auto_660004 ) ) ( not ( = ?auto_660001 ?auto_660005 ) ) ( not ( = ?auto_660001 ?auto_660006 ) ) ( not ( = ?auto_660002 ?auto_660003 ) ) ( not ( = ?auto_660002 ?auto_660004 ) ) ( not ( = ?auto_660002 ?auto_660005 ) ) ( not ( = ?auto_660002 ?auto_660006 ) ) ( not ( = ?auto_660003 ?auto_660004 ) ) ( not ( = ?auto_660003 ?auto_660005 ) ) ( not ( = ?auto_660003 ?auto_660006 ) ) ( not ( = ?auto_660004 ?auto_660005 ) ) ( not ( = ?auto_660004 ?auto_660006 ) ) ( not ( = ?auto_660005 ?auto_660006 ) ) ( ON ?auto_660004 ?auto_660005 ) ( ON ?auto_660003 ?auto_660004 ) ( ON ?auto_660002 ?auto_660003 ) ( ON ?auto_660001 ?auto_660002 ) ( CLEAR ?auto_659999 ) ( ON ?auto_660000 ?auto_660001 ) ( CLEAR ?auto_660000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_659994 ?auto_659995 ?auto_659996 ?auto_659997 ?auto_659998 ?auto_659999 ?auto_660000 )
      ( MAKE-12PILE ?auto_659994 ?auto_659995 ?auto_659996 ?auto_659997 ?auto_659998 ?auto_659999 ?auto_660000 ?auto_660001 ?auto_660002 ?auto_660003 ?auto_660004 ?auto_660005 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_660044 - BLOCK
      ?auto_660045 - BLOCK
      ?auto_660046 - BLOCK
      ?auto_660047 - BLOCK
      ?auto_660048 - BLOCK
      ?auto_660049 - BLOCK
      ?auto_660050 - BLOCK
      ?auto_660051 - BLOCK
      ?auto_660052 - BLOCK
      ?auto_660053 - BLOCK
      ?auto_660054 - BLOCK
      ?auto_660055 - BLOCK
    )
    :vars
    (
      ?auto_660056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660055 ?auto_660056 ) ( ON-TABLE ?auto_660044 ) ( ON ?auto_660045 ?auto_660044 ) ( ON ?auto_660046 ?auto_660045 ) ( ON ?auto_660047 ?auto_660046 ) ( ON ?auto_660048 ?auto_660047 ) ( not ( = ?auto_660044 ?auto_660045 ) ) ( not ( = ?auto_660044 ?auto_660046 ) ) ( not ( = ?auto_660044 ?auto_660047 ) ) ( not ( = ?auto_660044 ?auto_660048 ) ) ( not ( = ?auto_660044 ?auto_660049 ) ) ( not ( = ?auto_660044 ?auto_660050 ) ) ( not ( = ?auto_660044 ?auto_660051 ) ) ( not ( = ?auto_660044 ?auto_660052 ) ) ( not ( = ?auto_660044 ?auto_660053 ) ) ( not ( = ?auto_660044 ?auto_660054 ) ) ( not ( = ?auto_660044 ?auto_660055 ) ) ( not ( = ?auto_660044 ?auto_660056 ) ) ( not ( = ?auto_660045 ?auto_660046 ) ) ( not ( = ?auto_660045 ?auto_660047 ) ) ( not ( = ?auto_660045 ?auto_660048 ) ) ( not ( = ?auto_660045 ?auto_660049 ) ) ( not ( = ?auto_660045 ?auto_660050 ) ) ( not ( = ?auto_660045 ?auto_660051 ) ) ( not ( = ?auto_660045 ?auto_660052 ) ) ( not ( = ?auto_660045 ?auto_660053 ) ) ( not ( = ?auto_660045 ?auto_660054 ) ) ( not ( = ?auto_660045 ?auto_660055 ) ) ( not ( = ?auto_660045 ?auto_660056 ) ) ( not ( = ?auto_660046 ?auto_660047 ) ) ( not ( = ?auto_660046 ?auto_660048 ) ) ( not ( = ?auto_660046 ?auto_660049 ) ) ( not ( = ?auto_660046 ?auto_660050 ) ) ( not ( = ?auto_660046 ?auto_660051 ) ) ( not ( = ?auto_660046 ?auto_660052 ) ) ( not ( = ?auto_660046 ?auto_660053 ) ) ( not ( = ?auto_660046 ?auto_660054 ) ) ( not ( = ?auto_660046 ?auto_660055 ) ) ( not ( = ?auto_660046 ?auto_660056 ) ) ( not ( = ?auto_660047 ?auto_660048 ) ) ( not ( = ?auto_660047 ?auto_660049 ) ) ( not ( = ?auto_660047 ?auto_660050 ) ) ( not ( = ?auto_660047 ?auto_660051 ) ) ( not ( = ?auto_660047 ?auto_660052 ) ) ( not ( = ?auto_660047 ?auto_660053 ) ) ( not ( = ?auto_660047 ?auto_660054 ) ) ( not ( = ?auto_660047 ?auto_660055 ) ) ( not ( = ?auto_660047 ?auto_660056 ) ) ( not ( = ?auto_660048 ?auto_660049 ) ) ( not ( = ?auto_660048 ?auto_660050 ) ) ( not ( = ?auto_660048 ?auto_660051 ) ) ( not ( = ?auto_660048 ?auto_660052 ) ) ( not ( = ?auto_660048 ?auto_660053 ) ) ( not ( = ?auto_660048 ?auto_660054 ) ) ( not ( = ?auto_660048 ?auto_660055 ) ) ( not ( = ?auto_660048 ?auto_660056 ) ) ( not ( = ?auto_660049 ?auto_660050 ) ) ( not ( = ?auto_660049 ?auto_660051 ) ) ( not ( = ?auto_660049 ?auto_660052 ) ) ( not ( = ?auto_660049 ?auto_660053 ) ) ( not ( = ?auto_660049 ?auto_660054 ) ) ( not ( = ?auto_660049 ?auto_660055 ) ) ( not ( = ?auto_660049 ?auto_660056 ) ) ( not ( = ?auto_660050 ?auto_660051 ) ) ( not ( = ?auto_660050 ?auto_660052 ) ) ( not ( = ?auto_660050 ?auto_660053 ) ) ( not ( = ?auto_660050 ?auto_660054 ) ) ( not ( = ?auto_660050 ?auto_660055 ) ) ( not ( = ?auto_660050 ?auto_660056 ) ) ( not ( = ?auto_660051 ?auto_660052 ) ) ( not ( = ?auto_660051 ?auto_660053 ) ) ( not ( = ?auto_660051 ?auto_660054 ) ) ( not ( = ?auto_660051 ?auto_660055 ) ) ( not ( = ?auto_660051 ?auto_660056 ) ) ( not ( = ?auto_660052 ?auto_660053 ) ) ( not ( = ?auto_660052 ?auto_660054 ) ) ( not ( = ?auto_660052 ?auto_660055 ) ) ( not ( = ?auto_660052 ?auto_660056 ) ) ( not ( = ?auto_660053 ?auto_660054 ) ) ( not ( = ?auto_660053 ?auto_660055 ) ) ( not ( = ?auto_660053 ?auto_660056 ) ) ( not ( = ?auto_660054 ?auto_660055 ) ) ( not ( = ?auto_660054 ?auto_660056 ) ) ( not ( = ?auto_660055 ?auto_660056 ) ) ( ON ?auto_660054 ?auto_660055 ) ( ON ?auto_660053 ?auto_660054 ) ( ON ?auto_660052 ?auto_660053 ) ( ON ?auto_660051 ?auto_660052 ) ( ON ?auto_660050 ?auto_660051 ) ( CLEAR ?auto_660048 ) ( ON ?auto_660049 ?auto_660050 ) ( CLEAR ?auto_660049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_660044 ?auto_660045 ?auto_660046 ?auto_660047 ?auto_660048 ?auto_660049 )
      ( MAKE-12PILE ?auto_660044 ?auto_660045 ?auto_660046 ?auto_660047 ?auto_660048 ?auto_660049 ?auto_660050 ?auto_660051 ?auto_660052 ?auto_660053 ?auto_660054 ?auto_660055 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_660094 - BLOCK
      ?auto_660095 - BLOCK
      ?auto_660096 - BLOCK
      ?auto_660097 - BLOCK
      ?auto_660098 - BLOCK
      ?auto_660099 - BLOCK
      ?auto_660100 - BLOCK
      ?auto_660101 - BLOCK
      ?auto_660102 - BLOCK
      ?auto_660103 - BLOCK
      ?auto_660104 - BLOCK
      ?auto_660105 - BLOCK
    )
    :vars
    (
      ?auto_660106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660105 ?auto_660106 ) ( ON-TABLE ?auto_660094 ) ( ON ?auto_660095 ?auto_660094 ) ( ON ?auto_660096 ?auto_660095 ) ( ON ?auto_660097 ?auto_660096 ) ( not ( = ?auto_660094 ?auto_660095 ) ) ( not ( = ?auto_660094 ?auto_660096 ) ) ( not ( = ?auto_660094 ?auto_660097 ) ) ( not ( = ?auto_660094 ?auto_660098 ) ) ( not ( = ?auto_660094 ?auto_660099 ) ) ( not ( = ?auto_660094 ?auto_660100 ) ) ( not ( = ?auto_660094 ?auto_660101 ) ) ( not ( = ?auto_660094 ?auto_660102 ) ) ( not ( = ?auto_660094 ?auto_660103 ) ) ( not ( = ?auto_660094 ?auto_660104 ) ) ( not ( = ?auto_660094 ?auto_660105 ) ) ( not ( = ?auto_660094 ?auto_660106 ) ) ( not ( = ?auto_660095 ?auto_660096 ) ) ( not ( = ?auto_660095 ?auto_660097 ) ) ( not ( = ?auto_660095 ?auto_660098 ) ) ( not ( = ?auto_660095 ?auto_660099 ) ) ( not ( = ?auto_660095 ?auto_660100 ) ) ( not ( = ?auto_660095 ?auto_660101 ) ) ( not ( = ?auto_660095 ?auto_660102 ) ) ( not ( = ?auto_660095 ?auto_660103 ) ) ( not ( = ?auto_660095 ?auto_660104 ) ) ( not ( = ?auto_660095 ?auto_660105 ) ) ( not ( = ?auto_660095 ?auto_660106 ) ) ( not ( = ?auto_660096 ?auto_660097 ) ) ( not ( = ?auto_660096 ?auto_660098 ) ) ( not ( = ?auto_660096 ?auto_660099 ) ) ( not ( = ?auto_660096 ?auto_660100 ) ) ( not ( = ?auto_660096 ?auto_660101 ) ) ( not ( = ?auto_660096 ?auto_660102 ) ) ( not ( = ?auto_660096 ?auto_660103 ) ) ( not ( = ?auto_660096 ?auto_660104 ) ) ( not ( = ?auto_660096 ?auto_660105 ) ) ( not ( = ?auto_660096 ?auto_660106 ) ) ( not ( = ?auto_660097 ?auto_660098 ) ) ( not ( = ?auto_660097 ?auto_660099 ) ) ( not ( = ?auto_660097 ?auto_660100 ) ) ( not ( = ?auto_660097 ?auto_660101 ) ) ( not ( = ?auto_660097 ?auto_660102 ) ) ( not ( = ?auto_660097 ?auto_660103 ) ) ( not ( = ?auto_660097 ?auto_660104 ) ) ( not ( = ?auto_660097 ?auto_660105 ) ) ( not ( = ?auto_660097 ?auto_660106 ) ) ( not ( = ?auto_660098 ?auto_660099 ) ) ( not ( = ?auto_660098 ?auto_660100 ) ) ( not ( = ?auto_660098 ?auto_660101 ) ) ( not ( = ?auto_660098 ?auto_660102 ) ) ( not ( = ?auto_660098 ?auto_660103 ) ) ( not ( = ?auto_660098 ?auto_660104 ) ) ( not ( = ?auto_660098 ?auto_660105 ) ) ( not ( = ?auto_660098 ?auto_660106 ) ) ( not ( = ?auto_660099 ?auto_660100 ) ) ( not ( = ?auto_660099 ?auto_660101 ) ) ( not ( = ?auto_660099 ?auto_660102 ) ) ( not ( = ?auto_660099 ?auto_660103 ) ) ( not ( = ?auto_660099 ?auto_660104 ) ) ( not ( = ?auto_660099 ?auto_660105 ) ) ( not ( = ?auto_660099 ?auto_660106 ) ) ( not ( = ?auto_660100 ?auto_660101 ) ) ( not ( = ?auto_660100 ?auto_660102 ) ) ( not ( = ?auto_660100 ?auto_660103 ) ) ( not ( = ?auto_660100 ?auto_660104 ) ) ( not ( = ?auto_660100 ?auto_660105 ) ) ( not ( = ?auto_660100 ?auto_660106 ) ) ( not ( = ?auto_660101 ?auto_660102 ) ) ( not ( = ?auto_660101 ?auto_660103 ) ) ( not ( = ?auto_660101 ?auto_660104 ) ) ( not ( = ?auto_660101 ?auto_660105 ) ) ( not ( = ?auto_660101 ?auto_660106 ) ) ( not ( = ?auto_660102 ?auto_660103 ) ) ( not ( = ?auto_660102 ?auto_660104 ) ) ( not ( = ?auto_660102 ?auto_660105 ) ) ( not ( = ?auto_660102 ?auto_660106 ) ) ( not ( = ?auto_660103 ?auto_660104 ) ) ( not ( = ?auto_660103 ?auto_660105 ) ) ( not ( = ?auto_660103 ?auto_660106 ) ) ( not ( = ?auto_660104 ?auto_660105 ) ) ( not ( = ?auto_660104 ?auto_660106 ) ) ( not ( = ?auto_660105 ?auto_660106 ) ) ( ON ?auto_660104 ?auto_660105 ) ( ON ?auto_660103 ?auto_660104 ) ( ON ?auto_660102 ?auto_660103 ) ( ON ?auto_660101 ?auto_660102 ) ( ON ?auto_660100 ?auto_660101 ) ( ON ?auto_660099 ?auto_660100 ) ( CLEAR ?auto_660097 ) ( ON ?auto_660098 ?auto_660099 ) ( CLEAR ?auto_660098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_660094 ?auto_660095 ?auto_660096 ?auto_660097 ?auto_660098 )
      ( MAKE-12PILE ?auto_660094 ?auto_660095 ?auto_660096 ?auto_660097 ?auto_660098 ?auto_660099 ?auto_660100 ?auto_660101 ?auto_660102 ?auto_660103 ?auto_660104 ?auto_660105 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_660144 - BLOCK
      ?auto_660145 - BLOCK
      ?auto_660146 - BLOCK
      ?auto_660147 - BLOCK
      ?auto_660148 - BLOCK
      ?auto_660149 - BLOCK
      ?auto_660150 - BLOCK
      ?auto_660151 - BLOCK
      ?auto_660152 - BLOCK
      ?auto_660153 - BLOCK
      ?auto_660154 - BLOCK
      ?auto_660155 - BLOCK
    )
    :vars
    (
      ?auto_660156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660155 ?auto_660156 ) ( ON-TABLE ?auto_660144 ) ( ON ?auto_660145 ?auto_660144 ) ( ON ?auto_660146 ?auto_660145 ) ( not ( = ?auto_660144 ?auto_660145 ) ) ( not ( = ?auto_660144 ?auto_660146 ) ) ( not ( = ?auto_660144 ?auto_660147 ) ) ( not ( = ?auto_660144 ?auto_660148 ) ) ( not ( = ?auto_660144 ?auto_660149 ) ) ( not ( = ?auto_660144 ?auto_660150 ) ) ( not ( = ?auto_660144 ?auto_660151 ) ) ( not ( = ?auto_660144 ?auto_660152 ) ) ( not ( = ?auto_660144 ?auto_660153 ) ) ( not ( = ?auto_660144 ?auto_660154 ) ) ( not ( = ?auto_660144 ?auto_660155 ) ) ( not ( = ?auto_660144 ?auto_660156 ) ) ( not ( = ?auto_660145 ?auto_660146 ) ) ( not ( = ?auto_660145 ?auto_660147 ) ) ( not ( = ?auto_660145 ?auto_660148 ) ) ( not ( = ?auto_660145 ?auto_660149 ) ) ( not ( = ?auto_660145 ?auto_660150 ) ) ( not ( = ?auto_660145 ?auto_660151 ) ) ( not ( = ?auto_660145 ?auto_660152 ) ) ( not ( = ?auto_660145 ?auto_660153 ) ) ( not ( = ?auto_660145 ?auto_660154 ) ) ( not ( = ?auto_660145 ?auto_660155 ) ) ( not ( = ?auto_660145 ?auto_660156 ) ) ( not ( = ?auto_660146 ?auto_660147 ) ) ( not ( = ?auto_660146 ?auto_660148 ) ) ( not ( = ?auto_660146 ?auto_660149 ) ) ( not ( = ?auto_660146 ?auto_660150 ) ) ( not ( = ?auto_660146 ?auto_660151 ) ) ( not ( = ?auto_660146 ?auto_660152 ) ) ( not ( = ?auto_660146 ?auto_660153 ) ) ( not ( = ?auto_660146 ?auto_660154 ) ) ( not ( = ?auto_660146 ?auto_660155 ) ) ( not ( = ?auto_660146 ?auto_660156 ) ) ( not ( = ?auto_660147 ?auto_660148 ) ) ( not ( = ?auto_660147 ?auto_660149 ) ) ( not ( = ?auto_660147 ?auto_660150 ) ) ( not ( = ?auto_660147 ?auto_660151 ) ) ( not ( = ?auto_660147 ?auto_660152 ) ) ( not ( = ?auto_660147 ?auto_660153 ) ) ( not ( = ?auto_660147 ?auto_660154 ) ) ( not ( = ?auto_660147 ?auto_660155 ) ) ( not ( = ?auto_660147 ?auto_660156 ) ) ( not ( = ?auto_660148 ?auto_660149 ) ) ( not ( = ?auto_660148 ?auto_660150 ) ) ( not ( = ?auto_660148 ?auto_660151 ) ) ( not ( = ?auto_660148 ?auto_660152 ) ) ( not ( = ?auto_660148 ?auto_660153 ) ) ( not ( = ?auto_660148 ?auto_660154 ) ) ( not ( = ?auto_660148 ?auto_660155 ) ) ( not ( = ?auto_660148 ?auto_660156 ) ) ( not ( = ?auto_660149 ?auto_660150 ) ) ( not ( = ?auto_660149 ?auto_660151 ) ) ( not ( = ?auto_660149 ?auto_660152 ) ) ( not ( = ?auto_660149 ?auto_660153 ) ) ( not ( = ?auto_660149 ?auto_660154 ) ) ( not ( = ?auto_660149 ?auto_660155 ) ) ( not ( = ?auto_660149 ?auto_660156 ) ) ( not ( = ?auto_660150 ?auto_660151 ) ) ( not ( = ?auto_660150 ?auto_660152 ) ) ( not ( = ?auto_660150 ?auto_660153 ) ) ( not ( = ?auto_660150 ?auto_660154 ) ) ( not ( = ?auto_660150 ?auto_660155 ) ) ( not ( = ?auto_660150 ?auto_660156 ) ) ( not ( = ?auto_660151 ?auto_660152 ) ) ( not ( = ?auto_660151 ?auto_660153 ) ) ( not ( = ?auto_660151 ?auto_660154 ) ) ( not ( = ?auto_660151 ?auto_660155 ) ) ( not ( = ?auto_660151 ?auto_660156 ) ) ( not ( = ?auto_660152 ?auto_660153 ) ) ( not ( = ?auto_660152 ?auto_660154 ) ) ( not ( = ?auto_660152 ?auto_660155 ) ) ( not ( = ?auto_660152 ?auto_660156 ) ) ( not ( = ?auto_660153 ?auto_660154 ) ) ( not ( = ?auto_660153 ?auto_660155 ) ) ( not ( = ?auto_660153 ?auto_660156 ) ) ( not ( = ?auto_660154 ?auto_660155 ) ) ( not ( = ?auto_660154 ?auto_660156 ) ) ( not ( = ?auto_660155 ?auto_660156 ) ) ( ON ?auto_660154 ?auto_660155 ) ( ON ?auto_660153 ?auto_660154 ) ( ON ?auto_660152 ?auto_660153 ) ( ON ?auto_660151 ?auto_660152 ) ( ON ?auto_660150 ?auto_660151 ) ( ON ?auto_660149 ?auto_660150 ) ( ON ?auto_660148 ?auto_660149 ) ( CLEAR ?auto_660146 ) ( ON ?auto_660147 ?auto_660148 ) ( CLEAR ?auto_660147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_660144 ?auto_660145 ?auto_660146 ?auto_660147 )
      ( MAKE-12PILE ?auto_660144 ?auto_660145 ?auto_660146 ?auto_660147 ?auto_660148 ?auto_660149 ?auto_660150 ?auto_660151 ?auto_660152 ?auto_660153 ?auto_660154 ?auto_660155 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_660194 - BLOCK
      ?auto_660195 - BLOCK
      ?auto_660196 - BLOCK
      ?auto_660197 - BLOCK
      ?auto_660198 - BLOCK
      ?auto_660199 - BLOCK
      ?auto_660200 - BLOCK
      ?auto_660201 - BLOCK
      ?auto_660202 - BLOCK
      ?auto_660203 - BLOCK
      ?auto_660204 - BLOCK
      ?auto_660205 - BLOCK
    )
    :vars
    (
      ?auto_660206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660205 ?auto_660206 ) ( ON-TABLE ?auto_660194 ) ( ON ?auto_660195 ?auto_660194 ) ( not ( = ?auto_660194 ?auto_660195 ) ) ( not ( = ?auto_660194 ?auto_660196 ) ) ( not ( = ?auto_660194 ?auto_660197 ) ) ( not ( = ?auto_660194 ?auto_660198 ) ) ( not ( = ?auto_660194 ?auto_660199 ) ) ( not ( = ?auto_660194 ?auto_660200 ) ) ( not ( = ?auto_660194 ?auto_660201 ) ) ( not ( = ?auto_660194 ?auto_660202 ) ) ( not ( = ?auto_660194 ?auto_660203 ) ) ( not ( = ?auto_660194 ?auto_660204 ) ) ( not ( = ?auto_660194 ?auto_660205 ) ) ( not ( = ?auto_660194 ?auto_660206 ) ) ( not ( = ?auto_660195 ?auto_660196 ) ) ( not ( = ?auto_660195 ?auto_660197 ) ) ( not ( = ?auto_660195 ?auto_660198 ) ) ( not ( = ?auto_660195 ?auto_660199 ) ) ( not ( = ?auto_660195 ?auto_660200 ) ) ( not ( = ?auto_660195 ?auto_660201 ) ) ( not ( = ?auto_660195 ?auto_660202 ) ) ( not ( = ?auto_660195 ?auto_660203 ) ) ( not ( = ?auto_660195 ?auto_660204 ) ) ( not ( = ?auto_660195 ?auto_660205 ) ) ( not ( = ?auto_660195 ?auto_660206 ) ) ( not ( = ?auto_660196 ?auto_660197 ) ) ( not ( = ?auto_660196 ?auto_660198 ) ) ( not ( = ?auto_660196 ?auto_660199 ) ) ( not ( = ?auto_660196 ?auto_660200 ) ) ( not ( = ?auto_660196 ?auto_660201 ) ) ( not ( = ?auto_660196 ?auto_660202 ) ) ( not ( = ?auto_660196 ?auto_660203 ) ) ( not ( = ?auto_660196 ?auto_660204 ) ) ( not ( = ?auto_660196 ?auto_660205 ) ) ( not ( = ?auto_660196 ?auto_660206 ) ) ( not ( = ?auto_660197 ?auto_660198 ) ) ( not ( = ?auto_660197 ?auto_660199 ) ) ( not ( = ?auto_660197 ?auto_660200 ) ) ( not ( = ?auto_660197 ?auto_660201 ) ) ( not ( = ?auto_660197 ?auto_660202 ) ) ( not ( = ?auto_660197 ?auto_660203 ) ) ( not ( = ?auto_660197 ?auto_660204 ) ) ( not ( = ?auto_660197 ?auto_660205 ) ) ( not ( = ?auto_660197 ?auto_660206 ) ) ( not ( = ?auto_660198 ?auto_660199 ) ) ( not ( = ?auto_660198 ?auto_660200 ) ) ( not ( = ?auto_660198 ?auto_660201 ) ) ( not ( = ?auto_660198 ?auto_660202 ) ) ( not ( = ?auto_660198 ?auto_660203 ) ) ( not ( = ?auto_660198 ?auto_660204 ) ) ( not ( = ?auto_660198 ?auto_660205 ) ) ( not ( = ?auto_660198 ?auto_660206 ) ) ( not ( = ?auto_660199 ?auto_660200 ) ) ( not ( = ?auto_660199 ?auto_660201 ) ) ( not ( = ?auto_660199 ?auto_660202 ) ) ( not ( = ?auto_660199 ?auto_660203 ) ) ( not ( = ?auto_660199 ?auto_660204 ) ) ( not ( = ?auto_660199 ?auto_660205 ) ) ( not ( = ?auto_660199 ?auto_660206 ) ) ( not ( = ?auto_660200 ?auto_660201 ) ) ( not ( = ?auto_660200 ?auto_660202 ) ) ( not ( = ?auto_660200 ?auto_660203 ) ) ( not ( = ?auto_660200 ?auto_660204 ) ) ( not ( = ?auto_660200 ?auto_660205 ) ) ( not ( = ?auto_660200 ?auto_660206 ) ) ( not ( = ?auto_660201 ?auto_660202 ) ) ( not ( = ?auto_660201 ?auto_660203 ) ) ( not ( = ?auto_660201 ?auto_660204 ) ) ( not ( = ?auto_660201 ?auto_660205 ) ) ( not ( = ?auto_660201 ?auto_660206 ) ) ( not ( = ?auto_660202 ?auto_660203 ) ) ( not ( = ?auto_660202 ?auto_660204 ) ) ( not ( = ?auto_660202 ?auto_660205 ) ) ( not ( = ?auto_660202 ?auto_660206 ) ) ( not ( = ?auto_660203 ?auto_660204 ) ) ( not ( = ?auto_660203 ?auto_660205 ) ) ( not ( = ?auto_660203 ?auto_660206 ) ) ( not ( = ?auto_660204 ?auto_660205 ) ) ( not ( = ?auto_660204 ?auto_660206 ) ) ( not ( = ?auto_660205 ?auto_660206 ) ) ( ON ?auto_660204 ?auto_660205 ) ( ON ?auto_660203 ?auto_660204 ) ( ON ?auto_660202 ?auto_660203 ) ( ON ?auto_660201 ?auto_660202 ) ( ON ?auto_660200 ?auto_660201 ) ( ON ?auto_660199 ?auto_660200 ) ( ON ?auto_660198 ?auto_660199 ) ( ON ?auto_660197 ?auto_660198 ) ( CLEAR ?auto_660195 ) ( ON ?auto_660196 ?auto_660197 ) ( CLEAR ?auto_660196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_660194 ?auto_660195 ?auto_660196 )
      ( MAKE-12PILE ?auto_660194 ?auto_660195 ?auto_660196 ?auto_660197 ?auto_660198 ?auto_660199 ?auto_660200 ?auto_660201 ?auto_660202 ?auto_660203 ?auto_660204 ?auto_660205 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_660244 - BLOCK
      ?auto_660245 - BLOCK
      ?auto_660246 - BLOCK
      ?auto_660247 - BLOCK
      ?auto_660248 - BLOCK
      ?auto_660249 - BLOCK
      ?auto_660250 - BLOCK
      ?auto_660251 - BLOCK
      ?auto_660252 - BLOCK
      ?auto_660253 - BLOCK
      ?auto_660254 - BLOCK
      ?auto_660255 - BLOCK
    )
    :vars
    (
      ?auto_660256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660255 ?auto_660256 ) ( ON-TABLE ?auto_660244 ) ( not ( = ?auto_660244 ?auto_660245 ) ) ( not ( = ?auto_660244 ?auto_660246 ) ) ( not ( = ?auto_660244 ?auto_660247 ) ) ( not ( = ?auto_660244 ?auto_660248 ) ) ( not ( = ?auto_660244 ?auto_660249 ) ) ( not ( = ?auto_660244 ?auto_660250 ) ) ( not ( = ?auto_660244 ?auto_660251 ) ) ( not ( = ?auto_660244 ?auto_660252 ) ) ( not ( = ?auto_660244 ?auto_660253 ) ) ( not ( = ?auto_660244 ?auto_660254 ) ) ( not ( = ?auto_660244 ?auto_660255 ) ) ( not ( = ?auto_660244 ?auto_660256 ) ) ( not ( = ?auto_660245 ?auto_660246 ) ) ( not ( = ?auto_660245 ?auto_660247 ) ) ( not ( = ?auto_660245 ?auto_660248 ) ) ( not ( = ?auto_660245 ?auto_660249 ) ) ( not ( = ?auto_660245 ?auto_660250 ) ) ( not ( = ?auto_660245 ?auto_660251 ) ) ( not ( = ?auto_660245 ?auto_660252 ) ) ( not ( = ?auto_660245 ?auto_660253 ) ) ( not ( = ?auto_660245 ?auto_660254 ) ) ( not ( = ?auto_660245 ?auto_660255 ) ) ( not ( = ?auto_660245 ?auto_660256 ) ) ( not ( = ?auto_660246 ?auto_660247 ) ) ( not ( = ?auto_660246 ?auto_660248 ) ) ( not ( = ?auto_660246 ?auto_660249 ) ) ( not ( = ?auto_660246 ?auto_660250 ) ) ( not ( = ?auto_660246 ?auto_660251 ) ) ( not ( = ?auto_660246 ?auto_660252 ) ) ( not ( = ?auto_660246 ?auto_660253 ) ) ( not ( = ?auto_660246 ?auto_660254 ) ) ( not ( = ?auto_660246 ?auto_660255 ) ) ( not ( = ?auto_660246 ?auto_660256 ) ) ( not ( = ?auto_660247 ?auto_660248 ) ) ( not ( = ?auto_660247 ?auto_660249 ) ) ( not ( = ?auto_660247 ?auto_660250 ) ) ( not ( = ?auto_660247 ?auto_660251 ) ) ( not ( = ?auto_660247 ?auto_660252 ) ) ( not ( = ?auto_660247 ?auto_660253 ) ) ( not ( = ?auto_660247 ?auto_660254 ) ) ( not ( = ?auto_660247 ?auto_660255 ) ) ( not ( = ?auto_660247 ?auto_660256 ) ) ( not ( = ?auto_660248 ?auto_660249 ) ) ( not ( = ?auto_660248 ?auto_660250 ) ) ( not ( = ?auto_660248 ?auto_660251 ) ) ( not ( = ?auto_660248 ?auto_660252 ) ) ( not ( = ?auto_660248 ?auto_660253 ) ) ( not ( = ?auto_660248 ?auto_660254 ) ) ( not ( = ?auto_660248 ?auto_660255 ) ) ( not ( = ?auto_660248 ?auto_660256 ) ) ( not ( = ?auto_660249 ?auto_660250 ) ) ( not ( = ?auto_660249 ?auto_660251 ) ) ( not ( = ?auto_660249 ?auto_660252 ) ) ( not ( = ?auto_660249 ?auto_660253 ) ) ( not ( = ?auto_660249 ?auto_660254 ) ) ( not ( = ?auto_660249 ?auto_660255 ) ) ( not ( = ?auto_660249 ?auto_660256 ) ) ( not ( = ?auto_660250 ?auto_660251 ) ) ( not ( = ?auto_660250 ?auto_660252 ) ) ( not ( = ?auto_660250 ?auto_660253 ) ) ( not ( = ?auto_660250 ?auto_660254 ) ) ( not ( = ?auto_660250 ?auto_660255 ) ) ( not ( = ?auto_660250 ?auto_660256 ) ) ( not ( = ?auto_660251 ?auto_660252 ) ) ( not ( = ?auto_660251 ?auto_660253 ) ) ( not ( = ?auto_660251 ?auto_660254 ) ) ( not ( = ?auto_660251 ?auto_660255 ) ) ( not ( = ?auto_660251 ?auto_660256 ) ) ( not ( = ?auto_660252 ?auto_660253 ) ) ( not ( = ?auto_660252 ?auto_660254 ) ) ( not ( = ?auto_660252 ?auto_660255 ) ) ( not ( = ?auto_660252 ?auto_660256 ) ) ( not ( = ?auto_660253 ?auto_660254 ) ) ( not ( = ?auto_660253 ?auto_660255 ) ) ( not ( = ?auto_660253 ?auto_660256 ) ) ( not ( = ?auto_660254 ?auto_660255 ) ) ( not ( = ?auto_660254 ?auto_660256 ) ) ( not ( = ?auto_660255 ?auto_660256 ) ) ( ON ?auto_660254 ?auto_660255 ) ( ON ?auto_660253 ?auto_660254 ) ( ON ?auto_660252 ?auto_660253 ) ( ON ?auto_660251 ?auto_660252 ) ( ON ?auto_660250 ?auto_660251 ) ( ON ?auto_660249 ?auto_660250 ) ( ON ?auto_660248 ?auto_660249 ) ( ON ?auto_660247 ?auto_660248 ) ( ON ?auto_660246 ?auto_660247 ) ( CLEAR ?auto_660244 ) ( ON ?auto_660245 ?auto_660246 ) ( CLEAR ?auto_660245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_660244 ?auto_660245 )
      ( MAKE-12PILE ?auto_660244 ?auto_660245 ?auto_660246 ?auto_660247 ?auto_660248 ?auto_660249 ?auto_660250 ?auto_660251 ?auto_660252 ?auto_660253 ?auto_660254 ?auto_660255 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_660294 - BLOCK
      ?auto_660295 - BLOCK
      ?auto_660296 - BLOCK
      ?auto_660297 - BLOCK
      ?auto_660298 - BLOCK
      ?auto_660299 - BLOCK
      ?auto_660300 - BLOCK
      ?auto_660301 - BLOCK
      ?auto_660302 - BLOCK
      ?auto_660303 - BLOCK
      ?auto_660304 - BLOCK
      ?auto_660305 - BLOCK
    )
    :vars
    (
      ?auto_660306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660305 ?auto_660306 ) ( not ( = ?auto_660294 ?auto_660295 ) ) ( not ( = ?auto_660294 ?auto_660296 ) ) ( not ( = ?auto_660294 ?auto_660297 ) ) ( not ( = ?auto_660294 ?auto_660298 ) ) ( not ( = ?auto_660294 ?auto_660299 ) ) ( not ( = ?auto_660294 ?auto_660300 ) ) ( not ( = ?auto_660294 ?auto_660301 ) ) ( not ( = ?auto_660294 ?auto_660302 ) ) ( not ( = ?auto_660294 ?auto_660303 ) ) ( not ( = ?auto_660294 ?auto_660304 ) ) ( not ( = ?auto_660294 ?auto_660305 ) ) ( not ( = ?auto_660294 ?auto_660306 ) ) ( not ( = ?auto_660295 ?auto_660296 ) ) ( not ( = ?auto_660295 ?auto_660297 ) ) ( not ( = ?auto_660295 ?auto_660298 ) ) ( not ( = ?auto_660295 ?auto_660299 ) ) ( not ( = ?auto_660295 ?auto_660300 ) ) ( not ( = ?auto_660295 ?auto_660301 ) ) ( not ( = ?auto_660295 ?auto_660302 ) ) ( not ( = ?auto_660295 ?auto_660303 ) ) ( not ( = ?auto_660295 ?auto_660304 ) ) ( not ( = ?auto_660295 ?auto_660305 ) ) ( not ( = ?auto_660295 ?auto_660306 ) ) ( not ( = ?auto_660296 ?auto_660297 ) ) ( not ( = ?auto_660296 ?auto_660298 ) ) ( not ( = ?auto_660296 ?auto_660299 ) ) ( not ( = ?auto_660296 ?auto_660300 ) ) ( not ( = ?auto_660296 ?auto_660301 ) ) ( not ( = ?auto_660296 ?auto_660302 ) ) ( not ( = ?auto_660296 ?auto_660303 ) ) ( not ( = ?auto_660296 ?auto_660304 ) ) ( not ( = ?auto_660296 ?auto_660305 ) ) ( not ( = ?auto_660296 ?auto_660306 ) ) ( not ( = ?auto_660297 ?auto_660298 ) ) ( not ( = ?auto_660297 ?auto_660299 ) ) ( not ( = ?auto_660297 ?auto_660300 ) ) ( not ( = ?auto_660297 ?auto_660301 ) ) ( not ( = ?auto_660297 ?auto_660302 ) ) ( not ( = ?auto_660297 ?auto_660303 ) ) ( not ( = ?auto_660297 ?auto_660304 ) ) ( not ( = ?auto_660297 ?auto_660305 ) ) ( not ( = ?auto_660297 ?auto_660306 ) ) ( not ( = ?auto_660298 ?auto_660299 ) ) ( not ( = ?auto_660298 ?auto_660300 ) ) ( not ( = ?auto_660298 ?auto_660301 ) ) ( not ( = ?auto_660298 ?auto_660302 ) ) ( not ( = ?auto_660298 ?auto_660303 ) ) ( not ( = ?auto_660298 ?auto_660304 ) ) ( not ( = ?auto_660298 ?auto_660305 ) ) ( not ( = ?auto_660298 ?auto_660306 ) ) ( not ( = ?auto_660299 ?auto_660300 ) ) ( not ( = ?auto_660299 ?auto_660301 ) ) ( not ( = ?auto_660299 ?auto_660302 ) ) ( not ( = ?auto_660299 ?auto_660303 ) ) ( not ( = ?auto_660299 ?auto_660304 ) ) ( not ( = ?auto_660299 ?auto_660305 ) ) ( not ( = ?auto_660299 ?auto_660306 ) ) ( not ( = ?auto_660300 ?auto_660301 ) ) ( not ( = ?auto_660300 ?auto_660302 ) ) ( not ( = ?auto_660300 ?auto_660303 ) ) ( not ( = ?auto_660300 ?auto_660304 ) ) ( not ( = ?auto_660300 ?auto_660305 ) ) ( not ( = ?auto_660300 ?auto_660306 ) ) ( not ( = ?auto_660301 ?auto_660302 ) ) ( not ( = ?auto_660301 ?auto_660303 ) ) ( not ( = ?auto_660301 ?auto_660304 ) ) ( not ( = ?auto_660301 ?auto_660305 ) ) ( not ( = ?auto_660301 ?auto_660306 ) ) ( not ( = ?auto_660302 ?auto_660303 ) ) ( not ( = ?auto_660302 ?auto_660304 ) ) ( not ( = ?auto_660302 ?auto_660305 ) ) ( not ( = ?auto_660302 ?auto_660306 ) ) ( not ( = ?auto_660303 ?auto_660304 ) ) ( not ( = ?auto_660303 ?auto_660305 ) ) ( not ( = ?auto_660303 ?auto_660306 ) ) ( not ( = ?auto_660304 ?auto_660305 ) ) ( not ( = ?auto_660304 ?auto_660306 ) ) ( not ( = ?auto_660305 ?auto_660306 ) ) ( ON ?auto_660304 ?auto_660305 ) ( ON ?auto_660303 ?auto_660304 ) ( ON ?auto_660302 ?auto_660303 ) ( ON ?auto_660301 ?auto_660302 ) ( ON ?auto_660300 ?auto_660301 ) ( ON ?auto_660299 ?auto_660300 ) ( ON ?auto_660298 ?auto_660299 ) ( ON ?auto_660297 ?auto_660298 ) ( ON ?auto_660296 ?auto_660297 ) ( ON ?auto_660295 ?auto_660296 ) ( ON ?auto_660294 ?auto_660295 ) ( CLEAR ?auto_660294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_660294 )
      ( MAKE-12PILE ?auto_660294 ?auto_660295 ?auto_660296 ?auto_660297 ?auto_660298 ?auto_660299 ?auto_660300 ?auto_660301 ?auto_660302 ?auto_660303 ?auto_660304 ?auto_660305 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_660345 - BLOCK
      ?auto_660346 - BLOCK
      ?auto_660347 - BLOCK
      ?auto_660348 - BLOCK
      ?auto_660349 - BLOCK
      ?auto_660350 - BLOCK
      ?auto_660351 - BLOCK
      ?auto_660352 - BLOCK
      ?auto_660353 - BLOCK
      ?auto_660354 - BLOCK
      ?auto_660355 - BLOCK
      ?auto_660356 - BLOCK
      ?auto_660357 - BLOCK
    )
    :vars
    (
      ?auto_660358 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_660356 ) ( ON ?auto_660357 ?auto_660358 ) ( CLEAR ?auto_660357 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_660345 ) ( ON ?auto_660346 ?auto_660345 ) ( ON ?auto_660347 ?auto_660346 ) ( ON ?auto_660348 ?auto_660347 ) ( ON ?auto_660349 ?auto_660348 ) ( ON ?auto_660350 ?auto_660349 ) ( ON ?auto_660351 ?auto_660350 ) ( ON ?auto_660352 ?auto_660351 ) ( ON ?auto_660353 ?auto_660352 ) ( ON ?auto_660354 ?auto_660353 ) ( ON ?auto_660355 ?auto_660354 ) ( ON ?auto_660356 ?auto_660355 ) ( not ( = ?auto_660345 ?auto_660346 ) ) ( not ( = ?auto_660345 ?auto_660347 ) ) ( not ( = ?auto_660345 ?auto_660348 ) ) ( not ( = ?auto_660345 ?auto_660349 ) ) ( not ( = ?auto_660345 ?auto_660350 ) ) ( not ( = ?auto_660345 ?auto_660351 ) ) ( not ( = ?auto_660345 ?auto_660352 ) ) ( not ( = ?auto_660345 ?auto_660353 ) ) ( not ( = ?auto_660345 ?auto_660354 ) ) ( not ( = ?auto_660345 ?auto_660355 ) ) ( not ( = ?auto_660345 ?auto_660356 ) ) ( not ( = ?auto_660345 ?auto_660357 ) ) ( not ( = ?auto_660345 ?auto_660358 ) ) ( not ( = ?auto_660346 ?auto_660347 ) ) ( not ( = ?auto_660346 ?auto_660348 ) ) ( not ( = ?auto_660346 ?auto_660349 ) ) ( not ( = ?auto_660346 ?auto_660350 ) ) ( not ( = ?auto_660346 ?auto_660351 ) ) ( not ( = ?auto_660346 ?auto_660352 ) ) ( not ( = ?auto_660346 ?auto_660353 ) ) ( not ( = ?auto_660346 ?auto_660354 ) ) ( not ( = ?auto_660346 ?auto_660355 ) ) ( not ( = ?auto_660346 ?auto_660356 ) ) ( not ( = ?auto_660346 ?auto_660357 ) ) ( not ( = ?auto_660346 ?auto_660358 ) ) ( not ( = ?auto_660347 ?auto_660348 ) ) ( not ( = ?auto_660347 ?auto_660349 ) ) ( not ( = ?auto_660347 ?auto_660350 ) ) ( not ( = ?auto_660347 ?auto_660351 ) ) ( not ( = ?auto_660347 ?auto_660352 ) ) ( not ( = ?auto_660347 ?auto_660353 ) ) ( not ( = ?auto_660347 ?auto_660354 ) ) ( not ( = ?auto_660347 ?auto_660355 ) ) ( not ( = ?auto_660347 ?auto_660356 ) ) ( not ( = ?auto_660347 ?auto_660357 ) ) ( not ( = ?auto_660347 ?auto_660358 ) ) ( not ( = ?auto_660348 ?auto_660349 ) ) ( not ( = ?auto_660348 ?auto_660350 ) ) ( not ( = ?auto_660348 ?auto_660351 ) ) ( not ( = ?auto_660348 ?auto_660352 ) ) ( not ( = ?auto_660348 ?auto_660353 ) ) ( not ( = ?auto_660348 ?auto_660354 ) ) ( not ( = ?auto_660348 ?auto_660355 ) ) ( not ( = ?auto_660348 ?auto_660356 ) ) ( not ( = ?auto_660348 ?auto_660357 ) ) ( not ( = ?auto_660348 ?auto_660358 ) ) ( not ( = ?auto_660349 ?auto_660350 ) ) ( not ( = ?auto_660349 ?auto_660351 ) ) ( not ( = ?auto_660349 ?auto_660352 ) ) ( not ( = ?auto_660349 ?auto_660353 ) ) ( not ( = ?auto_660349 ?auto_660354 ) ) ( not ( = ?auto_660349 ?auto_660355 ) ) ( not ( = ?auto_660349 ?auto_660356 ) ) ( not ( = ?auto_660349 ?auto_660357 ) ) ( not ( = ?auto_660349 ?auto_660358 ) ) ( not ( = ?auto_660350 ?auto_660351 ) ) ( not ( = ?auto_660350 ?auto_660352 ) ) ( not ( = ?auto_660350 ?auto_660353 ) ) ( not ( = ?auto_660350 ?auto_660354 ) ) ( not ( = ?auto_660350 ?auto_660355 ) ) ( not ( = ?auto_660350 ?auto_660356 ) ) ( not ( = ?auto_660350 ?auto_660357 ) ) ( not ( = ?auto_660350 ?auto_660358 ) ) ( not ( = ?auto_660351 ?auto_660352 ) ) ( not ( = ?auto_660351 ?auto_660353 ) ) ( not ( = ?auto_660351 ?auto_660354 ) ) ( not ( = ?auto_660351 ?auto_660355 ) ) ( not ( = ?auto_660351 ?auto_660356 ) ) ( not ( = ?auto_660351 ?auto_660357 ) ) ( not ( = ?auto_660351 ?auto_660358 ) ) ( not ( = ?auto_660352 ?auto_660353 ) ) ( not ( = ?auto_660352 ?auto_660354 ) ) ( not ( = ?auto_660352 ?auto_660355 ) ) ( not ( = ?auto_660352 ?auto_660356 ) ) ( not ( = ?auto_660352 ?auto_660357 ) ) ( not ( = ?auto_660352 ?auto_660358 ) ) ( not ( = ?auto_660353 ?auto_660354 ) ) ( not ( = ?auto_660353 ?auto_660355 ) ) ( not ( = ?auto_660353 ?auto_660356 ) ) ( not ( = ?auto_660353 ?auto_660357 ) ) ( not ( = ?auto_660353 ?auto_660358 ) ) ( not ( = ?auto_660354 ?auto_660355 ) ) ( not ( = ?auto_660354 ?auto_660356 ) ) ( not ( = ?auto_660354 ?auto_660357 ) ) ( not ( = ?auto_660354 ?auto_660358 ) ) ( not ( = ?auto_660355 ?auto_660356 ) ) ( not ( = ?auto_660355 ?auto_660357 ) ) ( not ( = ?auto_660355 ?auto_660358 ) ) ( not ( = ?auto_660356 ?auto_660357 ) ) ( not ( = ?auto_660356 ?auto_660358 ) ) ( not ( = ?auto_660357 ?auto_660358 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_660357 ?auto_660358 )
      ( !STACK ?auto_660357 ?auto_660356 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_660399 - BLOCK
      ?auto_660400 - BLOCK
      ?auto_660401 - BLOCK
      ?auto_660402 - BLOCK
      ?auto_660403 - BLOCK
      ?auto_660404 - BLOCK
      ?auto_660405 - BLOCK
      ?auto_660406 - BLOCK
      ?auto_660407 - BLOCK
      ?auto_660408 - BLOCK
      ?auto_660409 - BLOCK
      ?auto_660410 - BLOCK
      ?auto_660411 - BLOCK
    )
    :vars
    (
      ?auto_660412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660411 ?auto_660412 ) ( ON-TABLE ?auto_660399 ) ( ON ?auto_660400 ?auto_660399 ) ( ON ?auto_660401 ?auto_660400 ) ( ON ?auto_660402 ?auto_660401 ) ( ON ?auto_660403 ?auto_660402 ) ( ON ?auto_660404 ?auto_660403 ) ( ON ?auto_660405 ?auto_660404 ) ( ON ?auto_660406 ?auto_660405 ) ( ON ?auto_660407 ?auto_660406 ) ( ON ?auto_660408 ?auto_660407 ) ( ON ?auto_660409 ?auto_660408 ) ( not ( = ?auto_660399 ?auto_660400 ) ) ( not ( = ?auto_660399 ?auto_660401 ) ) ( not ( = ?auto_660399 ?auto_660402 ) ) ( not ( = ?auto_660399 ?auto_660403 ) ) ( not ( = ?auto_660399 ?auto_660404 ) ) ( not ( = ?auto_660399 ?auto_660405 ) ) ( not ( = ?auto_660399 ?auto_660406 ) ) ( not ( = ?auto_660399 ?auto_660407 ) ) ( not ( = ?auto_660399 ?auto_660408 ) ) ( not ( = ?auto_660399 ?auto_660409 ) ) ( not ( = ?auto_660399 ?auto_660410 ) ) ( not ( = ?auto_660399 ?auto_660411 ) ) ( not ( = ?auto_660399 ?auto_660412 ) ) ( not ( = ?auto_660400 ?auto_660401 ) ) ( not ( = ?auto_660400 ?auto_660402 ) ) ( not ( = ?auto_660400 ?auto_660403 ) ) ( not ( = ?auto_660400 ?auto_660404 ) ) ( not ( = ?auto_660400 ?auto_660405 ) ) ( not ( = ?auto_660400 ?auto_660406 ) ) ( not ( = ?auto_660400 ?auto_660407 ) ) ( not ( = ?auto_660400 ?auto_660408 ) ) ( not ( = ?auto_660400 ?auto_660409 ) ) ( not ( = ?auto_660400 ?auto_660410 ) ) ( not ( = ?auto_660400 ?auto_660411 ) ) ( not ( = ?auto_660400 ?auto_660412 ) ) ( not ( = ?auto_660401 ?auto_660402 ) ) ( not ( = ?auto_660401 ?auto_660403 ) ) ( not ( = ?auto_660401 ?auto_660404 ) ) ( not ( = ?auto_660401 ?auto_660405 ) ) ( not ( = ?auto_660401 ?auto_660406 ) ) ( not ( = ?auto_660401 ?auto_660407 ) ) ( not ( = ?auto_660401 ?auto_660408 ) ) ( not ( = ?auto_660401 ?auto_660409 ) ) ( not ( = ?auto_660401 ?auto_660410 ) ) ( not ( = ?auto_660401 ?auto_660411 ) ) ( not ( = ?auto_660401 ?auto_660412 ) ) ( not ( = ?auto_660402 ?auto_660403 ) ) ( not ( = ?auto_660402 ?auto_660404 ) ) ( not ( = ?auto_660402 ?auto_660405 ) ) ( not ( = ?auto_660402 ?auto_660406 ) ) ( not ( = ?auto_660402 ?auto_660407 ) ) ( not ( = ?auto_660402 ?auto_660408 ) ) ( not ( = ?auto_660402 ?auto_660409 ) ) ( not ( = ?auto_660402 ?auto_660410 ) ) ( not ( = ?auto_660402 ?auto_660411 ) ) ( not ( = ?auto_660402 ?auto_660412 ) ) ( not ( = ?auto_660403 ?auto_660404 ) ) ( not ( = ?auto_660403 ?auto_660405 ) ) ( not ( = ?auto_660403 ?auto_660406 ) ) ( not ( = ?auto_660403 ?auto_660407 ) ) ( not ( = ?auto_660403 ?auto_660408 ) ) ( not ( = ?auto_660403 ?auto_660409 ) ) ( not ( = ?auto_660403 ?auto_660410 ) ) ( not ( = ?auto_660403 ?auto_660411 ) ) ( not ( = ?auto_660403 ?auto_660412 ) ) ( not ( = ?auto_660404 ?auto_660405 ) ) ( not ( = ?auto_660404 ?auto_660406 ) ) ( not ( = ?auto_660404 ?auto_660407 ) ) ( not ( = ?auto_660404 ?auto_660408 ) ) ( not ( = ?auto_660404 ?auto_660409 ) ) ( not ( = ?auto_660404 ?auto_660410 ) ) ( not ( = ?auto_660404 ?auto_660411 ) ) ( not ( = ?auto_660404 ?auto_660412 ) ) ( not ( = ?auto_660405 ?auto_660406 ) ) ( not ( = ?auto_660405 ?auto_660407 ) ) ( not ( = ?auto_660405 ?auto_660408 ) ) ( not ( = ?auto_660405 ?auto_660409 ) ) ( not ( = ?auto_660405 ?auto_660410 ) ) ( not ( = ?auto_660405 ?auto_660411 ) ) ( not ( = ?auto_660405 ?auto_660412 ) ) ( not ( = ?auto_660406 ?auto_660407 ) ) ( not ( = ?auto_660406 ?auto_660408 ) ) ( not ( = ?auto_660406 ?auto_660409 ) ) ( not ( = ?auto_660406 ?auto_660410 ) ) ( not ( = ?auto_660406 ?auto_660411 ) ) ( not ( = ?auto_660406 ?auto_660412 ) ) ( not ( = ?auto_660407 ?auto_660408 ) ) ( not ( = ?auto_660407 ?auto_660409 ) ) ( not ( = ?auto_660407 ?auto_660410 ) ) ( not ( = ?auto_660407 ?auto_660411 ) ) ( not ( = ?auto_660407 ?auto_660412 ) ) ( not ( = ?auto_660408 ?auto_660409 ) ) ( not ( = ?auto_660408 ?auto_660410 ) ) ( not ( = ?auto_660408 ?auto_660411 ) ) ( not ( = ?auto_660408 ?auto_660412 ) ) ( not ( = ?auto_660409 ?auto_660410 ) ) ( not ( = ?auto_660409 ?auto_660411 ) ) ( not ( = ?auto_660409 ?auto_660412 ) ) ( not ( = ?auto_660410 ?auto_660411 ) ) ( not ( = ?auto_660410 ?auto_660412 ) ) ( not ( = ?auto_660411 ?auto_660412 ) ) ( CLEAR ?auto_660409 ) ( ON ?auto_660410 ?auto_660411 ) ( CLEAR ?auto_660410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_660399 ?auto_660400 ?auto_660401 ?auto_660402 ?auto_660403 ?auto_660404 ?auto_660405 ?auto_660406 ?auto_660407 ?auto_660408 ?auto_660409 ?auto_660410 )
      ( MAKE-13PILE ?auto_660399 ?auto_660400 ?auto_660401 ?auto_660402 ?auto_660403 ?auto_660404 ?auto_660405 ?auto_660406 ?auto_660407 ?auto_660408 ?auto_660409 ?auto_660410 ?auto_660411 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_660453 - BLOCK
      ?auto_660454 - BLOCK
      ?auto_660455 - BLOCK
      ?auto_660456 - BLOCK
      ?auto_660457 - BLOCK
      ?auto_660458 - BLOCK
      ?auto_660459 - BLOCK
      ?auto_660460 - BLOCK
      ?auto_660461 - BLOCK
      ?auto_660462 - BLOCK
      ?auto_660463 - BLOCK
      ?auto_660464 - BLOCK
      ?auto_660465 - BLOCK
    )
    :vars
    (
      ?auto_660466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660465 ?auto_660466 ) ( ON-TABLE ?auto_660453 ) ( ON ?auto_660454 ?auto_660453 ) ( ON ?auto_660455 ?auto_660454 ) ( ON ?auto_660456 ?auto_660455 ) ( ON ?auto_660457 ?auto_660456 ) ( ON ?auto_660458 ?auto_660457 ) ( ON ?auto_660459 ?auto_660458 ) ( ON ?auto_660460 ?auto_660459 ) ( ON ?auto_660461 ?auto_660460 ) ( ON ?auto_660462 ?auto_660461 ) ( not ( = ?auto_660453 ?auto_660454 ) ) ( not ( = ?auto_660453 ?auto_660455 ) ) ( not ( = ?auto_660453 ?auto_660456 ) ) ( not ( = ?auto_660453 ?auto_660457 ) ) ( not ( = ?auto_660453 ?auto_660458 ) ) ( not ( = ?auto_660453 ?auto_660459 ) ) ( not ( = ?auto_660453 ?auto_660460 ) ) ( not ( = ?auto_660453 ?auto_660461 ) ) ( not ( = ?auto_660453 ?auto_660462 ) ) ( not ( = ?auto_660453 ?auto_660463 ) ) ( not ( = ?auto_660453 ?auto_660464 ) ) ( not ( = ?auto_660453 ?auto_660465 ) ) ( not ( = ?auto_660453 ?auto_660466 ) ) ( not ( = ?auto_660454 ?auto_660455 ) ) ( not ( = ?auto_660454 ?auto_660456 ) ) ( not ( = ?auto_660454 ?auto_660457 ) ) ( not ( = ?auto_660454 ?auto_660458 ) ) ( not ( = ?auto_660454 ?auto_660459 ) ) ( not ( = ?auto_660454 ?auto_660460 ) ) ( not ( = ?auto_660454 ?auto_660461 ) ) ( not ( = ?auto_660454 ?auto_660462 ) ) ( not ( = ?auto_660454 ?auto_660463 ) ) ( not ( = ?auto_660454 ?auto_660464 ) ) ( not ( = ?auto_660454 ?auto_660465 ) ) ( not ( = ?auto_660454 ?auto_660466 ) ) ( not ( = ?auto_660455 ?auto_660456 ) ) ( not ( = ?auto_660455 ?auto_660457 ) ) ( not ( = ?auto_660455 ?auto_660458 ) ) ( not ( = ?auto_660455 ?auto_660459 ) ) ( not ( = ?auto_660455 ?auto_660460 ) ) ( not ( = ?auto_660455 ?auto_660461 ) ) ( not ( = ?auto_660455 ?auto_660462 ) ) ( not ( = ?auto_660455 ?auto_660463 ) ) ( not ( = ?auto_660455 ?auto_660464 ) ) ( not ( = ?auto_660455 ?auto_660465 ) ) ( not ( = ?auto_660455 ?auto_660466 ) ) ( not ( = ?auto_660456 ?auto_660457 ) ) ( not ( = ?auto_660456 ?auto_660458 ) ) ( not ( = ?auto_660456 ?auto_660459 ) ) ( not ( = ?auto_660456 ?auto_660460 ) ) ( not ( = ?auto_660456 ?auto_660461 ) ) ( not ( = ?auto_660456 ?auto_660462 ) ) ( not ( = ?auto_660456 ?auto_660463 ) ) ( not ( = ?auto_660456 ?auto_660464 ) ) ( not ( = ?auto_660456 ?auto_660465 ) ) ( not ( = ?auto_660456 ?auto_660466 ) ) ( not ( = ?auto_660457 ?auto_660458 ) ) ( not ( = ?auto_660457 ?auto_660459 ) ) ( not ( = ?auto_660457 ?auto_660460 ) ) ( not ( = ?auto_660457 ?auto_660461 ) ) ( not ( = ?auto_660457 ?auto_660462 ) ) ( not ( = ?auto_660457 ?auto_660463 ) ) ( not ( = ?auto_660457 ?auto_660464 ) ) ( not ( = ?auto_660457 ?auto_660465 ) ) ( not ( = ?auto_660457 ?auto_660466 ) ) ( not ( = ?auto_660458 ?auto_660459 ) ) ( not ( = ?auto_660458 ?auto_660460 ) ) ( not ( = ?auto_660458 ?auto_660461 ) ) ( not ( = ?auto_660458 ?auto_660462 ) ) ( not ( = ?auto_660458 ?auto_660463 ) ) ( not ( = ?auto_660458 ?auto_660464 ) ) ( not ( = ?auto_660458 ?auto_660465 ) ) ( not ( = ?auto_660458 ?auto_660466 ) ) ( not ( = ?auto_660459 ?auto_660460 ) ) ( not ( = ?auto_660459 ?auto_660461 ) ) ( not ( = ?auto_660459 ?auto_660462 ) ) ( not ( = ?auto_660459 ?auto_660463 ) ) ( not ( = ?auto_660459 ?auto_660464 ) ) ( not ( = ?auto_660459 ?auto_660465 ) ) ( not ( = ?auto_660459 ?auto_660466 ) ) ( not ( = ?auto_660460 ?auto_660461 ) ) ( not ( = ?auto_660460 ?auto_660462 ) ) ( not ( = ?auto_660460 ?auto_660463 ) ) ( not ( = ?auto_660460 ?auto_660464 ) ) ( not ( = ?auto_660460 ?auto_660465 ) ) ( not ( = ?auto_660460 ?auto_660466 ) ) ( not ( = ?auto_660461 ?auto_660462 ) ) ( not ( = ?auto_660461 ?auto_660463 ) ) ( not ( = ?auto_660461 ?auto_660464 ) ) ( not ( = ?auto_660461 ?auto_660465 ) ) ( not ( = ?auto_660461 ?auto_660466 ) ) ( not ( = ?auto_660462 ?auto_660463 ) ) ( not ( = ?auto_660462 ?auto_660464 ) ) ( not ( = ?auto_660462 ?auto_660465 ) ) ( not ( = ?auto_660462 ?auto_660466 ) ) ( not ( = ?auto_660463 ?auto_660464 ) ) ( not ( = ?auto_660463 ?auto_660465 ) ) ( not ( = ?auto_660463 ?auto_660466 ) ) ( not ( = ?auto_660464 ?auto_660465 ) ) ( not ( = ?auto_660464 ?auto_660466 ) ) ( not ( = ?auto_660465 ?auto_660466 ) ) ( ON ?auto_660464 ?auto_660465 ) ( CLEAR ?auto_660462 ) ( ON ?auto_660463 ?auto_660464 ) ( CLEAR ?auto_660463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_660453 ?auto_660454 ?auto_660455 ?auto_660456 ?auto_660457 ?auto_660458 ?auto_660459 ?auto_660460 ?auto_660461 ?auto_660462 ?auto_660463 )
      ( MAKE-13PILE ?auto_660453 ?auto_660454 ?auto_660455 ?auto_660456 ?auto_660457 ?auto_660458 ?auto_660459 ?auto_660460 ?auto_660461 ?auto_660462 ?auto_660463 ?auto_660464 ?auto_660465 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_660507 - BLOCK
      ?auto_660508 - BLOCK
      ?auto_660509 - BLOCK
      ?auto_660510 - BLOCK
      ?auto_660511 - BLOCK
      ?auto_660512 - BLOCK
      ?auto_660513 - BLOCK
      ?auto_660514 - BLOCK
      ?auto_660515 - BLOCK
      ?auto_660516 - BLOCK
      ?auto_660517 - BLOCK
      ?auto_660518 - BLOCK
      ?auto_660519 - BLOCK
    )
    :vars
    (
      ?auto_660520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660519 ?auto_660520 ) ( ON-TABLE ?auto_660507 ) ( ON ?auto_660508 ?auto_660507 ) ( ON ?auto_660509 ?auto_660508 ) ( ON ?auto_660510 ?auto_660509 ) ( ON ?auto_660511 ?auto_660510 ) ( ON ?auto_660512 ?auto_660511 ) ( ON ?auto_660513 ?auto_660512 ) ( ON ?auto_660514 ?auto_660513 ) ( ON ?auto_660515 ?auto_660514 ) ( not ( = ?auto_660507 ?auto_660508 ) ) ( not ( = ?auto_660507 ?auto_660509 ) ) ( not ( = ?auto_660507 ?auto_660510 ) ) ( not ( = ?auto_660507 ?auto_660511 ) ) ( not ( = ?auto_660507 ?auto_660512 ) ) ( not ( = ?auto_660507 ?auto_660513 ) ) ( not ( = ?auto_660507 ?auto_660514 ) ) ( not ( = ?auto_660507 ?auto_660515 ) ) ( not ( = ?auto_660507 ?auto_660516 ) ) ( not ( = ?auto_660507 ?auto_660517 ) ) ( not ( = ?auto_660507 ?auto_660518 ) ) ( not ( = ?auto_660507 ?auto_660519 ) ) ( not ( = ?auto_660507 ?auto_660520 ) ) ( not ( = ?auto_660508 ?auto_660509 ) ) ( not ( = ?auto_660508 ?auto_660510 ) ) ( not ( = ?auto_660508 ?auto_660511 ) ) ( not ( = ?auto_660508 ?auto_660512 ) ) ( not ( = ?auto_660508 ?auto_660513 ) ) ( not ( = ?auto_660508 ?auto_660514 ) ) ( not ( = ?auto_660508 ?auto_660515 ) ) ( not ( = ?auto_660508 ?auto_660516 ) ) ( not ( = ?auto_660508 ?auto_660517 ) ) ( not ( = ?auto_660508 ?auto_660518 ) ) ( not ( = ?auto_660508 ?auto_660519 ) ) ( not ( = ?auto_660508 ?auto_660520 ) ) ( not ( = ?auto_660509 ?auto_660510 ) ) ( not ( = ?auto_660509 ?auto_660511 ) ) ( not ( = ?auto_660509 ?auto_660512 ) ) ( not ( = ?auto_660509 ?auto_660513 ) ) ( not ( = ?auto_660509 ?auto_660514 ) ) ( not ( = ?auto_660509 ?auto_660515 ) ) ( not ( = ?auto_660509 ?auto_660516 ) ) ( not ( = ?auto_660509 ?auto_660517 ) ) ( not ( = ?auto_660509 ?auto_660518 ) ) ( not ( = ?auto_660509 ?auto_660519 ) ) ( not ( = ?auto_660509 ?auto_660520 ) ) ( not ( = ?auto_660510 ?auto_660511 ) ) ( not ( = ?auto_660510 ?auto_660512 ) ) ( not ( = ?auto_660510 ?auto_660513 ) ) ( not ( = ?auto_660510 ?auto_660514 ) ) ( not ( = ?auto_660510 ?auto_660515 ) ) ( not ( = ?auto_660510 ?auto_660516 ) ) ( not ( = ?auto_660510 ?auto_660517 ) ) ( not ( = ?auto_660510 ?auto_660518 ) ) ( not ( = ?auto_660510 ?auto_660519 ) ) ( not ( = ?auto_660510 ?auto_660520 ) ) ( not ( = ?auto_660511 ?auto_660512 ) ) ( not ( = ?auto_660511 ?auto_660513 ) ) ( not ( = ?auto_660511 ?auto_660514 ) ) ( not ( = ?auto_660511 ?auto_660515 ) ) ( not ( = ?auto_660511 ?auto_660516 ) ) ( not ( = ?auto_660511 ?auto_660517 ) ) ( not ( = ?auto_660511 ?auto_660518 ) ) ( not ( = ?auto_660511 ?auto_660519 ) ) ( not ( = ?auto_660511 ?auto_660520 ) ) ( not ( = ?auto_660512 ?auto_660513 ) ) ( not ( = ?auto_660512 ?auto_660514 ) ) ( not ( = ?auto_660512 ?auto_660515 ) ) ( not ( = ?auto_660512 ?auto_660516 ) ) ( not ( = ?auto_660512 ?auto_660517 ) ) ( not ( = ?auto_660512 ?auto_660518 ) ) ( not ( = ?auto_660512 ?auto_660519 ) ) ( not ( = ?auto_660512 ?auto_660520 ) ) ( not ( = ?auto_660513 ?auto_660514 ) ) ( not ( = ?auto_660513 ?auto_660515 ) ) ( not ( = ?auto_660513 ?auto_660516 ) ) ( not ( = ?auto_660513 ?auto_660517 ) ) ( not ( = ?auto_660513 ?auto_660518 ) ) ( not ( = ?auto_660513 ?auto_660519 ) ) ( not ( = ?auto_660513 ?auto_660520 ) ) ( not ( = ?auto_660514 ?auto_660515 ) ) ( not ( = ?auto_660514 ?auto_660516 ) ) ( not ( = ?auto_660514 ?auto_660517 ) ) ( not ( = ?auto_660514 ?auto_660518 ) ) ( not ( = ?auto_660514 ?auto_660519 ) ) ( not ( = ?auto_660514 ?auto_660520 ) ) ( not ( = ?auto_660515 ?auto_660516 ) ) ( not ( = ?auto_660515 ?auto_660517 ) ) ( not ( = ?auto_660515 ?auto_660518 ) ) ( not ( = ?auto_660515 ?auto_660519 ) ) ( not ( = ?auto_660515 ?auto_660520 ) ) ( not ( = ?auto_660516 ?auto_660517 ) ) ( not ( = ?auto_660516 ?auto_660518 ) ) ( not ( = ?auto_660516 ?auto_660519 ) ) ( not ( = ?auto_660516 ?auto_660520 ) ) ( not ( = ?auto_660517 ?auto_660518 ) ) ( not ( = ?auto_660517 ?auto_660519 ) ) ( not ( = ?auto_660517 ?auto_660520 ) ) ( not ( = ?auto_660518 ?auto_660519 ) ) ( not ( = ?auto_660518 ?auto_660520 ) ) ( not ( = ?auto_660519 ?auto_660520 ) ) ( ON ?auto_660518 ?auto_660519 ) ( ON ?auto_660517 ?auto_660518 ) ( CLEAR ?auto_660515 ) ( ON ?auto_660516 ?auto_660517 ) ( CLEAR ?auto_660516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_660507 ?auto_660508 ?auto_660509 ?auto_660510 ?auto_660511 ?auto_660512 ?auto_660513 ?auto_660514 ?auto_660515 ?auto_660516 )
      ( MAKE-13PILE ?auto_660507 ?auto_660508 ?auto_660509 ?auto_660510 ?auto_660511 ?auto_660512 ?auto_660513 ?auto_660514 ?auto_660515 ?auto_660516 ?auto_660517 ?auto_660518 ?auto_660519 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_660561 - BLOCK
      ?auto_660562 - BLOCK
      ?auto_660563 - BLOCK
      ?auto_660564 - BLOCK
      ?auto_660565 - BLOCK
      ?auto_660566 - BLOCK
      ?auto_660567 - BLOCK
      ?auto_660568 - BLOCK
      ?auto_660569 - BLOCK
      ?auto_660570 - BLOCK
      ?auto_660571 - BLOCK
      ?auto_660572 - BLOCK
      ?auto_660573 - BLOCK
    )
    :vars
    (
      ?auto_660574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660573 ?auto_660574 ) ( ON-TABLE ?auto_660561 ) ( ON ?auto_660562 ?auto_660561 ) ( ON ?auto_660563 ?auto_660562 ) ( ON ?auto_660564 ?auto_660563 ) ( ON ?auto_660565 ?auto_660564 ) ( ON ?auto_660566 ?auto_660565 ) ( ON ?auto_660567 ?auto_660566 ) ( ON ?auto_660568 ?auto_660567 ) ( not ( = ?auto_660561 ?auto_660562 ) ) ( not ( = ?auto_660561 ?auto_660563 ) ) ( not ( = ?auto_660561 ?auto_660564 ) ) ( not ( = ?auto_660561 ?auto_660565 ) ) ( not ( = ?auto_660561 ?auto_660566 ) ) ( not ( = ?auto_660561 ?auto_660567 ) ) ( not ( = ?auto_660561 ?auto_660568 ) ) ( not ( = ?auto_660561 ?auto_660569 ) ) ( not ( = ?auto_660561 ?auto_660570 ) ) ( not ( = ?auto_660561 ?auto_660571 ) ) ( not ( = ?auto_660561 ?auto_660572 ) ) ( not ( = ?auto_660561 ?auto_660573 ) ) ( not ( = ?auto_660561 ?auto_660574 ) ) ( not ( = ?auto_660562 ?auto_660563 ) ) ( not ( = ?auto_660562 ?auto_660564 ) ) ( not ( = ?auto_660562 ?auto_660565 ) ) ( not ( = ?auto_660562 ?auto_660566 ) ) ( not ( = ?auto_660562 ?auto_660567 ) ) ( not ( = ?auto_660562 ?auto_660568 ) ) ( not ( = ?auto_660562 ?auto_660569 ) ) ( not ( = ?auto_660562 ?auto_660570 ) ) ( not ( = ?auto_660562 ?auto_660571 ) ) ( not ( = ?auto_660562 ?auto_660572 ) ) ( not ( = ?auto_660562 ?auto_660573 ) ) ( not ( = ?auto_660562 ?auto_660574 ) ) ( not ( = ?auto_660563 ?auto_660564 ) ) ( not ( = ?auto_660563 ?auto_660565 ) ) ( not ( = ?auto_660563 ?auto_660566 ) ) ( not ( = ?auto_660563 ?auto_660567 ) ) ( not ( = ?auto_660563 ?auto_660568 ) ) ( not ( = ?auto_660563 ?auto_660569 ) ) ( not ( = ?auto_660563 ?auto_660570 ) ) ( not ( = ?auto_660563 ?auto_660571 ) ) ( not ( = ?auto_660563 ?auto_660572 ) ) ( not ( = ?auto_660563 ?auto_660573 ) ) ( not ( = ?auto_660563 ?auto_660574 ) ) ( not ( = ?auto_660564 ?auto_660565 ) ) ( not ( = ?auto_660564 ?auto_660566 ) ) ( not ( = ?auto_660564 ?auto_660567 ) ) ( not ( = ?auto_660564 ?auto_660568 ) ) ( not ( = ?auto_660564 ?auto_660569 ) ) ( not ( = ?auto_660564 ?auto_660570 ) ) ( not ( = ?auto_660564 ?auto_660571 ) ) ( not ( = ?auto_660564 ?auto_660572 ) ) ( not ( = ?auto_660564 ?auto_660573 ) ) ( not ( = ?auto_660564 ?auto_660574 ) ) ( not ( = ?auto_660565 ?auto_660566 ) ) ( not ( = ?auto_660565 ?auto_660567 ) ) ( not ( = ?auto_660565 ?auto_660568 ) ) ( not ( = ?auto_660565 ?auto_660569 ) ) ( not ( = ?auto_660565 ?auto_660570 ) ) ( not ( = ?auto_660565 ?auto_660571 ) ) ( not ( = ?auto_660565 ?auto_660572 ) ) ( not ( = ?auto_660565 ?auto_660573 ) ) ( not ( = ?auto_660565 ?auto_660574 ) ) ( not ( = ?auto_660566 ?auto_660567 ) ) ( not ( = ?auto_660566 ?auto_660568 ) ) ( not ( = ?auto_660566 ?auto_660569 ) ) ( not ( = ?auto_660566 ?auto_660570 ) ) ( not ( = ?auto_660566 ?auto_660571 ) ) ( not ( = ?auto_660566 ?auto_660572 ) ) ( not ( = ?auto_660566 ?auto_660573 ) ) ( not ( = ?auto_660566 ?auto_660574 ) ) ( not ( = ?auto_660567 ?auto_660568 ) ) ( not ( = ?auto_660567 ?auto_660569 ) ) ( not ( = ?auto_660567 ?auto_660570 ) ) ( not ( = ?auto_660567 ?auto_660571 ) ) ( not ( = ?auto_660567 ?auto_660572 ) ) ( not ( = ?auto_660567 ?auto_660573 ) ) ( not ( = ?auto_660567 ?auto_660574 ) ) ( not ( = ?auto_660568 ?auto_660569 ) ) ( not ( = ?auto_660568 ?auto_660570 ) ) ( not ( = ?auto_660568 ?auto_660571 ) ) ( not ( = ?auto_660568 ?auto_660572 ) ) ( not ( = ?auto_660568 ?auto_660573 ) ) ( not ( = ?auto_660568 ?auto_660574 ) ) ( not ( = ?auto_660569 ?auto_660570 ) ) ( not ( = ?auto_660569 ?auto_660571 ) ) ( not ( = ?auto_660569 ?auto_660572 ) ) ( not ( = ?auto_660569 ?auto_660573 ) ) ( not ( = ?auto_660569 ?auto_660574 ) ) ( not ( = ?auto_660570 ?auto_660571 ) ) ( not ( = ?auto_660570 ?auto_660572 ) ) ( not ( = ?auto_660570 ?auto_660573 ) ) ( not ( = ?auto_660570 ?auto_660574 ) ) ( not ( = ?auto_660571 ?auto_660572 ) ) ( not ( = ?auto_660571 ?auto_660573 ) ) ( not ( = ?auto_660571 ?auto_660574 ) ) ( not ( = ?auto_660572 ?auto_660573 ) ) ( not ( = ?auto_660572 ?auto_660574 ) ) ( not ( = ?auto_660573 ?auto_660574 ) ) ( ON ?auto_660572 ?auto_660573 ) ( ON ?auto_660571 ?auto_660572 ) ( ON ?auto_660570 ?auto_660571 ) ( CLEAR ?auto_660568 ) ( ON ?auto_660569 ?auto_660570 ) ( CLEAR ?auto_660569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_660561 ?auto_660562 ?auto_660563 ?auto_660564 ?auto_660565 ?auto_660566 ?auto_660567 ?auto_660568 ?auto_660569 )
      ( MAKE-13PILE ?auto_660561 ?auto_660562 ?auto_660563 ?auto_660564 ?auto_660565 ?auto_660566 ?auto_660567 ?auto_660568 ?auto_660569 ?auto_660570 ?auto_660571 ?auto_660572 ?auto_660573 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_660615 - BLOCK
      ?auto_660616 - BLOCK
      ?auto_660617 - BLOCK
      ?auto_660618 - BLOCK
      ?auto_660619 - BLOCK
      ?auto_660620 - BLOCK
      ?auto_660621 - BLOCK
      ?auto_660622 - BLOCK
      ?auto_660623 - BLOCK
      ?auto_660624 - BLOCK
      ?auto_660625 - BLOCK
      ?auto_660626 - BLOCK
      ?auto_660627 - BLOCK
    )
    :vars
    (
      ?auto_660628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660627 ?auto_660628 ) ( ON-TABLE ?auto_660615 ) ( ON ?auto_660616 ?auto_660615 ) ( ON ?auto_660617 ?auto_660616 ) ( ON ?auto_660618 ?auto_660617 ) ( ON ?auto_660619 ?auto_660618 ) ( ON ?auto_660620 ?auto_660619 ) ( ON ?auto_660621 ?auto_660620 ) ( not ( = ?auto_660615 ?auto_660616 ) ) ( not ( = ?auto_660615 ?auto_660617 ) ) ( not ( = ?auto_660615 ?auto_660618 ) ) ( not ( = ?auto_660615 ?auto_660619 ) ) ( not ( = ?auto_660615 ?auto_660620 ) ) ( not ( = ?auto_660615 ?auto_660621 ) ) ( not ( = ?auto_660615 ?auto_660622 ) ) ( not ( = ?auto_660615 ?auto_660623 ) ) ( not ( = ?auto_660615 ?auto_660624 ) ) ( not ( = ?auto_660615 ?auto_660625 ) ) ( not ( = ?auto_660615 ?auto_660626 ) ) ( not ( = ?auto_660615 ?auto_660627 ) ) ( not ( = ?auto_660615 ?auto_660628 ) ) ( not ( = ?auto_660616 ?auto_660617 ) ) ( not ( = ?auto_660616 ?auto_660618 ) ) ( not ( = ?auto_660616 ?auto_660619 ) ) ( not ( = ?auto_660616 ?auto_660620 ) ) ( not ( = ?auto_660616 ?auto_660621 ) ) ( not ( = ?auto_660616 ?auto_660622 ) ) ( not ( = ?auto_660616 ?auto_660623 ) ) ( not ( = ?auto_660616 ?auto_660624 ) ) ( not ( = ?auto_660616 ?auto_660625 ) ) ( not ( = ?auto_660616 ?auto_660626 ) ) ( not ( = ?auto_660616 ?auto_660627 ) ) ( not ( = ?auto_660616 ?auto_660628 ) ) ( not ( = ?auto_660617 ?auto_660618 ) ) ( not ( = ?auto_660617 ?auto_660619 ) ) ( not ( = ?auto_660617 ?auto_660620 ) ) ( not ( = ?auto_660617 ?auto_660621 ) ) ( not ( = ?auto_660617 ?auto_660622 ) ) ( not ( = ?auto_660617 ?auto_660623 ) ) ( not ( = ?auto_660617 ?auto_660624 ) ) ( not ( = ?auto_660617 ?auto_660625 ) ) ( not ( = ?auto_660617 ?auto_660626 ) ) ( not ( = ?auto_660617 ?auto_660627 ) ) ( not ( = ?auto_660617 ?auto_660628 ) ) ( not ( = ?auto_660618 ?auto_660619 ) ) ( not ( = ?auto_660618 ?auto_660620 ) ) ( not ( = ?auto_660618 ?auto_660621 ) ) ( not ( = ?auto_660618 ?auto_660622 ) ) ( not ( = ?auto_660618 ?auto_660623 ) ) ( not ( = ?auto_660618 ?auto_660624 ) ) ( not ( = ?auto_660618 ?auto_660625 ) ) ( not ( = ?auto_660618 ?auto_660626 ) ) ( not ( = ?auto_660618 ?auto_660627 ) ) ( not ( = ?auto_660618 ?auto_660628 ) ) ( not ( = ?auto_660619 ?auto_660620 ) ) ( not ( = ?auto_660619 ?auto_660621 ) ) ( not ( = ?auto_660619 ?auto_660622 ) ) ( not ( = ?auto_660619 ?auto_660623 ) ) ( not ( = ?auto_660619 ?auto_660624 ) ) ( not ( = ?auto_660619 ?auto_660625 ) ) ( not ( = ?auto_660619 ?auto_660626 ) ) ( not ( = ?auto_660619 ?auto_660627 ) ) ( not ( = ?auto_660619 ?auto_660628 ) ) ( not ( = ?auto_660620 ?auto_660621 ) ) ( not ( = ?auto_660620 ?auto_660622 ) ) ( not ( = ?auto_660620 ?auto_660623 ) ) ( not ( = ?auto_660620 ?auto_660624 ) ) ( not ( = ?auto_660620 ?auto_660625 ) ) ( not ( = ?auto_660620 ?auto_660626 ) ) ( not ( = ?auto_660620 ?auto_660627 ) ) ( not ( = ?auto_660620 ?auto_660628 ) ) ( not ( = ?auto_660621 ?auto_660622 ) ) ( not ( = ?auto_660621 ?auto_660623 ) ) ( not ( = ?auto_660621 ?auto_660624 ) ) ( not ( = ?auto_660621 ?auto_660625 ) ) ( not ( = ?auto_660621 ?auto_660626 ) ) ( not ( = ?auto_660621 ?auto_660627 ) ) ( not ( = ?auto_660621 ?auto_660628 ) ) ( not ( = ?auto_660622 ?auto_660623 ) ) ( not ( = ?auto_660622 ?auto_660624 ) ) ( not ( = ?auto_660622 ?auto_660625 ) ) ( not ( = ?auto_660622 ?auto_660626 ) ) ( not ( = ?auto_660622 ?auto_660627 ) ) ( not ( = ?auto_660622 ?auto_660628 ) ) ( not ( = ?auto_660623 ?auto_660624 ) ) ( not ( = ?auto_660623 ?auto_660625 ) ) ( not ( = ?auto_660623 ?auto_660626 ) ) ( not ( = ?auto_660623 ?auto_660627 ) ) ( not ( = ?auto_660623 ?auto_660628 ) ) ( not ( = ?auto_660624 ?auto_660625 ) ) ( not ( = ?auto_660624 ?auto_660626 ) ) ( not ( = ?auto_660624 ?auto_660627 ) ) ( not ( = ?auto_660624 ?auto_660628 ) ) ( not ( = ?auto_660625 ?auto_660626 ) ) ( not ( = ?auto_660625 ?auto_660627 ) ) ( not ( = ?auto_660625 ?auto_660628 ) ) ( not ( = ?auto_660626 ?auto_660627 ) ) ( not ( = ?auto_660626 ?auto_660628 ) ) ( not ( = ?auto_660627 ?auto_660628 ) ) ( ON ?auto_660626 ?auto_660627 ) ( ON ?auto_660625 ?auto_660626 ) ( ON ?auto_660624 ?auto_660625 ) ( ON ?auto_660623 ?auto_660624 ) ( CLEAR ?auto_660621 ) ( ON ?auto_660622 ?auto_660623 ) ( CLEAR ?auto_660622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_660615 ?auto_660616 ?auto_660617 ?auto_660618 ?auto_660619 ?auto_660620 ?auto_660621 ?auto_660622 )
      ( MAKE-13PILE ?auto_660615 ?auto_660616 ?auto_660617 ?auto_660618 ?auto_660619 ?auto_660620 ?auto_660621 ?auto_660622 ?auto_660623 ?auto_660624 ?auto_660625 ?auto_660626 ?auto_660627 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_660669 - BLOCK
      ?auto_660670 - BLOCK
      ?auto_660671 - BLOCK
      ?auto_660672 - BLOCK
      ?auto_660673 - BLOCK
      ?auto_660674 - BLOCK
      ?auto_660675 - BLOCK
      ?auto_660676 - BLOCK
      ?auto_660677 - BLOCK
      ?auto_660678 - BLOCK
      ?auto_660679 - BLOCK
      ?auto_660680 - BLOCK
      ?auto_660681 - BLOCK
    )
    :vars
    (
      ?auto_660682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660681 ?auto_660682 ) ( ON-TABLE ?auto_660669 ) ( ON ?auto_660670 ?auto_660669 ) ( ON ?auto_660671 ?auto_660670 ) ( ON ?auto_660672 ?auto_660671 ) ( ON ?auto_660673 ?auto_660672 ) ( ON ?auto_660674 ?auto_660673 ) ( not ( = ?auto_660669 ?auto_660670 ) ) ( not ( = ?auto_660669 ?auto_660671 ) ) ( not ( = ?auto_660669 ?auto_660672 ) ) ( not ( = ?auto_660669 ?auto_660673 ) ) ( not ( = ?auto_660669 ?auto_660674 ) ) ( not ( = ?auto_660669 ?auto_660675 ) ) ( not ( = ?auto_660669 ?auto_660676 ) ) ( not ( = ?auto_660669 ?auto_660677 ) ) ( not ( = ?auto_660669 ?auto_660678 ) ) ( not ( = ?auto_660669 ?auto_660679 ) ) ( not ( = ?auto_660669 ?auto_660680 ) ) ( not ( = ?auto_660669 ?auto_660681 ) ) ( not ( = ?auto_660669 ?auto_660682 ) ) ( not ( = ?auto_660670 ?auto_660671 ) ) ( not ( = ?auto_660670 ?auto_660672 ) ) ( not ( = ?auto_660670 ?auto_660673 ) ) ( not ( = ?auto_660670 ?auto_660674 ) ) ( not ( = ?auto_660670 ?auto_660675 ) ) ( not ( = ?auto_660670 ?auto_660676 ) ) ( not ( = ?auto_660670 ?auto_660677 ) ) ( not ( = ?auto_660670 ?auto_660678 ) ) ( not ( = ?auto_660670 ?auto_660679 ) ) ( not ( = ?auto_660670 ?auto_660680 ) ) ( not ( = ?auto_660670 ?auto_660681 ) ) ( not ( = ?auto_660670 ?auto_660682 ) ) ( not ( = ?auto_660671 ?auto_660672 ) ) ( not ( = ?auto_660671 ?auto_660673 ) ) ( not ( = ?auto_660671 ?auto_660674 ) ) ( not ( = ?auto_660671 ?auto_660675 ) ) ( not ( = ?auto_660671 ?auto_660676 ) ) ( not ( = ?auto_660671 ?auto_660677 ) ) ( not ( = ?auto_660671 ?auto_660678 ) ) ( not ( = ?auto_660671 ?auto_660679 ) ) ( not ( = ?auto_660671 ?auto_660680 ) ) ( not ( = ?auto_660671 ?auto_660681 ) ) ( not ( = ?auto_660671 ?auto_660682 ) ) ( not ( = ?auto_660672 ?auto_660673 ) ) ( not ( = ?auto_660672 ?auto_660674 ) ) ( not ( = ?auto_660672 ?auto_660675 ) ) ( not ( = ?auto_660672 ?auto_660676 ) ) ( not ( = ?auto_660672 ?auto_660677 ) ) ( not ( = ?auto_660672 ?auto_660678 ) ) ( not ( = ?auto_660672 ?auto_660679 ) ) ( not ( = ?auto_660672 ?auto_660680 ) ) ( not ( = ?auto_660672 ?auto_660681 ) ) ( not ( = ?auto_660672 ?auto_660682 ) ) ( not ( = ?auto_660673 ?auto_660674 ) ) ( not ( = ?auto_660673 ?auto_660675 ) ) ( not ( = ?auto_660673 ?auto_660676 ) ) ( not ( = ?auto_660673 ?auto_660677 ) ) ( not ( = ?auto_660673 ?auto_660678 ) ) ( not ( = ?auto_660673 ?auto_660679 ) ) ( not ( = ?auto_660673 ?auto_660680 ) ) ( not ( = ?auto_660673 ?auto_660681 ) ) ( not ( = ?auto_660673 ?auto_660682 ) ) ( not ( = ?auto_660674 ?auto_660675 ) ) ( not ( = ?auto_660674 ?auto_660676 ) ) ( not ( = ?auto_660674 ?auto_660677 ) ) ( not ( = ?auto_660674 ?auto_660678 ) ) ( not ( = ?auto_660674 ?auto_660679 ) ) ( not ( = ?auto_660674 ?auto_660680 ) ) ( not ( = ?auto_660674 ?auto_660681 ) ) ( not ( = ?auto_660674 ?auto_660682 ) ) ( not ( = ?auto_660675 ?auto_660676 ) ) ( not ( = ?auto_660675 ?auto_660677 ) ) ( not ( = ?auto_660675 ?auto_660678 ) ) ( not ( = ?auto_660675 ?auto_660679 ) ) ( not ( = ?auto_660675 ?auto_660680 ) ) ( not ( = ?auto_660675 ?auto_660681 ) ) ( not ( = ?auto_660675 ?auto_660682 ) ) ( not ( = ?auto_660676 ?auto_660677 ) ) ( not ( = ?auto_660676 ?auto_660678 ) ) ( not ( = ?auto_660676 ?auto_660679 ) ) ( not ( = ?auto_660676 ?auto_660680 ) ) ( not ( = ?auto_660676 ?auto_660681 ) ) ( not ( = ?auto_660676 ?auto_660682 ) ) ( not ( = ?auto_660677 ?auto_660678 ) ) ( not ( = ?auto_660677 ?auto_660679 ) ) ( not ( = ?auto_660677 ?auto_660680 ) ) ( not ( = ?auto_660677 ?auto_660681 ) ) ( not ( = ?auto_660677 ?auto_660682 ) ) ( not ( = ?auto_660678 ?auto_660679 ) ) ( not ( = ?auto_660678 ?auto_660680 ) ) ( not ( = ?auto_660678 ?auto_660681 ) ) ( not ( = ?auto_660678 ?auto_660682 ) ) ( not ( = ?auto_660679 ?auto_660680 ) ) ( not ( = ?auto_660679 ?auto_660681 ) ) ( not ( = ?auto_660679 ?auto_660682 ) ) ( not ( = ?auto_660680 ?auto_660681 ) ) ( not ( = ?auto_660680 ?auto_660682 ) ) ( not ( = ?auto_660681 ?auto_660682 ) ) ( ON ?auto_660680 ?auto_660681 ) ( ON ?auto_660679 ?auto_660680 ) ( ON ?auto_660678 ?auto_660679 ) ( ON ?auto_660677 ?auto_660678 ) ( ON ?auto_660676 ?auto_660677 ) ( CLEAR ?auto_660674 ) ( ON ?auto_660675 ?auto_660676 ) ( CLEAR ?auto_660675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_660669 ?auto_660670 ?auto_660671 ?auto_660672 ?auto_660673 ?auto_660674 ?auto_660675 )
      ( MAKE-13PILE ?auto_660669 ?auto_660670 ?auto_660671 ?auto_660672 ?auto_660673 ?auto_660674 ?auto_660675 ?auto_660676 ?auto_660677 ?auto_660678 ?auto_660679 ?auto_660680 ?auto_660681 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_660723 - BLOCK
      ?auto_660724 - BLOCK
      ?auto_660725 - BLOCK
      ?auto_660726 - BLOCK
      ?auto_660727 - BLOCK
      ?auto_660728 - BLOCK
      ?auto_660729 - BLOCK
      ?auto_660730 - BLOCK
      ?auto_660731 - BLOCK
      ?auto_660732 - BLOCK
      ?auto_660733 - BLOCK
      ?auto_660734 - BLOCK
      ?auto_660735 - BLOCK
    )
    :vars
    (
      ?auto_660736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660735 ?auto_660736 ) ( ON-TABLE ?auto_660723 ) ( ON ?auto_660724 ?auto_660723 ) ( ON ?auto_660725 ?auto_660724 ) ( ON ?auto_660726 ?auto_660725 ) ( ON ?auto_660727 ?auto_660726 ) ( not ( = ?auto_660723 ?auto_660724 ) ) ( not ( = ?auto_660723 ?auto_660725 ) ) ( not ( = ?auto_660723 ?auto_660726 ) ) ( not ( = ?auto_660723 ?auto_660727 ) ) ( not ( = ?auto_660723 ?auto_660728 ) ) ( not ( = ?auto_660723 ?auto_660729 ) ) ( not ( = ?auto_660723 ?auto_660730 ) ) ( not ( = ?auto_660723 ?auto_660731 ) ) ( not ( = ?auto_660723 ?auto_660732 ) ) ( not ( = ?auto_660723 ?auto_660733 ) ) ( not ( = ?auto_660723 ?auto_660734 ) ) ( not ( = ?auto_660723 ?auto_660735 ) ) ( not ( = ?auto_660723 ?auto_660736 ) ) ( not ( = ?auto_660724 ?auto_660725 ) ) ( not ( = ?auto_660724 ?auto_660726 ) ) ( not ( = ?auto_660724 ?auto_660727 ) ) ( not ( = ?auto_660724 ?auto_660728 ) ) ( not ( = ?auto_660724 ?auto_660729 ) ) ( not ( = ?auto_660724 ?auto_660730 ) ) ( not ( = ?auto_660724 ?auto_660731 ) ) ( not ( = ?auto_660724 ?auto_660732 ) ) ( not ( = ?auto_660724 ?auto_660733 ) ) ( not ( = ?auto_660724 ?auto_660734 ) ) ( not ( = ?auto_660724 ?auto_660735 ) ) ( not ( = ?auto_660724 ?auto_660736 ) ) ( not ( = ?auto_660725 ?auto_660726 ) ) ( not ( = ?auto_660725 ?auto_660727 ) ) ( not ( = ?auto_660725 ?auto_660728 ) ) ( not ( = ?auto_660725 ?auto_660729 ) ) ( not ( = ?auto_660725 ?auto_660730 ) ) ( not ( = ?auto_660725 ?auto_660731 ) ) ( not ( = ?auto_660725 ?auto_660732 ) ) ( not ( = ?auto_660725 ?auto_660733 ) ) ( not ( = ?auto_660725 ?auto_660734 ) ) ( not ( = ?auto_660725 ?auto_660735 ) ) ( not ( = ?auto_660725 ?auto_660736 ) ) ( not ( = ?auto_660726 ?auto_660727 ) ) ( not ( = ?auto_660726 ?auto_660728 ) ) ( not ( = ?auto_660726 ?auto_660729 ) ) ( not ( = ?auto_660726 ?auto_660730 ) ) ( not ( = ?auto_660726 ?auto_660731 ) ) ( not ( = ?auto_660726 ?auto_660732 ) ) ( not ( = ?auto_660726 ?auto_660733 ) ) ( not ( = ?auto_660726 ?auto_660734 ) ) ( not ( = ?auto_660726 ?auto_660735 ) ) ( not ( = ?auto_660726 ?auto_660736 ) ) ( not ( = ?auto_660727 ?auto_660728 ) ) ( not ( = ?auto_660727 ?auto_660729 ) ) ( not ( = ?auto_660727 ?auto_660730 ) ) ( not ( = ?auto_660727 ?auto_660731 ) ) ( not ( = ?auto_660727 ?auto_660732 ) ) ( not ( = ?auto_660727 ?auto_660733 ) ) ( not ( = ?auto_660727 ?auto_660734 ) ) ( not ( = ?auto_660727 ?auto_660735 ) ) ( not ( = ?auto_660727 ?auto_660736 ) ) ( not ( = ?auto_660728 ?auto_660729 ) ) ( not ( = ?auto_660728 ?auto_660730 ) ) ( not ( = ?auto_660728 ?auto_660731 ) ) ( not ( = ?auto_660728 ?auto_660732 ) ) ( not ( = ?auto_660728 ?auto_660733 ) ) ( not ( = ?auto_660728 ?auto_660734 ) ) ( not ( = ?auto_660728 ?auto_660735 ) ) ( not ( = ?auto_660728 ?auto_660736 ) ) ( not ( = ?auto_660729 ?auto_660730 ) ) ( not ( = ?auto_660729 ?auto_660731 ) ) ( not ( = ?auto_660729 ?auto_660732 ) ) ( not ( = ?auto_660729 ?auto_660733 ) ) ( not ( = ?auto_660729 ?auto_660734 ) ) ( not ( = ?auto_660729 ?auto_660735 ) ) ( not ( = ?auto_660729 ?auto_660736 ) ) ( not ( = ?auto_660730 ?auto_660731 ) ) ( not ( = ?auto_660730 ?auto_660732 ) ) ( not ( = ?auto_660730 ?auto_660733 ) ) ( not ( = ?auto_660730 ?auto_660734 ) ) ( not ( = ?auto_660730 ?auto_660735 ) ) ( not ( = ?auto_660730 ?auto_660736 ) ) ( not ( = ?auto_660731 ?auto_660732 ) ) ( not ( = ?auto_660731 ?auto_660733 ) ) ( not ( = ?auto_660731 ?auto_660734 ) ) ( not ( = ?auto_660731 ?auto_660735 ) ) ( not ( = ?auto_660731 ?auto_660736 ) ) ( not ( = ?auto_660732 ?auto_660733 ) ) ( not ( = ?auto_660732 ?auto_660734 ) ) ( not ( = ?auto_660732 ?auto_660735 ) ) ( not ( = ?auto_660732 ?auto_660736 ) ) ( not ( = ?auto_660733 ?auto_660734 ) ) ( not ( = ?auto_660733 ?auto_660735 ) ) ( not ( = ?auto_660733 ?auto_660736 ) ) ( not ( = ?auto_660734 ?auto_660735 ) ) ( not ( = ?auto_660734 ?auto_660736 ) ) ( not ( = ?auto_660735 ?auto_660736 ) ) ( ON ?auto_660734 ?auto_660735 ) ( ON ?auto_660733 ?auto_660734 ) ( ON ?auto_660732 ?auto_660733 ) ( ON ?auto_660731 ?auto_660732 ) ( ON ?auto_660730 ?auto_660731 ) ( ON ?auto_660729 ?auto_660730 ) ( CLEAR ?auto_660727 ) ( ON ?auto_660728 ?auto_660729 ) ( CLEAR ?auto_660728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_660723 ?auto_660724 ?auto_660725 ?auto_660726 ?auto_660727 ?auto_660728 )
      ( MAKE-13PILE ?auto_660723 ?auto_660724 ?auto_660725 ?auto_660726 ?auto_660727 ?auto_660728 ?auto_660729 ?auto_660730 ?auto_660731 ?auto_660732 ?auto_660733 ?auto_660734 ?auto_660735 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_660777 - BLOCK
      ?auto_660778 - BLOCK
      ?auto_660779 - BLOCK
      ?auto_660780 - BLOCK
      ?auto_660781 - BLOCK
      ?auto_660782 - BLOCK
      ?auto_660783 - BLOCK
      ?auto_660784 - BLOCK
      ?auto_660785 - BLOCK
      ?auto_660786 - BLOCK
      ?auto_660787 - BLOCK
      ?auto_660788 - BLOCK
      ?auto_660789 - BLOCK
    )
    :vars
    (
      ?auto_660790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660789 ?auto_660790 ) ( ON-TABLE ?auto_660777 ) ( ON ?auto_660778 ?auto_660777 ) ( ON ?auto_660779 ?auto_660778 ) ( ON ?auto_660780 ?auto_660779 ) ( not ( = ?auto_660777 ?auto_660778 ) ) ( not ( = ?auto_660777 ?auto_660779 ) ) ( not ( = ?auto_660777 ?auto_660780 ) ) ( not ( = ?auto_660777 ?auto_660781 ) ) ( not ( = ?auto_660777 ?auto_660782 ) ) ( not ( = ?auto_660777 ?auto_660783 ) ) ( not ( = ?auto_660777 ?auto_660784 ) ) ( not ( = ?auto_660777 ?auto_660785 ) ) ( not ( = ?auto_660777 ?auto_660786 ) ) ( not ( = ?auto_660777 ?auto_660787 ) ) ( not ( = ?auto_660777 ?auto_660788 ) ) ( not ( = ?auto_660777 ?auto_660789 ) ) ( not ( = ?auto_660777 ?auto_660790 ) ) ( not ( = ?auto_660778 ?auto_660779 ) ) ( not ( = ?auto_660778 ?auto_660780 ) ) ( not ( = ?auto_660778 ?auto_660781 ) ) ( not ( = ?auto_660778 ?auto_660782 ) ) ( not ( = ?auto_660778 ?auto_660783 ) ) ( not ( = ?auto_660778 ?auto_660784 ) ) ( not ( = ?auto_660778 ?auto_660785 ) ) ( not ( = ?auto_660778 ?auto_660786 ) ) ( not ( = ?auto_660778 ?auto_660787 ) ) ( not ( = ?auto_660778 ?auto_660788 ) ) ( not ( = ?auto_660778 ?auto_660789 ) ) ( not ( = ?auto_660778 ?auto_660790 ) ) ( not ( = ?auto_660779 ?auto_660780 ) ) ( not ( = ?auto_660779 ?auto_660781 ) ) ( not ( = ?auto_660779 ?auto_660782 ) ) ( not ( = ?auto_660779 ?auto_660783 ) ) ( not ( = ?auto_660779 ?auto_660784 ) ) ( not ( = ?auto_660779 ?auto_660785 ) ) ( not ( = ?auto_660779 ?auto_660786 ) ) ( not ( = ?auto_660779 ?auto_660787 ) ) ( not ( = ?auto_660779 ?auto_660788 ) ) ( not ( = ?auto_660779 ?auto_660789 ) ) ( not ( = ?auto_660779 ?auto_660790 ) ) ( not ( = ?auto_660780 ?auto_660781 ) ) ( not ( = ?auto_660780 ?auto_660782 ) ) ( not ( = ?auto_660780 ?auto_660783 ) ) ( not ( = ?auto_660780 ?auto_660784 ) ) ( not ( = ?auto_660780 ?auto_660785 ) ) ( not ( = ?auto_660780 ?auto_660786 ) ) ( not ( = ?auto_660780 ?auto_660787 ) ) ( not ( = ?auto_660780 ?auto_660788 ) ) ( not ( = ?auto_660780 ?auto_660789 ) ) ( not ( = ?auto_660780 ?auto_660790 ) ) ( not ( = ?auto_660781 ?auto_660782 ) ) ( not ( = ?auto_660781 ?auto_660783 ) ) ( not ( = ?auto_660781 ?auto_660784 ) ) ( not ( = ?auto_660781 ?auto_660785 ) ) ( not ( = ?auto_660781 ?auto_660786 ) ) ( not ( = ?auto_660781 ?auto_660787 ) ) ( not ( = ?auto_660781 ?auto_660788 ) ) ( not ( = ?auto_660781 ?auto_660789 ) ) ( not ( = ?auto_660781 ?auto_660790 ) ) ( not ( = ?auto_660782 ?auto_660783 ) ) ( not ( = ?auto_660782 ?auto_660784 ) ) ( not ( = ?auto_660782 ?auto_660785 ) ) ( not ( = ?auto_660782 ?auto_660786 ) ) ( not ( = ?auto_660782 ?auto_660787 ) ) ( not ( = ?auto_660782 ?auto_660788 ) ) ( not ( = ?auto_660782 ?auto_660789 ) ) ( not ( = ?auto_660782 ?auto_660790 ) ) ( not ( = ?auto_660783 ?auto_660784 ) ) ( not ( = ?auto_660783 ?auto_660785 ) ) ( not ( = ?auto_660783 ?auto_660786 ) ) ( not ( = ?auto_660783 ?auto_660787 ) ) ( not ( = ?auto_660783 ?auto_660788 ) ) ( not ( = ?auto_660783 ?auto_660789 ) ) ( not ( = ?auto_660783 ?auto_660790 ) ) ( not ( = ?auto_660784 ?auto_660785 ) ) ( not ( = ?auto_660784 ?auto_660786 ) ) ( not ( = ?auto_660784 ?auto_660787 ) ) ( not ( = ?auto_660784 ?auto_660788 ) ) ( not ( = ?auto_660784 ?auto_660789 ) ) ( not ( = ?auto_660784 ?auto_660790 ) ) ( not ( = ?auto_660785 ?auto_660786 ) ) ( not ( = ?auto_660785 ?auto_660787 ) ) ( not ( = ?auto_660785 ?auto_660788 ) ) ( not ( = ?auto_660785 ?auto_660789 ) ) ( not ( = ?auto_660785 ?auto_660790 ) ) ( not ( = ?auto_660786 ?auto_660787 ) ) ( not ( = ?auto_660786 ?auto_660788 ) ) ( not ( = ?auto_660786 ?auto_660789 ) ) ( not ( = ?auto_660786 ?auto_660790 ) ) ( not ( = ?auto_660787 ?auto_660788 ) ) ( not ( = ?auto_660787 ?auto_660789 ) ) ( not ( = ?auto_660787 ?auto_660790 ) ) ( not ( = ?auto_660788 ?auto_660789 ) ) ( not ( = ?auto_660788 ?auto_660790 ) ) ( not ( = ?auto_660789 ?auto_660790 ) ) ( ON ?auto_660788 ?auto_660789 ) ( ON ?auto_660787 ?auto_660788 ) ( ON ?auto_660786 ?auto_660787 ) ( ON ?auto_660785 ?auto_660786 ) ( ON ?auto_660784 ?auto_660785 ) ( ON ?auto_660783 ?auto_660784 ) ( ON ?auto_660782 ?auto_660783 ) ( CLEAR ?auto_660780 ) ( ON ?auto_660781 ?auto_660782 ) ( CLEAR ?auto_660781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_660777 ?auto_660778 ?auto_660779 ?auto_660780 ?auto_660781 )
      ( MAKE-13PILE ?auto_660777 ?auto_660778 ?auto_660779 ?auto_660780 ?auto_660781 ?auto_660782 ?auto_660783 ?auto_660784 ?auto_660785 ?auto_660786 ?auto_660787 ?auto_660788 ?auto_660789 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_660831 - BLOCK
      ?auto_660832 - BLOCK
      ?auto_660833 - BLOCK
      ?auto_660834 - BLOCK
      ?auto_660835 - BLOCK
      ?auto_660836 - BLOCK
      ?auto_660837 - BLOCK
      ?auto_660838 - BLOCK
      ?auto_660839 - BLOCK
      ?auto_660840 - BLOCK
      ?auto_660841 - BLOCK
      ?auto_660842 - BLOCK
      ?auto_660843 - BLOCK
    )
    :vars
    (
      ?auto_660844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660843 ?auto_660844 ) ( ON-TABLE ?auto_660831 ) ( ON ?auto_660832 ?auto_660831 ) ( ON ?auto_660833 ?auto_660832 ) ( not ( = ?auto_660831 ?auto_660832 ) ) ( not ( = ?auto_660831 ?auto_660833 ) ) ( not ( = ?auto_660831 ?auto_660834 ) ) ( not ( = ?auto_660831 ?auto_660835 ) ) ( not ( = ?auto_660831 ?auto_660836 ) ) ( not ( = ?auto_660831 ?auto_660837 ) ) ( not ( = ?auto_660831 ?auto_660838 ) ) ( not ( = ?auto_660831 ?auto_660839 ) ) ( not ( = ?auto_660831 ?auto_660840 ) ) ( not ( = ?auto_660831 ?auto_660841 ) ) ( not ( = ?auto_660831 ?auto_660842 ) ) ( not ( = ?auto_660831 ?auto_660843 ) ) ( not ( = ?auto_660831 ?auto_660844 ) ) ( not ( = ?auto_660832 ?auto_660833 ) ) ( not ( = ?auto_660832 ?auto_660834 ) ) ( not ( = ?auto_660832 ?auto_660835 ) ) ( not ( = ?auto_660832 ?auto_660836 ) ) ( not ( = ?auto_660832 ?auto_660837 ) ) ( not ( = ?auto_660832 ?auto_660838 ) ) ( not ( = ?auto_660832 ?auto_660839 ) ) ( not ( = ?auto_660832 ?auto_660840 ) ) ( not ( = ?auto_660832 ?auto_660841 ) ) ( not ( = ?auto_660832 ?auto_660842 ) ) ( not ( = ?auto_660832 ?auto_660843 ) ) ( not ( = ?auto_660832 ?auto_660844 ) ) ( not ( = ?auto_660833 ?auto_660834 ) ) ( not ( = ?auto_660833 ?auto_660835 ) ) ( not ( = ?auto_660833 ?auto_660836 ) ) ( not ( = ?auto_660833 ?auto_660837 ) ) ( not ( = ?auto_660833 ?auto_660838 ) ) ( not ( = ?auto_660833 ?auto_660839 ) ) ( not ( = ?auto_660833 ?auto_660840 ) ) ( not ( = ?auto_660833 ?auto_660841 ) ) ( not ( = ?auto_660833 ?auto_660842 ) ) ( not ( = ?auto_660833 ?auto_660843 ) ) ( not ( = ?auto_660833 ?auto_660844 ) ) ( not ( = ?auto_660834 ?auto_660835 ) ) ( not ( = ?auto_660834 ?auto_660836 ) ) ( not ( = ?auto_660834 ?auto_660837 ) ) ( not ( = ?auto_660834 ?auto_660838 ) ) ( not ( = ?auto_660834 ?auto_660839 ) ) ( not ( = ?auto_660834 ?auto_660840 ) ) ( not ( = ?auto_660834 ?auto_660841 ) ) ( not ( = ?auto_660834 ?auto_660842 ) ) ( not ( = ?auto_660834 ?auto_660843 ) ) ( not ( = ?auto_660834 ?auto_660844 ) ) ( not ( = ?auto_660835 ?auto_660836 ) ) ( not ( = ?auto_660835 ?auto_660837 ) ) ( not ( = ?auto_660835 ?auto_660838 ) ) ( not ( = ?auto_660835 ?auto_660839 ) ) ( not ( = ?auto_660835 ?auto_660840 ) ) ( not ( = ?auto_660835 ?auto_660841 ) ) ( not ( = ?auto_660835 ?auto_660842 ) ) ( not ( = ?auto_660835 ?auto_660843 ) ) ( not ( = ?auto_660835 ?auto_660844 ) ) ( not ( = ?auto_660836 ?auto_660837 ) ) ( not ( = ?auto_660836 ?auto_660838 ) ) ( not ( = ?auto_660836 ?auto_660839 ) ) ( not ( = ?auto_660836 ?auto_660840 ) ) ( not ( = ?auto_660836 ?auto_660841 ) ) ( not ( = ?auto_660836 ?auto_660842 ) ) ( not ( = ?auto_660836 ?auto_660843 ) ) ( not ( = ?auto_660836 ?auto_660844 ) ) ( not ( = ?auto_660837 ?auto_660838 ) ) ( not ( = ?auto_660837 ?auto_660839 ) ) ( not ( = ?auto_660837 ?auto_660840 ) ) ( not ( = ?auto_660837 ?auto_660841 ) ) ( not ( = ?auto_660837 ?auto_660842 ) ) ( not ( = ?auto_660837 ?auto_660843 ) ) ( not ( = ?auto_660837 ?auto_660844 ) ) ( not ( = ?auto_660838 ?auto_660839 ) ) ( not ( = ?auto_660838 ?auto_660840 ) ) ( not ( = ?auto_660838 ?auto_660841 ) ) ( not ( = ?auto_660838 ?auto_660842 ) ) ( not ( = ?auto_660838 ?auto_660843 ) ) ( not ( = ?auto_660838 ?auto_660844 ) ) ( not ( = ?auto_660839 ?auto_660840 ) ) ( not ( = ?auto_660839 ?auto_660841 ) ) ( not ( = ?auto_660839 ?auto_660842 ) ) ( not ( = ?auto_660839 ?auto_660843 ) ) ( not ( = ?auto_660839 ?auto_660844 ) ) ( not ( = ?auto_660840 ?auto_660841 ) ) ( not ( = ?auto_660840 ?auto_660842 ) ) ( not ( = ?auto_660840 ?auto_660843 ) ) ( not ( = ?auto_660840 ?auto_660844 ) ) ( not ( = ?auto_660841 ?auto_660842 ) ) ( not ( = ?auto_660841 ?auto_660843 ) ) ( not ( = ?auto_660841 ?auto_660844 ) ) ( not ( = ?auto_660842 ?auto_660843 ) ) ( not ( = ?auto_660842 ?auto_660844 ) ) ( not ( = ?auto_660843 ?auto_660844 ) ) ( ON ?auto_660842 ?auto_660843 ) ( ON ?auto_660841 ?auto_660842 ) ( ON ?auto_660840 ?auto_660841 ) ( ON ?auto_660839 ?auto_660840 ) ( ON ?auto_660838 ?auto_660839 ) ( ON ?auto_660837 ?auto_660838 ) ( ON ?auto_660836 ?auto_660837 ) ( ON ?auto_660835 ?auto_660836 ) ( CLEAR ?auto_660833 ) ( ON ?auto_660834 ?auto_660835 ) ( CLEAR ?auto_660834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_660831 ?auto_660832 ?auto_660833 ?auto_660834 )
      ( MAKE-13PILE ?auto_660831 ?auto_660832 ?auto_660833 ?auto_660834 ?auto_660835 ?auto_660836 ?auto_660837 ?auto_660838 ?auto_660839 ?auto_660840 ?auto_660841 ?auto_660842 ?auto_660843 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_660885 - BLOCK
      ?auto_660886 - BLOCK
      ?auto_660887 - BLOCK
      ?auto_660888 - BLOCK
      ?auto_660889 - BLOCK
      ?auto_660890 - BLOCK
      ?auto_660891 - BLOCK
      ?auto_660892 - BLOCK
      ?auto_660893 - BLOCK
      ?auto_660894 - BLOCK
      ?auto_660895 - BLOCK
      ?auto_660896 - BLOCK
      ?auto_660897 - BLOCK
    )
    :vars
    (
      ?auto_660898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660897 ?auto_660898 ) ( ON-TABLE ?auto_660885 ) ( ON ?auto_660886 ?auto_660885 ) ( not ( = ?auto_660885 ?auto_660886 ) ) ( not ( = ?auto_660885 ?auto_660887 ) ) ( not ( = ?auto_660885 ?auto_660888 ) ) ( not ( = ?auto_660885 ?auto_660889 ) ) ( not ( = ?auto_660885 ?auto_660890 ) ) ( not ( = ?auto_660885 ?auto_660891 ) ) ( not ( = ?auto_660885 ?auto_660892 ) ) ( not ( = ?auto_660885 ?auto_660893 ) ) ( not ( = ?auto_660885 ?auto_660894 ) ) ( not ( = ?auto_660885 ?auto_660895 ) ) ( not ( = ?auto_660885 ?auto_660896 ) ) ( not ( = ?auto_660885 ?auto_660897 ) ) ( not ( = ?auto_660885 ?auto_660898 ) ) ( not ( = ?auto_660886 ?auto_660887 ) ) ( not ( = ?auto_660886 ?auto_660888 ) ) ( not ( = ?auto_660886 ?auto_660889 ) ) ( not ( = ?auto_660886 ?auto_660890 ) ) ( not ( = ?auto_660886 ?auto_660891 ) ) ( not ( = ?auto_660886 ?auto_660892 ) ) ( not ( = ?auto_660886 ?auto_660893 ) ) ( not ( = ?auto_660886 ?auto_660894 ) ) ( not ( = ?auto_660886 ?auto_660895 ) ) ( not ( = ?auto_660886 ?auto_660896 ) ) ( not ( = ?auto_660886 ?auto_660897 ) ) ( not ( = ?auto_660886 ?auto_660898 ) ) ( not ( = ?auto_660887 ?auto_660888 ) ) ( not ( = ?auto_660887 ?auto_660889 ) ) ( not ( = ?auto_660887 ?auto_660890 ) ) ( not ( = ?auto_660887 ?auto_660891 ) ) ( not ( = ?auto_660887 ?auto_660892 ) ) ( not ( = ?auto_660887 ?auto_660893 ) ) ( not ( = ?auto_660887 ?auto_660894 ) ) ( not ( = ?auto_660887 ?auto_660895 ) ) ( not ( = ?auto_660887 ?auto_660896 ) ) ( not ( = ?auto_660887 ?auto_660897 ) ) ( not ( = ?auto_660887 ?auto_660898 ) ) ( not ( = ?auto_660888 ?auto_660889 ) ) ( not ( = ?auto_660888 ?auto_660890 ) ) ( not ( = ?auto_660888 ?auto_660891 ) ) ( not ( = ?auto_660888 ?auto_660892 ) ) ( not ( = ?auto_660888 ?auto_660893 ) ) ( not ( = ?auto_660888 ?auto_660894 ) ) ( not ( = ?auto_660888 ?auto_660895 ) ) ( not ( = ?auto_660888 ?auto_660896 ) ) ( not ( = ?auto_660888 ?auto_660897 ) ) ( not ( = ?auto_660888 ?auto_660898 ) ) ( not ( = ?auto_660889 ?auto_660890 ) ) ( not ( = ?auto_660889 ?auto_660891 ) ) ( not ( = ?auto_660889 ?auto_660892 ) ) ( not ( = ?auto_660889 ?auto_660893 ) ) ( not ( = ?auto_660889 ?auto_660894 ) ) ( not ( = ?auto_660889 ?auto_660895 ) ) ( not ( = ?auto_660889 ?auto_660896 ) ) ( not ( = ?auto_660889 ?auto_660897 ) ) ( not ( = ?auto_660889 ?auto_660898 ) ) ( not ( = ?auto_660890 ?auto_660891 ) ) ( not ( = ?auto_660890 ?auto_660892 ) ) ( not ( = ?auto_660890 ?auto_660893 ) ) ( not ( = ?auto_660890 ?auto_660894 ) ) ( not ( = ?auto_660890 ?auto_660895 ) ) ( not ( = ?auto_660890 ?auto_660896 ) ) ( not ( = ?auto_660890 ?auto_660897 ) ) ( not ( = ?auto_660890 ?auto_660898 ) ) ( not ( = ?auto_660891 ?auto_660892 ) ) ( not ( = ?auto_660891 ?auto_660893 ) ) ( not ( = ?auto_660891 ?auto_660894 ) ) ( not ( = ?auto_660891 ?auto_660895 ) ) ( not ( = ?auto_660891 ?auto_660896 ) ) ( not ( = ?auto_660891 ?auto_660897 ) ) ( not ( = ?auto_660891 ?auto_660898 ) ) ( not ( = ?auto_660892 ?auto_660893 ) ) ( not ( = ?auto_660892 ?auto_660894 ) ) ( not ( = ?auto_660892 ?auto_660895 ) ) ( not ( = ?auto_660892 ?auto_660896 ) ) ( not ( = ?auto_660892 ?auto_660897 ) ) ( not ( = ?auto_660892 ?auto_660898 ) ) ( not ( = ?auto_660893 ?auto_660894 ) ) ( not ( = ?auto_660893 ?auto_660895 ) ) ( not ( = ?auto_660893 ?auto_660896 ) ) ( not ( = ?auto_660893 ?auto_660897 ) ) ( not ( = ?auto_660893 ?auto_660898 ) ) ( not ( = ?auto_660894 ?auto_660895 ) ) ( not ( = ?auto_660894 ?auto_660896 ) ) ( not ( = ?auto_660894 ?auto_660897 ) ) ( not ( = ?auto_660894 ?auto_660898 ) ) ( not ( = ?auto_660895 ?auto_660896 ) ) ( not ( = ?auto_660895 ?auto_660897 ) ) ( not ( = ?auto_660895 ?auto_660898 ) ) ( not ( = ?auto_660896 ?auto_660897 ) ) ( not ( = ?auto_660896 ?auto_660898 ) ) ( not ( = ?auto_660897 ?auto_660898 ) ) ( ON ?auto_660896 ?auto_660897 ) ( ON ?auto_660895 ?auto_660896 ) ( ON ?auto_660894 ?auto_660895 ) ( ON ?auto_660893 ?auto_660894 ) ( ON ?auto_660892 ?auto_660893 ) ( ON ?auto_660891 ?auto_660892 ) ( ON ?auto_660890 ?auto_660891 ) ( ON ?auto_660889 ?auto_660890 ) ( ON ?auto_660888 ?auto_660889 ) ( CLEAR ?auto_660886 ) ( ON ?auto_660887 ?auto_660888 ) ( CLEAR ?auto_660887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_660885 ?auto_660886 ?auto_660887 )
      ( MAKE-13PILE ?auto_660885 ?auto_660886 ?auto_660887 ?auto_660888 ?auto_660889 ?auto_660890 ?auto_660891 ?auto_660892 ?auto_660893 ?auto_660894 ?auto_660895 ?auto_660896 ?auto_660897 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_660939 - BLOCK
      ?auto_660940 - BLOCK
      ?auto_660941 - BLOCK
      ?auto_660942 - BLOCK
      ?auto_660943 - BLOCK
      ?auto_660944 - BLOCK
      ?auto_660945 - BLOCK
      ?auto_660946 - BLOCK
      ?auto_660947 - BLOCK
      ?auto_660948 - BLOCK
      ?auto_660949 - BLOCK
      ?auto_660950 - BLOCK
      ?auto_660951 - BLOCK
    )
    :vars
    (
      ?auto_660952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_660951 ?auto_660952 ) ( ON-TABLE ?auto_660939 ) ( not ( = ?auto_660939 ?auto_660940 ) ) ( not ( = ?auto_660939 ?auto_660941 ) ) ( not ( = ?auto_660939 ?auto_660942 ) ) ( not ( = ?auto_660939 ?auto_660943 ) ) ( not ( = ?auto_660939 ?auto_660944 ) ) ( not ( = ?auto_660939 ?auto_660945 ) ) ( not ( = ?auto_660939 ?auto_660946 ) ) ( not ( = ?auto_660939 ?auto_660947 ) ) ( not ( = ?auto_660939 ?auto_660948 ) ) ( not ( = ?auto_660939 ?auto_660949 ) ) ( not ( = ?auto_660939 ?auto_660950 ) ) ( not ( = ?auto_660939 ?auto_660951 ) ) ( not ( = ?auto_660939 ?auto_660952 ) ) ( not ( = ?auto_660940 ?auto_660941 ) ) ( not ( = ?auto_660940 ?auto_660942 ) ) ( not ( = ?auto_660940 ?auto_660943 ) ) ( not ( = ?auto_660940 ?auto_660944 ) ) ( not ( = ?auto_660940 ?auto_660945 ) ) ( not ( = ?auto_660940 ?auto_660946 ) ) ( not ( = ?auto_660940 ?auto_660947 ) ) ( not ( = ?auto_660940 ?auto_660948 ) ) ( not ( = ?auto_660940 ?auto_660949 ) ) ( not ( = ?auto_660940 ?auto_660950 ) ) ( not ( = ?auto_660940 ?auto_660951 ) ) ( not ( = ?auto_660940 ?auto_660952 ) ) ( not ( = ?auto_660941 ?auto_660942 ) ) ( not ( = ?auto_660941 ?auto_660943 ) ) ( not ( = ?auto_660941 ?auto_660944 ) ) ( not ( = ?auto_660941 ?auto_660945 ) ) ( not ( = ?auto_660941 ?auto_660946 ) ) ( not ( = ?auto_660941 ?auto_660947 ) ) ( not ( = ?auto_660941 ?auto_660948 ) ) ( not ( = ?auto_660941 ?auto_660949 ) ) ( not ( = ?auto_660941 ?auto_660950 ) ) ( not ( = ?auto_660941 ?auto_660951 ) ) ( not ( = ?auto_660941 ?auto_660952 ) ) ( not ( = ?auto_660942 ?auto_660943 ) ) ( not ( = ?auto_660942 ?auto_660944 ) ) ( not ( = ?auto_660942 ?auto_660945 ) ) ( not ( = ?auto_660942 ?auto_660946 ) ) ( not ( = ?auto_660942 ?auto_660947 ) ) ( not ( = ?auto_660942 ?auto_660948 ) ) ( not ( = ?auto_660942 ?auto_660949 ) ) ( not ( = ?auto_660942 ?auto_660950 ) ) ( not ( = ?auto_660942 ?auto_660951 ) ) ( not ( = ?auto_660942 ?auto_660952 ) ) ( not ( = ?auto_660943 ?auto_660944 ) ) ( not ( = ?auto_660943 ?auto_660945 ) ) ( not ( = ?auto_660943 ?auto_660946 ) ) ( not ( = ?auto_660943 ?auto_660947 ) ) ( not ( = ?auto_660943 ?auto_660948 ) ) ( not ( = ?auto_660943 ?auto_660949 ) ) ( not ( = ?auto_660943 ?auto_660950 ) ) ( not ( = ?auto_660943 ?auto_660951 ) ) ( not ( = ?auto_660943 ?auto_660952 ) ) ( not ( = ?auto_660944 ?auto_660945 ) ) ( not ( = ?auto_660944 ?auto_660946 ) ) ( not ( = ?auto_660944 ?auto_660947 ) ) ( not ( = ?auto_660944 ?auto_660948 ) ) ( not ( = ?auto_660944 ?auto_660949 ) ) ( not ( = ?auto_660944 ?auto_660950 ) ) ( not ( = ?auto_660944 ?auto_660951 ) ) ( not ( = ?auto_660944 ?auto_660952 ) ) ( not ( = ?auto_660945 ?auto_660946 ) ) ( not ( = ?auto_660945 ?auto_660947 ) ) ( not ( = ?auto_660945 ?auto_660948 ) ) ( not ( = ?auto_660945 ?auto_660949 ) ) ( not ( = ?auto_660945 ?auto_660950 ) ) ( not ( = ?auto_660945 ?auto_660951 ) ) ( not ( = ?auto_660945 ?auto_660952 ) ) ( not ( = ?auto_660946 ?auto_660947 ) ) ( not ( = ?auto_660946 ?auto_660948 ) ) ( not ( = ?auto_660946 ?auto_660949 ) ) ( not ( = ?auto_660946 ?auto_660950 ) ) ( not ( = ?auto_660946 ?auto_660951 ) ) ( not ( = ?auto_660946 ?auto_660952 ) ) ( not ( = ?auto_660947 ?auto_660948 ) ) ( not ( = ?auto_660947 ?auto_660949 ) ) ( not ( = ?auto_660947 ?auto_660950 ) ) ( not ( = ?auto_660947 ?auto_660951 ) ) ( not ( = ?auto_660947 ?auto_660952 ) ) ( not ( = ?auto_660948 ?auto_660949 ) ) ( not ( = ?auto_660948 ?auto_660950 ) ) ( not ( = ?auto_660948 ?auto_660951 ) ) ( not ( = ?auto_660948 ?auto_660952 ) ) ( not ( = ?auto_660949 ?auto_660950 ) ) ( not ( = ?auto_660949 ?auto_660951 ) ) ( not ( = ?auto_660949 ?auto_660952 ) ) ( not ( = ?auto_660950 ?auto_660951 ) ) ( not ( = ?auto_660950 ?auto_660952 ) ) ( not ( = ?auto_660951 ?auto_660952 ) ) ( ON ?auto_660950 ?auto_660951 ) ( ON ?auto_660949 ?auto_660950 ) ( ON ?auto_660948 ?auto_660949 ) ( ON ?auto_660947 ?auto_660948 ) ( ON ?auto_660946 ?auto_660947 ) ( ON ?auto_660945 ?auto_660946 ) ( ON ?auto_660944 ?auto_660945 ) ( ON ?auto_660943 ?auto_660944 ) ( ON ?auto_660942 ?auto_660943 ) ( ON ?auto_660941 ?auto_660942 ) ( CLEAR ?auto_660939 ) ( ON ?auto_660940 ?auto_660941 ) ( CLEAR ?auto_660940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_660939 ?auto_660940 )
      ( MAKE-13PILE ?auto_660939 ?auto_660940 ?auto_660941 ?auto_660942 ?auto_660943 ?auto_660944 ?auto_660945 ?auto_660946 ?auto_660947 ?auto_660948 ?auto_660949 ?auto_660950 ?auto_660951 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_660993 - BLOCK
      ?auto_660994 - BLOCK
      ?auto_660995 - BLOCK
      ?auto_660996 - BLOCK
      ?auto_660997 - BLOCK
      ?auto_660998 - BLOCK
      ?auto_660999 - BLOCK
      ?auto_661000 - BLOCK
      ?auto_661001 - BLOCK
      ?auto_661002 - BLOCK
      ?auto_661003 - BLOCK
      ?auto_661004 - BLOCK
      ?auto_661005 - BLOCK
    )
    :vars
    (
      ?auto_661006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661005 ?auto_661006 ) ( not ( = ?auto_660993 ?auto_660994 ) ) ( not ( = ?auto_660993 ?auto_660995 ) ) ( not ( = ?auto_660993 ?auto_660996 ) ) ( not ( = ?auto_660993 ?auto_660997 ) ) ( not ( = ?auto_660993 ?auto_660998 ) ) ( not ( = ?auto_660993 ?auto_660999 ) ) ( not ( = ?auto_660993 ?auto_661000 ) ) ( not ( = ?auto_660993 ?auto_661001 ) ) ( not ( = ?auto_660993 ?auto_661002 ) ) ( not ( = ?auto_660993 ?auto_661003 ) ) ( not ( = ?auto_660993 ?auto_661004 ) ) ( not ( = ?auto_660993 ?auto_661005 ) ) ( not ( = ?auto_660993 ?auto_661006 ) ) ( not ( = ?auto_660994 ?auto_660995 ) ) ( not ( = ?auto_660994 ?auto_660996 ) ) ( not ( = ?auto_660994 ?auto_660997 ) ) ( not ( = ?auto_660994 ?auto_660998 ) ) ( not ( = ?auto_660994 ?auto_660999 ) ) ( not ( = ?auto_660994 ?auto_661000 ) ) ( not ( = ?auto_660994 ?auto_661001 ) ) ( not ( = ?auto_660994 ?auto_661002 ) ) ( not ( = ?auto_660994 ?auto_661003 ) ) ( not ( = ?auto_660994 ?auto_661004 ) ) ( not ( = ?auto_660994 ?auto_661005 ) ) ( not ( = ?auto_660994 ?auto_661006 ) ) ( not ( = ?auto_660995 ?auto_660996 ) ) ( not ( = ?auto_660995 ?auto_660997 ) ) ( not ( = ?auto_660995 ?auto_660998 ) ) ( not ( = ?auto_660995 ?auto_660999 ) ) ( not ( = ?auto_660995 ?auto_661000 ) ) ( not ( = ?auto_660995 ?auto_661001 ) ) ( not ( = ?auto_660995 ?auto_661002 ) ) ( not ( = ?auto_660995 ?auto_661003 ) ) ( not ( = ?auto_660995 ?auto_661004 ) ) ( not ( = ?auto_660995 ?auto_661005 ) ) ( not ( = ?auto_660995 ?auto_661006 ) ) ( not ( = ?auto_660996 ?auto_660997 ) ) ( not ( = ?auto_660996 ?auto_660998 ) ) ( not ( = ?auto_660996 ?auto_660999 ) ) ( not ( = ?auto_660996 ?auto_661000 ) ) ( not ( = ?auto_660996 ?auto_661001 ) ) ( not ( = ?auto_660996 ?auto_661002 ) ) ( not ( = ?auto_660996 ?auto_661003 ) ) ( not ( = ?auto_660996 ?auto_661004 ) ) ( not ( = ?auto_660996 ?auto_661005 ) ) ( not ( = ?auto_660996 ?auto_661006 ) ) ( not ( = ?auto_660997 ?auto_660998 ) ) ( not ( = ?auto_660997 ?auto_660999 ) ) ( not ( = ?auto_660997 ?auto_661000 ) ) ( not ( = ?auto_660997 ?auto_661001 ) ) ( not ( = ?auto_660997 ?auto_661002 ) ) ( not ( = ?auto_660997 ?auto_661003 ) ) ( not ( = ?auto_660997 ?auto_661004 ) ) ( not ( = ?auto_660997 ?auto_661005 ) ) ( not ( = ?auto_660997 ?auto_661006 ) ) ( not ( = ?auto_660998 ?auto_660999 ) ) ( not ( = ?auto_660998 ?auto_661000 ) ) ( not ( = ?auto_660998 ?auto_661001 ) ) ( not ( = ?auto_660998 ?auto_661002 ) ) ( not ( = ?auto_660998 ?auto_661003 ) ) ( not ( = ?auto_660998 ?auto_661004 ) ) ( not ( = ?auto_660998 ?auto_661005 ) ) ( not ( = ?auto_660998 ?auto_661006 ) ) ( not ( = ?auto_660999 ?auto_661000 ) ) ( not ( = ?auto_660999 ?auto_661001 ) ) ( not ( = ?auto_660999 ?auto_661002 ) ) ( not ( = ?auto_660999 ?auto_661003 ) ) ( not ( = ?auto_660999 ?auto_661004 ) ) ( not ( = ?auto_660999 ?auto_661005 ) ) ( not ( = ?auto_660999 ?auto_661006 ) ) ( not ( = ?auto_661000 ?auto_661001 ) ) ( not ( = ?auto_661000 ?auto_661002 ) ) ( not ( = ?auto_661000 ?auto_661003 ) ) ( not ( = ?auto_661000 ?auto_661004 ) ) ( not ( = ?auto_661000 ?auto_661005 ) ) ( not ( = ?auto_661000 ?auto_661006 ) ) ( not ( = ?auto_661001 ?auto_661002 ) ) ( not ( = ?auto_661001 ?auto_661003 ) ) ( not ( = ?auto_661001 ?auto_661004 ) ) ( not ( = ?auto_661001 ?auto_661005 ) ) ( not ( = ?auto_661001 ?auto_661006 ) ) ( not ( = ?auto_661002 ?auto_661003 ) ) ( not ( = ?auto_661002 ?auto_661004 ) ) ( not ( = ?auto_661002 ?auto_661005 ) ) ( not ( = ?auto_661002 ?auto_661006 ) ) ( not ( = ?auto_661003 ?auto_661004 ) ) ( not ( = ?auto_661003 ?auto_661005 ) ) ( not ( = ?auto_661003 ?auto_661006 ) ) ( not ( = ?auto_661004 ?auto_661005 ) ) ( not ( = ?auto_661004 ?auto_661006 ) ) ( not ( = ?auto_661005 ?auto_661006 ) ) ( ON ?auto_661004 ?auto_661005 ) ( ON ?auto_661003 ?auto_661004 ) ( ON ?auto_661002 ?auto_661003 ) ( ON ?auto_661001 ?auto_661002 ) ( ON ?auto_661000 ?auto_661001 ) ( ON ?auto_660999 ?auto_661000 ) ( ON ?auto_660998 ?auto_660999 ) ( ON ?auto_660997 ?auto_660998 ) ( ON ?auto_660996 ?auto_660997 ) ( ON ?auto_660995 ?auto_660996 ) ( ON ?auto_660994 ?auto_660995 ) ( ON ?auto_660993 ?auto_660994 ) ( CLEAR ?auto_660993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_660993 )
      ( MAKE-13PILE ?auto_660993 ?auto_660994 ?auto_660995 ?auto_660996 ?auto_660997 ?auto_660998 ?auto_660999 ?auto_661000 ?auto_661001 ?auto_661002 ?auto_661003 ?auto_661004 ?auto_661005 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_661048 - BLOCK
      ?auto_661049 - BLOCK
      ?auto_661050 - BLOCK
      ?auto_661051 - BLOCK
      ?auto_661052 - BLOCK
      ?auto_661053 - BLOCK
      ?auto_661054 - BLOCK
      ?auto_661055 - BLOCK
      ?auto_661056 - BLOCK
      ?auto_661057 - BLOCK
      ?auto_661058 - BLOCK
      ?auto_661059 - BLOCK
      ?auto_661060 - BLOCK
      ?auto_661061 - BLOCK
    )
    :vars
    (
      ?auto_661062 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_661060 ) ( ON ?auto_661061 ?auto_661062 ) ( CLEAR ?auto_661061 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_661048 ) ( ON ?auto_661049 ?auto_661048 ) ( ON ?auto_661050 ?auto_661049 ) ( ON ?auto_661051 ?auto_661050 ) ( ON ?auto_661052 ?auto_661051 ) ( ON ?auto_661053 ?auto_661052 ) ( ON ?auto_661054 ?auto_661053 ) ( ON ?auto_661055 ?auto_661054 ) ( ON ?auto_661056 ?auto_661055 ) ( ON ?auto_661057 ?auto_661056 ) ( ON ?auto_661058 ?auto_661057 ) ( ON ?auto_661059 ?auto_661058 ) ( ON ?auto_661060 ?auto_661059 ) ( not ( = ?auto_661048 ?auto_661049 ) ) ( not ( = ?auto_661048 ?auto_661050 ) ) ( not ( = ?auto_661048 ?auto_661051 ) ) ( not ( = ?auto_661048 ?auto_661052 ) ) ( not ( = ?auto_661048 ?auto_661053 ) ) ( not ( = ?auto_661048 ?auto_661054 ) ) ( not ( = ?auto_661048 ?auto_661055 ) ) ( not ( = ?auto_661048 ?auto_661056 ) ) ( not ( = ?auto_661048 ?auto_661057 ) ) ( not ( = ?auto_661048 ?auto_661058 ) ) ( not ( = ?auto_661048 ?auto_661059 ) ) ( not ( = ?auto_661048 ?auto_661060 ) ) ( not ( = ?auto_661048 ?auto_661061 ) ) ( not ( = ?auto_661048 ?auto_661062 ) ) ( not ( = ?auto_661049 ?auto_661050 ) ) ( not ( = ?auto_661049 ?auto_661051 ) ) ( not ( = ?auto_661049 ?auto_661052 ) ) ( not ( = ?auto_661049 ?auto_661053 ) ) ( not ( = ?auto_661049 ?auto_661054 ) ) ( not ( = ?auto_661049 ?auto_661055 ) ) ( not ( = ?auto_661049 ?auto_661056 ) ) ( not ( = ?auto_661049 ?auto_661057 ) ) ( not ( = ?auto_661049 ?auto_661058 ) ) ( not ( = ?auto_661049 ?auto_661059 ) ) ( not ( = ?auto_661049 ?auto_661060 ) ) ( not ( = ?auto_661049 ?auto_661061 ) ) ( not ( = ?auto_661049 ?auto_661062 ) ) ( not ( = ?auto_661050 ?auto_661051 ) ) ( not ( = ?auto_661050 ?auto_661052 ) ) ( not ( = ?auto_661050 ?auto_661053 ) ) ( not ( = ?auto_661050 ?auto_661054 ) ) ( not ( = ?auto_661050 ?auto_661055 ) ) ( not ( = ?auto_661050 ?auto_661056 ) ) ( not ( = ?auto_661050 ?auto_661057 ) ) ( not ( = ?auto_661050 ?auto_661058 ) ) ( not ( = ?auto_661050 ?auto_661059 ) ) ( not ( = ?auto_661050 ?auto_661060 ) ) ( not ( = ?auto_661050 ?auto_661061 ) ) ( not ( = ?auto_661050 ?auto_661062 ) ) ( not ( = ?auto_661051 ?auto_661052 ) ) ( not ( = ?auto_661051 ?auto_661053 ) ) ( not ( = ?auto_661051 ?auto_661054 ) ) ( not ( = ?auto_661051 ?auto_661055 ) ) ( not ( = ?auto_661051 ?auto_661056 ) ) ( not ( = ?auto_661051 ?auto_661057 ) ) ( not ( = ?auto_661051 ?auto_661058 ) ) ( not ( = ?auto_661051 ?auto_661059 ) ) ( not ( = ?auto_661051 ?auto_661060 ) ) ( not ( = ?auto_661051 ?auto_661061 ) ) ( not ( = ?auto_661051 ?auto_661062 ) ) ( not ( = ?auto_661052 ?auto_661053 ) ) ( not ( = ?auto_661052 ?auto_661054 ) ) ( not ( = ?auto_661052 ?auto_661055 ) ) ( not ( = ?auto_661052 ?auto_661056 ) ) ( not ( = ?auto_661052 ?auto_661057 ) ) ( not ( = ?auto_661052 ?auto_661058 ) ) ( not ( = ?auto_661052 ?auto_661059 ) ) ( not ( = ?auto_661052 ?auto_661060 ) ) ( not ( = ?auto_661052 ?auto_661061 ) ) ( not ( = ?auto_661052 ?auto_661062 ) ) ( not ( = ?auto_661053 ?auto_661054 ) ) ( not ( = ?auto_661053 ?auto_661055 ) ) ( not ( = ?auto_661053 ?auto_661056 ) ) ( not ( = ?auto_661053 ?auto_661057 ) ) ( not ( = ?auto_661053 ?auto_661058 ) ) ( not ( = ?auto_661053 ?auto_661059 ) ) ( not ( = ?auto_661053 ?auto_661060 ) ) ( not ( = ?auto_661053 ?auto_661061 ) ) ( not ( = ?auto_661053 ?auto_661062 ) ) ( not ( = ?auto_661054 ?auto_661055 ) ) ( not ( = ?auto_661054 ?auto_661056 ) ) ( not ( = ?auto_661054 ?auto_661057 ) ) ( not ( = ?auto_661054 ?auto_661058 ) ) ( not ( = ?auto_661054 ?auto_661059 ) ) ( not ( = ?auto_661054 ?auto_661060 ) ) ( not ( = ?auto_661054 ?auto_661061 ) ) ( not ( = ?auto_661054 ?auto_661062 ) ) ( not ( = ?auto_661055 ?auto_661056 ) ) ( not ( = ?auto_661055 ?auto_661057 ) ) ( not ( = ?auto_661055 ?auto_661058 ) ) ( not ( = ?auto_661055 ?auto_661059 ) ) ( not ( = ?auto_661055 ?auto_661060 ) ) ( not ( = ?auto_661055 ?auto_661061 ) ) ( not ( = ?auto_661055 ?auto_661062 ) ) ( not ( = ?auto_661056 ?auto_661057 ) ) ( not ( = ?auto_661056 ?auto_661058 ) ) ( not ( = ?auto_661056 ?auto_661059 ) ) ( not ( = ?auto_661056 ?auto_661060 ) ) ( not ( = ?auto_661056 ?auto_661061 ) ) ( not ( = ?auto_661056 ?auto_661062 ) ) ( not ( = ?auto_661057 ?auto_661058 ) ) ( not ( = ?auto_661057 ?auto_661059 ) ) ( not ( = ?auto_661057 ?auto_661060 ) ) ( not ( = ?auto_661057 ?auto_661061 ) ) ( not ( = ?auto_661057 ?auto_661062 ) ) ( not ( = ?auto_661058 ?auto_661059 ) ) ( not ( = ?auto_661058 ?auto_661060 ) ) ( not ( = ?auto_661058 ?auto_661061 ) ) ( not ( = ?auto_661058 ?auto_661062 ) ) ( not ( = ?auto_661059 ?auto_661060 ) ) ( not ( = ?auto_661059 ?auto_661061 ) ) ( not ( = ?auto_661059 ?auto_661062 ) ) ( not ( = ?auto_661060 ?auto_661061 ) ) ( not ( = ?auto_661060 ?auto_661062 ) ) ( not ( = ?auto_661061 ?auto_661062 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_661061 ?auto_661062 )
      ( !STACK ?auto_661061 ?auto_661060 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_661106 - BLOCK
      ?auto_661107 - BLOCK
      ?auto_661108 - BLOCK
      ?auto_661109 - BLOCK
      ?auto_661110 - BLOCK
      ?auto_661111 - BLOCK
      ?auto_661112 - BLOCK
      ?auto_661113 - BLOCK
      ?auto_661114 - BLOCK
      ?auto_661115 - BLOCK
      ?auto_661116 - BLOCK
      ?auto_661117 - BLOCK
      ?auto_661118 - BLOCK
      ?auto_661119 - BLOCK
    )
    :vars
    (
      ?auto_661120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661119 ?auto_661120 ) ( ON-TABLE ?auto_661106 ) ( ON ?auto_661107 ?auto_661106 ) ( ON ?auto_661108 ?auto_661107 ) ( ON ?auto_661109 ?auto_661108 ) ( ON ?auto_661110 ?auto_661109 ) ( ON ?auto_661111 ?auto_661110 ) ( ON ?auto_661112 ?auto_661111 ) ( ON ?auto_661113 ?auto_661112 ) ( ON ?auto_661114 ?auto_661113 ) ( ON ?auto_661115 ?auto_661114 ) ( ON ?auto_661116 ?auto_661115 ) ( ON ?auto_661117 ?auto_661116 ) ( not ( = ?auto_661106 ?auto_661107 ) ) ( not ( = ?auto_661106 ?auto_661108 ) ) ( not ( = ?auto_661106 ?auto_661109 ) ) ( not ( = ?auto_661106 ?auto_661110 ) ) ( not ( = ?auto_661106 ?auto_661111 ) ) ( not ( = ?auto_661106 ?auto_661112 ) ) ( not ( = ?auto_661106 ?auto_661113 ) ) ( not ( = ?auto_661106 ?auto_661114 ) ) ( not ( = ?auto_661106 ?auto_661115 ) ) ( not ( = ?auto_661106 ?auto_661116 ) ) ( not ( = ?auto_661106 ?auto_661117 ) ) ( not ( = ?auto_661106 ?auto_661118 ) ) ( not ( = ?auto_661106 ?auto_661119 ) ) ( not ( = ?auto_661106 ?auto_661120 ) ) ( not ( = ?auto_661107 ?auto_661108 ) ) ( not ( = ?auto_661107 ?auto_661109 ) ) ( not ( = ?auto_661107 ?auto_661110 ) ) ( not ( = ?auto_661107 ?auto_661111 ) ) ( not ( = ?auto_661107 ?auto_661112 ) ) ( not ( = ?auto_661107 ?auto_661113 ) ) ( not ( = ?auto_661107 ?auto_661114 ) ) ( not ( = ?auto_661107 ?auto_661115 ) ) ( not ( = ?auto_661107 ?auto_661116 ) ) ( not ( = ?auto_661107 ?auto_661117 ) ) ( not ( = ?auto_661107 ?auto_661118 ) ) ( not ( = ?auto_661107 ?auto_661119 ) ) ( not ( = ?auto_661107 ?auto_661120 ) ) ( not ( = ?auto_661108 ?auto_661109 ) ) ( not ( = ?auto_661108 ?auto_661110 ) ) ( not ( = ?auto_661108 ?auto_661111 ) ) ( not ( = ?auto_661108 ?auto_661112 ) ) ( not ( = ?auto_661108 ?auto_661113 ) ) ( not ( = ?auto_661108 ?auto_661114 ) ) ( not ( = ?auto_661108 ?auto_661115 ) ) ( not ( = ?auto_661108 ?auto_661116 ) ) ( not ( = ?auto_661108 ?auto_661117 ) ) ( not ( = ?auto_661108 ?auto_661118 ) ) ( not ( = ?auto_661108 ?auto_661119 ) ) ( not ( = ?auto_661108 ?auto_661120 ) ) ( not ( = ?auto_661109 ?auto_661110 ) ) ( not ( = ?auto_661109 ?auto_661111 ) ) ( not ( = ?auto_661109 ?auto_661112 ) ) ( not ( = ?auto_661109 ?auto_661113 ) ) ( not ( = ?auto_661109 ?auto_661114 ) ) ( not ( = ?auto_661109 ?auto_661115 ) ) ( not ( = ?auto_661109 ?auto_661116 ) ) ( not ( = ?auto_661109 ?auto_661117 ) ) ( not ( = ?auto_661109 ?auto_661118 ) ) ( not ( = ?auto_661109 ?auto_661119 ) ) ( not ( = ?auto_661109 ?auto_661120 ) ) ( not ( = ?auto_661110 ?auto_661111 ) ) ( not ( = ?auto_661110 ?auto_661112 ) ) ( not ( = ?auto_661110 ?auto_661113 ) ) ( not ( = ?auto_661110 ?auto_661114 ) ) ( not ( = ?auto_661110 ?auto_661115 ) ) ( not ( = ?auto_661110 ?auto_661116 ) ) ( not ( = ?auto_661110 ?auto_661117 ) ) ( not ( = ?auto_661110 ?auto_661118 ) ) ( not ( = ?auto_661110 ?auto_661119 ) ) ( not ( = ?auto_661110 ?auto_661120 ) ) ( not ( = ?auto_661111 ?auto_661112 ) ) ( not ( = ?auto_661111 ?auto_661113 ) ) ( not ( = ?auto_661111 ?auto_661114 ) ) ( not ( = ?auto_661111 ?auto_661115 ) ) ( not ( = ?auto_661111 ?auto_661116 ) ) ( not ( = ?auto_661111 ?auto_661117 ) ) ( not ( = ?auto_661111 ?auto_661118 ) ) ( not ( = ?auto_661111 ?auto_661119 ) ) ( not ( = ?auto_661111 ?auto_661120 ) ) ( not ( = ?auto_661112 ?auto_661113 ) ) ( not ( = ?auto_661112 ?auto_661114 ) ) ( not ( = ?auto_661112 ?auto_661115 ) ) ( not ( = ?auto_661112 ?auto_661116 ) ) ( not ( = ?auto_661112 ?auto_661117 ) ) ( not ( = ?auto_661112 ?auto_661118 ) ) ( not ( = ?auto_661112 ?auto_661119 ) ) ( not ( = ?auto_661112 ?auto_661120 ) ) ( not ( = ?auto_661113 ?auto_661114 ) ) ( not ( = ?auto_661113 ?auto_661115 ) ) ( not ( = ?auto_661113 ?auto_661116 ) ) ( not ( = ?auto_661113 ?auto_661117 ) ) ( not ( = ?auto_661113 ?auto_661118 ) ) ( not ( = ?auto_661113 ?auto_661119 ) ) ( not ( = ?auto_661113 ?auto_661120 ) ) ( not ( = ?auto_661114 ?auto_661115 ) ) ( not ( = ?auto_661114 ?auto_661116 ) ) ( not ( = ?auto_661114 ?auto_661117 ) ) ( not ( = ?auto_661114 ?auto_661118 ) ) ( not ( = ?auto_661114 ?auto_661119 ) ) ( not ( = ?auto_661114 ?auto_661120 ) ) ( not ( = ?auto_661115 ?auto_661116 ) ) ( not ( = ?auto_661115 ?auto_661117 ) ) ( not ( = ?auto_661115 ?auto_661118 ) ) ( not ( = ?auto_661115 ?auto_661119 ) ) ( not ( = ?auto_661115 ?auto_661120 ) ) ( not ( = ?auto_661116 ?auto_661117 ) ) ( not ( = ?auto_661116 ?auto_661118 ) ) ( not ( = ?auto_661116 ?auto_661119 ) ) ( not ( = ?auto_661116 ?auto_661120 ) ) ( not ( = ?auto_661117 ?auto_661118 ) ) ( not ( = ?auto_661117 ?auto_661119 ) ) ( not ( = ?auto_661117 ?auto_661120 ) ) ( not ( = ?auto_661118 ?auto_661119 ) ) ( not ( = ?auto_661118 ?auto_661120 ) ) ( not ( = ?auto_661119 ?auto_661120 ) ) ( CLEAR ?auto_661117 ) ( ON ?auto_661118 ?auto_661119 ) ( CLEAR ?auto_661118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_661106 ?auto_661107 ?auto_661108 ?auto_661109 ?auto_661110 ?auto_661111 ?auto_661112 ?auto_661113 ?auto_661114 ?auto_661115 ?auto_661116 ?auto_661117 ?auto_661118 )
      ( MAKE-14PILE ?auto_661106 ?auto_661107 ?auto_661108 ?auto_661109 ?auto_661110 ?auto_661111 ?auto_661112 ?auto_661113 ?auto_661114 ?auto_661115 ?auto_661116 ?auto_661117 ?auto_661118 ?auto_661119 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_661164 - BLOCK
      ?auto_661165 - BLOCK
      ?auto_661166 - BLOCK
      ?auto_661167 - BLOCK
      ?auto_661168 - BLOCK
      ?auto_661169 - BLOCK
      ?auto_661170 - BLOCK
      ?auto_661171 - BLOCK
      ?auto_661172 - BLOCK
      ?auto_661173 - BLOCK
      ?auto_661174 - BLOCK
      ?auto_661175 - BLOCK
      ?auto_661176 - BLOCK
      ?auto_661177 - BLOCK
    )
    :vars
    (
      ?auto_661178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661177 ?auto_661178 ) ( ON-TABLE ?auto_661164 ) ( ON ?auto_661165 ?auto_661164 ) ( ON ?auto_661166 ?auto_661165 ) ( ON ?auto_661167 ?auto_661166 ) ( ON ?auto_661168 ?auto_661167 ) ( ON ?auto_661169 ?auto_661168 ) ( ON ?auto_661170 ?auto_661169 ) ( ON ?auto_661171 ?auto_661170 ) ( ON ?auto_661172 ?auto_661171 ) ( ON ?auto_661173 ?auto_661172 ) ( ON ?auto_661174 ?auto_661173 ) ( not ( = ?auto_661164 ?auto_661165 ) ) ( not ( = ?auto_661164 ?auto_661166 ) ) ( not ( = ?auto_661164 ?auto_661167 ) ) ( not ( = ?auto_661164 ?auto_661168 ) ) ( not ( = ?auto_661164 ?auto_661169 ) ) ( not ( = ?auto_661164 ?auto_661170 ) ) ( not ( = ?auto_661164 ?auto_661171 ) ) ( not ( = ?auto_661164 ?auto_661172 ) ) ( not ( = ?auto_661164 ?auto_661173 ) ) ( not ( = ?auto_661164 ?auto_661174 ) ) ( not ( = ?auto_661164 ?auto_661175 ) ) ( not ( = ?auto_661164 ?auto_661176 ) ) ( not ( = ?auto_661164 ?auto_661177 ) ) ( not ( = ?auto_661164 ?auto_661178 ) ) ( not ( = ?auto_661165 ?auto_661166 ) ) ( not ( = ?auto_661165 ?auto_661167 ) ) ( not ( = ?auto_661165 ?auto_661168 ) ) ( not ( = ?auto_661165 ?auto_661169 ) ) ( not ( = ?auto_661165 ?auto_661170 ) ) ( not ( = ?auto_661165 ?auto_661171 ) ) ( not ( = ?auto_661165 ?auto_661172 ) ) ( not ( = ?auto_661165 ?auto_661173 ) ) ( not ( = ?auto_661165 ?auto_661174 ) ) ( not ( = ?auto_661165 ?auto_661175 ) ) ( not ( = ?auto_661165 ?auto_661176 ) ) ( not ( = ?auto_661165 ?auto_661177 ) ) ( not ( = ?auto_661165 ?auto_661178 ) ) ( not ( = ?auto_661166 ?auto_661167 ) ) ( not ( = ?auto_661166 ?auto_661168 ) ) ( not ( = ?auto_661166 ?auto_661169 ) ) ( not ( = ?auto_661166 ?auto_661170 ) ) ( not ( = ?auto_661166 ?auto_661171 ) ) ( not ( = ?auto_661166 ?auto_661172 ) ) ( not ( = ?auto_661166 ?auto_661173 ) ) ( not ( = ?auto_661166 ?auto_661174 ) ) ( not ( = ?auto_661166 ?auto_661175 ) ) ( not ( = ?auto_661166 ?auto_661176 ) ) ( not ( = ?auto_661166 ?auto_661177 ) ) ( not ( = ?auto_661166 ?auto_661178 ) ) ( not ( = ?auto_661167 ?auto_661168 ) ) ( not ( = ?auto_661167 ?auto_661169 ) ) ( not ( = ?auto_661167 ?auto_661170 ) ) ( not ( = ?auto_661167 ?auto_661171 ) ) ( not ( = ?auto_661167 ?auto_661172 ) ) ( not ( = ?auto_661167 ?auto_661173 ) ) ( not ( = ?auto_661167 ?auto_661174 ) ) ( not ( = ?auto_661167 ?auto_661175 ) ) ( not ( = ?auto_661167 ?auto_661176 ) ) ( not ( = ?auto_661167 ?auto_661177 ) ) ( not ( = ?auto_661167 ?auto_661178 ) ) ( not ( = ?auto_661168 ?auto_661169 ) ) ( not ( = ?auto_661168 ?auto_661170 ) ) ( not ( = ?auto_661168 ?auto_661171 ) ) ( not ( = ?auto_661168 ?auto_661172 ) ) ( not ( = ?auto_661168 ?auto_661173 ) ) ( not ( = ?auto_661168 ?auto_661174 ) ) ( not ( = ?auto_661168 ?auto_661175 ) ) ( not ( = ?auto_661168 ?auto_661176 ) ) ( not ( = ?auto_661168 ?auto_661177 ) ) ( not ( = ?auto_661168 ?auto_661178 ) ) ( not ( = ?auto_661169 ?auto_661170 ) ) ( not ( = ?auto_661169 ?auto_661171 ) ) ( not ( = ?auto_661169 ?auto_661172 ) ) ( not ( = ?auto_661169 ?auto_661173 ) ) ( not ( = ?auto_661169 ?auto_661174 ) ) ( not ( = ?auto_661169 ?auto_661175 ) ) ( not ( = ?auto_661169 ?auto_661176 ) ) ( not ( = ?auto_661169 ?auto_661177 ) ) ( not ( = ?auto_661169 ?auto_661178 ) ) ( not ( = ?auto_661170 ?auto_661171 ) ) ( not ( = ?auto_661170 ?auto_661172 ) ) ( not ( = ?auto_661170 ?auto_661173 ) ) ( not ( = ?auto_661170 ?auto_661174 ) ) ( not ( = ?auto_661170 ?auto_661175 ) ) ( not ( = ?auto_661170 ?auto_661176 ) ) ( not ( = ?auto_661170 ?auto_661177 ) ) ( not ( = ?auto_661170 ?auto_661178 ) ) ( not ( = ?auto_661171 ?auto_661172 ) ) ( not ( = ?auto_661171 ?auto_661173 ) ) ( not ( = ?auto_661171 ?auto_661174 ) ) ( not ( = ?auto_661171 ?auto_661175 ) ) ( not ( = ?auto_661171 ?auto_661176 ) ) ( not ( = ?auto_661171 ?auto_661177 ) ) ( not ( = ?auto_661171 ?auto_661178 ) ) ( not ( = ?auto_661172 ?auto_661173 ) ) ( not ( = ?auto_661172 ?auto_661174 ) ) ( not ( = ?auto_661172 ?auto_661175 ) ) ( not ( = ?auto_661172 ?auto_661176 ) ) ( not ( = ?auto_661172 ?auto_661177 ) ) ( not ( = ?auto_661172 ?auto_661178 ) ) ( not ( = ?auto_661173 ?auto_661174 ) ) ( not ( = ?auto_661173 ?auto_661175 ) ) ( not ( = ?auto_661173 ?auto_661176 ) ) ( not ( = ?auto_661173 ?auto_661177 ) ) ( not ( = ?auto_661173 ?auto_661178 ) ) ( not ( = ?auto_661174 ?auto_661175 ) ) ( not ( = ?auto_661174 ?auto_661176 ) ) ( not ( = ?auto_661174 ?auto_661177 ) ) ( not ( = ?auto_661174 ?auto_661178 ) ) ( not ( = ?auto_661175 ?auto_661176 ) ) ( not ( = ?auto_661175 ?auto_661177 ) ) ( not ( = ?auto_661175 ?auto_661178 ) ) ( not ( = ?auto_661176 ?auto_661177 ) ) ( not ( = ?auto_661176 ?auto_661178 ) ) ( not ( = ?auto_661177 ?auto_661178 ) ) ( ON ?auto_661176 ?auto_661177 ) ( CLEAR ?auto_661174 ) ( ON ?auto_661175 ?auto_661176 ) ( CLEAR ?auto_661175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_661164 ?auto_661165 ?auto_661166 ?auto_661167 ?auto_661168 ?auto_661169 ?auto_661170 ?auto_661171 ?auto_661172 ?auto_661173 ?auto_661174 ?auto_661175 )
      ( MAKE-14PILE ?auto_661164 ?auto_661165 ?auto_661166 ?auto_661167 ?auto_661168 ?auto_661169 ?auto_661170 ?auto_661171 ?auto_661172 ?auto_661173 ?auto_661174 ?auto_661175 ?auto_661176 ?auto_661177 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_661222 - BLOCK
      ?auto_661223 - BLOCK
      ?auto_661224 - BLOCK
      ?auto_661225 - BLOCK
      ?auto_661226 - BLOCK
      ?auto_661227 - BLOCK
      ?auto_661228 - BLOCK
      ?auto_661229 - BLOCK
      ?auto_661230 - BLOCK
      ?auto_661231 - BLOCK
      ?auto_661232 - BLOCK
      ?auto_661233 - BLOCK
      ?auto_661234 - BLOCK
      ?auto_661235 - BLOCK
    )
    :vars
    (
      ?auto_661236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661235 ?auto_661236 ) ( ON-TABLE ?auto_661222 ) ( ON ?auto_661223 ?auto_661222 ) ( ON ?auto_661224 ?auto_661223 ) ( ON ?auto_661225 ?auto_661224 ) ( ON ?auto_661226 ?auto_661225 ) ( ON ?auto_661227 ?auto_661226 ) ( ON ?auto_661228 ?auto_661227 ) ( ON ?auto_661229 ?auto_661228 ) ( ON ?auto_661230 ?auto_661229 ) ( ON ?auto_661231 ?auto_661230 ) ( not ( = ?auto_661222 ?auto_661223 ) ) ( not ( = ?auto_661222 ?auto_661224 ) ) ( not ( = ?auto_661222 ?auto_661225 ) ) ( not ( = ?auto_661222 ?auto_661226 ) ) ( not ( = ?auto_661222 ?auto_661227 ) ) ( not ( = ?auto_661222 ?auto_661228 ) ) ( not ( = ?auto_661222 ?auto_661229 ) ) ( not ( = ?auto_661222 ?auto_661230 ) ) ( not ( = ?auto_661222 ?auto_661231 ) ) ( not ( = ?auto_661222 ?auto_661232 ) ) ( not ( = ?auto_661222 ?auto_661233 ) ) ( not ( = ?auto_661222 ?auto_661234 ) ) ( not ( = ?auto_661222 ?auto_661235 ) ) ( not ( = ?auto_661222 ?auto_661236 ) ) ( not ( = ?auto_661223 ?auto_661224 ) ) ( not ( = ?auto_661223 ?auto_661225 ) ) ( not ( = ?auto_661223 ?auto_661226 ) ) ( not ( = ?auto_661223 ?auto_661227 ) ) ( not ( = ?auto_661223 ?auto_661228 ) ) ( not ( = ?auto_661223 ?auto_661229 ) ) ( not ( = ?auto_661223 ?auto_661230 ) ) ( not ( = ?auto_661223 ?auto_661231 ) ) ( not ( = ?auto_661223 ?auto_661232 ) ) ( not ( = ?auto_661223 ?auto_661233 ) ) ( not ( = ?auto_661223 ?auto_661234 ) ) ( not ( = ?auto_661223 ?auto_661235 ) ) ( not ( = ?auto_661223 ?auto_661236 ) ) ( not ( = ?auto_661224 ?auto_661225 ) ) ( not ( = ?auto_661224 ?auto_661226 ) ) ( not ( = ?auto_661224 ?auto_661227 ) ) ( not ( = ?auto_661224 ?auto_661228 ) ) ( not ( = ?auto_661224 ?auto_661229 ) ) ( not ( = ?auto_661224 ?auto_661230 ) ) ( not ( = ?auto_661224 ?auto_661231 ) ) ( not ( = ?auto_661224 ?auto_661232 ) ) ( not ( = ?auto_661224 ?auto_661233 ) ) ( not ( = ?auto_661224 ?auto_661234 ) ) ( not ( = ?auto_661224 ?auto_661235 ) ) ( not ( = ?auto_661224 ?auto_661236 ) ) ( not ( = ?auto_661225 ?auto_661226 ) ) ( not ( = ?auto_661225 ?auto_661227 ) ) ( not ( = ?auto_661225 ?auto_661228 ) ) ( not ( = ?auto_661225 ?auto_661229 ) ) ( not ( = ?auto_661225 ?auto_661230 ) ) ( not ( = ?auto_661225 ?auto_661231 ) ) ( not ( = ?auto_661225 ?auto_661232 ) ) ( not ( = ?auto_661225 ?auto_661233 ) ) ( not ( = ?auto_661225 ?auto_661234 ) ) ( not ( = ?auto_661225 ?auto_661235 ) ) ( not ( = ?auto_661225 ?auto_661236 ) ) ( not ( = ?auto_661226 ?auto_661227 ) ) ( not ( = ?auto_661226 ?auto_661228 ) ) ( not ( = ?auto_661226 ?auto_661229 ) ) ( not ( = ?auto_661226 ?auto_661230 ) ) ( not ( = ?auto_661226 ?auto_661231 ) ) ( not ( = ?auto_661226 ?auto_661232 ) ) ( not ( = ?auto_661226 ?auto_661233 ) ) ( not ( = ?auto_661226 ?auto_661234 ) ) ( not ( = ?auto_661226 ?auto_661235 ) ) ( not ( = ?auto_661226 ?auto_661236 ) ) ( not ( = ?auto_661227 ?auto_661228 ) ) ( not ( = ?auto_661227 ?auto_661229 ) ) ( not ( = ?auto_661227 ?auto_661230 ) ) ( not ( = ?auto_661227 ?auto_661231 ) ) ( not ( = ?auto_661227 ?auto_661232 ) ) ( not ( = ?auto_661227 ?auto_661233 ) ) ( not ( = ?auto_661227 ?auto_661234 ) ) ( not ( = ?auto_661227 ?auto_661235 ) ) ( not ( = ?auto_661227 ?auto_661236 ) ) ( not ( = ?auto_661228 ?auto_661229 ) ) ( not ( = ?auto_661228 ?auto_661230 ) ) ( not ( = ?auto_661228 ?auto_661231 ) ) ( not ( = ?auto_661228 ?auto_661232 ) ) ( not ( = ?auto_661228 ?auto_661233 ) ) ( not ( = ?auto_661228 ?auto_661234 ) ) ( not ( = ?auto_661228 ?auto_661235 ) ) ( not ( = ?auto_661228 ?auto_661236 ) ) ( not ( = ?auto_661229 ?auto_661230 ) ) ( not ( = ?auto_661229 ?auto_661231 ) ) ( not ( = ?auto_661229 ?auto_661232 ) ) ( not ( = ?auto_661229 ?auto_661233 ) ) ( not ( = ?auto_661229 ?auto_661234 ) ) ( not ( = ?auto_661229 ?auto_661235 ) ) ( not ( = ?auto_661229 ?auto_661236 ) ) ( not ( = ?auto_661230 ?auto_661231 ) ) ( not ( = ?auto_661230 ?auto_661232 ) ) ( not ( = ?auto_661230 ?auto_661233 ) ) ( not ( = ?auto_661230 ?auto_661234 ) ) ( not ( = ?auto_661230 ?auto_661235 ) ) ( not ( = ?auto_661230 ?auto_661236 ) ) ( not ( = ?auto_661231 ?auto_661232 ) ) ( not ( = ?auto_661231 ?auto_661233 ) ) ( not ( = ?auto_661231 ?auto_661234 ) ) ( not ( = ?auto_661231 ?auto_661235 ) ) ( not ( = ?auto_661231 ?auto_661236 ) ) ( not ( = ?auto_661232 ?auto_661233 ) ) ( not ( = ?auto_661232 ?auto_661234 ) ) ( not ( = ?auto_661232 ?auto_661235 ) ) ( not ( = ?auto_661232 ?auto_661236 ) ) ( not ( = ?auto_661233 ?auto_661234 ) ) ( not ( = ?auto_661233 ?auto_661235 ) ) ( not ( = ?auto_661233 ?auto_661236 ) ) ( not ( = ?auto_661234 ?auto_661235 ) ) ( not ( = ?auto_661234 ?auto_661236 ) ) ( not ( = ?auto_661235 ?auto_661236 ) ) ( ON ?auto_661234 ?auto_661235 ) ( ON ?auto_661233 ?auto_661234 ) ( CLEAR ?auto_661231 ) ( ON ?auto_661232 ?auto_661233 ) ( CLEAR ?auto_661232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_661222 ?auto_661223 ?auto_661224 ?auto_661225 ?auto_661226 ?auto_661227 ?auto_661228 ?auto_661229 ?auto_661230 ?auto_661231 ?auto_661232 )
      ( MAKE-14PILE ?auto_661222 ?auto_661223 ?auto_661224 ?auto_661225 ?auto_661226 ?auto_661227 ?auto_661228 ?auto_661229 ?auto_661230 ?auto_661231 ?auto_661232 ?auto_661233 ?auto_661234 ?auto_661235 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_661280 - BLOCK
      ?auto_661281 - BLOCK
      ?auto_661282 - BLOCK
      ?auto_661283 - BLOCK
      ?auto_661284 - BLOCK
      ?auto_661285 - BLOCK
      ?auto_661286 - BLOCK
      ?auto_661287 - BLOCK
      ?auto_661288 - BLOCK
      ?auto_661289 - BLOCK
      ?auto_661290 - BLOCK
      ?auto_661291 - BLOCK
      ?auto_661292 - BLOCK
      ?auto_661293 - BLOCK
    )
    :vars
    (
      ?auto_661294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661293 ?auto_661294 ) ( ON-TABLE ?auto_661280 ) ( ON ?auto_661281 ?auto_661280 ) ( ON ?auto_661282 ?auto_661281 ) ( ON ?auto_661283 ?auto_661282 ) ( ON ?auto_661284 ?auto_661283 ) ( ON ?auto_661285 ?auto_661284 ) ( ON ?auto_661286 ?auto_661285 ) ( ON ?auto_661287 ?auto_661286 ) ( ON ?auto_661288 ?auto_661287 ) ( not ( = ?auto_661280 ?auto_661281 ) ) ( not ( = ?auto_661280 ?auto_661282 ) ) ( not ( = ?auto_661280 ?auto_661283 ) ) ( not ( = ?auto_661280 ?auto_661284 ) ) ( not ( = ?auto_661280 ?auto_661285 ) ) ( not ( = ?auto_661280 ?auto_661286 ) ) ( not ( = ?auto_661280 ?auto_661287 ) ) ( not ( = ?auto_661280 ?auto_661288 ) ) ( not ( = ?auto_661280 ?auto_661289 ) ) ( not ( = ?auto_661280 ?auto_661290 ) ) ( not ( = ?auto_661280 ?auto_661291 ) ) ( not ( = ?auto_661280 ?auto_661292 ) ) ( not ( = ?auto_661280 ?auto_661293 ) ) ( not ( = ?auto_661280 ?auto_661294 ) ) ( not ( = ?auto_661281 ?auto_661282 ) ) ( not ( = ?auto_661281 ?auto_661283 ) ) ( not ( = ?auto_661281 ?auto_661284 ) ) ( not ( = ?auto_661281 ?auto_661285 ) ) ( not ( = ?auto_661281 ?auto_661286 ) ) ( not ( = ?auto_661281 ?auto_661287 ) ) ( not ( = ?auto_661281 ?auto_661288 ) ) ( not ( = ?auto_661281 ?auto_661289 ) ) ( not ( = ?auto_661281 ?auto_661290 ) ) ( not ( = ?auto_661281 ?auto_661291 ) ) ( not ( = ?auto_661281 ?auto_661292 ) ) ( not ( = ?auto_661281 ?auto_661293 ) ) ( not ( = ?auto_661281 ?auto_661294 ) ) ( not ( = ?auto_661282 ?auto_661283 ) ) ( not ( = ?auto_661282 ?auto_661284 ) ) ( not ( = ?auto_661282 ?auto_661285 ) ) ( not ( = ?auto_661282 ?auto_661286 ) ) ( not ( = ?auto_661282 ?auto_661287 ) ) ( not ( = ?auto_661282 ?auto_661288 ) ) ( not ( = ?auto_661282 ?auto_661289 ) ) ( not ( = ?auto_661282 ?auto_661290 ) ) ( not ( = ?auto_661282 ?auto_661291 ) ) ( not ( = ?auto_661282 ?auto_661292 ) ) ( not ( = ?auto_661282 ?auto_661293 ) ) ( not ( = ?auto_661282 ?auto_661294 ) ) ( not ( = ?auto_661283 ?auto_661284 ) ) ( not ( = ?auto_661283 ?auto_661285 ) ) ( not ( = ?auto_661283 ?auto_661286 ) ) ( not ( = ?auto_661283 ?auto_661287 ) ) ( not ( = ?auto_661283 ?auto_661288 ) ) ( not ( = ?auto_661283 ?auto_661289 ) ) ( not ( = ?auto_661283 ?auto_661290 ) ) ( not ( = ?auto_661283 ?auto_661291 ) ) ( not ( = ?auto_661283 ?auto_661292 ) ) ( not ( = ?auto_661283 ?auto_661293 ) ) ( not ( = ?auto_661283 ?auto_661294 ) ) ( not ( = ?auto_661284 ?auto_661285 ) ) ( not ( = ?auto_661284 ?auto_661286 ) ) ( not ( = ?auto_661284 ?auto_661287 ) ) ( not ( = ?auto_661284 ?auto_661288 ) ) ( not ( = ?auto_661284 ?auto_661289 ) ) ( not ( = ?auto_661284 ?auto_661290 ) ) ( not ( = ?auto_661284 ?auto_661291 ) ) ( not ( = ?auto_661284 ?auto_661292 ) ) ( not ( = ?auto_661284 ?auto_661293 ) ) ( not ( = ?auto_661284 ?auto_661294 ) ) ( not ( = ?auto_661285 ?auto_661286 ) ) ( not ( = ?auto_661285 ?auto_661287 ) ) ( not ( = ?auto_661285 ?auto_661288 ) ) ( not ( = ?auto_661285 ?auto_661289 ) ) ( not ( = ?auto_661285 ?auto_661290 ) ) ( not ( = ?auto_661285 ?auto_661291 ) ) ( not ( = ?auto_661285 ?auto_661292 ) ) ( not ( = ?auto_661285 ?auto_661293 ) ) ( not ( = ?auto_661285 ?auto_661294 ) ) ( not ( = ?auto_661286 ?auto_661287 ) ) ( not ( = ?auto_661286 ?auto_661288 ) ) ( not ( = ?auto_661286 ?auto_661289 ) ) ( not ( = ?auto_661286 ?auto_661290 ) ) ( not ( = ?auto_661286 ?auto_661291 ) ) ( not ( = ?auto_661286 ?auto_661292 ) ) ( not ( = ?auto_661286 ?auto_661293 ) ) ( not ( = ?auto_661286 ?auto_661294 ) ) ( not ( = ?auto_661287 ?auto_661288 ) ) ( not ( = ?auto_661287 ?auto_661289 ) ) ( not ( = ?auto_661287 ?auto_661290 ) ) ( not ( = ?auto_661287 ?auto_661291 ) ) ( not ( = ?auto_661287 ?auto_661292 ) ) ( not ( = ?auto_661287 ?auto_661293 ) ) ( not ( = ?auto_661287 ?auto_661294 ) ) ( not ( = ?auto_661288 ?auto_661289 ) ) ( not ( = ?auto_661288 ?auto_661290 ) ) ( not ( = ?auto_661288 ?auto_661291 ) ) ( not ( = ?auto_661288 ?auto_661292 ) ) ( not ( = ?auto_661288 ?auto_661293 ) ) ( not ( = ?auto_661288 ?auto_661294 ) ) ( not ( = ?auto_661289 ?auto_661290 ) ) ( not ( = ?auto_661289 ?auto_661291 ) ) ( not ( = ?auto_661289 ?auto_661292 ) ) ( not ( = ?auto_661289 ?auto_661293 ) ) ( not ( = ?auto_661289 ?auto_661294 ) ) ( not ( = ?auto_661290 ?auto_661291 ) ) ( not ( = ?auto_661290 ?auto_661292 ) ) ( not ( = ?auto_661290 ?auto_661293 ) ) ( not ( = ?auto_661290 ?auto_661294 ) ) ( not ( = ?auto_661291 ?auto_661292 ) ) ( not ( = ?auto_661291 ?auto_661293 ) ) ( not ( = ?auto_661291 ?auto_661294 ) ) ( not ( = ?auto_661292 ?auto_661293 ) ) ( not ( = ?auto_661292 ?auto_661294 ) ) ( not ( = ?auto_661293 ?auto_661294 ) ) ( ON ?auto_661292 ?auto_661293 ) ( ON ?auto_661291 ?auto_661292 ) ( ON ?auto_661290 ?auto_661291 ) ( CLEAR ?auto_661288 ) ( ON ?auto_661289 ?auto_661290 ) ( CLEAR ?auto_661289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_661280 ?auto_661281 ?auto_661282 ?auto_661283 ?auto_661284 ?auto_661285 ?auto_661286 ?auto_661287 ?auto_661288 ?auto_661289 )
      ( MAKE-14PILE ?auto_661280 ?auto_661281 ?auto_661282 ?auto_661283 ?auto_661284 ?auto_661285 ?auto_661286 ?auto_661287 ?auto_661288 ?auto_661289 ?auto_661290 ?auto_661291 ?auto_661292 ?auto_661293 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_661338 - BLOCK
      ?auto_661339 - BLOCK
      ?auto_661340 - BLOCK
      ?auto_661341 - BLOCK
      ?auto_661342 - BLOCK
      ?auto_661343 - BLOCK
      ?auto_661344 - BLOCK
      ?auto_661345 - BLOCK
      ?auto_661346 - BLOCK
      ?auto_661347 - BLOCK
      ?auto_661348 - BLOCK
      ?auto_661349 - BLOCK
      ?auto_661350 - BLOCK
      ?auto_661351 - BLOCK
    )
    :vars
    (
      ?auto_661352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661351 ?auto_661352 ) ( ON-TABLE ?auto_661338 ) ( ON ?auto_661339 ?auto_661338 ) ( ON ?auto_661340 ?auto_661339 ) ( ON ?auto_661341 ?auto_661340 ) ( ON ?auto_661342 ?auto_661341 ) ( ON ?auto_661343 ?auto_661342 ) ( ON ?auto_661344 ?auto_661343 ) ( ON ?auto_661345 ?auto_661344 ) ( not ( = ?auto_661338 ?auto_661339 ) ) ( not ( = ?auto_661338 ?auto_661340 ) ) ( not ( = ?auto_661338 ?auto_661341 ) ) ( not ( = ?auto_661338 ?auto_661342 ) ) ( not ( = ?auto_661338 ?auto_661343 ) ) ( not ( = ?auto_661338 ?auto_661344 ) ) ( not ( = ?auto_661338 ?auto_661345 ) ) ( not ( = ?auto_661338 ?auto_661346 ) ) ( not ( = ?auto_661338 ?auto_661347 ) ) ( not ( = ?auto_661338 ?auto_661348 ) ) ( not ( = ?auto_661338 ?auto_661349 ) ) ( not ( = ?auto_661338 ?auto_661350 ) ) ( not ( = ?auto_661338 ?auto_661351 ) ) ( not ( = ?auto_661338 ?auto_661352 ) ) ( not ( = ?auto_661339 ?auto_661340 ) ) ( not ( = ?auto_661339 ?auto_661341 ) ) ( not ( = ?auto_661339 ?auto_661342 ) ) ( not ( = ?auto_661339 ?auto_661343 ) ) ( not ( = ?auto_661339 ?auto_661344 ) ) ( not ( = ?auto_661339 ?auto_661345 ) ) ( not ( = ?auto_661339 ?auto_661346 ) ) ( not ( = ?auto_661339 ?auto_661347 ) ) ( not ( = ?auto_661339 ?auto_661348 ) ) ( not ( = ?auto_661339 ?auto_661349 ) ) ( not ( = ?auto_661339 ?auto_661350 ) ) ( not ( = ?auto_661339 ?auto_661351 ) ) ( not ( = ?auto_661339 ?auto_661352 ) ) ( not ( = ?auto_661340 ?auto_661341 ) ) ( not ( = ?auto_661340 ?auto_661342 ) ) ( not ( = ?auto_661340 ?auto_661343 ) ) ( not ( = ?auto_661340 ?auto_661344 ) ) ( not ( = ?auto_661340 ?auto_661345 ) ) ( not ( = ?auto_661340 ?auto_661346 ) ) ( not ( = ?auto_661340 ?auto_661347 ) ) ( not ( = ?auto_661340 ?auto_661348 ) ) ( not ( = ?auto_661340 ?auto_661349 ) ) ( not ( = ?auto_661340 ?auto_661350 ) ) ( not ( = ?auto_661340 ?auto_661351 ) ) ( not ( = ?auto_661340 ?auto_661352 ) ) ( not ( = ?auto_661341 ?auto_661342 ) ) ( not ( = ?auto_661341 ?auto_661343 ) ) ( not ( = ?auto_661341 ?auto_661344 ) ) ( not ( = ?auto_661341 ?auto_661345 ) ) ( not ( = ?auto_661341 ?auto_661346 ) ) ( not ( = ?auto_661341 ?auto_661347 ) ) ( not ( = ?auto_661341 ?auto_661348 ) ) ( not ( = ?auto_661341 ?auto_661349 ) ) ( not ( = ?auto_661341 ?auto_661350 ) ) ( not ( = ?auto_661341 ?auto_661351 ) ) ( not ( = ?auto_661341 ?auto_661352 ) ) ( not ( = ?auto_661342 ?auto_661343 ) ) ( not ( = ?auto_661342 ?auto_661344 ) ) ( not ( = ?auto_661342 ?auto_661345 ) ) ( not ( = ?auto_661342 ?auto_661346 ) ) ( not ( = ?auto_661342 ?auto_661347 ) ) ( not ( = ?auto_661342 ?auto_661348 ) ) ( not ( = ?auto_661342 ?auto_661349 ) ) ( not ( = ?auto_661342 ?auto_661350 ) ) ( not ( = ?auto_661342 ?auto_661351 ) ) ( not ( = ?auto_661342 ?auto_661352 ) ) ( not ( = ?auto_661343 ?auto_661344 ) ) ( not ( = ?auto_661343 ?auto_661345 ) ) ( not ( = ?auto_661343 ?auto_661346 ) ) ( not ( = ?auto_661343 ?auto_661347 ) ) ( not ( = ?auto_661343 ?auto_661348 ) ) ( not ( = ?auto_661343 ?auto_661349 ) ) ( not ( = ?auto_661343 ?auto_661350 ) ) ( not ( = ?auto_661343 ?auto_661351 ) ) ( not ( = ?auto_661343 ?auto_661352 ) ) ( not ( = ?auto_661344 ?auto_661345 ) ) ( not ( = ?auto_661344 ?auto_661346 ) ) ( not ( = ?auto_661344 ?auto_661347 ) ) ( not ( = ?auto_661344 ?auto_661348 ) ) ( not ( = ?auto_661344 ?auto_661349 ) ) ( not ( = ?auto_661344 ?auto_661350 ) ) ( not ( = ?auto_661344 ?auto_661351 ) ) ( not ( = ?auto_661344 ?auto_661352 ) ) ( not ( = ?auto_661345 ?auto_661346 ) ) ( not ( = ?auto_661345 ?auto_661347 ) ) ( not ( = ?auto_661345 ?auto_661348 ) ) ( not ( = ?auto_661345 ?auto_661349 ) ) ( not ( = ?auto_661345 ?auto_661350 ) ) ( not ( = ?auto_661345 ?auto_661351 ) ) ( not ( = ?auto_661345 ?auto_661352 ) ) ( not ( = ?auto_661346 ?auto_661347 ) ) ( not ( = ?auto_661346 ?auto_661348 ) ) ( not ( = ?auto_661346 ?auto_661349 ) ) ( not ( = ?auto_661346 ?auto_661350 ) ) ( not ( = ?auto_661346 ?auto_661351 ) ) ( not ( = ?auto_661346 ?auto_661352 ) ) ( not ( = ?auto_661347 ?auto_661348 ) ) ( not ( = ?auto_661347 ?auto_661349 ) ) ( not ( = ?auto_661347 ?auto_661350 ) ) ( not ( = ?auto_661347 ?auto_661351 ) ) ( not ( = ?auto_661347 ?auto_661352 ) ) ( not ( = ?auto_661348 ?auto_661349 ) ) ( not ( = ?auto_661348 ?auto_661350 ) ) ( not ( = ?auto_661348 ?auto_661351 ) ) ( not ( = ?auto_661348 ?auto_661352 ) ) ( not ( = ?auto_661349 ?auto_661350 ) ) ( not ( = ?auto_661349 ?auto_661351 ) ) ( not ( = ?auto_661349 ?auto_661352 ) ) ( not ( = ?auto_661350 ?auto_661351 ) ) ( not ( = ?auto_661350 ?auto_661352 ) ) ( not ( = ?auto_661351 ?auto_661352 ) ) ( ON ?auto_661350 ?auto_661351 ) ( ON ?auto_661349 ?auto_661350 ) ( ON ?auto_661348 ?auto_661349 ) ( ON ?auto_661347 ?auto_661348 ) ( CLEAR ?auto_661345 ) ( ON ?auto_661346 ?auto_661347 ) ( CLEAR ?auto_661346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_661338 ?auto_661339 ?auto_661340 ?auto_661341 ?auto_661342 ?auto_661343 ?auto_661344 ?auto_661345 ?auto_661346 )
      ( MAKE-14PILE ?auto_661338 ?auto_661339 ?auto_661340 ?auto_661341 ?auto_661342 ?auto_661343 ?auto_661344 ?auto_661345 ?auto_661346 ?auto_661347 ?auto_661348 ?auto_661349 ?auto_661350 ?auto_661351 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_661396 - BLOCK
      ?auto_661397 - BLOCK
      ?auto_661398 - BLOCK
      ?auto_661399 - BLOCK
      ?auto_661400 - BLOCK
      ?auto_661401 - BLOCK
      ?auto_661402 - BLOCK
      ?auto_661403 - BLOCK
      ?auto_661404 - BLOCK
      ?auto_661405 - BLOCK
      ?auto_661406 - BLOCK
      ?auto_661407 - BLOCK
      ?auto_661408 - BLOCK
      ?auto_661409 - BLOCK
    )
    :vars
    (
      ?auto_661410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661409 ?auto_661410 ) ( ON-TABLE ?auto_661396 ) ( ON ?auto_661397 ?auto_661396 ) ( ON ?auto_661398 ?auto_661397 ) ( ON ?auto_661399 ?auto_661398 ) ( ON ?auto_661400 ?auto_661399 ) ( ON ?auto_661401 ?auto_661400 ) ( ON ?auto_661402 ?auto_661401 ) ( not ( = ?auto_661396 ?auto_661397 ) ) ( not ( = ?auto_661396 ?auto_661398 ) ) ( not ( = ?auto_661396 ?auto_661399 ) ) ( not ( = ?auto_661396 ?auto_661400 ) ) ( not ( = ?auto_661396 ?auto_661401 ) ) ( not ( = ?auto_661396 ?auto_661402 ) ) ( not ( = ?auto_661396 ?auto_661403 ) ) ( not ( = ?auto_661396 ?auto_661404 ) ) ( not ( = ?auto_661396 ?auto_661405 ) ) ( not ( = ?auto_661396 ?auto_661406 ) ) ( not ( = ?auto_661396 ?auto_661407 ) ) ( not ( = ?auto_661396 ?auto_661408 ) ) ( not ( = ?auto_661396 ?auto_661409 ) ) ( not ( = ?auto_661396 ?auto_661410 ) ) ( not ( = ?auto_661397 ?auto_661398 ) ) ( not ( = ?auto_661397 ?auto_661399 ) ) ( not ( = ?auto_661397 ?auto_661400 ) ) ( not ( = ?auto_661397 ?auto_661401 ) ) ( not ( = ?auto_661397 ?auto_661402 ) ) ( not ( = ?auto_661397 ?auto_661403 ) ) ( not ( = ?auto_661397 ?auto_661404 ) ) ( not ( = ?auto_661397 ?auto_661405 ) ) ( not ( = ?auto_661397 ?auto_661406 ) ) ( not ( = ?auto_661397 ?auto_661407 ) ) ( not ( = ?auto_661397 ?auto_661408 ) ) ( not ( = ?auto_661397 ?auto_661409 ) ) ( not ( = ?auto_661397 ?auto_661410 ) ) ( not ( = ?auto_661398 ?auto_661399 ) ) ( not ( = ?auto_661398 ?auto_661400 ) ) ( not ( = ?auto_661398 ?auto_661401 ) ) ( not ( = ?auto_661398 ?auto_661402 ) ) ( not ( = ?auto_661398 ?auto_661403 ) ) ( not ( = ?auto_661398 ?auto_661404 ) ) ( not ( = ?auto_661398 ?auto_661405 ) ) ( not ( = ?auto_661398 ?auto_661406 ) ) ( not ( = ?auto_661398 ?auto_661407 ) ) ( not ( = ?auto_661398 ?auto_661408 ) ) ( not ( = ?auto_661398 ?auto_661409 ) ) ( not ( = ?auto_661398 ?auto_661410 ) ) ( not ( = ?auto_661399 ?auto_661400 ) ) ( not ( = ?auto_661399 ?auto_661401 ) ) ( not ( = ?auto_661399 ?auto_661402 ) ) ( not ( = ?auto_661399 ?auto_661403 ) ) ( not ( = ?auto_661399 ?auto_661404 ) ) ( not ( = ?auto_661399 ?auto_661405 ) ) ( not ( = ?auto_661399 ?auto_661406 ) ) ( not ( = ?auto_661399 ?auto_661407 ) ) ( not ( = ?auto_661399 ?auto_661408 ) ) ( not ( = ?auto_661399 ?auto_661409 ) ) ( not ( = ?auto_661399 ?auto_661410 ) ) ( not ( = ?auto_661400 ?auto_661401 ) ) ( not ( = ?auto_661400 ?auto_661402 ) ) ( not ( = ?auto_661400 ?auto_661403 ) ) ( not ( = ?auto_661400 ?auto_661404 ) ) ( not ( = ?auto_661400 ?auto_661405 ) ) ( not ( = ?auto_661400 ?auto_661406 ) ) ( not ( = ?auto_661400 ?auto_661407 ) ) ( not ( = ?auto_661400 ?auto_661408 ) ) ( not ( = ?auto_661400 ?auto_661409 ) ) ( not ( = ?auto_661400 ?auto_661410 ) ) ( not ( = ?auto_661401 ?auto_661402 ) ) ( not ( = ?auto_661401 ?auto_661403 ) ) ( not ( = ?auto_661401 ?auto_661404 ) ) ( not ( = ?auto_661401 ?auto_661405 ) ) ( not ( = ?auto_661401 ?auto_661406 ) ) ( not ( = ?auto_661401 ?auto_661407 ) ) ( not ( = ?auto_661401 ?auto_661408 ) ) ( not ( = ?auto_661401 ?auto_661409 ) ) ( not ( = ?auto_661401 ?auto_661410 ) ) ( not ( = ?auto_661402 ?auto_661403 ) ) ( not ( = ?auto_661402 ?auto_661404 ) ) ( not ( = ?auto_661402 ?auto_661405 ) ) ( not ( = ?auto_661402 ?auto_661406 ) ) ( not ( = ?auto_661402 ?auto_661407 ) ) ( not ( = ?auto_661402 ?auto_661408 ) ) ( not ( = ?auto_661402 ?auto_661409 ) ) ( not ( = ?auto_661402 ?auto_661410 ) ) ( not ( = ?auto_661403 ?auto_661404 ) ) ( not ( = ?auto_661403 ?auto_661405 ) ) ( not ( = ?auto_661403 ?auto_661406 ) ) ( not ( = ?auto_661403 ?auto_661407 ) ) ( not ( = ?auto_661403 ?auto_661408 ) ) ( not ( = ?auto_661403 ?auto_661409 ) ) ( not ( = ?auto_661403 ?auto_661410 ) ) ( not ( = ?auto_661404 ?auto_661405 ) ) ( not ( = ?auto_661404 ?auto_661406 ) ) ( not ( = ?auto_661404 ?auto_661407 ) ) ( not ( = ?auto_661404 ?auto_661408 ) ) ( not ( = ?auto_661404 ?auto_661409 ) ) ( not ( = ?auto_661404 ?auto_661410 ) ) ( not ( = ?auto_661405 ?auto_661406 ) ) ( not ( = ?auto_661405 ?auto_661407 ) ) ( not ( = ?auto_661405 ?auto_661408 ) ) ( not ( = ?auto_661405 ?auto_661409 ) ) ( not ( = ?auto_661405 ?auto_661410 ) ) ( not ( = ?auto_661406 ?auto_661407 ) ) ( not ( = ?auto_661406 ?auto_661408 ) ) ( not ( = ?auto_661406 ?auto_661409 ) ) ( not ( = ?auto_661406 ?auto_661410 ) ) ( not ( = ?auto_661407 ?auto_661408 ) ) ( not ( = ?auto_661407 ?auto_661409 ) ) ( not ( = ?auto_661407 ?auto_661410 ) ) ( not ( = ?auto_661408 ?auto_661409 ) ) ( not ( = ?auto_661408 ?auto_661410 ) ) ( not ( = ?auto_661409 ?auto_661410 ) ) ( ON ?auto_661408 ?auto_661409 ) ( ON ?auto_661407 ?auto_661408 ) ( ON ?auto_661406 ?auto_661407 ) ( ON ?auto_661405 ?auto_661406 ) ( ON ?auto_661404 ?auto_661405 ) ( CLEAR ?auto_661402 ) ( ON ?auto_661403 ?auto_661404 ) ( CLEAR ?auto_661403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_661396 ?auto_661397 ?auto_661398 ?auto_661399 ?auto_661400 ?auto_661401 ?auto_661402 ?auto_661403 )
      ( MAKE-14PILE ?auto_661396 ?auto_661397 ?auto_661398 ?auto_661399 ?auto_661400 ?auto_661401 ?auto_661402 ?auto_661403 ?auto_661404 ?auto_661405 ?auto_661406 ?auto_661407 ?auto_661408 ?auto_661409 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_661454 - BLOCK
      ?auto_661455 - BLOCK
      ?auto_661456 - BLOCK
      ?auto_661457 - BLOCK
      ?auto_661458 - BLOCK
      ?auto_661459 - BLOCK
      ?auto_661460 - BLOCK
      ?auto_661461 - BLOCK
      ?auto_661462 - BLOCK
      ?auto_661463 - BLOCK
      ?auto_661464 - BLOCK
      ?auto_661465 - BLOCK
      ?auto_661466 - BLOCK
      ?auto_661467 - BLOCK
    )
    :vars
    (
      ?auto_661468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661467 ?auto_661468 ) ( ON-TABLE ?auto_661454 ) ( ON ?auto_661455 ?auto_661454 ) ( ON ?auto_661456 ?auto_661455 ) ( ON ?auto_661457 ?auto_661456 ) ( ON ?auto_661458 ?auto_661457 ) ( ON ?auto_661459 ?auto_661458 ) ( not ( = ?auto_661454 ?auto_661455 ) ) ( not ( = ?auto_661454 ?auto_661456 ) ) ( not ( = ?auto_661454 ?auto_661457 ) ) ( not ( = ?auto_661454 ?auto_661458 ) ) ( not ( = ?auto_661454 ?auto_661459 ) ) ( not ( = ?auto_661454 ?auto_661460 ) ) ( not ( = ?auto_661454 ?auto_661461 ) ) ( not ( = ?auto_661454 ?auto_661462 ) ) ( not ( = ?auto_661454 ?auto_661463 ) ) ( not ( = ?auto_661454 ?auto_661464 ) ) ( not ( = ?auto_661454 ?auto_661465 ) ) ( not ( = ?auto_661454 ?auto_661466 ) ) ( not ( = ?auto_661454 ?auto_661467 ) ) ( not ( = ?auto_661454 ?auto_661468 ) ) ( not ( = ?auto_661455 ?auto_661456 ) ) ( not ( = ?auto_661455 ?auto_661457 ) ) ( not ( = ?auto_661455 ?auto_661458 ) ) ( not ( = ?auto_661455 ?auto_661459 ) ) ( not ( = ?auto_661455 ?auto_661460 ) ) ( not ( = ?auto_661455 ?auto_661461 ) ) ( not ( = ?auto_661455 ?auto_661462 ) ) ( not ( = ?auto_661455 ?auto_661463 ) ) ( not ( = ?auto_661455 ?auto_661464 ) ) ( not ( = ?auto_661455 ?auto_661465 ) ) ( not ( = ?auto_661455 ?auto_661466 ) ) ( not ( = ?auto_661455 ?auto_661467 ) ) ( not ( = ?auto_661455 ?auto_661468 ) ) ( not ( = ?auto_661456 ?auto_661457 ) ) ( not ( = ?auto_661456 ?auto_661458 ) ) ( not ( = ?auto_661456 ?auto_661459 ) ) ( not ( = ?auto_661456 ?auto_661460 ) ) ( not ( = ?auto_661456 ?auto_661461 ) ) ( not ( = ?auto_661456 ?auto_661462 ) ) ( not ( = ?auto_661456 ?auto_661463 ) ) ( not ( = ?auto_661456 ?auto_661464 ) ) ( not ( = ?auto_661456 ?auto_661465 ) ) ( not ( = ?auto_661456 ?auto_661466 ) ) ( not ( = ?auto_661456 ?auto_661467 ) ) ( not ( = ?auto_661456 ?auto_661468 ) ) ( not ( = ?auto_661457 ?auto_661458 ) ) ( not ( = ?auto_661457 ?auto_661459 ) ) ( not ( = ?auto_661457 ?auto_661460 ) ) ( not ( = ?auto_661457 ?auto_661461 ) ) ( not ( = ?auto_661457 ?auto_661462 ) ) ( not ( = ?auto_661457 ?auto_661463 ) ) ( not ( = ?auto_661457 ?auto_661464 ) ) ( not ( = ?auto_661457 ?auto_661465 ) ) ( not ( = ?auto_661457 ?auto_661466 ) ) ( not ( = ?auto_661457 ?auto_661467 ) ) ( not ( = ?auto_661457 ?auto_661468 ) ) ( not ( = ?auto_661458 ?auto_661459 ) ) ( not ( = ?auto_661458 ?auto_661460 ) ) ( not ( = ?auto_661458 ?auto_661461 ) ) ( not ( = ?auto_661458 ?auto_661462 ) ) ( not ( = ?auto_661458 ?auto_661463 ) ) ( not ( = ?auto_661458 ?auto_661464 ) ) ( not ( = ?auto_661458 ?auto_661465 ) ) ( not ( = ?auto_661458 ?auto_661466 ) ) ( not ( = ?auto_661458 ?auto_661467 ) ) ( not ( = ?auto_661458 ?auto_661468 ) ) ( not ( = ?auto_661459 ?auto_661460 ) ) ( not ( = ?auto_661459 ?auto_661461 ) ) ( not ( = ?auto_661459 ?auto_661462 ) ) ( not ( = ?auto_661459 ?auto_661463 ) ) ( not ( = ?auto_661459 ?auto_661464 ) ) ( not ( = ?auto_661459 ?auto_661465 ) ) ( not ( = ?auto_661459 ?auto_661466 ) ) ( not ( = ?auto_661459 ?auto_661467 ) ) ( not ( = ?auto_661459 ?auto_661468 ) ) ( not ( = ?auto_661460 ?auto_661461 ) ) ( not ( = ?auto_661460 ?auto_661462 ) ) ( not ( = ?auto_661460 ?auto_661463 ) ) ( not ( = ?auto_661460 ?auto_661464 ) ) ( not ( = ?auto_661460 ?auto_661465 ) ) ( not ( = ?auto_661460 ?auto_661466 ) ) ( not ( = ?auto_661460 ?auto_661467 ) ) ( not ( = ?auto_661460 ?auto_661468 ) ) ( not ( = ?auto_661461 ?auto_661462 ) ) ( not ( = ?auto_661461 ?auto_661463 ) ) ( not ( = ?auto_661461 ?auto_661464 ) ) ( not ( = ?auto_661461 ?auto_661465 ) ) ( not ( = ?auto_661461 ?auto_661466 ) ) ( not ( = ?auto_661461 ?auto_661467 ) ) ( not ( = ?auto_661461 ?auto_661468 ) ) ( not ( = ?auto_661462 ?auto_661463 ) ) ( not ( = ?auto_661462 ?auto_661464 ) ) ( not ( = ?auto_661462 ?auto_661465 ) ) ( not ( = ?auto_661462 ?auto_661466 ) ) ( not ( = ?auto_661462 ?auto_661467 ) ) ( not ( = ?auto_661462 ?auto_661468 ) ) ( not ( = ?auto_661463 ?auto_661464 ) ) ( not ( = ?auto_661463 ?auto_661465 ) ) ( not ( = ?auto_661463 ?auto_661466 ) ) ( not ( = ?auto_661463 ?auto_661467 ) ) ( not ( = ?auto_661463 ?auto_661468 ) ) ( not ( = ?auto_661464 ?auto_661465 ) ) ( not ( = ?auto_661464 ?auto_661466 ) ) ( not ( = ?auto_661464 ?auto_661467 ) ) ( not ( = ?auto_661464 ?auto_661468 ) ) ( not ( = ?auto_661465 ?auto_661466 ) ) ( not ( = ?auto_661465 ?auto_661467 ) ) ( not ( = ?auto_661465 ?auto_661468 ) ) ( not ( = ?auto_661466 ?auto_661467 ) ) ( not ( = ?auto_661466 ?auto_661468 ) ) ( not ( = ?auto_661467 ?auto_661468 ) ) ( ON ?auto_661466 ?auto_661467 ) ( ON ?auto_661465 ?auto_661466 ) ( ON ?auto_661464 ?auto_661465 ) ( ON ?auto_661463 ?auto_661464 ) ( ON ?auto_661462 ?auto_661463 ) ( ON ?auto_661461 ?auto_661462 ) ( CLEAR ?auto_661459 ) ( ON ?auto_661460 ?auto_661461 ) ( CLEAR ?auto_661460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_661454 ?auto_661455 ?auto_661456 ?auto_661457 ?auto_661458 ?auto_661459 ?auto_661460 )
      ( MAKE-14PILE ?auto_661454 ?auto_661455 ?auto_661456 ?auto_661457 ?auto_661458 ?auto_661459 ?auto_661460 ?auto_661461 ?auto_661462 ?auto_661463 ?auto_661464 ?auto_661465 ?auto_661466 ?auto_661467 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_661512 - BLOCK
      ?auto_661513 - BLOCK
      ?auto_661514 - BLOCK
      ?auto_661515 - BLOCK
      ?auto_661516 - BLOCK
      ?auto_661517 - BLOCK
      ?auto_661518 - BLOCK
      ?auto_661519 - BLOCK
      ?auto_661520 - BLOCK
      ?auto_661521 - BLOCK
      ?auto_661522 - BLOCK
      ?auto_661523 - BLOCK
      ?auto_661524 - BLOCK
      ?auto_661525 - BLOCK
    )
    :vars
    (
      ?auto_661526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661525 ?auto_661526 ) ( ON-TABLE ?auto_661512 ) ( ON ?auto_661513 ?auto_661512 ) ( ON ?auto_661514 ?auto_661513 ) ( ON ?auto_661515 ?auto_661514 ) ( ON ?auto_661516 ?auto_661515 ) ( not ( = ?auto_661512 ?auto_661513 ) ) ( not ( = ?auto_661512 ?auto_661514 ) ) ( not ( = ?auto_661512 ?auto_661515 ) ) ( not ( = ?auto_661512 ?auto_661516 ) ) ( not ( = ?auto_661512 ?auto_661517 ) ) ( not ( = ?auto_661512 ?auto_661518 ) ) ( not ( = ?auto_661512 ?auto_661519 ) ) ( not ( = ?auto_661512 ?auto_661520 ) ) ( not ( = ?auto_661512 ?auto_661521 ) ) ( not ( = ?auto_661512 ?auto_661522 ) ) ( not ( = ?auto_661512 ?auto_661523 ) ) ( not ( = ?auto_661512 ?auto_661524 ) ) ( not ( = ?auto_661512 ?auto_661525 ) ) ( not ( = ?auto_661512 ?auto_661526 ) ) ( not ( = ?auto_661513 ?auto_661514 ) ) ( not ( = ?auto_661513 ?auto_661515 ) ) ( not ( = ?auto_661513 ?auto_661516 ) ) ( not ( = ?auto_661513 ?auto_661517 ) ) ( not ( = ?auto_661513 ?auto_661518 ) ) ( not ( = ?auto_661513 ?auto_661519 ) ) ( not ( = ?auto_661513 ?auto_661520 ) ) ( not ( = ?auto_661513 ?auto_661521 ) ) ( not ( = ?auto_661513 ?auto_661522 ) ) ( not ( = ?auto_661513 ?auto_661523 ) ) ( not ( = ?auto_661513 ?auto_661524 ) ) ( not ( = ?auto_661513 ?auto_661525 ) ) ( not ( = ?auto_661513 ?auto_661526 ) ) ( not ( = ?auto_661514 ?auto_661515 ) ) ( not ( = ?auto_661514 ?auto_661516 ) ) ( not ( = ?auto_661514 ?auto_661517 ) ) ( not ( = ?auto_661514 ?auto_661518 ) ) ( not ( = ?auto_661514 ?auto_661519 ) ) ( not ( = ?auto_661514 ?auto_661520 ) ) ( not ( = ?auto_661514 ?auto_661521 ) ) ( not ( = ?auto_661514 ?auto_661522 ) ) ( not ( = ?auto_661514 ?auto_661523 ) ) ( not ( = ?auto_661514 ?auto_661524 ) ) ( not ( = ?auto_661514 ?auto_661525 ) ) ( not ( = ?auto_661514 ?auto_661526 ) ) ( not ( = ?auto_661515 ?auto_661516 ) ) ( not ( = ?auto_661515 ?auto_661517 ) ) ( not ( = ?auto_661515 ?auto_661518 ) ) ( not ( = ?auto_661515 ?auto_661519 ) ) ( not ( = ?auto_661515 ?auto_661520 ) ) ( not ( = ?auto_661515 ?auto_661521 ) ) ( not ( = ?auto_661515 ?auto_661522 ) ) ( not ( = ?auto_661515 ?auto_661523 ) ) ( not ( = ?auto_661515 ?auto_661524 ) ) ( not ( = ?auto_661515 ?auto_661525 ) ) ( not ( = ?auto_661515 ?auto_661526 ) ) ( not ( = ?auto_661516 ?auto_661517 ) ) ( not ( = ?auto_661516 ?auto_661518 ) ) ( not ( = ?auto_661516 ?auto_661519 ) ) ( not ( = ?auto_661516 ?auto_661520 ) ) ( not ( = ?auto_661516 ?auto_661521 ) ) ( not ( = ?auto_661516 ?auto_661522 ) ) ( not ( = ?auto_661516 ?auto_661523 ) ) ( not ( = ?auto_661516 ?auto_661524 ) ) ( not ( = ?auto_661516 ?auto_661525 ) ) ( not ( = ?auto_661516 ?auto_661526 ) ) ( not ( = ?auto_661517 ?auto_661518 ) ) ( not ( = ?auto_661517 ?auto_661519 ) ) ( not ( = ?auto_661517 ?auto_661520 ) ) ( not ( = ?auto_661517 ?auto_661521 ) ) ( not ( = ?auto_661517 ?auto_661522 ) ) ( not ( = ?auto_661517 ?auto_661523 ) ) ( not ( = ?auto_661517 ?auto_661524 ) ) ( not ( = ?auto_661517 ?auto_661525 ) ) ( not ( = ?auto_661517 ?auto_661526 ) ) ( not ( = ?auto_661518 ?auto_661519 ) ) ( not ( = ?auto_661518 ?auto_661520 ) ) ( not ( = ?auto_661518 ?auto_661521 ) ) ( not ( = ?auto_661518 ?auto_661522 ) ) ( not ( = ?auto_661518 ?auto_661523 ) ) ( not ( = ?auto_661518 ?auto_661524 ) ) ( not ( = ?auto_661518 ?auto_661525 ) ) ( not ( = ?auto_661518 ?auto_661526 ) ) ( not ( = ?auto_661519 ?auto_661520 ) ) ( not ( = ?auto_661519 ?auto_661521 ) ) ( not ( = ?auto_661519 ?auto_661522 ) ) ( not ( = ?auto_661519 ?auto_661523 ) ) ( not ( = ?auto_661519 ?auto_661524 ) ) ( not ( = ?auto_661519 ?auto_661525 ) ) ( not ( = ?auto_661519 ?auto_661526 ) ) ( not ( = ?auto_661520 ?auto_661521 ) ) ( not ( = ?auto_661520 ?auto_661522 ) ) ( not ( = ?auto_661520 ?auto_661523 ) ) ( not ( = ?auto_661520 ?auto_661524 ) ) ( not ( = ?auto_661520 ?auto_661525 ) ) ( not ( = ?auto_661520 ?auto_661526 ) ) ( not ( = ?auto_661521 ?auto_661522 ) ) ( not ( = ?auto_661521 ?auto_661523 ) ) ( not ( = ?auto_661521 ?auto_661524 ) ) ( not ( = ?auto_661521 ?auto_661525 ) ) ( not ( = ?auto_661521 ?auto_661526 ) ) ( not ( = ?auto_661522 ?auto_661523 ) ) ( not ( = ?auto_661522 ?auto_661524 ) ) ( not ( = ?auto_661522 ?auto_661525 ) ) ( not ( = ?auto_661522 ?auto_661526 ) ) ( not ( = ?auto_661523 ?auto_661524 ) ) ( not ( = ?auto_661523 ?auto_661525 ) ) ( not ( = ?auto_661523 ?auto_661526 ) ) ( not ( = ?auto_661524 ?auto_661525 ) ) ( not ( = ?auto_661524 ?auto_661526 ) ) ( not ( = ?auto_661525 ?auto_661526 ) ) ( ON ?auto_661524 ?auto_661525 ) ( ON ?auto_661523 ?auto_661524 ) ( ON ?auto_661522 ?auto_661523 ) ( ON ?auto_661521 ?auto_661522 ) ( ON ?auto_661520 ?auto_661521 ) ( ON ?auto_661519 ?auto_661520 ) ( ON ?auto_661518 ?auto_661519 ) ( CLEAR ?auto_661516 ) ( ON ?auto_661517 ?auto_661518 ) ( CLEAR ?auto_661517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_661512 ?auto_661513 ?auto_661514 ?auto_661515 ?auto_661516 ?auto_661517 )
      ( MAKE-14PILE ?auto_661512 ?auto_661513 ?auto_661514 ?auto_661515 ?auto_661516 ?auto_661517 ?auto_661518 ?auto_661519 ?auto_661520 ?auto_661521 ?auto_661522 ?auto_661523 ?auto_661524 ?auto_661525 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_661570 - BLOCK
      ?auto_661571 - BLOCK
      ?auto_661572 - BLOCK
      ?auto_661573 - BLOCK
      ?auto_661574 - BLOCK
      ?auto_661575 - BLOCK
      ?auto_661576 - BLOCK
      ?auto_661577 - BLOCK
      ?auto_661578 - BLOCK
      ?auto_661579 - BLOCK
      ?auto_661580 - BLOCK
      ?auto_661581 - BLOCK
      ?auto_661582 - BLOCK
      ?auto_661583 - BLOCK
    )
    :vars
    (
      ?auto_661584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661583 ?auto_661584 ) ( ON-TABLE ?auto_661570 ) ( ON ?auto_661571 ?auto_661570 ) ( ON ?auto_661572 ?auto_661571 ) ( ON ?auto_661573 ?auto_661572 ) ( not ( = ?auto_661570 ?auto_661571 ) ) ( not ( = ?auto_661570 ?auto_661572 ) ) ( not ( = ?auto_661570 ?auto_661573 ) ) ( not ( = ?auto_661570 ?auto_661574 ) ) ( not ( = ?auto_661570 ?auto_661575 ) ) ( not ( = ?auto_661570 ?auto_661576 ) ) ( not ( = ?auto_661570 ?auto_661577 ) ) ( not ( = ?auto_661570 ?auto_661578 ) ) ( not ( = ?auto_661570 ?auto_661579 ) ) ( not ( = ?auto_661570 ?auto_661580 ) ) ( not ( = ?auto_661570 ?auto_661581 ) ) ( not ( = ?auto_661570 ?auto_661582 ) ) ( not ( = ?auto_661570 ?auto_661583 ) ) ( not ( = ?auto_661570 ?auto_661584 ) ) ( not ( = ?auto_661571 ?auto_661572 ) ) ( not ( = ?auto_661571 ?auto_661573 ) ) ( not ( = ?auto_661571 ?auto_661574 ) ) ( not ( = ?auto_661571 ?auto_661575 ) ) ( not ( = ?auto_661571 ?auto_661576 ) ) ( not ( = ?auto_661571 ?auto_661577 ) ) ( not ( = ?auto_661571 ?auto_661578 ) ) ( not ( = ?auto_661571 ?auto_661579 ) ) ( not ( = ?auto_661571 ?auto_661580 ) ) ( not ( = ?auto_661571 ?auto_661581 ) ) ( not ( = ?auto_661571 ?auto_661582 ) ) ( not ( = ?auto_661571 ?auto_661583 ) ) ( not ( = ?auto_661571 ?auto_661584 ) ) ( not ( = ?auto_661572 ?auto_661573 ) ) ( not ( = ?auto_661572 ?auto_661574 ) ) ( not ( = ?auto_661572 ?auto_661575 ) ) ( not ( = ?auto_661572 ?auto_661576 ) ) ( not ( = ?auto_661572 ?auto_661577 ) ) ( not ( = ?auto_661572 ?auto_661578 ) ) ( not ( = ?auto_661572 ?auto_661579 ) ) ( not ( = ?auto_661572 ?auto_661580 ) ) ( not ( = ?auto_661572 ?auto_661581 ) ) ( not ( = ?auto_661572 ?auto_661582 ) ) ( not ( = ?auto_661572 ?auto_661583 ) ) ( not ( = ?auto_661572 ?auto_661584 ) ) ( not ( = ?auto_661573 ?auto_661574 ) ) ( not ( = ?auto_661573 ?auto_661575 ) ) ( not ( = ?auto_661573 ?auto_661576 ) ) ( not ( = ?auto_661573 ?auto_661577 ) ) ( not ( = ?auto_661573 ?auto_661578 ) ) ( not ( = ?auto_661573 ?auto_661579 ) ) ( not ( = ?auto_661573 ?auto_661580 ) ) ( not ( = ?auto_661573 ?auto_661581 ) ) ( not ( = ?auto_661573 ?auto_661582 ) ) ( not ( = ?auto_661573 ?auto_661583 ) ) ( not ( = ?auto_661573 ?auto_661584 ) ) ( not ( = ?auto_661574 ?auto_661575 ) ) ( not ( = ?auto_661574 ?auto_661576 ) ) ( not ( = ?auto_661574 ?auto_661577 ) ) ( not ( = ?auto_661574 ?auto_661578 ) ) ( not ( = ?auto_661574 ?auto_661579 ) ) ( not ( = ?auto_661574 ?auto_661580 ) ) ( not ( = ?auto_661574 ?auto_661581 ) ) ( not ( = ?auto_661574 ?auto_661582 ) ) ( not ( = ?auto_661574 ?auto_661583 ) ) ( not ( = ?auto_661574 ?auto_661584 ) ) ( not ( = ?auto_661575 ?auto_661576 ) ) ( not ( = ?auto_661575 ?auto_661577 ) ) ( not ( = ?auto_661575 ?auto_661578 ) ) ( not ( = ?auto_661575 ?auto_661579 ) ) ( not ( = ?auto_661575 ?auto_661580 ) ) ( not ( = ?auto_661575 ?auto_661581 ) ) ( not ( = ?auto_661575 ?auto_661582 ) ) ( not ( = ?auto_661575 ?auto_661583 ) ) ( not ( = ?auto_661575 ?auto_661584 ) ) ( not ( = ?auto_661576 ?auto_661577 ) ) ( not ( = ?auto_661576 ?auto_661578 ) ) ( not ( = ?auto_661576 ?auto_661579 ) ) ( not ( = ?auto_661576 ?auto_661580 ) ) ( not ( = ?auto_661576 ?auto_661581 ) ) ( not ( = ?auto_661576 ?auto_661582 ) ) ( not ( = ?auto_661576 ?auto_661583 ) ) ( not ( = ?auto_661576 ?auto_661584 ) ) ( not ( = ?auto_661577 ?auto_661578 ) ) ( not ( = ?auto_661577 ?auto_661579 ) ) ( not ( = ?auto_661577 ?auto_661580 ) ) ( not ( = ?auto_661577 ?auto_661581 ) ) ( not ( = ?auto_661577 ?auto_661582 ) ) ( not ( = ?auto_661577 ?auto_661583 ) ) ( not ( = ?auto_661577 ?auto_661584 ) ) ( not ( = ?auto_661578 ?auto_661579 ) ) ( not ( = ?auto_661578 ?auto_661580 ) ) ( not ( = ?auto_661578 ?auto_661581 ) ) ( not ( = ?auto_661578 ?auto_661582 ) ) ( not ( = ?auto_661578 ?auto_661583 ) ) ( not ( = ?auto_661578 ?auto_661584 ) ) ( not ( = ?auto_661579 ?auto_661580 ) ) ( not ( = ?auto_661579 ?auto_661581 ) ) ( not ( = ?auto_661579 ?auto_661582 ) ) ( not ( = ?auto_661579 ?auto_661583 ) ) ( not ( = ?auto_661579 ?auto_661584 ) ) ( not ( = ?auto_661580 ?auto_661581 ) ) ( not ( = ?auto_661580 ?auto_661582 ) ) ( not ( = ?auto_661580 ?auto_661583 ) ) ( not ( = ?auto_661580 ?auto_661584 ) ) ( not ( = ?auto_661581 ?auto_661582 ) ) ( not ( = ?auto_661581 ?auto_661583 ) ) ( not ( = ?auto_661581 ?auto_661584 ) ) ( not ( = ?auto_661582 ?auto_661583 ) ) ( not ( = ?auto_661582 ?auto_661584 ) ) ( not ( = ?auto_661583 ?auto_661584 ) ) ( ON ?auto_661582 ?auto_661583 ) ( ON ?auto_661581 ?auto_661582 ) ( ON ?auto_661580 ?auto_661581 ) ( ON ?auto_661579 ?auto_661580 ) ( ON ?auto_661578 ?auto_661579 ) ( ON ?auto_661577 ?auto_661578 ) ( ON ?auto_661576 ?auto_661577 ) ( ON ?auto_661575 ?auto_661576 ) ( CLEAR ?auto_661573 ) ( ON ?auto_661574 ?auto_661575 ) ( CLEAR ?auto_661574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_661570 ?auto_661571 ?auto_661572 ?auto_661573 ?auto_661574 )
      ( MAKE-14PILE ?auto_661570 ?auto_661571 ?auto_661572 ?auto_661573 ?auto_661574 ?auto_661575 ?auto_661576 ?auto_661577 ?auto_661578 ?auto_661579 ?auto_661580 ?auto_661581 ?auto_661582 ?auto_661583 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_661628 - BLOCK
      ?auto_661629 - BLOCK
      ?auto_661630 - BLOCK
      ?auto_661631 - BLOCK
      ?auto_661632 - BLOCK
      ?auto_661633 - BLOCK
      ?auto_661634 - BLOCK
      ?auto_661635 - BLOCK
      ?auto_661636 - BLOCK
      ?auto_661637 - BLOCK
      ?auto_661638 - BLOCK
      ?auto_661639 - BLOCK
      ?auto_661640 - BLOCK
      ?auto_661641 - BLOCK
    )
    :vars
    (
      ?auto_661642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661641 ?auto_661642 ) ( ON-TABLE ?auto_661628 ) ( ON ?auto_661629 ?auto_661628 ) ( ON ?auto_661630 ?auto_661629 ) ( not ( = ?auto_661628 ?auto_661629 ) ) ( not ( = ?auto_661628 ?auto_661630 ) ) ( not ( = ?auto_661628 ?auto_661631 ) ) ( not ( = ?auto_661628 ?auto_661632 ) ) ( not ( = ?auto_661628 ?auto_661633 ) ) ( not ( = ?auto_661628 ?auto_661634 ) ) ( not ( = ?auto_661628 ?auto_661635 ) ) ( not ( = ?auto_661628 ?auto_661636 ) ) ( not ( = ?auto_661628 ?auto_661637 ) ) ( not ( = ?auto_661628 ?auto_661638 ) ) ( not ( = ?auto_661628 ?auto_661639 ) ) ( not ( = ?auto_661628 ?auto_661640 ) ) ( not ( = ?auto_661628 ?auto_661641 ) ) ( not ( = ?auto_661628 ?auto_661642 ) ) ( not ( = ?auto_661629 ?auto_661630 ) ) ( not ( = ?auto_661629 ?auto_661631 ) ) ( not ( = ?auto_661629 ?auto_661632 ) ) ( not ( = ?auto_661629 ?auto_661633 ) ) ( not ( = ?auto_661629 ?auto_661634 ) ) ( not ( = ?auto_661629 ?auto_661635 ) ) ( not ( = ?auto_661629 ?auto_661636 ) ) ( not ( = ?auto_661629 ?auto_661637 ) ) ( not ( = ?auto_661629 ?auto_661638 ) ) ( not ( = ?auto_661629 ?auto_661639 ) ) ( not ( = ?auto_661629 ?auto_661640 ) ) ( not ( = ?auto_661629 ?auto_661641 ) ) ( not ( = ?auto_661629 ?auto_661642 ) ) ( not ( = ?auto_661630 ?auto_661631 ) ) ( not ( = ?auto_661630 ?auto_661632 ) ) ( not ( = ?auto_661630 ?auto_661633 ) ) ( not ( = ?auto_661630 ?auto_661634 ) ) ( not ( = ?auto_661630 ?auto_661635 ) ) ( not ( = ?auto_661630 ?auto_661636 ) ) ( not ( = ?auto_661630 ?auto_661637 ) ) ( not ( = ?auto_661630 ?auto_661638 ) ) ( not ( = ?auto_661630 ?auto_661639 ) ) ( not ( = ?auto_661630 ?auto_661640 ) ) ( not ( = ?auto_661630 ?auto_661641 ) ) ( not ( = ?auto_661630 ?auto_661642 ) ) ( not ( = ?auto_661631 ?auto_661632 ) ) ( not ( = ?auto_661631 ?auto_661633 ) ) ( not ( = ?auto_661631 ?auto_661634 ) ) ( not ( = ?auto_661631 ?auto_661635 ) ) ( not ( = ?auto_661631 ?auto_661636 ) ) ( not ( = ?auto_661631 ?auto_661637 ) ) ( not ( = ?auto_661631 ?auto_661638 ) ) ( not ( = ?auto_661631 ?auto_661639 ) ) ( not ( = ?auto_661631 ?auto_661640 ) ) ( not ( = ?auto_661631 ?auto_661641 ) ) ( not ( = ?auto_661631 ?auto_661642 ) ) ( not ( = ?auto_661632 ?auto_661633 ) ) ( not ( = ?auto_661632 ?auto_661634 ) ) ( not ( = ?auto_661632 ?auto_661635 ) ) ( not ( = ?auto_661632 ?auto_661636 ) ) ( not ( = ?auto_661632 ?auto_661637 ) ) ( not ( = ?auto_661632 ?auto_661638 ) ) ( not ( = ?auto_661632 ?auto_661639 ) ) ( not ( = ?auto_661632 ?auto_661640 ) ) ( not ( = ?auto_661632 ?auto_661641 ) ) ( not ( = ?auto_661632 ?auto_661642 ) ) ( not ( = ?auto_661633 ?auto_661634 ) ) ( not ( = ?auto_661633 ?auto_661635 ) ) ( not ( = ?auto_661633 ?auto_661636 ) ) ( not ( = ?auto_661633 ?auto_661637 ) ) ( not ( = ?auto_661633 ?auto_661638 ) ) ( not ( = ?auto_661633 ?auto_661639 ) ) ( not ( = ?auto_661633 ?auto_661640 ) ) ( not ( = ?auto_661633 ?auto_661641 ) ) ( not ( = ?auto_661633 ?auto_661642 ) ) ( not ( = ?auto_661634 ?auto_661635 ) ) ( not ( = ?auto_661634 ?auto_661636 ) ) ( not ( = ?auto_661634 ?auto_661637 ) ) ( not ( = ?auto_661634 ?auto_661638 ) ) ( not ( = ?auto_661634 ?auto_661639 ) ) ( not ( = ?auto_661634 ?auto_661640 ) ) ( not ( = ?auto_661634 ?auto_661641 ) ) ( not ( = ?auto_661634 ?auto_661642 ) ) ( not ( = ?auto_661635 ?auto_661636 ) ) ( not ( = ?auto_661635 ?auto_661637 ) ) ( not ( = ?auto_661635 ?auto_661638 ) ) ( not ( = ?auto_661635 ?auto_661639 ) ) ( not ( = ?auto_661635 ?auto_661640 ) ) ( not ( = ?auto_661635 ?auto_661641 ) ) ( not ( = ?auto_661635 ?auto_661642 ) ) ( not ( = ?auto_661636 ?auto_661637 ) ) ( not ( = ?auto_661636 ?auto_661638 ) ) ( not ( = ?auto_661636 ?auto_661639 ) ) ( not ( = ?auto_661636 ?auto_661640 ) ) ( not ( = ?auto_661636 ?auto_661641 ) ) ( not ( = ?auto_661636 ?auto_661642 ) ) ( not ( = ?auto_661637 ?auto_661638 ) ) ( not ( = ?auto_661637 ?auto_661639 ) ) ( not ( = ?auto_661637 ?auto_661640 ) ) ( not ( = ?auto_661637 ?auto_661641 ) ) ( not ( = ?auto_661637 ?auto_661642 ) ) ( not ( = ?auto_661638 ?auto_661639 ) ) ( not ( = ?auto_661638 ?auto_661640 ) ) ( not ( = ?auto_661638 ?auto_661641 ) ) ( not ( = ?auto_661638 ?auto_661642 ) ) ( not ( = ?auto_661639 ?auto_661640 ) ) ( not ( = ?auto_661639 ?auto_661641 ) ) ( not ( = ?auto_661639 ?auto_661642 ) ) ( not ( = ?auto_661640 ?auto_661641 ) ) ( not ( = ?auto_661640 ?auto_661642 ) ) ( not ( = ?auto_661641 ?auto_661642 ) ) ( ON ?auto_661640 ?auto_661641 ) ( ON ?auto_661639 ?auto_661640 ) ( ON ?auto_661638 ?auto_661639 ) ( ON ?auto_661637 ?auto_661638 ) ( ON ?auto_661636 ?auto_661637 ) ( ON ?auto_661635 ?auto_661636 ) ( ON ?auto_661634 ?auto_661635 ) ( ON ?auto_661633 ?auto_661634 ) ( ON ?auto_661632 ?auto_661633 ) ( CLEAR ?auto_661630 ) ( ON ?auto_661631 ?auto_661632 ) ( CLEAR ?auto_661631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_661628 ?auto_661629 ?auto_661630 ?auto_661631 )
      ( MAKE-14PILE ?auto_661628 ?auto_661629 ?auto_661630 ?auto_661631 ?auto_661632 ?auto_661633 ?auto_661634 ?auto_661635 ?auto_661636 ?auto_661637 ?auto_661638 ?auto_661639 ?auto_661640 ?auto_661641 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_661686 - BLOCK
      ?auto_661687 - BLOCK
      ?auto_661688 - BLOCK
      ?auto_661689 - BLOCK
      ?auto_661690 - BLOCK
      ?auto_661691 - BLOCK
      ?auto_661692 - BLOCK
      ?auto_661693 - BLOCK
      ?auto_661694 - BLOCK
      ?auto_661695 - BLOCK
      ?auto_661696 - BLOCK
      ?auto_661697 - BLOCK
      ?auto_661698 - BLOCK
      ?auto_661699 - BLOCK
    )
    :vars
    (
      ?auto_661700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661699 ?auto_661700 ) ( ON-TABLE ?auto_661686 ) ( ON ?auto_661687 ?auto_661686 ) ( not ( = ?auto_661686 ?auto_661687 ) ) ( not ( = ?auto_661686 ?auto_661688 ) ) ( not ( = ?auto_661686 ?auto_661689 ) ) ( not ( = ?auto_661686 ?auto_661690 ) ) ( not ( = ?auto_661686 ?auto_661691 ) ) ( not ( = ?auto_661686 ?auto_661692 ) ) ( not ( = ?auto_661686 ?auto_661693 ) ) ( not ( = ?auto_661686 ?auto_661694 ) ) ( not ( = ?auto_661686 ?auto_661695 ) ) ( not ( = ?auto_661686 ?auto_661696 ) ) ( not ( = ?auto_661686 ?auto_661697 ) ) ( not ( = ?auto_661686 ?auto_661698 ) ) ( not ( = ?auto_661686 ?auto_661699 ) ) ( not ( = ?auto_661686 ?auto_661700 ) ) ( not ( = ?auto_661687 ?auto_661688 ) ) ( not ( = ?auto_661687 ?auto_661689 ) ) ( not ( = ?auto_661687 ?auto_661690 ) ) ( not ( = ?auto_661687 ?auto_661691 ) ) ( not ( = ?auto_661687 ?auto_661692 ) ) ( not ( = ?auto_661687 ?auto_661693 ) ) ( not ( = ?auto_661687 ?auto_661694 ) ) ( not ( = ?auto_661687 ?auto_661695 ) ) ( not ( = ?auto_661687 ?auto_661696 ) ) ( not ( = ?auto_661687 ?auto_661697 ) ) ( not ( = ?auto_661687 ?auto_661698 ) ) ( not ( = ?auto_661687 ?auto_661699 ) ) ( not ( = ?auto_661687 ?auto_661700 ) ) ( not ( = ?auto_661688 ?auto_661689 ) ) ( not ( = ?auto_661688 ?auto_661690 ) ) ( not ( = ?auto_661688 ?auto_661691 ) ) ( not ( = ?auto_661688 ?auto_661692 ) ) ( not ( = ?auto_661688 ?auto_661693 ) ) ( not ( = ?auto_661688 ?auto_661694 ) ) ( not ( = ?auto_661688 ?auto_661695 ) ) ( not ( = ?auto_661688 ?auto_661696 ) ) ( not ( = ?auto_661688 ?auto_661697 ) ) ( not ( = ?auto_661688 ?auto_661698 ) ) ( not ( = ?auto_661688 ?auto_661699 ) ) ( not ( = ?auto_661688 ?auto_661700 ) ) ( not ( = ?auto_661689 ?auto_661690 ) ) ( not ( = ?auto_661689 ?auto_661691 ) ) ( not ( = ?auto_661689 ?auto_661692 ) ) ( not ( = ?auto_661689 ?auto_661693 ) ) ( not ( = ?auto_661689 ?auto_661694 ) ) ( not ( = ?auto_661689 ?auto_661695 ) ) ( not ( = ?auto_661689 ?auto_661696 ) ) ( not ( = ?auto_661689 ?auto_661697 ) ) ( not ( = ?auto_661689 ?auto_661698 ) ) ( not ( = ?auto_661689 ?auto_661699 ) ) ( not ( = ?auto_661689 ?auto_661700 ) ) ( not ( = ?auto_661690 ?auto_661691 ) ) ( not ( = ?auto_661690 ?auto_661692 ) ) ( not ( = ?auto_661690 ?auto_661693 ) ) ( not ( = ?auto_661690 ?auto_661694 ) ) ( not ( = ?auto_661690 ?auto_661695 ) ) ( not ( = ?auto_661690 ?auto_661696 ) ) ( not ( = ?auto_661690 ?auto_661697 ) ) ( not ( = ?auto_661690 ?auto_661698 ) ) ( not ( = ?auto_661690 ?auto_661699 ) ) ( not ( = ?auto_661690 ?auto_661700 ) ) ( not ( = ?auto_661691 ?auto_661692 ) ) ( not ( = ?auto_661691 ?auto_661693 ) ) ( not ( = ?auto_661691 ?auto_661694 ) ) ( not ( = ?auto_661691 ?auto_661695 ) ) ( not ( = ?auto_661691 ?auto_661696 ) ) ( not ( = ?auto_661691 ?auto_661697 ) ) ( not ( = ?auto_661691 ?auto_661698 ) ) ( not ( = ?auto_661691 ?auto_661699 ) ) ( not ( = ?auto_661691 ?auto_661700 ) ) ( not ( = ?auto_661692 ?auto_661693 ) ) ( not ( = ?auto_661692 ?auto_661694 ) ) ( not ( = ?auto_661692 ?auto_661695 ) ) ( not ( = ?auto_661692 ?auto_661696 ) ) ( not ( = ?auto_661692 ?auto_661697 ) ) ( not ( = ?auto_661692 ?auto_661698 ) ) ( not ( = ?auto_661692 ?auto_661699 ) ) ( not ( = ?auto_661692 ?auto_661700 ) ) ( not ( = ?auto_661693 ?auto_661694 ) ) ( not ( = ?auto_661693 ?auto_661695 ) ) ( not ( = ?auto_661693 ?auto_661696 ) ) ( not ( = ?auto_661693 ?auto_661697 ) ) ( not ( = ?auto_661693 ?auto_661698 ) ) ( not ( = ?auto_661693 ?auto_661699 ) ) ( not ( = ?auto_661693 ?auto_661700 ) ) ( not ( = ?auto_661694 ?auto_661695 ) ) ( not ( = ?auto_661694 ?auto_661696 ) ) ( not ( = ?auto_661694 ?auto_661697 ) ) ( not ( = ?auto_661694 ?auto_661698 ) ) ( not ( = ?auto_661694 ?auto_661699 ) ) ( not ( = ?auto_661694 ?auto_661700 ) ) ( not ( = ?auto_661695 ?auto_661696 ) ) ( not ( = ?auto_661695 ?auto_661697 ) ) ( not ( = ?auto_661695 ?auto_661698 ) ) ( not ( = ?auto_661695 ?auto_661699 ) ) ( not ( = ?auto_661695 ?auto_661700 ) ) ( not ( = ?auto_661696 ?auto_661697 ) ) ( not ( = ?auto_661696 ?auto_661698 ) ) ( not ( = ?auto_661696 ?auto_661699 ) ) ( not ( = ?auto_661696 ?auto_661700 ) ) ( not ( = ?auto_661697 ?auto_661698 ) ) ( not ( = ?auto_661697 ?auto_661699 ) ) ( not ( = ?auto_661697 ?auto_661700 ) ) ( not ( = ?auto_661698 ?auto_661699 ) ) ( not ( = ?auto_661698 ?auto_661700 ) ) ( not ( = ?auto_661699 ?auto_661700 ) ) ( ON ?auto_661698 ?auto_661699 ) ( ON ?auto_661697 ?auto_661698 ) ( ON ?auto_661696 ?auto_661697 ) ( ON ?auto_661695 ?auto_661696 ) ( ON ?auto_661694 ?auto_661695 ) ( ON ?auto_661693 ?auto_661694 ) ( ON ?auto_661692 ?auto_661693 ) ( ON ?auto_661691 ?auto_661692 ) ( ON ?auto_661690 ?auto_661691 ) ( ON ?auto_661689 ?auto_661690 ) ( CLEAR ?auto_661687 ) ( ON ?auto_661688 ?auto_661689 ) ( CLEAR ?auto_661688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_661686 ?auto_661687 ?auto_661688 )
      ( MAKE-14PILE ?auto_661686 ?auto_661687 ?auto_661688 ?auto_661689 ?auto_661690 ?auto_661691 ?auto_661692 ?auto_661693 ?auto_661694 ?auto_661695 ?auto_661696 ?auto_661697 ?auto_661698 ?auto_661699 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_661744 - BLOCK
      ?auto_661745 - BLOCK
      ?auto_661746 - BLOCK
      ?auto_661747 - BLOCK
      ?auto_661748 - BLOCK
      ?auto_661749 - BLOCK
      ?auto_661750 - BLOCK
      ?auto_661751 - BLOCK
      ?auto_661752 - BLOCK
      ?auto_661753 - BLOCK
      ?auto_661754 - BLOCK
      ?auto_661755 - BLOCK
      ?auto_661756 - BLOCK
      ?auto_661757 - BLOCK
    )
    :vars
    (
      ?auto_661758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661757 ?auto_661758 ) ( ON-TABLE ?auto_661744 ) ( not ( = ?auto_661744 ?auto_661745 ) ) ( not ( = ?auto_661744 ?auto_661746 ) ) ( not ( = ?auto_661744 ?auto_661747 ) ) ( not ( = ?auto_661744 ?auto_661748 ) ) ( not ( = ?auto_661744 ?auto_661749 ) ) ( not ( = ?auto_661744 ?auto_661750 ) ) ( not ( = ?auto_661744 ?auto_661751 ) ) ( not ( = ?auto_661744 ?auto_661752 ) ) ( not ( = ?auto_661744 ?auto_661753 ) ) ( not ( = ?auto_661744 ?auto_661754 ) ) ( not ( = ?auto_661744 ?auto_661755 ) ) ( not ( = ?auto_661744 ?auto_661756 ) ) ( not ( = ?auto_661744 ?auto_661757 ) ) ( not ( = ?auto_661744 ?auto_661758 ) ) ( not ( = ?auto_661745 ?auto_661746 ) ) ( not ( = ?auto_661745 ?auto_661747 ) ) ( not ( = ?auto_661745 ?auto_661748 ) ) ( not ( = ?auto_661745 ?auto_661749 ) ) ( not ( = ?auto_661745 ?auto_661750 ) ) ( not ( = ?auto_661745 ?auto_661751 ) ) ( not ( = ?auto_661745 ?auto_661752 ) ) ( not ( = ?auto_661745 ?auto_661753 ) ) ( not ( = ?auto_661745 ?auto_661754 ) ) ( not ( = ?auto_661745 ?auto_661755 ) ) ( not ( = ?auto_661745 ?auto_661756 ) ) ( not ( = ?auto_661745 ?auto_661757 ) ) ( not ( = ?auto_661745 ?auto_661758 ) ) ( not ( = ?auto_661746 ?auto_661747 ) ) ( not ( = ?auto_661746 ?auto_661748 ) ) ( not ( = ?auto_661746 ?auto_661749 ) ) ( not ( = ?auto_661746 ?auto_661750 ) ) ( not ( = ?auto_661746 ?auto_661751 ) ) ( not ( = ?auto_661746 ?auto_661752 ) ) ( not ( = ?auto_661746 ?auto_661753 ) ) ( not ( = ?auto_661746 ?auto_661754 ) ) ( not ( = ?auto_661746 ?auto_661755 ) ) ( not ( = ?auto_661746 ?auto_661756 ) ) ( not ( = ?auto_661746 ?auto_661757 ) ) ( not ( = ?auto_661746 ?auto_661758 ) ) ( not ( = ?auto_661747 ?auto_661748 ) ) ( not ( = ?auto_661747 ?auto_661749 ) ) ( not ( = ?auto_661747 ?auto_661750 ) ) ( not ( = ?auto_661747 ?auto_661751 ) ) ( not ( = ?auto_661747 ?auto_661752 ) ) ( not ( = ?auto_661747 ?auto_661753 ) ) ( not ( = ?auto_661747 ?auto_661754 ) ) ( not ( = ?auto_661747 ?auto_661755 ) ) ( not ( = ?auto_661747 ?auto_661756 ) ) ( not ( = ?auto_661747 ?auto_661757 ) ) ( not ( = ?auto_661747 ?auto_661758 ) ) ( not ( = ?auto_661748 ?auto_661749 ) ) ( not ( = ?auto_661748 ?auto_661750 ) ) ( not ( = ?auto_661748 ?auto_661751 ) ) ( not ( = ?auto_661748 ?auto_661752 ) ) ( not ( = ?auto_661748 ?auto_661753 ) ) ( not ( = ?auto_661748 ?auto_661754 ) ) ( not ( = ?auto_661748 ?auto_661755 ) ) ( not ( = ?auto_661748 ?auto_661756 ) ) ( not ( = ?auto_661748 ?auto_661757 ) ) ( not ( = ?auto_661748 ?auto_661758 ) ) ( not ( = ?auto_661749 ?auto_661750 ) ) ( not ( = ?auto_661749 ?auto_661751 ) ) ( not ( = ?auto_661749 ?auto_661752 ) ) ( not ( = ?auto_661749 ?auto_661753 ) ) ( not ( = ?auto_661749 ?auto_661754 ) ) ( not ( = ?auto_661749 ?auto_661755 ) ) ( not ( = ?auto_661749 ?auto_661756 ) ) ( not ( = ?auto_661749 ?auto_661757 ) ) ( not ( = ?auto_661749 ?auto_661758 ) ) ( not ( = ?auto_661750 ?auto_661751 ) ) ( not ( = ?auto_661750 ?auto_661752 ) ) ( not ( = ?auto_661750 ?auto_661753 ) ) ( not ( = ?auto_661750 ?auto_661754 ) ) ( not ( = ?auto_661750 ?auto_661755 ) ) ( not ( = ?auto_661750 ?auto_661756 ) ) ( not ( = ?auto_661750 ?auto_661757 ) ) ( not ( = ?auto_661750 ?auto_661758 ) ) ( not ( = ?auto_661751 ?auto_661752 ) ) ( not ( = ?auto_661751 ?auto_661753 ) ) ( not ( = ?auto_661751 ?auto_661754 ) ) ( not ( = ?auto_661751 ?auto_661755 ) ) ( not ( = ?auto_661751 ?auto_661756 ) ) ( not ( = ?auto_661751 ?auto_661757 ) ) ( not ( = ?auto_661751 ?auto_661758 ) ) ( not ( = ?auto_661752 ?auto_661753 ) ) ( not ( = ?auto_661752 ?auto_661754 ) ) ( not ( = ?auto_661752 ?auto_661755 ) ) ( not ( = ?auto_661752 ?auto_661756 ) ) ( not ( = ?auto_661752 ?auto_661757 ) ) ( not ( = ?auto_661752 ?auto_661758 ) ) ( not ( = ?auto_661753 ?auto_661754 ) ) ( not ( = ?auto_661753 ?auto_661755 ) ) ( not ( = ?auto_661753 ?auto_661756 ) ) ( not ( = ?auto_661753 ?auto_661757 ) ) ( not ( = ?auto_661753 ?auto_661758 ) ) ( not ( = ?auto_661754 ?auto_661755 ) ) ( not ( = ?auto_661754 ?auto_661756 ) ) ( not ( = ?auto_661754 ?auto_661757 ) ) ( not ( = ?auto_661754 ?auto_661758 ) ) ( not ( = ?auto_661755 ?auto_661756 ) ) ( not ( = ?auto_661755 ?auto_661757 ) ) ( not ( = ?auto_661755 ?auto_661758 ) ) ( not ( = ?auto_661756 ?auto_661757 ) ) ( not ( = ?auto_661756 ?auto_661758 ) ) ( not ( = ?auto_661757 ?auto_661758 ) ) ( ON ?auto_661756 ?auto_661757 ) ( ON ?auto_661755 ?auto_661756 ) ( ON ?auto_661754 ?auto_661755 ) ( ON ?auto_661753 ?auto_661754 ) ( ON ?auto_661752 ?auto_661753 ) ( ON ?auto_661751 ?auto_661752 ) ( ON ?auto_661750 ?auto_661751 ) ( ON ?auto_661749 ?auto_661750 ) ( ON ?auto_661748 ?auto_661749 ) ( ON ?auto_661747 ?auto_661748 ) ( ON ?auto_661746 ?auto_661747 ) ( CLEAR ?auto_661744 ) ( ON ?auto_661745 ?auto_661746 ) ( CLEAR ?auto_661745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_661744 ?auto_661745 )
      ( MAKE-14PILE ?auto_661744 ?auto_661745 ?auto_661746 ?auto_661747 ?auto_661748 ?auto_661749 ?auto_661750 ?auto_661751 ?auto_661752 ?auto_661753 ?auto_661754 ?auto_661755 ?auto_661756 ?auto_661757 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_661802 - BLOCK
      ?auto_661803 - BLOCK
      ?auto_661804 - BLOCK
      ?auto_661805 - BLOCK
      ?auto_661806 - BLOCK
      ?auto_661807 - BLOCK
      ?auto_661808 - BLOCK
      ?auto_661809 - BLOCK
      ?auto_661810 - BLOCK
      ?auto_661811 - BLOCK
      ?auto_661812 - BLOCK
      ?auto_661813 - BLOCK
      ?auto_661814 - BLOCK
      ?auto_661815 - BLOCK
    )
    :vars
    (
      ?auto_661816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661815 ?auto_661816 ) ( not ( = ?auto_661802 ?auto_661803 ) ) ( not ( = ?auto_661802 ?auto_661804 ) ) ( not ( = ?auto_661802 ?auto_661805 ) ) ( not ( = ?auto_661802 ?auto_661806 ) ) ( not ( = ?auto_661802 ?auto_661807 ) ) ( not ( = ?auto_661802 ?auto_661808 ) ) ( not ( = ?auto_661802 ?auto_661809 ) ) ( not ( = ?auto_661802 ?auto_661810 ) ) ( not ( = ?auto_661802 ?auto_661811 ) ) ( not ( = ?auto_661802 ?auto_661812 ) ) ( not ( = ?auto_661802 ?auto_661813 ) ) ( not ( = ?auto_661802 ?auto_661814 ) ) ( not ( = ?auto_661802 ?auto_661815 ) ) ( not ( = ?auto_661802 ?auto_661816 ) ) ( not ( = ?auto_661803 ?auto_661804 ) ) ( not ( = ?auto_661803 ?auto_661805 ) ) ( not ( = ?auto_661803 ?auto_661806 ) ) ( not ( = ?auto_661803 ?auto_661807 ) ) ( not ( = ?auto_661803 ?auto_661808 ) ) ( not ( = ?auto_661803 ?auto_661809 ) ) ( not ( = ?auto_661803 ?auto_661810 ) ) ( not ( = ?auto_661803 ?auto_661811 ) ) ( not ( = ?auto_661803 ?auto_661812 ) ) ( not ( = ?auto_661803 ?auto_661813 ) ) ( not ( = ?auto_661803 ?auto_661814 ) ) ( not ( = ?auto_661803 ?auto_661815 ) ) ( not ( = ?auto_661803 ?auto_661816 ) ) ( not ( = ?auto_661804 ?auto_661805 ) ) ( not ( = ?auto_661804 ?auto_661806 ) ) ( not ( = ?auto_661804 ?auto_661807 ) ) ( not ( = ?auto_661804 ?auto_661808 ) ) ( not ( = ?auto_661804 ?auto_661809 ) ) ( not ( = ?auto_661804 ?auto_661810 ) ) ( not ( = ?auto_661804 ?auto_661811 ) ) ( not ( = ?auto_661804 ?auto_661812 ) ) ( not ( = ?auto_661804 ?auto_661813 ) ) ( not ( = ?auto_661804 ?auto_661814 ) ) ( not ( = ?auto_661804 ?auto_661815 ) ) ( not ( = ?auto_661804 ?auto_661816 ) ) ( not ( = ?auto_661805 ?auto_661806 ) ) ( not ( = ?auto_661805 ?auto_661807 ) ) ( not ( = ?auto_661805 ?auto_661808 ) ) ( not ( = ?auto_661805 ?auto_661809 ) ) ( not ( = ?auto_661805 ?auto_661810 ) ) ( not ( = ?auto_661805 ?auto_661811 ) ) ( not ( = ?auto_661805 ?auto_661812 ) ) ( not ( = ?auto_661805 ?auto_661813 ) ) ( not ( = ?auto_661805 ?auto_661814 ) ) ( not ( = ?auto_661805 ?auto_661815 ) ) ( not ( = ?auto_661805 ?auto_661816 ) ) ( not ( = ?auto_661806 ?auto_661807 ) ) ( not ( = ?auto_661806 ?auto_661808 ) ) ( not ( = ?auto_661806 ?auto_661809 ) ) ( not ( = ?auto_661806 ?auto_661810 ) ) ( not ( = ?auto_661806 ?auto_661811 ) ) ( not ( = ?auto_661806 ?auto_661812 ) ) ( not ( = ?auto_661806 ?auto_661813 ) ) ( not ( = ?auto_661806 ?auto_661814 ) ) ( not ( = ?auto_661806 ?auto_661815 ) ) ( not ( = ?auto_661806 ?auto_661816 ) ) ( not ( = ?auto_661807 ?auto_661808 ) ) ( not ( = ?auto_661807 ?auto_661809 ) ) ( not ( = ?auto_661807 ?auto_661810 ) ) ( not ( = ?auto_661807 ?auto_661811 ) ) ( not ( = ?auto_661807 ?auto_661812 ) ) ( not ( = ?auto_661807 ?auto_661813 ) ) ( not ( = ?auto_661807 ?auto_661814 ) ) ( not ( = ?auto_661807 ?auto_661815 ) ) ( not ( = ?auto_661807 ?auto_661816 ) ) ( not ( = ?auto_661808 ?auto_661809 ) ) ( not ( = ?auto_661808 ?auto_661810 ) ) ( not ( = ?auto_661808 ?auto_661811 ) ) ( not ( = ?auto_661808 ?auto_661812 ) ) ( not ( = ?auto_661808 ?auto_661813 ) ) ( not ( = ?auto_661808 ?auto_661814 ) ) ( not ( = ?auto_661808 ?auto_661815 ) ) ( not ( = ?auto_661808 ?auto_661816 ) ) ( not ( = ?auto_661809 ?auto_661810 ) ) ( not ( = ?auto_661809 ?auto_661811 ) ) ( not ( = ?auto_661809 ?auto_661812 ) ) ( not ( = ?auto_661809 ?auto_661813 ) ) ( not ( = ?auto_661809 ?auto_661814 ) ) ( not ( = ?auto_661809 ?auto_661815 ) ) ( not ( = ?auto_661809 ?auto_661816 ) ) ( not ( = ?auto_661810 ?auto_661811 ) ) ( not ( = ?auto_661810 ?auto_661812 ) ) ( not ( = ?auto_661810 ?auto_661813 ) ) ( not ( = ?auto_661810 ?auto_661814 ) ) ( not ( = ?auto_661810 ?auto_661815 ) ) ( not ( = ?auto_661810 ?auto_661816 ) ) ( not ( = ?auto_661811 ?auto_661812 ) ) ( not ( = ?auto_661811 ?auto_661813 ) ) ( not ( = ?auto_661811 ?auto_661814 ) ) ( not ( = ?auto_661811 ?auto_661815 ) ) ( not ( = ?auto_661811 ?auto_661816 ) ) ( not ( = ?auto_661812 ?auto_661813 ) ) ( not ( = ?auto_661812 ?auto_661814 ) ) ( not ( = ?auto_661812 ?auto_661815 ) ) ( not ( = ?auto_661812 ?auto_661816 ) ) ( not ( = ?auto_661813 ?auto_661814 ) ) ( not ( = ?auto_661813 ?auto_661815 ) ) ( not ( = ?auto_661813 ?auto_661816 ) ) ( not ( = ?auto_661814 ?auto_661815 ) ) ( not ( = ?auto_661814 ?auto_661816 ) ) ( not ( = ?auto_661815 ?auto_661816 ) ) ( ON ?auto_661814 ?auto_661815 ) ( ON ?auto_661813 ?auto_661814 ) ( ON ?auto_661812 ?auto_661813 ) ( ON ?auto_661811 ?auto_661812 ) ( ON ?auto_661810 ?auto_661811 ) ( ON ?auto_661809 ?auto_661810 ) ( ON ?auto_661808 ?auto_661809 ) ( ON ?auto_661807 ?auto_661808 ) ( ON ?auto_661806 ?auto_661807 ) ( ON ?auto_661805 ?auto_661806 ) ( ON ?auto_661804 ?auto_661805 ) ( ON ?auto_661803 ?auto_661804 ) ( ON ?auto_661802 ?auto_661803 ) ( CLEAR ?auto_661802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_661802 )
      ( MAKE-14PILE ?auto_661802 ?auto_661803 ?auto_661804 ?auto_661805 ?auto_661806 ?auto_661807 ?auto_661808 ?auto_661809 ?auto_661810 ?auto_661811 ?auto_661812 ?auto_661813 ?auto_661814 ?auto_661815 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_661861 - BLOCK
      ?auto_661862 - BLOCK
      ?auto_661863 - BLOCK
      ?auto_661864 - BLOCK
      ?auto_661865 - BLOCK
      ?auto_661866 - BLOCK
      ?auto_661867 - BLOCK
      ?auto_661868 - BLOCK
      ?auto_661869 - BLOCK
      ?auto_661870 - BLOCK
      ?auto_661871 - BLOCK
      ?auto_661872 - BLOCK
      ?auto_661873 - BLOCK
      ?auto_661874 - BLOCK
      ?auto_661875 - BLOCK
    )
    :vars
    (
      ?auto_661876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_661874 ) ( ON ?auto_661875 ?auto_661876 ) ( CLEAR ?auto_661875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_661861 ) ( ON ?auto_661862 ?auto_661861 ) ( ON ?auto_661863 ?auto_661862 ) ( ON ?auto_661864 ?auto_661863 ) ( ON ?auto_661865 ?auto_661864 ) ( ON ?auto_661866 ?auto_661865 ) ( ON ?auto_661867 ?auto_661866 ) ( ON ?auto_661868 ?auto_661867 ) ( ON ?auto_661869 ?auto_661868 ) ( ON ?auto_661870 ?auto_661869 ) ( ON ?auto_661871 ?auto_661870 ) ( ON ?auto_661872 ?auto_661871 ) ( ON ?auto_661873 ?auto_661872 ) ( ON ?auto_661874 ?auto_661873 ) ( not ( = ?auto_661861 ?auto_661862 ) ) ( not ( = ?auto_661861 ?auto_661863 ) ) ( not ( = ?auto_661861 ?auto_661864 ) ) ( not ( = ?auto_661861 ?auto_661865 ) ) ( not ( = ?auto_661861 ?auto_661866 ) ) ( not ( = ?auto_661861 ?auto_661867 ) ) ( not ( = ?auto_661861 ?auto_661868 ) ) ( not ( = ?auto_661861 ?auto_661869 ) ) ( not ( = ?auto_661861 ?auto_661870 ) ) ( not ( = ?auto_661861 ?auto_661871 ) ) ( not ( = ?auto_661861 ?auto_661872 ) ) ( not ( = ?auto_661861 ?auto_661873 ) ) ( not ( = ?auto_661861 ?auto_661874 ) ) ( not ( = ?auto_661861 ?auto_661875 ) ) ( not ( = ?auto_661861 ?auto_661876 ) ) ( not ( = ?auto_661862 ?auto_661863 ) ) ( not ( = ?auto_661862 ?auto_661864 ) ) ( not ( = ?auto_661862 ?auto_661865 ) ) ( not ( = ?auto_661862 ?auto_661866 ) ) ( not ( = ?auto_661862 ?auto_661867 ) ) ( not ( = ?auto_661862 ?auto_661868 ) ) ( not ( = ?auto_661862 ?auto_661869 ) ) ( not ( = ?auto_661862 ?auto_661870 ) ) ( not ( = ?auto_661862 ?auto_661871 ) ) ( not ( = ?auto_661862 ?auto_661872 ) ) ( not ( = ?auto_661862 ?auto_661873 ) ) ( not ( = ?auto_661862 ?auto_661874 ) ) ( not ( = ?auto_661862 ?auto_661875 ) ) ( not ( = ?auto_661862 ?auto_661876 ) ) ( not ( = ?auto_661863 ?auto_661864 ) ) ( not ( = ?auto_661863 ?auto_661865 ) ) ( not ( = ?auto_661863 ?auto_661866 ) ) ( not ( = ?auto_661863 ?auto_661867 ) ) ( not ( = ?auto_661863 ?auto_661868 ) ) ( not ( = ?auto_661863 ?auto_661869 ) ) ( not ( = ?auto_661863 ?auto_661870 ) ) ( not ( = ?auto_661863 ?auto_661871 ) ) ( not ( = ?auto_661863 ?auto_661872 ) ) ( not ( = ?auto_661863 ?auto_661873 ) ) ( not ( = ?auto_661863 ?auto_661874 ) ) ( not ( = ?auto_661863 ?auto_661875 ) ) ( not ( = ?auto_661863 ?auto_661876 ) ) ( not ( = ?auto_661864 ?auto_661865 ) ) ( not ( = ?auto_661864 ?auto_661866 ) ) ( not ( = ?auto_661864 ?auto_661867 ) ) ( not ( = ?auto_661864 ?auto_661868 ) ) ( not ( = ?auto_661864 ?auto_661869 ) ) ( not ( = ?auto_661864 ?auto_661870 ) ) ( not ( = ?auto_661864 ?auto_661871 ) ) ( not ( = ?auto_661864 ?auto_661872 ) ) ( not ( = ?auto_661864 ?auto_661873 ) ) ( not ( = ?auto_661864 ?auto_661874 ) ) ( not ( = ?auto_661864 ?auto_661875 ) ) ( not ( = ?auto_661864 ?auto_661876 ) ) ( not ( = ?auto_661865 ?auto_661866 ) ) ( not ( = ?auto_661865 ?auto_661867 ) ) ( not ( = ?auto_661865 ?auto_661868 ) ) ( not ( = ?auto_661865 ?auto_661869 ) ) ( not ( = ?auto_661865 ?auto_661870 ) ) ( not ( = ?auto_661865 ?auto_661871 ) ) ( not ( = ?auto_661865 ?auto_661872 ) ) ( not ( = ?auto_661865 ?auto_661873 ) ) ( not ( = ?auto_661865 ?auto_661874 ) ) ( not ( = ?auto_661865 ?auto_661875 ) ) ( not ( = ?auto_661865 ?auto_661876 ) ) ( not ( = ?auto_661866 ?auto_661867 ) ) ( not ( = ?auto_661866 ?auto_661868 ) ) ( not ( = ?auto_661866 ?auto_661869 ) ) ( not ( = ?auto_661866 ?auto_661870 ) ) ( not ( = ?auto_661866 ?auto_661871 ) ) ( not ( = ?auto_661866 ?auto_661872 ) ) ( not ( = ?auto_661866 ?auto_661873 ) ) ( not ( = ?auto_661866 ?auto_661874 ) ) ( not ( = ?auto_661866 ?auto_661875 ) ) ( not ( = ?auto_661866 ?auto_661876 ) ) ( not ( = ?auto_661867 ?auto_661868 ) ) ( not ( = ?auto_661867 ?auto_661869 ) ) ( not ( = ?auto_661867 ?auto_661870 ) ) ( not ( = ?auto_661867 ?auto_661871 ) ) ( not ( = ?auto_661867 ?auto_661872 ) ) ( not ( = ?auto_661867 ?auto_661873 ) ) ( not ( = ?auto_661867 ?auto_661874 ) ) ( not ( = ?auto_661867 ?auto_661875 ) ) ( not ( = ?auto_661867 ?auto_661876 ) ) ( not ( = ?auto_661868 ?auto_661869 ) ) ( not ( = ?auto_661868 ?auto_661870 ) ) ( not ( = ?auto_661868 ?auto_661871 ) ) ( not ( = ?auto_661868 ?auto_661872 ) ) ( not ( = ?auto_661868 ?auto_661873 ) ) ( not ( = ?auto_661868 ?auto_661874 ) ) ( not ( = ?auto_661868 ?auto_661875 ) ) ( not ( = ?auto_661868 ?auto_661876 ) ) ( not ( = ?auto_661869 ?auto_661870 ) ) ( not ( = ?auto_661869 ?auto_661871 ) ) ( not ( = ?auto_661869 ?auto_661872 ) ) ( not ( = ?auto_661869 ?auto_661873 ) ) ( not ( = ?auto_661869 ?auto_661874 ) ) ( not ( = ?auto_661869 ?auto_661875 ) ) ( not ( = ?auto_661869 ?auto_661876 ) ) ( not ( = ?auto_661870 ?auto_661871 ) ) ( not ( = ?auto_661870 ?auto_661872 ) ) ( not ( = ?auto_661870 ?auto_661873 ) ) ( not ( = ?auto_661870 ?auto_661874 ) ) ( not ( = ?auto_661870 ?auto_661875 ) ) ( not ( = ?auto_661870 ?auto_661876 ) ) ( not ( = ?auto_661871 ?auto_661872 ) ) ( not ( = ?auto_661871 ?auto_661873 ) ) ( not ( = ?auto_661871 ?auto_661874 ) ) ( not ( = ?auto_661871 ?auto_661875 ) ) ( not ( = ?auto_661871 ?auto_661876 ) ) ( not ( = ?auto_661872 ?auto_661873 ) ) ( not ( = ?auto_661872 ?auto_661874 ) ) ( not ( = ?auto_661872 ?auto_661875 ) ) ( not ( = ?auto_661872 ?auto_661876 ) ) ( not ( = ?auto_661873 ?auto_661874 ) ) ( not ( = ?auto_661873 ?auto_661875 ) ) ( not ( = ?auto_661873 ?auto_661876 ) ) ( not ( = ?auto_661874 ?auto_661875 ) ) ( not ( = ?auto_661874 ?auto_661876 ) ) ( not ( = ?auto_661875 ?auto_661876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_661875 ?auto_661876 )
      ( !STACK ?auto_661875 ?auto_661874 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_661923 - BLOCK
      ?auto_661924 - BLOCK
      ?auto_661925 - BLOCK
      ?auto_661926 - BLOCK
      ?auto_661927 - BLOCK
      ?auto_661928 - BLOCK
      ?auto_661929 - BLOCK
      ?auto_661930 - BLOCK
      ?auto_661931 - BLOCK
      ?auto_661932 - BLOCK
      ?auto_661933 - BLOCK
      ?auto_661934 - BLOCK
      ?auto_661935 - BLOCK
      ?auto_661936 - BLOCK
      ?auto_661937 - BLOCK
    )
    :vars
    (
      ?auto_661938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661937 ?auto_661938 ) ( ON-TABLE ?auto_661923 ) ( ON ?auto_661924 ?auto_661923 ) ( ON ?auto_661925 ?auto_661924 ) ( ON ?auto_661926 ?auto_661925 ) ( ON ?auto_661927 ?auto_661926 ) ( ON ?auto_661928 ?auto_661927 ) ( ON ?auto_661929 ?auto_661928 ) ( ON ?auto_661930 ?auto_661929 ) ( ON ?auto_661931 ?auto_661930 ) ( ON ?auto_661932 ?auto_661931 ) ( ON ?auto_661933 ?auto_661932 ) ( ON ?auto_661934 ?auto_661933 ) ( ON ?auto_661935 ?auto_661934 ) ( not ( = ?auto_661923 ?auto_661924 ) ) ( not ( = ?auto_661923 ?auto_661925 ) ) ( not ( = ?auto_661923 ?auto_661926 ) ) ( not ( = ?auto_661923 ?auto_661927 ) ) ( not ( = ?auto_661923 ?auto_661928 ) ) ( not ( = ?auto_661923 ?auto_661929 ) ) ( not ( = ?auto_661923 ?auto_661930 ) ) ( not ( = ?auto_661923 ?auto_661931 ) ) ( not ( = ?auto_661923 ?auto_661932 ) ) ( not ( = ?auto_661923 ?auto_661933 ) ) ( not ( = ?auto_661923 ?auto_661934 ) ) ( not ( = ?auto_661923 ?auto_661935 ) ) ( not ( = ?auto_661923 ?auto_661936 ) ) ( not ( = ?auto_661923 ?auto_661937 ) ) ( not ( = ?auto_661923 ?auto_661938 ) ) ( not ( = ?auto_661924 ?auto_661925 ) ) ( not ( = ?auto_661924 ?auto_661926 ) ) ( not ( = ?auto_661924 ?auto_661927 ) ) ( not ( = ?auto_661924 ?auto_661928 ) ) ( not ( = ?auto_661924 ?auto_661929 ) ) ( not ( = ?auto_661924 ?auto_661930 ) ) ( not ( = ?auto_661924 ?auto_661931 ) ) ( not ( = ?auto_661924 ?auto_661932 ) ) ( not ( = ?auto_661924 ?auto_661933 ) ) ( not ( = ?auto_661924 ?auto_661934 ) ) ( not ( = ?auto_661924 ?auto_661935 ) ) ( not ( = ?auto_661924 ?auto_661936 ) ) ( not ( = ?auto_661924 ?auto_661937 ) ) ( not ( = ?auto_661924 ?auto_661938 ) ) ( not ( = ?auto_661925 ?auto_661926 ) ) ( not ( = ?auto_661925 ?auto_661927 ) ) ( not ( = ?auto_661925 ?auto_661928 ) ) ( not ( = ?auto_661925 ?auto_661929 ) ) ( not ( = ?auto_661925 ?auto_661930 ) ) ( not ( = ?auto_661925 ?auto_661931 ) ) ( not ( = ?auto_661925 ?auto_661932 ) ) ( not ( = ?auto_661925 ?auto_661933 ) ) ( not ( = ?auto_661925 ?auto_661934 ) ) ( not ( = ?auto_661925 ?auto_661935 ) ) ( not ( = ?auto_661925 ?auto_661936 ) ) ( not ( = ?auto_661925 ?auto_661937 ) ) ( not ( = ?auto_661925 ?auto_661938 ) ) ( not ( = ?auto_661926 ?auto_661927 ) ) ( not ( = ?auto_661926 ?auto_661928 ) ) ( not ( = ?auto_661926 ?auto_661929 ) ) ( not ( = ?auto_661926 ?auto_661930 ) ) ( not ( = ?auto_661926 ?auto_661931 ) ) ( not ( = ?auto_661926 ?auto_661932 ) ) ( not ( = ?auto_661926 ?auto_661933 ) ) ( not ( = ?auto_661926 ?auto_661934 ) ) ( not ( = ?auto_661926 ?auto_661935 ) ) ( not ( = ?auto_661926 ?auto_661936 ) ) ( not ( = ?auto_661926 ?auto_661937 ) ) ( not ( = ?auto_661926 ?auto_661938 ) ) ( not ( = ?auto_661927 ?auto_661928 ) ) ( not ( = ?auto_661927 ?auto_661929 ) ) ( not ( = ?auto_661927 ?auto_661930 ) ) ( not ( = ?auto_661927 ?auto_661931 ) ) ( not ( = ?auto_661927 ?auto_661932 ) ) ( not ( = ?auto_661927 ?auto_661933 ) ) ( not ( = ?auto_661927 ?auto_661934 ) ) ( not ( = ?auto_661927 ?auto_661935 ) ) ( not ( = ?auto_661927 ?auto_661936 ) ) ( not ( = ?auto_661927 ?auto_661937 ) ) ( not ( = ?auto_661927 ?auto_661938 ) ) ( not ( = ?auto_661928 ?auto_661929 ) ) ( not ( = ?auto_661928 ?auto_661930 ) ) ( not ( = ?auto_661928 ?auto_661931 ) ) ( not ( = ?auto_661928 ?auto_661932 ) ) ( not ( = ?auto_661928 ?auto_661933 ) ) ( not ( = ?auto_661928 ?auto_661934 ) ) ( not ( = ?auto_661928 ?auto_661935 ) ) ( not ( = ?auto_661928 ?auto_661936 ) ) ( not ( = ?auto_661928 ?auto_661937 ) ) ( not ( = ?auto_661928 ?auto_661938 ) ) ( not ( = ?auto_661929 ?auto_661930 ) ) ( not ( = ?auto_661929 ?auto_661931 ) ) ( not ( = ?auto_661929 ?auto_661932 ) ) ( not ( = ?auto_661929 ?auto_661933 ) ) ( not ( = ?auto_661929 ?auto_661934 ) ) ( not ( = ?auto_661929 ?auto_661935 ) ) ( not ( = ?auto_661929 ?auto_661936 ) ) ( not ( = ?auto_661929 ?auto_661937 ) ) ( not ( = ?auto_661929 ?auto_661938 ) ) ( not ( = ?auto_661930 ?auto_661931 ) ) ( not ( = ?auto_661930 ?auto_661932 ) ) ( not ( = ?auto_661930 ?auto_661933 ) ) ( not ( = ?auto_661930 ?auto_661934 ) ) ( not ( = ?auto_661930 ?auto_661935 ) ) ( not ( = ?auto_661930 ?auto_661936 ) ) ( not ( = ?auto_661930 ?auto_661937 ) ) ( not ( = ?auto_661930 ?auto_661938 ) ) ( not ( = ?auto_661931 ?auto_661932 ) ) ( not ( = ?auto_661931 ?auto_661933 ) ) ( not ( = ?auto_661931 ?auto_661934 ) ) ( not ( = ?auto_661931 ?auto_661935 ) ) ( not ( = ?auto_661931 ?auto_661936 ) ) ( not ( = ?auto_661931 ?auto_661937 ) ) ( not ( = ?auto_661931 ?auto_661938 ) ) ( not ( = ?auto_661932 ?auto_661933 ) ) ( not ( = ?auto_661932 ?auto_661934 ) ) ( not ( = ?auto_661932 ?auto_661935 ) ) ( not ( = ?auto_661932 ?auto_661936 ) ) ( not ( = ?auto_661932 ?auto_661937 ) ) ( not ( = ?auto_661932 ?auto_661938 ) ) ( not ( = ?auto_661933 ?auto_661934 ) ) ( not ( = ?auto_661933 ?auto_661935 ) ) ( not ( = ?auto_661933 ?auto_661936 ) ) ( not ( = ?auto_661933 ?auto_661937 ) ) ( not ( = ?auto_661933 ?auto_661938 ) ) ( not ( = ?auto_661934 ?auto_661935 ) ) ( not ( = ?auto_661934 ?auto_661936 ) ) ( not ( = ?auto_661934 ?auto_661937 ) ) ( not ( = ?auto_661934 ?auto_661938 ) ) ( not ( = ?auto_661935 ?auto_661936 ) ) ( not ( = ?auto_661935 ?auto_661937 ) ) ( not ( = ?auto_661935 ?auto_661938 ) ) ( not ( = ?auto_661936 ?auto_661937 ) ) ( not ( = ?auto_661936 ?auto_661938 ) ) ( not ( = ?auto_661937 ?auto_661938 ) ) ( CLEAR ?auto_661935 ) ( ON ?auto_661936 ?auto_661937 ) ( CLEAR ?auto_661936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_661923 ?auto_661924 ?auto_661925 ?auto_661926 ?auto_661927 ?auto_661928 ?auto_661929 ?auto_661930 ?auto_661931 ?auto_661932 ?auto_661933 ?auto_661934 ?auto_661935 ?auto_661936 )
      ( MAKE-15PILE ?auto_661923 ?auto_661924 ?auto_661925 ?auto_661926 ?auto_661927 ?auto_661928 ?auto_661929 ?auto_661930 ?auto_661931 ?auto_661932 ?auto_661933 ?auto_661934 ?auto_661935 ?auto_661936 ?auto_661937 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_661985 - BLOCK
      ?auto_661986 - BLOCK
      ?auto_661987 - BLOCK
      ?auto_661988 - BLOCK
      ?auto_661989 - BLOCK
      ?auto_661990 - BLOCK
      ?auto_661991 - BLOCK
      ?auto_661992 - BLOCK
      ?auto_661993 - BLOCK
      ?auto_661994 - BLOCK
      ?auto_661995 - BLOCK
      ?auto_661996 - BLOCK
      ?auto_661997 - BLOCK
      ?auto_661998 - BLOCK
      ?auto_661999 - BLOCK
    )
    :vars
    (
      ?auto_662000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661999 ?auto_662000 ) ( ON-TABLE ?auto_661985 ) ( ON ?auto_661986 ?auto_661985 ) ( ON ?auto_661987 ?auto_661986 ) ( ON ?auto_661988 ?auto_661987 ) ( ON ?auto_661989 ?auto_661988 ) ( ON ?auto_661990 ?auto_661989 ) ( ON ?auto_661991 ?auto_661990 ) ( ON ?auto_661992 ?auto_661991 ) ( ON ?auto_661993 ?auto_661992 ) ( ON ?auto_661994 ?auto_661993 ) ( ON ?auto_661995 ?auto_661994 ) ( ON ?auto_661996 ?auto_661995 ) ( not ( = ?auto_661985 ?auto_661986 ) ) ( not ( = ?auto_661985 ?auto_661987 ) ) ( not ( = ?auto_661985 ?auto_661988 ) ) ( not ( = ?auto_661985 ?auto_661989 ) ) ( not ( = ?auto_661985 ?auto_661990 ) ) ( not ( = ?auto_661985 ?auto_661991 ) ) ( not ( = ?auto_661985 ?auto_661992 ) ) ( not ( = ?auto_661985 ?auto_661993 ) ) ( not ( = ?auto_661985 ?auto_661994 ) ) ( not ( = ?auto_661985 ?auto_661995 ) ) ( not ( = ?auto_661985 ?auto_661996 ) ) ( not ( = ?auto_661985 ?auto_661997 ) ) ( not ( = ?auto_661985 ?auto_661998 ) ) ( not ( = ?auto_661985 ?auto_661999 ) ) ( not ( = ?auto_661985 ?auto_662000 ) ) ( not ( = ?auto_661986 ?auto_661987 ) ) ( not ( = ?auto_661986 ?auto_661988 ) ) ( not ( = ?auto_661986 ?auto_661989 ) ) ( not ( = ?auto_661986 ?auto_661990 ) ) ( not ( = ?auto_661986 ?auto_661991 ) ) ( not ( = ?auto_661986 ?auto_661992 ) ) ( not ( = ?auto_661986 ?auto_661993 ) ) ( not ( = ?auto_661986 ?auto_661994 ) ) ( not ( = ?auto_661986 ?auto_661995 ) ) ( not ( = ?auto_661986 ?auto_661996 ) ) ( not ( = ?auto_661986 ?auto_661997 ) ) ( not ( = ?auto_661986 ?auto_661998 ) ) ( not ( = ?auto_661986 ?auto_661999 ) ) ( not ( = ?auto_661986 ?auto_662000 ) ) ( not ( = ?auto_661987 ?auto_661988 ) ) ( not ( = ?auto_661987 ?auto_661989 ) ) ( not ( = ?auto_661987 ?auto_661990 ) ) ( not ( = ?auto_661987 ?auto_661991 ) ) ( not ( = ?auto_661987 ?auto_661992 ) ) ( not ( = ?auto_661987 ?auto_661993 ) ) ( not ( = ?auto_661987 ?auto_661994 ) ) ( not ( = ?auto_661987 ?auto_661995 ) ) ( not ( = ?auto_661987 ?auto_661996 ) ) ( not ( = ?auto_661987 ?auto_661997 ) ) ( not ( = ?auto_661987 ?auto_661998 ) ) ( not ( = ?auto_661987 ?auto_661999 ) ) ( not ( = ?auto_661987 ?auto_662000 ) ) ( not ( = ?auto_661988 ?auto_661989 ) ) ( not ( = ?auto_661988 ?auto_661990 ) ) ( not ( = ?auto_661988 ?auto_661991 ) ) ( not ( = ?auto_661988 ?auto_661992 ) ) ( not ( = ?auto_661988 ?auto_661993 ) ) ( not ( = ?auto_661988 ?auto_661994 ) ) ( not ( = ?auto_661988 ?auto_661995 ) ) ( not ( = ?auto_661988 ?auto_661996 ) ) ( not ( = ?auto_661988 ?auto_661997 ) ) ( not ( = ?auto_661988 ?auto_661998 ) ) ( not ( = ?auto_661988 ?auto_661999 ) ) ( not ( = ?auto_661988 ?auto_662000 ) ) ( not ( = ?auto_661989 ?auto_661990 ) ) ( not ( = ?auto_661989 ?auto_661991 ) ) ( not ( = ?auto_661989 ?auto_661992 ) ) ( not ( = ?auto_661989 ?auto_661993 ) ) ( not ( = ?auto_661989 ?auto_661994 ) ) ( not ( = ?auto_661989 ?auto_661995 ) ) ( not ( = ?auto_661989 ?auto_661996 ) ) ( not ( = ?auto_661989 ?auto_661997 ) ) ( not ( = ?auto_661989 ?auto_661998 ) ) ( not ( = ?auto_661989 ?auto_661999 ) ) ( not ( = ?auto_661989 ?auto_662000 ) ) ( not ( = ?auto_661990 ?auto_661991 ) ) ( not ( = ?auto_661990 ?auto_661992 ) ) ( not ( = ?auto_661990 ?auto_661993 ) ) ( not ( = ?auto_661990 ?auto_661994 ) ) ( not ( = ?auto_661990 ?auto_661995 ) ) ( not ( = ?auto_661990 ?auto_661996 ) ) ( not ( = ?auto_661990 ?auto_661997 ) ) ( not ( = ?auto_661990 ?auto_661998 ) ) ( not ( = ?auto_661990 ?auto_661999 ) ) ( not ( = ?auto_661990 ?auto_662000 ) ) ( not ( = ?auto_661991 ?auto_661992 ) ) ( not ( = ?auto_661991 ?auto_661993 ) ) ( not ( = ?auto_661991 ?auto_661994 ) ) ( not ( = ?auto_661991 ?auto_661995 ) ) ( not ( = ?auto_661991 ?auto_661996 ) ) ( not ( = ?auto_661991 ?auto_661997 ) ) ( not ( = ?auto_661991 ?auto_661998 ) ) ( not ( = ?auto_661991 ?auto_661999 ) ) ( not ( = ?auto_661991 ?auto_662000 ) ) ( not ( = ?auto_661992 ?auto_661993 ) ) ( not ( = ?auto_661992 ?auto_661994 ) ) ( not ( = ?auto_661992 ?auto_661995 ) ) ( not ( = ?auto_661992 ?auto_661996 ) ) ( not ( = ?auto_661992 ?auto_661997 ) ) ( not ( = ?auto_661992 ?auto_661998 ) ) ( not ( = ?auto_661992 ?auto_661999 ) ) ( not ( = ?auto_661992 ?auto_662000 ) ) ( not ( = ?auto_661993 ?auto_661994 ) ) ( not ( = ?auto_661993 ?auto_661995 ) ) ( not ( = ?auto_661993 ?auto_661996 ) ) ( not ( = ?auto_661993 ?auto_661997 ) ) ( not ( = ?auto_661993 ?auto_661998 ) ) ( not ( = ?auto_661993 ?auto_661999 ) ) ( not ( = ?auto_661993 ?auto_662000 ) ) ( not ( = ?auto_661994 ?auto_661995 ) ) ( not ( = ?auto_661994 ?auto_661996 ) ) ( not ( = ?auto_661994 ?auto_661997 ) ) ( not ( = ?auto_661994 ?auto_661998 ) ) ( not ( = ?auto_661994 ?auto_661999 ) ) ( not ( = ?auto_661994 ?auto_662000 ) ) ( not ( = ?auto_661995 ?auto_661996 ) ) ( not ( = ?auto_661995 ?auto_661997 ) ) ( not ( = ?auto_661995 ?auto_661998 ) ) ( not ( = ?auto_661995 ?auto_661999 ) ) ( not ( = ?auto_661995 ?auto_662000 ) ) ( not ( = ?auto_661996 ?auto_661997 ) ) ( not ( = ?auto_661996 ?auto_661998 ) ) ( not ( = ?auto_661996 ?auto_661999 ) ) ( not ( = ?auto_661996 ?auto_662000 ) ) ( not ( = ?auto_661997 ?auto_661998 ) ) ( not ( = ?auto_661997 ?auto_661999 ) ) ( not ( = ?auto_661997 ?auto_662000 ) ) ( not ( = ?auto_661998 ?auto_661999 ) ) ( not ( = ?auto_661998 ?auto_662000 ) ) ( not ( = ?auto_661999 ?auto_662000 ) ) ( ON ?auto_661998 ?auto_661999 ) ( CLEAR ?auto_661996 ) ( ON ?auto_661997 ?auto_661998 ) ( CLEAR ?auto_661997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_661985 ?auto_661986 ?auto_661987 ?auto_661988 ?auto_661989 ?auto_661990 ?auto_661991 ?auto_661992 ?auto_661993 ?auto_661994 ?auto_661995 ?auto_661996 ?auto_661997 )
      ( MAKE-15PILE ?auto_661985 ?auto_661986 ?auto_661987 ?auto_661988 ?auto_661989 ?auto_661990 ?auto_661991 ?auto_661992 ?auto_661993 ?auto_661994 ?auto_661995 ?auto_661996 ?auto_661997 ?auto_661998 ?auto_661999 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_662047 - BLOCK
      ?auto_662048 - BLOCK
      ?auto_662049 - BLOCK
      ?auto_662050 - BLOCK
      ?auto_662051 - BLOCK
      ?auto_662052 - BLOCK
      ?auto_662053 - BLOCK
      ?auto_662054 - BLOCK
      ?auto_662055 - BLOCK
      ?auto_662056 - BLOCK
      ?auto_662057 - BLOCK
      ?auto_662058 - BLOCK
      ?auto_662059 - BLOCK
      ?auto_662060 - BLOCK
      ?auto_662061 - BLOCK
    )
    :vars
    (
      ?auto_662062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_662061 ?auto_662062 ) ( ON-TABLE ?auto_662047 ) ( ON ?auto_662048 ?auto_662047 ) ( ON ?auto_662049 ?auto_662048 ) ( ON ?auto_662050 ?auto_662049 ) ( ON ?auto_662051 ?auto_662050 ) ( ON ?auto_662052 ?auto_662051 ) ( ON ?auto_662053 ?auto_662052 ) ( ON ?auto_662054 ?auto_662053 ) ( ON ?auto_662055 ?auto_662054 ) ( ON ?auto_662056 ?auto_662055 ) ( ON ?auto_662057 ?auto_662056 ) ( not ( = ?auto_662047 ?auto_662048 ) ) ( not ( = ?auto_662047 ?auto_662049 ) ) ( not ( = ?auto_662047 ?auto_662050 ) ) ( not ( = ?auto_662047 ?auto_662051 ) ) ( not ( = ?auto_662047 ?auto_662052 ) ) ( not ( = ?auto_662047 ?auto_662053 ) ) ( not ( = ?auto_662047 ?auto_662054 ) ) ( not ( = ?auto_662047 ?auto_662055 ) ) ( not ( = ?auto_662047 ?auto_662056 ) ) ( not ( = ?auto_662047 ?auto_662057 ) ) ( not ( = ?auto_662047 ?auto_662058 ) ) ( not ( = ?auto_662047 ?auto_662059 ) ) ( not ( = ?auto_662047 ?auto_662060 ) ) ( not ( = ?auto_662047 ?auto_662061 ) ) ( not ( = ?auto_662047 ?auto_662062 ) ) ( not ( = ?auto_662048 ?auto_662049 ) ) ( not ( = ?auto_662048 ?auto_662050 ) ) ( not ( = ?auto_662048 ?auto_662051 ) ) ( not ( = ?auto_662048 ?auto_662052 ) ) ( not ( = ?auto_662048 ?auto_662053 ) ) ( not ( = ?auto_662048 ?auto_662054 ) ) ( not ( = ?auto_662048 ?auto_662055 ) ) ( not ( = ?auto_662048 ?auto_662056 ) ) ( not ( = ?auto_662048 ?auto_662057 ) ) ( not ( = ?auto_662048 ?auto_662058 ) ) ( not ( = ?auto_662048 ?auto_662059 ) ) ( not ( = ?auto_662048 ?auto_662060 ) ) ( not ( = ?auto_662048 ?auto_662061 ) ) ( not ( = ?auto_662048 ?auto_662062 ) ) ( not ( = ?auto_662049 ?auto_662050 ) ) ( not ( = ?auto_662049 ?auto_662051 ) ) ( not ( = ?auto_662049 ?auto_662052 ) ) ( not ( = ?auto_662049 ?auto_662053 ) ) ( not ( = ?auto_662049 ?auto_662054 ) ) ( not ( = ?auto_662049 ?auto_662055 ) ) ( not ( = ?auto_662049 ?auto_662056 ) ) ( not ( = ?auto_662049 ?auto_662057 ) ) ( not ( = ?auto_662049 ?auto_662058 ) ) ( not ( = ?auto_662049 ?auto_662059 ) ) ( not ( = ?auto_662049 ?auto_662060 ) ) ( not ( = ?auto_662049 ?auto_662061 ) ) ( not ( = ?auto_662049 ?auto_662062 ) ) ( not ( = ?auto_662050 ?auto_662051 ) ) ( not ( = ?auto_662050 ?auto_662052 ) ) ( not ( = ?auto_662050 ?auto_662053 ) ) ( not ( = ?auto_662050 ?auto_662054 ) ) ( not ( = ?auto_662050 ?auto_662055 ) ) ( not ( = ?auto_662050 ?auto_662056 ) ) ( not ( = ?auto_662050 ?auto_662057 ) ) ( not ( = ?auto_662050 ?auto_662058 ) ) ( not ( = ?auto_662050 ?auto_662059 ) ) ( not ( = ?auto_662050 ?auto_662060 ) ) ( not ( = ?auto_662050 ?auto_662061 ) ) ( not ( = ?auto_662050 ?auto_662062 ) ) ( not ( = ?auto_662051 ?auto_662052 ) ) ( not ( = ?auto_662051 ?auto_662053 ) ) ( not ( = ?auto_662051 ?auto_662054 ) ) ( not ( = ?auto_662051 ?auto_662055 ) ) ( not ( = ?auto_662051 ?auto_662056 ) ) ( not ( = ?auto_662051 ?auto_662057 ) ) ( not ( = ?auto_662051 ?auto_662058 ) ) ( not ( = ?auto_662051 ?auto_662059 ) ) ( not ( = ?auto_662051 ?auto_662060 ) ) ( not ( = ?auto_662051 ?auto_662061 ) ) ( not ( = ?auto_662051 ?auto_662062 ) ) ( not ( = ?auto_662052 ?auto_662053 ) ) ( not ( = ?auto_662052 ?auto_662054 ) ) ( not ( = ?auto_662052 ?auto_662055 ) ) ( not ( = ?auto_662052 ?auto_662056 ) ) ( not ( = ?auto_662052 ?auto_662057 ) ) ( not ( = ?auto_662052 ?auto_662058 ) ) ( not ( = ?auto_662052 ?auto_662059 ) ) ( not ( = ?auto_662052 ?auto_662060 ) ) ( not ( = ?auto_662052 ?auto_662061 ) ) ( not ( = ?auto_662052 ?auto_662062 ) ) ( not ( = ?auto_662053 ?auto_662054 ) ) ( not ( = ?auto_662053 ?auto_662055 ) ) ( not ( = ?auto_662053 ?auto_662056 ) ) ( not ( = ?auto_662053 ?auto_662057 ) ) ( not ( = ?auto_662053 ?auto_662058 ) ) ( not ( = ?auto_662053 ?auto_662059 ) ) ( not ( = ?auto_662053 ?auto_662060 ) ) ( not ( = ?auto_662053 ?auto_662061 ) ) ( not ( = ?auto_662053 ?auto_662062 ) ) ( not ( = ?auto_662054 ?auto_662055 ) ) ( not ( = ?auto_662054 ?auto_662056 ) ) ( not ( = ?auto_662054 ?auto_662057 ) ) ( not ( = ?auto_662054 ?auto_662058 ) ) ( not ( = ?auto_662054 ?auto_662059 ) ) ( not ( = ?auto_662054 ?auto_662060 ) ) ( not ( = ?auto_662054 ?auto_662061 ) ) ( not ( = ?auto_662054 ?auto_662062 ) ) ( not ( = ?auto_662055 ?auto_662056 ) ) ( not ( = ?auto_662055 ?auto_662057 ) ) ( not ( = ?auto_662055 ?auto_662058 ) ) ( not ( = ?auto_662055 ?auto_662059 ) ) ( not ( = ?auto_662055 ?auto_662060 ) ) ( not ( = ?auto_662055 ?auto_662061 ) ) ( not ( = ?auto_662055 ?auto_662062 ) ) ( not ( = ?auto_662056 ?auto_662057 ) ) ( not ( = ?auto_662056 ?auto_662058 ) ) ( not ( = ?auto_662056 ?auto_662059 ) ) ( not ( = ?auto_662056 ?auto_662060 ) ) ( not ( = ?auto_662056 ?auto_662061 ) ) ( not ( = ?auto_662056 ?auto_662062 ) ) ( not ( = ?auto_662057 ?auto_662058 ) ) ( not ( = ?auto_662057 ?auto_662059 ) ) ( not ( = ?auto_662057 ?auto_662060 ) ) ( not ( = ?auto_662057 ?auto_662061 ) ) ( not ( = ?auto_662057 ?auto_662062 ) ) ( not ( = ?auto_662058 ?auto_662059 ) ) ( not ( = ?auto_662058 ?auto_662060 ) ) ( not ( = ?auto_662058 ?auto_662061 ) ) ( not ( = ?auto_662058 ?auto_662062 ) ) ( not ( = ?auto_662059 ?auto_662060 ) ) ( not ( = ?auto_662059 ?auto_662061 ) ) ( not ( = ?auto_662059 ?auto_662062 ) ) ( not ( = ?auto_662060 ?auto_662061 ) ) ( not ( = ?auto_662060 ?auto_662062 ) ) ( not ( = ?auto_662061 ?auto_662062 ) ) ( ON ?auto_662060 ?auto_662061 ) ( ON ?auto_662059 ?auto_662060 ) ( CLEAR ?auto_662057 ) ( ON ?auto_662058 ?auto_662059 ) ( CLEAR ?auto_662058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_662047 ?auto_662048 ?auto_662049 ?auto_662050 ?auto_662051 ?auto_662052 ?auto_662053 ?auto_662054 ?auto_662055 ?auto_662056 ?auto_662057 ?auto_662058 )
      ( MAKE-15PILE ?auto_662047 ?auto_662048 ?auto_662049 ?auto_662050 ?auto_662051 ?auto_662052 ?auto_662053 ?auto_662054 ?auto_662055 ?auto_662056 ?auto_662057 ?auto_662058 ?auto_662059 ?auto_662060 ?auto_662061 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_662109 - BLOCK
      ?auto_662110 - BLOCK
      ?auto_662111 - BLOCK
      ?auto_662112 - BLOCK
      ?auto_662113 - BLOCK
      ?auto_662114 - BLOCK
      ?auto_662115 - BLOCK
      ?auto_662116 - BLOCK
      ?auto_662117 - BLOCK
      ?auto_662118 - BLOCK
      ?auto_662119 - BLOCK
      ?auto_662120 - BLOCK
      ?auto_662121 - BLOCK
      ?auto_662122 - BLOCK
      ?auto_662123 - BLOCK
    )
    :vars
    (
      ?auto_662124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_662123 ?auto_662124 ) ( ON-TABLE ?auto_662109 ) ( ON ?auto_662110 ?auto_662109 ) ( ON ?auto_662111 ?auto_662110 ) ( ON ?auto_662112 ?auto_662111 ) ( ON ?auto_662113 ?auto_662112 ) ( ON ?auto_662114 ?auto_662113 ) ( ON ?auto_662115 ?auto_662114 ) ( ON ?auto_662116 ?auto_662115 ) ( ON ?auto_662117 ?auto_662116 ) ( ON ?auto_662118 ?auto_662117 ) ( not ( = ?auto_662109 ?auto_662110 ) ) ( not ( = ?auto_662109 ?auto_662111 ) ) ( not ( = ?auto_662109 ?auto_662112 ) ) ( not ( = ?auto_662109 ?auto_662113 ) ) ( not ( = ?auto_662109 ?auto_662114 ) ) ( not ( = ?auto_662109 ?auto_662115 ) ) ( not ( = ?auto_662109 ?auto_662116 ) ) ( not ( = ?auto_662109 ?auto_662117 ) ) ( not ( = ?auto_662109 ?auto_662118 ) ) ( not ( = ?auto_662109 ?auto_662119 ) ) ( not ( = ?auto_662109 ?auto_662120 ) ) ( not ( = ?auto_662109 ?auto_662121 ) ) ( not ( = ?auto_662109 ?auto_662122 ) ) ( not ( = ?auto_662109 ?auto_662123 ) ) ( not ( = ?auto_662109 ?auto_662124 ) ) ( not ( = ?auto_662110 ?auto_662111 ) ) ( not ( = ?auto_662110 ?auto_662112 ) ) ( not ( = ?auto_662110 ?auto_662113 ) ) ( not ( = ?auto_662110 ?auto_662114 ) ) ( not ( = ?auto_662110 ?auto_662115 ) ) ( not ( = ?auto_662110 ?auto_662116 ) ) ( not ( = ?auto_662110 ?auto_662117 ) ) ( not ( = ?auto_662110 ?auto_662118 ) ) ( not ( = ?auto_662110 ?auto_662119 ) ) ( not ( = ?auto_662110 ?auto_662120 ) ) ( not ( = ?auto_662110 ?auto_662121 ) ) ( not ( = ?auto_662110 ?auto_662122 ) ) ( not ( = ?auto_662110 ?auto_662123 ) ) ( not ( = ?auto_662110 ?auto_662124 ) ) ( not ( = ?auto_662111 ?auto_662112 ) ) ( not ( = ?auto_662111 ?auto_662113 ) ) ( not ( = ?auto_662111 ?auto_662114 ) ) ( not ( = ?auto_662111 ?auto_662115 ) ) ( not ( = ?auto_662111 ?auto_662116 ) ) ( not ( = ?auto_662111 ?auto_662117 ) ) ( not ( = ?auto_662111 ?auto_662118 ) ) ( not ( = ?auto_662111 ?auto_662119 ) ) ( not ( = ?auto_662111 ?auto_662120 ) ) ( not ( = ?auto_662111 ?auto_662121 ) ) ( not ( = ?auto_662111 ?auto_662122 ) ) ( not ( = ?auto_662111 ?auto_662123 ) ) ( not ( = ?auto_662111 ?auto_662124 ) ) ( not ( = ?auto_662112 ?auto_662113 ) ) ( not ( = ?auto_662112 ?auto_662114 ) ) ( not ( = ?auto_662112 ?auto_662115 ) ) ( not ( = ?auto_662112 ?auto_662116 ) ) ( not ( = ?auto_662112 ?auto_662117 ) ) ( not ( = ?auto_662112 ?auto_662118 ) ) ( not ( = ?auto_662112 ?auto_662119 ) ) ( not ( = ?auto_662112 ?auto_662120 ) ) ( not ( = ?auto_662112 ?auto_662121 ) ) ( not ( = ?auto_662112 ?auto_662122 ) ) ( not ( = ?auto_662112 ?auto_662123 ) ) ( not ( = ?auto_662112 ?auto_662124 ) ) ( not ( = ?auto_662113 ?auto_662114 ) ) ( not ( = ?auto_662113 ?auto_662115 ) ) ( not ( = ?auto_662113 ?auto_662116 ) ) ( not ( = ?auto_662113 ?auto_662117 ) ) ( not ( = ?auto_662113 ?auto_662118 ) ) ( not ( = ?auto_662113 ?auto_662119 ) ) ( not ( = ?auto_662113 ?auto_662120 ) ) ( not ( = ?auto_662113 ?auto_662121 ) ) ( not ( = ?auto_662113 ?auto_662122 ) ) ( not ( = ?auto_662113 ?auto_662123 ) ) ( not ( = ?auto_662113 ?auto_662124 ) ) ( not ( = ?auto_662114 ?auto_662115 ) ) ( not ( = ?auto_662114 ?auto_662116 ) ) ( not ( = ?auto_662114 ?auto_662117 ) ) ( not ( = ?auto_662114 ?auto_662118 ) ) ( not ( = ?auto_662114 ?auto_662119 ) ) ( not ( = ?auto_662114 ?auto_662120 ) ) ( not ( = ?auto_662114 ?auto_662121 ) ) ( not ( = ?auto_662114 ?auto_662122 ) ) ( not ( = ?auto_662114 ?auto_662123 ) ) ( not ( = ?auto_662114 ?auto_662124 ) ) ( not ( = ?auto_662115 ?auto_662116 ) ) ( not ( = ?auto_662115 ?auto_662117 ) ) ( not ( = ?auto_662115 ?auto_662118 ) ) ( not ( = ?auto_662115 ?auto_662119 ) ) ( not ( = ?auto_662115 ?auto_662120 ) ) ( not ( = ?auto_662115 ?auto_662121 ) ) ( not ( = ?auto_662115 ?auto_662122 ) ) ( not ( = ?auto_662115 ?auto_662123 ) ) ( not ( = ?auto_662115 ?auto_662124 ) ) ( not ( = ?auto_662116 ?auto_662117 ) ) ( not ( = ?auto_662116 ?auto_662118 ) ) ( not ( = ?auto_662116 ?auto_662119 ) ) ( not ( = ?auto_662116 ?auto_662120 ) ) ( not ( = ?auto_662116 ?auto_662121 ) ) ( not ( = ?auto_662116 ?auto_662122 ) ) ( not ( = ?auto_662116 ?auto_662123 ) ) ( not ( = ?auto_662116 ?auto_662124 ) ) ( not ( = ?auto_662117 ?auto_662118 ) ) ( not ( = ?auto_662117 ?auto_662119 ) ) ( not ( = ?auto_662117 ?auto_662120 ) ) ( not ( = ?auto_662117 ?auto_662121 ) ) ( not ( = ?auto_662117 ?auto_662122 ) ) ( not ( = ?auto_662117 ?auto_662123 ) ) ( not ( = ?auto_662117 ?auto_662124 ) ) ( not ( = ?auto_662118 ?auto_662119 ) ) ( not ( = ?auto_662118 ?auto_662120 ) ) ( not ( = ?auto_662118 ?auto_662121 ) ) ( not ( = ?auto_662118 ?auto_662122 ) ) ( not ( = ?auto_662118 ?auto_662123 ) ) ( not ( = ?auto_662118 ?auto_662124 ) ) ( not ( = ?auto_662119 ?auto_662120 ) ) ( not ( = ?auto_662119 ?auto_662121 ) ) ( not ( = ?auto_662119 ?auto_662122 ) ) ( not ( = ?auto_662119 ?auto_662123 ) ) ( not ( = ?auto_662119 ?auto_662124 ) ) ( not ( = ?auto_662120 ?auto_662121 ) ) ( not ( = ?auto_662120 ?auto_662122 ) ) ( not ( = ?auto_662120 ?auto_662123 ) ) ( not ( = ?auto_662120 ?auto_662124 ) ) ( not ( = ?auto_662121 ?auto_662122 ) ) ( not ( = ?auto_662121 ?auto_662123 ) ) ( not ( = ?auto_662121 ?auto_662124 ) ) ( not ( = ?auto_662122 ?auto_662123 ) ) ( not ( = ?auto_662122 ?auto_662124 ) ) ( not ( = ?auto_662123 ?auto_662124 ) ) ( ON ?auto_662122 ?auto_662123 ) ( ON ?auto_662121 ?auto_662122 ) ( ON ?auto_662120 ?auto_662121 ) ( CLEAR ?auto_662118 ) ( ON ?auto_662119 ?auto_662120 ) ( CLEAR ?auto_662119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_662109 ?auto_662110 ?auto_662111 ?auto_662112 ?auto_662113 ?auto_662114 ?auto_662115 ?auto_662116 ?auto_662117 ?auto_662118 ?auto_662119 )
      ( MAKE-15PILE ?auto_662109 ?auto_662110 ?auto_662111 ?auto_662112 ?auto_662113 ?auto_662114 ?auto_662115 ?auto_662116 ?auto_662117 ?auto_662118 ?auto_662119 ?auto_662120 ?auto_662121 ?auto_662122 ?auto_662123 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_662171 - BLOCK
      ?auto_662172 - BLOCK
      ?auto_662173 - BLOCK
      ?auto_662174 - BLOCK
      ?auto_662175 - BLOCK
      ?auto_662176 - BLOCK
      ?auto_662177 - BLOCK
      ?auto_662178 - BLOCK
      ?auto_662179 - BLOCK
      ?auto_662180 - BLOCK
      ?auto_662181 - BLOCK
      ?auto_662182 - BLOCK
      ?auto_662183 - BLOCK
      ?auto_662184 - BLOCK
      ?auto_662185 - BLOCK
    )
    :vars
    (
      ?auto_662186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_662185 ?auto_662186 ) ( ON-TABLE ?auto_662171 ) ( ON ?auto_662172 ?auto_662171 ) ( ON ?auto_662173 ?auto_662172 ) ( ON ?auto_662174 ?auto_662173 ) ( ON ?auto_662175 ?auto_662174 ) ( ON ?auto_662176 ?auto_662175 ) ( ON ?auto_662177 ?auto_662176 ) ( ON ?auto_662178 ?auto_662177 ) ( ON ?auto_662179 ?auto_662178 ) ( not ( = ?auto_662171 ?auto_662172 ) ) ( not ( = ?auto_662171 ?auto_662173 ) ) ( not ( = ?auto_662171 ?auto_662174 ) ) ( not ( = ?auto_662171 ?auto_662175 ) ) ( not ( = ?auto_662171 ?auto_662176 ) ) ( not ( = ?auto_662171 ?auto_662177 ) ) ( not ( = ?auto_662171 ?auto_662178 ) ) ( not ( = ?auto_662171 ?auto_662179 ) ) ( not ( = ?auto_662171 ?auto_662180 ) ) ( not ( = ?auto_662171 ?auto_662181 ) ) ( not ( = ?auto_662171 ?auto_662182 ) ) ( not ( = ?auto_662171 ?auto_662183 ) ) ( not ( = ?auto_662171 ?auto_662184 ) ) ( not ( = ?auto_662171 ?auto_662185 ) ) ( not ( = ?auto_662171 ?auto_662186 ) ) ( not ( = ?auto_662172 ?auto_662173 ) ) ( not ( = ?auto_662172 ?auto_662174 ) ) ( not ( = ?auto_662172 ?auto_662175 ) ) ( not ( = ?auto_662172 ?auto_662176 ) ) ( not ( = ?auto_662172 ?auto_662177 ) ) ( not ( = ?auto_662172 ?auto_662178 ) ) ( not ( = ?auto_662172 ?auto_662179 ) ) ( not ( = ?auto_662172 ?auto_662180 ) ) ( not ( = ?auto_662172 ?auto_662181 ) ) ( not ( = ?auto_662172 ?auto_662182 ) ) ( not ( = ?auto_662172 ?auto_662183 ) ) ( not ( = ?auto_662172 ?auto_662184 ) ) ( not ( = ?auto_662172 ?auto_662185 ) ) ( not ( = ?auto_662172 ?auto_662186 ) ) ( not ( = ?auto_662173 ?auto_662174 ) ) ( not ( = ?auto_662173 ?auto_662175 ) ) ( not ( = ?auto_662173 ?auto_662176 ) ) ( not ( = ?auto_662173 ?auto_662177 ) ) ( not ( = ?auto_662173 ?auto_662178 ) ) ( not ( = ?auto_662173 ?auto_662179 ) ) ( not ( = ?auto_662173 ?auto_662180 ) ) ( not ( = ?auto_662173 ?auto_662181 ) ) ( not ( = ?auto_662173 ?auto_662182 ) ) ( not ( = ?auto_662173 ?auto_662183 ) ) ( not ( = ?auto_662173 ?auto_662184 ) ) ( not ( = ?auto_662173 ?auto_662185 ) ) ( not ( = ?auto_662173 ?auto_662186 ) ) ( not ( = ?auto_662174 ?auto_662175 ) ) ( not ( = ?auto_662174 ?auto_662176 ) ) ( not ( = ?auto_662174 ?auto_662177 ) ) ( not ( = ?auto_662174 ?auto_662178 ) ) ( not ( = ?auto_662174 ?auto_662179 ) ) ( not ( = ?auto_662174 ?auto_662180 ) ) ( not ( = ?auto_662174 ?auto_662181 ) ) ( not ( = ?auto_662174 ?auto_662182 ) ) ( not ( = ?auto_662174 ?auto_662183 ) ) ( not ( = ?auto_662174 ?auto_662184 ) ) ( not ( = ?auto_662174 ?auto_662185 ) ) ( not ( = ?auto_662174 ?auto_662186 ) ) ( not ( = ?auto_662175 ?auto_662176 ) ) ( not ( = ?auto_662175 ?auto_662177 ) ) ( not ( = ?auto_662175 ?auto_662178 ) ) ( not ( = ?auto_662175 ?auto_662179 ) ) ( not ( = ?auto_662175 ?auto_662180 ) ) ( not ( = ?auto_662175 ?auto_662181 ) ) ( not ( = ?auto_662175 ?auto_662182 ) ) ( not ( = ?auto_662175 ?auto_662183 ) ) ( not ( = ?auto_662175 ?auto_662184 ) ) ( not ( = ?auto_662175 ?auto_662185 ) ) ( not ( = ?auto_662175 ?auto_662186 ) ) ( not ( = ?auto_662176 ?auto_662177 ) ) ( not ( = ?auto_662176 ?auto_662178 ) ) ( not ( = ?auto_662176 ?auto_662179 ) ) ( not ( = ?auto_662176 ?auto_662180 ) ) ( not ( = ?auto_662176 ?auto_662181 ) ) ( not ( = ?auto_662176 ?auto_662182 ) ) ( not ( = ?auto_662176 ?auto_662183 ) ) ( not ( = ?auto_662176 ?auto_662184 ) ) ( not ( = ?auto_662176 ?auto_662185 ) ) ( not ( = ?auto_662176 ?auto_662186 ) ) ( not ( = ?auto_662177 ?auto_662178 ) ) ( not ( = ?auto_662177 ?auto_662179 ) ) ( not ( = ?auto_662177 ?auto_662180 ) ) ( not ( = ?auto_662177 ?auto_662181 ) ) ( not ( = ?auto_662177 ?auto_662182 ) ) ( not ( = ?auto_662177 ?auto_662183 ) ) ( not ( = ?auto_662177 ?auto_662184 ) ) ( not ( = ?auto_662177 ?auto_662185 ) ) ( not ( = ?auto_662177 ?auto_662186 ) ) ( not ( = ?auto_662178 ?auto_662179 ) ) ( not ( = ?auto_662178 ?auto_662180 ) ) ( not ( = ?auto_662178 ?auto_662181 ) ) ( not ( = ?auto_662178 ?auto_662182 ) ) ( not ( = ?auto_662178 ?auto_662183 ) ) ( not ( = ?auto_662178 ?auto_662184 ) ) ( not ( = ?auto_662178 ?auto_662185 ) ) ( not ( = ?auto_662178 ?auto_662186 ) ) ( not ( = ?auto_662179 ?auto_662180 ) ) ( not ( = ?auto_662179 ?auto_662181 ) ) ( not ( = ?auto_662179 ?auto_662182 ) ) ( not ( = ?auto_662179 ?auto_662183 ) ) ( not ( = ?auto_662179 ?auto_662184 ) ) ( not ( = ?auto_662179 ?auto_662185 ) ) ( not ( = ?auto_662179 ?auto_662186 ) ) ( not ( = ?auto_662180 ?auto_662181 ) ) ( not ( = ?auto_662180 ?auto_662182 ) ) ( not ( = ?auto_662180 ?auto_662183 ) ) ( not ( = ?auto_662180 ?auto_662184 ) ) ( not ( = ?auto_662180 ?auto_662185 ) ) ( not ( = ?auto_662180 ?auto_662186 ) ) ( not ( = ?auto_662181 ?auto_662182 ) ) ( not ( = ?auto_662181 ?auto_662183 ) ) ( not ( = ?auto_662181 ?auto_662184 ) ) ( not ( = ?auto_662181 ?auto_662185 ) ) ( not ( = ?auto_662181 ?auto_662186 ) ) ( not ( = ?auto_662182 ?auto_662183 ) ) ( not ( = ?auto_662182 ?auto_662184 ) ) ( not ( = ?auto_662182 ?auto_662185 ) ) ( not ( = ?auto_662182 ?auto_662186 ) ) ( not ( = ?auto_662183 ?auto_662184 ) ) ( not ( = ?auto_662183 ?auto_662185 ) ) ( not ( = ?auto_662183 ?auto_662186 ) ) ( not ( = ?auto_662184 ?auto_662185 ) ) ( not ( = ?auto_662184 ?auto_662186 ) ) ( not ( = ?auto_662185 ?auto_662186 ) ) ( ON ?auto_662184 ?auto_662185 ) ( ON ?auto_662183 ?auto_662184 ) ( ON ?auto_662182 ?auto_662183 ) ( ON ?auto_662181 ?auto_662182 ) ( CLEAR ?auto_662179 ) ( ON ?auto_662180 ?auto_662181 ) ( CLEAR ?auto_662180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_662171 ?auto_662172 ?auto_662173 ?auto_662174 ?auto_662175 ?auto_662176 ?auto_662177 ?auto_662178 ?auto_662179 ?auto_662180 )
      ( MAKE-15PILE ?auto_662171 ?auto_662172 ?auto_662173 ?auto_662174 ?auto_662175 ?auto_662176 ?auto_662177 ?auto_662178 ?auto_662179 ?auto_662180 ?auto_662181 ?auto_662182 ?auto_662183 ?auto_662184 ?auto_662185 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_662233 - BLOCK
      ?auto_662234 - BLOCK
      ?auto_662235 - BLOCK
      ?auto_662236 - BLOCK
      ?auto_662237 - BLOCK
      ?auto_662238 - BLOCK
      ?auto_662239 - BLOCK
      ?auto_662240 - BLOCK
      ?auto_662241 - BLOCK
      ?auto_662242 - BLOCK
      ?auto_662243 - BLOCK
      ?auto_662244 - BLOCK
      ?auto_662245 - BLOCK
      ?auto_662246 - BLOCK
      ?auto_662247 - BLOCK
    )
    :vars
    (
      ?auto_662248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_662247 ?auto_662248 ) ( ON-TABLE ?auto_662233 ) ( ON ?auto_662234 ?auto_662233 ) ( ON ?auto_662235 ?auto_662234 ) ( ON ?auto_662236 ?auto_662235 ) ( ON ?auto_662237 ?auto_662236 ) ( ON ?auto_662238 ?auto_662237 ) ( ON ?auto_662239 ?auto_662238 ) ( ON ?auto_662240 ?auto_662239 ) ( not ( = ?auto_662233 ?auto_662234 ) ) ( not ( = ?auto_662233 ?auto_662235 ) ) ( not ( = ?auto_662233 ?auto_662236 ) ) ( not ( = ?auto_662233 ?auto_662237 ) ) ( not ( = ?auto_662233 ?auto_662238 ) ) ( not ( = ?auto_662233 ?auto_662239 ) ) ( not ( = ?auto_662233 ?auto_662240 ) ) ( not ( = ?auto_662233 ?auto_662241 ) ) ( not ( = ?auto_662233 ?auto_662242 ) ) ( not ( = ?auto_662233 ?auto_662243 ) ) ( not ( = ?auto_662233 ?auto_662244 ) ) ( not ( = ?auto_662233 ?auto_662245 ) ) ( not ( = ?auto_662233 ?auto_662246 ) ) ( not ( = ?auto_662233 ?auto_662247 ) ) ( not ( = ?auto_662233 ?auto_662248 ) ) ( not ( = ?auto_662234 ?auto_662235 ) ) ( not ( = ?auto_662234 ?auto_662236 ) ) ( not ( = ?auto_662234 ?auto_662237 ) ) ( not ( = ?auto_662234 ?auto_662238 ) ) ( not ( = ?auto_662234 ?auto_662239 ) ) ( not ( = ?auto_662234 ?auto_662240 ) ) ( not ( = ?auto_662234 ?auto_662241 ) ) ( not ( = ?auto_662234 ?auto_662242 ) ) ( not ( = ?auto_662234 ?auto_662243 ) ) ( not ( = ?auto_662234 ?auto_662244 ) ) ( not ( = ?auto_662234 ?auto_662245 ) ) ( not ( = ?auto_662234 ?auto_662246 ) ) ( not ( = ?auto_662234 ?auto_662247 ) ) ( not ( = ?auto_662234 ?auto_662248 ) ) ( not ( = ?auto_662235 ?auto_662236 ) ) ( not ( = ?auto_662235 ?auto_662237 ) ) ( not ( = ?auto_662235 ?auto_662238 ) ) ( not ( = ?auto_662235 ?auto_662239 ) ) ( not ( = ?auto_662235 ?auto_662240 ) ) ( not ( = ?auto_662235 ?auto_662241 ) ) ( not ( = ?auto_662235 ?auto_662242 ) ) ( not ( = ?auto_662235 ?auto_662243 ) ) ( not ( = ?auto_662235 ?auto_662244 ) ) ( not ( = ?auto_662235 ?auto_662245 ) ) ( not ( = ?auto_662235 ?auto_662246 ) ) ( not ( = ?auto_662235 ?auto_662247 ) ) ( not ( = ?auto_662235 ?auto_662248 ) ) ( not ( = ?auto_662236 ?auto_662237 ) ) ( not ( = ?auto_662236 ?auto_662238 ) ) ( not ( = ?auto_662236 ?auto_662239 ) ) ( not ( = ?auto_662236 ?auto_662240 ) ) ( not ( = ?auto_662236 ?auto_662241 ) ) ( not ( = ?auto_662236 ?auto_662242 ) ) ( not ( = ?auto_662236 ?auto_662243 ) ) ( not ( = ?auto_662236 ?auto_662244 ) ) ( not ( = ?auto_662236 ?auto_662245 ) ) ( not ( = ?auto_662236 ?auto_662246 ) ) ( not ( = ?auto_662236 ?auto_662247 ) ) ( not ( = ?auto_662236 ?auto_662248 ) ) ( not ( = ?auto_662237 ?auto_662238 ) ) ( not ( = ?auto_662237 ?auto_662239 ) ) ( not ( = ?auto_662237 ?auto_662240 ) ) ( not ( = ?auto_662237 ?auto_662241 ) ) ( not ( = ?auto_662237 ?auto_662242 ) ) ( not ( = ?auto_662237 ?auto_662243 ) ) ( not ( = ?auto_662237 ?auto_662244 ) ) ( not ( = ?auto_662237 ?auto_662245 ) ) ( not ( = ?auto_662237 ?auto_662246 ) ) ( not ( = ?auto_662237 ?auto_662247 ) ) ( not ( = ?auto_662237 ?auto_662248 ) ) ( not ( = ?auto_662238 ?auto_662239 ) ) ( not ( = ?auto_662238 ?auto_662240 ) ) ( not ( = ?auto_662238 ?auto_662241 ) ) ( not ( = ?auto_662238 ?auto_662242 ) ) ( not ( = ?auto_662238 ?auto_662243 ) ) ( not ( = ?auto_662238 ?auto_662244 ) ) ( not ( = ?auto_662238 ?auto_662245 ) ) ( not ( = ?auto_662238 ?auto_662246 ) ) ( not ( = ?auto_662238 ?auto_662247 ) ) ( not ( = ?auto_662238 ?auto_662248 ) ) ( not ( = ?auto_662239 ?auto_662240 ) ) ( not ( = ?auto_662239 ?auto_662241 ) ) ( not ( = ?auto_662239 ?auto_662242 ) ) ( not ( = ?auto_662239 ?auto_662243 ) ) ( not ( = ?auto_662239 ?auto_662244 ) ) ( not ( = ?auto_662239 ?auto_662245 ) ) ( not ( = ?auto_662239 ?auto_662246 ) ) ( not ( = ?auto_662239 ?auto_662247 ) ) ( not ( = ?auto_662239 ?auto_662248 ) ) ( not ( = ?auto_662240 ?auto_662241 ) ) ( not ( = ?auto_662240 ?auto_662242 ) ) ( not ( = ?auto_662240 ?auto_662243 ) ) ( not ( = ?auto_662240 ?auto_662244 ) ) ( not ( = ?auto_662240 ?auto_662245 ) ) ( not ( = ?auto_662240 ?auto_662246 ) ) ( not ( = ?auto_662240 ?auto_662247 ) ) ( not ( = ?auto_662240 ?auto_662248 ) ) ( not ( = ?auto_662241 ?auto_662242 ) ) ( not ( = ?auto_662241 ?auto_662243 ) ) ( not ( = ?auto_662241 ?auto_662244 ) ) ( not ( = ?auto_662241 ?auto_662245 ) ) ( not ( = ?auto_662241 ?auto_662246 ) ) ( not ( = ?auto_662241 ?auto_662247 ) ) ( not ( = ?auto_662241 ?auto_662248 ) ) ( not ( = ?auto_662242 ?auto_662243 ) ) ( not ( = ?auto_662242 ?auto_662244 ) ) ( not ( = ?auto_662242 ?auto_662245 ) ) ( not ( = ?auto_662242 ?auto_662246 ) ) ( not ( = ?auto_662242 ?auto_662247 ) ) ( not ( = ?auto_662242 ?auto_662248 ) ) ( not ( = ?auto_662243 ?auto_662244 ) ) ( not ( = ?auto_662243 ?auto_662245 ) ) ( not ( = ?auto_662243 ?auto_662246 ) ) ( not ( = ?auto_662243 ?auto_662247 ) ) ( not ( = ?auto_662243 ?auto_662248 ) ) ( not ( = ?auto_662244 ?auto_662245 ) ) ( not ( = ?auto_662244 ?auto_662246 ) ) ( not ( = ?auto_662244 ?auto_662247 ) ) ( not ( = ?auto_662244 ?auto_662248 ) ) ( not ( = ?auto_662245 ?auto_662246 ) ) ( not ( = ?auto_662245 ?auto_662247 ) ) ( not ( = ?auto_662245 ?auto_662248 ) ) ( not ( = ?auto_662246 ?auto_662247 ) ) ( not ( = ?auto_662246 ?auto_662248 ) ) ( not ( = ?auto_662247 ?auto_662248 ) ) ( ON ?auto_662246 ?auto_662247 ) ( ON ?auto_662245 ?auto_662246 ) ( ON ?auto_662244 ?auto_662245 ) ( ON ?auto_662243 ?auto_662244 ) ( ON ?auto_662242 ?auto_662243 ) ( CLEAR ?auto_662240 ) ( ON ?auto_662241 ?auto_662242 ) ( CLEAR ?auto_662241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_662233 ?auto_662234 ?auto_662235 ?auto_662236 ?auto_662237 ?auto_662238 ?auto_662239 ?auto_662240 ?auto_662241 )
      ( MAKE-15PILE ?auto_662233 ?auto_662234 ?auto_662235 ?auto_662236 ?auto_662237 ?auto_662238 ?auto_662239 ?auto_662240 ?auto_662241 ?auto_662242 ?auto_662243 ?auto_662244 ?auto_662245 ?auto_662246 ?auto_662247 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_662295 - BLOCK
      ?auto_662296 - BLOCK
      ?auto_662297 - BLOCK
      ?auto_662298 - BLOCK
      ?auto_662299 - BLOCK
      ?auto_662300 - BLOCK
      ?auto_662301 - BLOCK
      ?auto_662302 - BLOCK
      ?auto_662303 - BLOCK
      ?auto_662304 - BLOCK
      ?auto_662305 - BLOCK
      ?auto_662306 - BLOCK
      ?auto_662307 - BLOCK
      ?auto_662308 - BLOCK
      ?auto_662309 - BLOCK
    )
    :vars
    (
      ?auto_662310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_662309 ?auto_662310 ) ( ON-TABLE ?auto_662295 ) ( ON ?auto_662296 ?auto_662295 ) ( ON ?auto_662297 ?auto_662296 ) ( ON ?auto_662298 ?auto_662297 ) ( ON ?auto_662299 ?auto_662298 ) ( ON ?auto_662300 ?auto_662299 ) ( ON ?auto_662301 ?auto_662300 ) ( not ( = ?auto_662295 ?auto_662296 ) ) ( not ( = ?auto_662295 ?auto_662297 ) ) ( not ( = ?auto_662295 ?auto_662298 ) ) ( not ( = ?auto_662295 ?auto_662299 ) ) ( not ( = ?auto_662295 ?auto_662300 ) ) ( not ( = ?auto_662295 ?auto_662301 ) ) ( not ( = ?auto_662295 ?auto_662302 ) ) ( not ( = ?auto_662295 ?auto_662303 ) ) ( not ( = ?auto_662295 ?auto_662304 ) ) ( not ( = ?auto_662295 ?auto_662305 ) ) ( not ( = ?auto_662295 ?auto_662306 ) ) ( not ( = ?auto_662295 ?auto_662307 ) ) ( not ( = ?auto_662295 ?auto_662308 ) ) ( not ( = ?auto_662295 ?auto_662309 ) ) ( not ( = ?auto_662295 ?auto_662310 ) ) ( not ( = ?auto_662296 ?auto_662297 ) ) ( not ( = ?auto_662296 ?auto_662298 ) ) ( not ( = ?auto_662296 ?auto_662299 ) ) ( not ( = ?auto_662296 ?auto_662300 ) ) ( not ( = ?auto_662296 ?auto_662301 ) ) ( not ( = ?auto_662296 ?auto_662302 ) ) ( not ( = ?auto_662296 ?auto_662303 ) ) ( not ( = ?auto_662296 ?auto_662304 ) ) ( not ( = ?auto_662296 ?auto_662305 ) ) ( not ( = ?auto_662296 ?auto_662306 ) ) ( not ( = ?auto_662296 ?auto_662307 ) ) ( not ( = ?auto_662296 ?auto_662308 ) ) ( not ( = ?auto_662296 ?auto_662309 ) ) ( not ( = ?auto_662296 ?auto_662310 ) ) ( not ( = ?auto_662297 ?auto_662298 ) ) ( not ( = ?auto_662297 ?auto_662299 ) ) ( not ( = ?auto_662297 ?auto_662300 ) ) ( not ( = ?auto_662297 ?auto_662301 ) ) ( not ( = ?auto_662297 ?auto_662302 ) ) ( not ( = ?auto_662297 ?auto_662303 ) ) ( not ( = ?auto_662297 ?auto_662304 ) ) ( not ( = ?auto_662297 ?auto_662305 ) ) ( not ( = ?auto_662297 ?auto_662306 ) ) ( not ( = ?auto_662297 ?auto_662307 ) ) ( not ( = ?auto_662297 ?auto_662308 ) ) ( not ( = ?auto_662297 ?auto_662309 ) ) ( not ( = ?auto_662297 ?auto_662310 ) ) ( not ( = ?auto_662298 ?auto_662299 ) ) ( not ( = ?auto_662298 ?auto_662300 ) ) ( not ( = ?auto_662298 ?auto_662301 ) ) ( not ( = ?auto_662298 ?auto_662302 ) ) ( not ( = ?auto_662298 ?auto_662303 ) ) ( not ( = ?auto_662298 ?auto_662304 ) ) ( not ( = ?auto_662298 ?auto_662305 ) ) ( not ( = ?auto_662298 ?auto_662306 ) ) ( not ( = ?auto_662298 ?auto_662307 ) ) ( not ( = ?auto_662298 ?auto_662308 ) ) ( not ( = ?auto_662298 ?auto_662309 ) ) ( not ( = ?auto_662298 ?auto_662310 ) ) ( not ( = ?auto_662299 ?auto_662300 ) ) ( not ( = ?auto_662299 ?auto_662301 ) ) ( not ( = ?auto_662299 ?auto_662302 ) ) ( not ( = ?auto_662299 ?auto_662303 ) ) ( not ( = ?auto_662299 ?auto_662304 ) ) ( not ( = ?auto_662299 ?auto_662305 ) ) ( not ( = ?auto_662299 ?auto_662306 ) ) ( not ( = ?auto_662299 ?auto_662307 ) ) ( not ( = ?auto_662299 ?auto_662308 ) ) ( not ( = ?auto_662299 ?auto_662309 ) ) ( not ( = ?auto_662299 ?auto_662310 ) ) ( not ( = ?auto_662300 ?auto_662301 ) ) ( not ( = ?auto_662300 ?auto_662302 ) ) ( not ( = ?auto_662300 ?auto_662303 ) ) ( not ( = ?auto_662300 ?auto_662304 ) ) ( not ( = ?auto_662300 ?auto_662305 ) ) ( not ( = ?auto_662300 ?auto_662306 ) ) ( not ( = ?auto_662300 ?auto_662307 ) ) ( not ( = ?auto_662300 ?auto_662308 ) ) ( not ( = ?auto_662300 ?auto_662309 ) ) ( not ( = ?auto_662300 ?auto_662310 ) ) ( not ( = ?auto_662301 ?auto_662302 ) ) ( not ( = ?auto_662301 ?auto_662303 ) ) ( not ( = ?auto_662301 ?auto_662304 ) ) ( not ( = ?auto_662301 ?auto_662305 ) ) ( not ( = ?auto_662301 ?auto_662306 ) ) ( not ( = ?auto_662301 ?auto_662307 ) ) ( not ( = ?auto_662301 ?auto_662308 ) ) ( not ( = ?auto_662301 ?auto_662309 ) ) ( not ( = ?auto_662301 ?auto_662310 ) ) ( not ( = ?auto_662302 ?auto_662303 ) ) ( not ( = ?auto_662302 ?auto_662304 ) ) ( not ( = ?auto_662302 ?auto_662305 ) ) ( not ( = ?auto_662302 ?auto_662306 ) ) ( not ( = ?auto_662302 ?auto_662307 ) ) ( not ( = ?auto_662302 ?auto_662308 ) ) ( not ( = ?auto_662302 ?auto_662309 ) ) ( not ( = ?auto_662302 ?auto_662310 ) ) ( not ( = ?auto_662303 ?auto_662304 ) ) ( not ( = ?auto_662303 ?auto_662305 ) ) ( not ( = ?auto_662303 ?auto_662306 ) ) ( not ( = ?auto_662303 ?auto_662307 ) ) ( not ( = ?auto_662303 ?auto_662308 ) ) ( not ( = ?auto_662303 ?auto_662309 ) ) ( not ( = ?auto_662303 ?auto_662310 ) ) ( not ( = ?auto_662304 ?auto_662305 ) ) ( not ( = ?auto_662304 ?auto_662306 ) ) ( not ( = ?auto_662304 ?auto_662307 ) ) ( not ( = ?auto_662304 ?auto_662308 ) ) ( not ( = ?auto_662304 ?auto_662309 ) ) ( not ( = ?auto_662304 ?auto_662310 ) ) ( not ( = ?auto_662305 ?auto_662306 ) ) ( not ( = ?auto_662305 ?auto_662307 ) ) ( not ( = ?auto_662305 ?auto_662308 ) ) ( not ( = ?auto_662305 ?auto_662309 ) ) ( not ( = ?auto_662305 ?auto_662310 ) ) ( not ( = ?auto_662306 ?auto_662307 ) ) ( not ( = ?auto_662306 ?auto_662308 ) ) ( not ( = ?auto_662306 ?auto_662309 ) ) ( not ( = ?auto_662306 ?auto_662310 ) ) ( not ( = ?auto_662307 ?auto_662308 ) ) ( not ( = ?auto_662307 ?auto_662309 ) ) ( not ( = ?auto_662307 ?auto_662310 ) ) ( not ( = ?auto_662308 ?auto_662309 ) ) ( not ( = ?auto_662308 ?auto_662310 ) ) ( not ( = ?auto_662309 ?auto_662310 ) ) ( ON ?auto_662308 ?auto_662309 ) ( ON ?auto_662307 ?auto_662308 ) ( ON ?auto_662306 ?auto_662307 ) ( ON ?auto_662305 ?auto_662306 ) ( ON ?auto_662304 ?auto_662305 ) ( ON ?auto_662303 ?auto_662304 ) ( CLEAR ?auto_662301 ) ( ON ?auto_662302 ?auto_662303 ) ( CLEAR ?auto_662302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_662295 ?auto_662296 ?auto_662297 ?auto_662298 ?auto_662299 ?auto_662300 ?auto_662301 ?auto_662302 )
      ( MAKE-15PILE ?auto_662295 ?auto_662296 ?auto_662297 ?auto_662298 ?auto_662299 ?auto_662300 ?auto_662301 ?auto_662302 ?auto_662303 ?auto_662304 ?auto_662305 ?auto_662306 ?auto_662307 ?auto_662308 ?auto_662309 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_662357 - BLOCK
      ?auto_662358 - BLOCK
      ?auto_662359 - BLOCK
      ?auto_662360 - BLOCK
      ?auto_662361 - BLOCK
      ?auto_662362 - BLOCK
      ?auto_662363 - BLOCK
      ?auto_662364 - BLOCK
      ?auto_662365 - BLOCK
      ?auto_662366 - BLOCK
      ?auto_662367 - BLOCK
      ?auto_662368 - BLOCK
      ?auto_662369 - BLOCK
      ?auto_662370 - BLOCK
      ?auto_662371 - BLOCK
    )
    :vars
    (
      ?auto_662372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_662371 ?auto_662372 ) ( ON-TABLE ?auto_662357 ) ( ON ?auto_662358 ?auto_662357 ) ( ON ?auto_662359 ?auto_662358 ) ( ON ?auto_662360 ?auto_662359 ) ( ON ?auto_662361 ?auto_662360 ) ( ON ?auto_662362 ?auto_662361 ) ( not ( = ?auto_662357 ?auto_662358 ) ) ( not ( = ?auto_662357 ?auto_662359 ) ) ( not ( = ?auto_662357 ?auto_662360 ) ) ( not ( = ?auto_662357 ?auto_662361 ) ) ( not ( = ?auto_662357 ?auto_662362 ) ) ( not ( = ?auto_662357 ?auto_662363 ) ) ( not ( = ?auto_662357 ?auto_662364 ) ) ( not ( = ?auto_662357 ?auto_662365 ) ) ( not ( = ?auto_662357 ?auto_662366 ) ) ( not ( = ?auto_662357 ?auto_662367 ) ) ( not ( = ?auto_662357 ?auto_662368 ) ) ( not ( = ?auto_662357 ?auto_662369 ) ) ( not ( = ?auto_662357 ?auto_662370 ) ) ( not ( = ?auto_662357 ?auto_662371 ) ) ( not ( = ?auto_662357 ?auto_662372 ) ) ( not ( = ?auto_662358 ?auto_662359 ) ) ( not ( = ?auto_662358 ?auto_662360 ) ) ( not ( = ?auto_662358 ?auto_662361 ) ) ( not ( = ?auto_662358 ?auto_662362 ) ) ( not ( = ?auto_662358 ?auto_662363 ) ) ( not ( = ?auto_662358 ?auto_662364 ) ) ( not ( = ?auto_662358 ?auto_662365 ) ) ( not ( = ?auto_662358 ?auto_662366 ) ) ( not ( = ?auto_662358 ?auto_662367 ) ) ( not ( = ?auto_662358 ?auto_662368 ) ) ( not ( = ?auto_662358 ?auto_662369 ) ) ( not ( = ?auto_662358 ?auto_662370 ) ) ( not ( = ?auto_662358 ?auto_662371 ) ) ( not ( = ?auto_662358 ?auto_662372 ) ) ( not ( = ?auto_662359 ?auto_662360 ) ) ( not ( = ?auto_662359 ?auto_662361 ) ) ( not ( = ?auto_662359 ?auto_662362 ) ) ( not ( = ?auto_662359 ?auto_662363 ) ) ( not ( = ?auto_662359 ?auto_662364 ) ) ( not ( = ?auto_662359 ?auto_662365 ) ) ( not ( = ?auto_662359 ?auto_662366 ) ) ( not ( = ?auto_662359 ?auto_662367 ) ) ( not ( = ?auto_662359 ?auto_662368 ) ) ( not ( = ?auto_662359 ?auto_662369 ) ) ( not ( = ?auto_662359 ?auto_662370 ) ) ( not ( = ?auto_662359 ?auto_662371 ) ) ( not ( = ?auto_662359 ?auto_662372 ) ) ( not ( = ?auto_662360 ?auto_662361 ) ) ( not ( = ?auto_662360 ?auto_662362 ) ) ( not ( = ?auto_662360 ?auto_662363 ) ) ( not ( = ?auto_662360 ?auto_662364 ) ) ( not ( = ?auto_662360 ?auto_662365 ) ) ( not ( = ?auto_662360 ?auto_662366 ) ) ( not ( = ?auto_662360 ?auto_662367 ) ) ( not ( = ?auto_662360 ?auto_662368 ) ) ( not ( = ?auto_662360 ?auto_662369 ) ) ( not ( = ?auto_662360 ?auto_662370 ) ) ( not ( = ?auto_662360 ?auto_662371 ) ) ( not ( = ?auto_662360 ?auto_662372 ) ) ( not ( = ?auto_662361 ?auto_662362 ) ) ( not ( = ?auto_662361 ?auto_662363 ) ) ( not ( = ?auto_662361 ?auto_662364 ) ) ( not ( = ?auto_662361 ?auto_662365 ) ) ( not ( = ?auto_662361 ?auto_662366 ) ) ( not ( = ?auto_662361 ?auto_662367 ) ) ( not ( = ?auto_662361 ?auto_662368 ) ) ( not ( = ?auto_662361 ?auto_662369 ) ) ( not ( = ?auto_662361 ?auto_662370 ) ) ( not ( = ?auto_662361 ?auto_662371 ) ) ( not ( = ?auto_662361 ?auto_662372 ) ) ( not ( = ?auto_662362 ?auto_662363 ) ) ( not ( = ?auto_662362 ?auto_662364 ) ) ( not ( = ?auto_662362 ?auto_662365 ) ) ( not ( = ?auto_662362 ?auto_662366 ) ) ( not ( = ?auto_662362 ?auto_662367 ) ) ( not ( = ?auto_662362 ?auto_662368 ) ) ( not ( = ?auto_662362 ?auto_662369 ) ) ( not ( = ?auto_662362 ?auto_662370 ) ) ( not ( = ?auto_662362 ?auto_662371 ) ) ( not ( = ?auto_662362 ?auto_662372 ) ) ( not ( = ?auto_662363 ?auto_662364 ) ) ( not ( = ?auto_662363 ?auto_662365 ) ) ( not ( = ?auto_662363 ?auto_662366 ) ) ( not ( = ?auto_662363 ?auto_662367 ) ) ( not ( = ?auto_662363 ?auto_662368 ) ) ( not ( = ?auto_662363 ?auto_662369 ) ) ( not ( = ?auto_662363 ?auto_662370 ) ) ( not ( = ?auto_662363 ?auto_662371 ) ) ( not ( = ?auto_662363 ?auto_662372 ) ) ( not ( = ?auto_662364 ?auto_662365 ) ) ( not ( = ?auto_662364 ?auto_662366 ) ) ( not ( = ?auto_662364 ?auto_662367 ) ) ( not ( = ?auto_662364 ?auto_662368 ) ) ( not ( = ?auto_662364 ?auto_662369 ) ) ( not ( = ?auto_662364 ?auto_662370 ) ) ( not ( = ?auto_662364 ?auto_662371 ) ) ( not ( = ?auto_662364 ?auto_662372 ) ) ( not ( = ?auto_662365 ?auto_662366 ) ) ( not ( = ?auto_662365 ?auto_662367 ) ) ( not ( = ?auto_662365 ?auto_662368 ) ) ( not ( = ?auto_662365 ?auto_662369 ) ) ( not ( = ?auto_662365 ?auto_662370 ) ) ( not ( = ?auto_662365 ?auto_662371 ) ) ( not ( = ?auto_662365 ?auto_662372 ) ) ( not ( = ?auto_662366 ?auto_662367 ) ) ( not ( = ?auto_662366 ?auto_662368 ) ) ( not ( = ?auto_662366 ?auto_662369 ) ) ( not ( = ?auto_662366 ?auto_662370 ) ) ( not ( = ?auto_662366 ?auto_662371 ) ) ( not ( = ?auto_662366 ?auto_662372 ) ) ( not ( = ?auto_662367 ?auto_662368 ) ) ( not ( = ?auto_662367 ?auto_662369 ) ) ( not ( = ?auto_662367 ?auto_662370 ) ) ( not ( = ?auto_662367 ?auto_662371 ) ) ( not ( = ?auto_662367 ?auto_662372 ) ) ( not ( = ?auto_662368 ?auto_662369 ) ) ( not ( = ?auto_662368 ?auto_662370 ) ) ( not ( = ?auto_662368 ?auto_662371 ) ) ( not ( = ?auto_662368 ?auto_662372 ) ) ( not ( = ?auto_662369 ?auto_662370 ) ) ( not ( = ?auto_662369 ?auto_662371 ) ) ( not ( = ?auto_662369 ?auto_662372 ) ) ( not ( = ?auto_662370 ?auto_662371 ) ) ( not ( = ?auto_662370 ?auto_662372 ) ) ( not ( = ?auto_662371 ?auto_662372 ) ) ( ON ?auto_662370 ?auto_662371 ) ( ON ?auto_662369 ?auto_662370 ) ( ON ?auto_662368 ?auto_662369 ) ( ON ?auto_662367 ?auto_662368 ) ( ON ?auto_662366 ?auto_662367 ) ( ON ?auto_662365 ?auto_662366 ) ( ON ?auto_662364 ?auto_662365 ) ( CLEAR ?auto_662362 ) ( ON ?auto_662363 ?auto_662364 ) ( CLEAR ?auto_662363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_662357 ?auto_662358 ?auto_662359 ?auto_662360 ?auto_662361 ?auto_662362 ?auto_662363 )
      ( MAKE-15PILE ?auto_662357 ?auto_662358 ?auto_662359 ?auto_662360 ?auto_662361 ?auto_662362 ?auto_662363 ?auto_662364 ?auto_662365 ?auto_662366 ?auto_662367 ?auto_662368 ?auto_662369 ?auto_662370 ?auto_662371 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_662419 - BLOCK
      ?auto_662420 - BLOCK
      ?auto_662421 - BLOCK
      ?auto_662422 - BLOCK
      ?auto_662423 - BLOCK
      ?auto_662424 - BLOCK
      ?auto_662425 - BLOCK
      ?auto_662426 - BLOCK
      ?auto_662427 - BLOCK
      ?auto_662428 - BLOCK
      ?auto_662429 - BLOCK
      ?auto_662430 - BLOCK
      ?auto_662431 - BLOCK
      ?auto_662432 - BLOCK
      ?auto_662433 - BLOCK
    )
    :vars
    (
      ?auto_662434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_662433 ?auto_662434 ) ( ON-TABLE ?auto_662419 ) ( ON ?auto_662420 ?auto_662419 ) ( ON ?auto_662421 ?auto_662420 ) ( ON ?auto_662422 ?auto_662421 ) ( ON ?auto_662423 ?auto_662422 ) ( not ( = ?auto_662419 ?auto_662420 ) ) ( not ( = ?auto_662419 ?auto_662421 ) ) ( not ( = ?auto_662419 ?auto_662422 ) ) ( not ( = ?auto_662419 ?auto_662423 ) ) ( not ( = ?auto_662419 ?auto_662424 ) ) ( not ( = ?auto_662419 ?auto_662425 ) ) ( not ( = ?auto_662419 ?auto_662426 ) ) ( not ( = ?auto_662419 ?auto_662427 ) ) ( not ( = ?auto_662419 ?auto_662428 ) ) ( not ( = ?auto_662419 ?auto_662429 ) ) ( not ( = ?auto_662419 ?auto_662430 ) ) ( not ( = ?auto_662419 ?auto_662431 ) ) ( not ( = ?auto_662419 ?auto_662432 ) ) ( not ( = ?auto_662419 ?auto_662433 ) ) ( not ( = ?auto_662419 ?auto_662434 ) ) ( not ( = ?auto_662420 ?auto_662421 ) ) ( not ( = ?auto_662420 ?auto_662422 ) ) ( not ( = ?auto_662420 ?auto_662423 ) ) ( not ( = ?auto_662420 ?auto_662424 ) ) ( not ( = ?auto_662420 ?auto_662425 ) ) ( not ( = ?auto_662420 ?auto_662426 ) ) ( not ( = ?auto_662420 ?auto_662427 ) ) ( not ( = ?auto_662420 ?auto_662428 ) ) ( not ( = ?auto_662420 ?auto_662429 ) ) ( not ( = ?auto_662420 ?auto_662430 ) ) ( not ( = ?auto_662420 ?auto_662431 ) ) ( not ( = ?auto_662420 ?auto_662432 ) ) ( not ( = ?auto_662420 ?auto_662433 ) ) ( not ( = ?auto_662420 ?auto_662434 ) ) ( not ( = ?auto_662421 ?auto_662422 ) ) ( not ( = ?auto_662421 ?auto_662423 ) ) ( not ( = ?auto_662421 ?auto_662424 ) ) ( not ( = ?auto_662421 ?auto_662425 ) ) ( not ( = ?auto_662421 ?auto_662426 ) ) ( not ( = ?auto_662421 ?auto_662427 ) ) ( not ( = ?auto_662421 ?auto_662428 ) ) ( not ( = ?auto_662421 ?auto_662429 ) ) ( not ( = ?auto_662421 ?auto_662430 ) ) ( not ( = ?auto_662421 ?auto_662431 ) ) ( not ( = ?auto_662421 ?auto_662432 ) ) ( not ( = ?auto_662421 ?auto_662433 ) ) ( not ( = ?auto_662421 ?auto_662434 ) ) ( not ( = ?auto_662422 ?auto_662423 ) ) ( not ( = ?auto_662422 ?auto_662424 ) ) ( not ( = ?auto_662422 ?auto_662425 ) ) ( not ( = ?auto_662422 ?auto_662426 ) ) ( not ( = ?auto_662422 ?auto_662427 ) ) ( not ( = ?auto_662422 ?auto_662428 ) ) ( not ( = ?auto_662422 ?auto_662429 ) ) ( not ( = ?auto_662422 ?auto_662430 ) ) ( not ( = ?auto_662422 ?auto_662431 ) ) ( not ( = ?auto_662422 ?auto_662432 ) ) ( not ( = ?auto_662422 ?auto_662433 ) ) ( not ( = ?auto_662422 ?auto_662434 ) ) ( not ( = ?auto_662423 ?auto_662424 ) ) ( not ( = ?auto_662423 ?auto_662425 ) ) ( not ( = ?auto_662423 ?auto_662426 ) ) ( not ( = ?auto_662423 ?auto_662427 ) ) ( not ( = ?auto_662423 ?auto_662428 ) ) ( not ( = ?auto_662423 ?auto_662429 ) ) ( not ( = ?auto_662423 ?auto_662430 ) ) ( not ( = ?auto_662423 ?auto_662431 ) ) ( not ( = ?auto_662423 ?auto_662432 ) ) ( not ( = ?auto_662423 ?auto_662433 ) ) ( not ( = ?auto_662423 ?auto_662434 ) ) ( not ( = ?auto_662424 ?auto_662425 ) ) ( not ( = ?auto_662424 ?auto_662426 ) ) ( not ( = ?auto_662424 ?auto_662427 ) ) ( not ( = ?auto_662424 ?auto_662428 ) ) ( not ( = ?auto_662424 ?auto_662429 ) ) ( not ( = ?auto_662424 ?auto_662430 ) ) ( not ( = ?auto_662424 ?auto_662431 ) ) ( not ( = ?auto_662424 ?auto_662432 ) ) ( not ( = ?auto_662424 ?auto_662433 ) ) ( not ( = ?auto_662424 ?auto_662434 ) ) ( not ( = ?auto_662425 ?auto_662426 ) ) ( not ( = ?auto_662425 ?auto_662427 ) ) ( not ( = ?auto_662425 ?auto_662428 ) ) ( not ( = ?auto_662425 ?auto_662429 ) ) ( not ( = ?auto_662425 ?auto_662430 ) ) ( not ( = ?auto_662425 ?auto_662431 ) ) ( not ( = ?auto_662425 ?auto_662432 ) ) ( not ( = ?auto_662425 ?auto_662433 ) ) ( not ( = ?auto_662425 ?auto_662434 ) ) ( not ( = ?auto_662426 ?auto_662427 ) ) ( not ( = ?auto_662426 ?auto_662428 ) ) ( not ( = ?auto_662426 ?auto_662429 ) ) ( not ( = ?auto_662426 ?auto_662430 ) ) ( not ( = ?auto_662426 ?auto_662431 ) ) ( not ( = ?auto_662426 ?auto_662432 ) ) ( not ( = ?auto_662426 ?auto_662433 ) ) ( not ( = ?auto_662426 ?auto_662434 ) ) ( not ( = ?auto_662427 ?auto_662428 ) ) ( not ( = ?auto_662427 ?auto_662429 ) ) ( not ( = ?auto_662427 ?auto_662430 ) ) ( not ( = ?auto_662427 ?auto_662431 ) ) ( not ( = ?auto_662427 ?auto_662432 ) ) ( not ( = ?auto_662427 ?auto_662433 ) ) ( not ( = ?auto_662427 ?auto_662434 ) ) ( not ( = ?auto_662428 ?auto_662429 ) ) ( not ( = ?auto_662428 ?auto_662430 ) ) ( not ( = ?auto_662428 ?auto_662431 ) ) ( not ( = ?auto_662428 ?auto_662432 ) ) ( not ( = ?auto_662428 ?auto_662433 ) ) ( not ( = ?auto_662428 ?auto_662434 ) ) ( not ( = ?auto_662429 ?auto_662430 ) ) ( not ( = ?auto_662429 ?auto_662431 ) ) ( not ( = ?auto_662429 ?auto_662432 ) ) ( not ( = ?auto_662429 ?auto_662433 ) ) ( not ( = ?auto_662429 ?auto_662434 ) ) ( not ( = ?auto_662430 ?auto_662431 ) ) ( not ( = ?auto_662430 ?auto_662432 ) ) ( not ( = ?auto_662430 ?auto_662433 ) ) ( not ( = ?auto_662430 ?auto_662434 ) ) ( not ( = ?auto_662431 ?auto_662432 ) ) ( not ( = ?auto_662431 ?auto_662433 ) ) ( not ( = ?auto_662431 ?auto_662434 ) ) ( not ( = ?auto_662432 ?auto_662433 ) ) ( not ( = ?auto_662432 ?auto_662434 ) ) ( not ( = ?auto_662433 ?auto_662434 ) ) ( ON ?auto_662432 ?auto_662433 ) ( ON ?auto_662431 ?auto_662432 ) ( ON ?auto_662430 ?auto_662431 ) ( ON ?auto_662429 ?auto_662430 ) ( ON ?auto_662428 ?auto_662429 ) ( ON ?auto_662427 ?auto_662428 ) ( ON ?auto_662426 ?auto_662427 ) ( ON ?auto_662425 ?auto_662426 ) ( CLEAR ?auto_662423 ) ( ON ?auto_662424 ?auto_662425 ) ( CLEAR ?auto_662424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_662419 ?auto_662420 ?auto_662421 ?auto_662422 ?auto_662423 ?auto_662424 )
      ( MAKE-15PILE ?auto_662419 ?auto_662420 ?auto_662421 ?auto_662422 ?auto_662423 ?auto_662424 ?auto_662425 ?auto_662426 ?auto_662427 ?auto_662428 ?auto_662429 ?auto_662430 ?auto_662431 ?auto_662432 ?auto_662433 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_662481 - BLOCK
      ?auto_662482 - BLOCK
      ?auto_662483 - BLOCK
      ?auto_662484 - BLOCK
      ?auto_662485 - BLOCK
      ?auto_662486 - BLOCK
      ?auto_662487 - BLOCK
      ?auto_662488 - BLOCK
      ?auto_662489 - BLOCK
      ?auto_662490 - BLOCK
      ?auto_662491 - BLOCK
      ?auto_662492 - BLOCK
      ?auto_662493 - BLOCK
      ?auto_662494 - BLOCK
      ?auto_662495 - BLOCK
    )
    :vars
    (
      ?auto_662496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_662495 ?auto_662496 ) ( ON-TABLE ?auto_662481 ) ( ON ?auto_662482 ?auto_662481 ) ( ON ?auto_662483 ?auto_662482 ) ( ON ?auto_662484 ?auto_662483 ) ( not ( = ?auto_662481 ?auto_662482 ) ) ( not ( = ?auto_662481 ?auto_662483 ) ) ( not ( = ?auto_662481 ?auto_662484 ) ) ( not ( = ?auto_662481 ?auto_662485 ) ) ( not ( = ?auto_662481 ?auto_662486 ) ) ( not ( = ?auto_662481 ?auto_662487 ) ) ( not ( = ?auto_662481 ?auto_662488 ) ) ( not ( = ?auto_662481 ?auto_662489 ) ) ( not ( = ?auto_662481 ?auto_662490 ) ) ( not ( = ?auto_662481 ?auto_662491 ) ) ( not ( = ?auto_662481 ?auto_662492 ) ) ( not ( = ?auto_662481 ?auto_662493 ) ) ( not ( = ?auto_662481 ?auto_662494 ) ) ( not ( = ?auto_662481 ?auto_662495 ) ) ( not ( = ?auto_662481 ?auto_662496 ) ) ( not ( = ?auto_662482 ?auto_662483 ) ) ( not ( = ?auto_662482 ?auto_662484 ) ) ( not ( = ?auto_662482 ?auto_662485 ) ) ( not ( = ?auto_662482 ?auto_662486 ) ) ( not ( = ?auto_662482 ?auto_662487 ) ) ( not ( = ?auto_662482 ?auto_662488 ) ) ( not ( = ?auto_662482 ?auto_662489 ) ) ( not ( = ?auto_662482 ?auto_662490 ) ) ( not ( = ?auto_662482 ?auto_662491 ) ) ( not ( = ?auto_662482 ?auto_662492 ) ) ( not ( = ?auto_662482 ?auto_662493 ) ) ( not ( = ?auto_662482 ?auto_662494 ) ) ( not ( = ?auto_662482 ?auto_662495 ) ) ( not ( = ?auto_662482 ?auto_662496 ) ) ( not ( = ?auto_662483 ?auto_662484 ) ) ( not ( = ?auto_662483 ?auto_662485 ) ) ( not ( = ?auto_662483 ?auto_662486 ) ) ( not ( = ?auto_662483 ?auto_662487 ) ) ( not ( = ?auto_662483 ?auto_662488 ) ) ( not ( = ?auto_662483 ?auto_662489 ) ) ( not ( = ?auto_662483 ?auto_662490 ) ) ( not ( = ?auto_662483 ?auto_662491 ) ) ( not ( = ?auto_662483 ?auto_662492 ) ) ( not ( = ?auto_662483 ?auto_662493 ) ) ( not ( = ?auto_662483 ?auto_662494 ) ) ( not ( = ?auto_662483 ?auto_662495 ) ) ( not ( = ?auto_662483 ?auto_662496 ) ) ( not ( = ?auto_662484 ?auto_662485 ) ) ( not ( = ?auto_662484 ?auto_662486 ) ) ( not ( = ?auto_662484 ?auto_662487 ) ) ( not ( = ?auto_662484 ?auto_662488 ) ) ( not ( = ?auto_662484 ?auto_662489 ) ) ( not ( = ?auto_662484 ?auto_662490 ) ) ( not ( = ?auto_662484 ?auto_662491 ) ) ( not ( = ?auto_662484 ?auto_662492 ) ) ( not ( = ?auto_662484 ?auto_662493 ) ) ( not ( = ?auto_662484 ?auto_662494 ) ) ( not ( = ?auto_662484 ?auto_662495 ) ) ( not ( = ?auto_662484 ?auto_662496 ) ) ( not ( = ?auto_662485 ?auto_662486 ) ) ( not ( = ?auto_662485 ?auto_662487 ) ) ( not ( = ?auto_662485 ?auto_662488 ) ) ( not ( = ?auto_662485 ?auto_662489 ) ) ( not ( = ?auto_662485 ?auto_662490 ) ) ( not ( = ?auto_662485 ?auto_662491 ) ) ( not ( = ?auto_662485 ?auto_662492 ) ) ( not ( = ?auto_662485 ?auto_662493 ) ) ( not ( = ?auto_662485 ?auto_662494 ) ) ( not ( = ?auto_662485 ?auto_662495 ) ) ( not ( = ?auto_662485 ?auto_662496 ) ) ( not ( = ?auto_662486 ?auto_662487 ) ) ( not ( = ?auto_662486 ?auto_662488 ) ) ( not ( = ?auto_662486 ?auto_662489 ) ) ( not ( = ?auto_662486 ?auto_662490 ) ) ( not ( = ?auto_662486 ?auto_662491 ) ) ( not ( = ?auto_662486 ?auto_662492 ) ) ( not ( = ?auto_662486 ?auto_662493 ) ) ( not ( = ?auto_662486 ?auto_662494 ) ) ( not ( = ?auto_662486 ?auto_662495 ) ) ( not ( = ?auto_662486 ?auto_662496 ) ) ( not ( = ?auto_662487 ?auto_662488 ) ) ( not ( = ?auto_662487 ?auto_662489 ) ) ( not ( = ?auto_662487 ?auto_662490 ) ) ( not ( = ?auto_662487 ?auto_662491 ) ) ( not ( = ?auto_662487 ?auto_662492 ) ) ( not ( = ?auto_662487 ?auto_662493 ) ) ( not ( = ?auto_662487 ?auto_662494 ) ) ( not ( = ?auto_662487 ?auto_662495 ) ) ( not ( = ?auto_662487 ?auto_662496 ) ) ( not ( = ?auto_662488 ?auto_662489 ) ) ( not ( = ?auto_662488 ?auto_662490 ) ) ( not ( = ?auto_662488 ?auto_662491 ) ) ( not ( = ?auto_662488 ?auto_662492 ) ) ( not ( = ?auto_662488 ?auto_662493 ) ) ( not ( = ?auto_662488 ?auto_662494 ) ) ( not ( = ?auto_662488 ?auto_662495 ) ) ( not ( = ?auto_662488 ?auto_662496 ) ) ( not ( = ?auto_662489 ?auto_662490 ) ) ( not ( = ?auto_662489 ?auto_662491 ) ) ( not ( = ?auto_662489 ?auto_662492 ) ) ( not ( = ?auto_662489 ?auto_662493 ) ) ( not ( = ?auto_662489 ?auto_662494 ) ) ( not ( = ?auto_662489 ?auto_662495 ) ) ( not ( = ?auto_662489 ?auto_662496 ) ) ( not ( = ?auto_662490 ?auto_662491 ) ) ( not ( = ?auto_662490 ?auto_662492 ) ) ( not ( = ?auto_662490 ?auto_662493 ) ) ( not ( = ?auto_662490 ?auto_662494 ) ) ( not ( = ?auto_662490 ?auto_662495 ) ) ( not ( = ?auto_662490 ?auto_662496 ) ) ( not ( = ?auto_662491 ?auto_662492 ) ) ( not ( = ?auto_662491 ?auto_662493 ) ) ( not ( = ?auto_662491 ?auto_662494 ) ) ( not ( = ?auto_662491 ?auto_662495 ) ) ( not ( = ?auto_662491 ?auto_662496 ) ) ( not ( = ?auto_662492 ?auto_662493 ) ) ( not ( = ?auto_662492 ?auto_662494 ) ) ( not ( = ?auto_662492 ?auto_662495 ) ) ( not ( = ?auto_662492 ?auto_662496 ) ) ( not ( = ?auto_662493 ?auto_662494 ) ) ( not ( = ?auto_662493 ?auto_662495 ) ) ( not ( = ?auto_662493 ?auto_662496 ) ) ( not ( = ?auto_662494 ?auto_662495 ) ) ( not ( = ?auto_662494 ?auto_662496 ) ) ( not ( = ?auto_662495 ?auto_662496 ) ) ( ON ?auto_662494 ?auto_662495 ) ( ON ?auto_662493 ?auto_662494 ) ( ON ?auto_662492 ?auto_662493 ) ( ON ?auto_662491 ?auto_662492 ) ( ON ?auto_662490 ?auto_662491 ) ( ON ?auto_662489 ?auto_662490 ) ( ON ?auto_662488 ?auto_662489 ) ( ON ?auto_662487 ?auto_662488 ) ( ON ?auto_662486 ?auto_662487 ) ( CLEAR ?auto_662484 ) ( ON ?auto_662485 ?auto_662486 ) ( CLEAR ?auto_662485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_662481 ?auto_662482 ?auto_662483 ?auto_662484 ?auto_662485 )
      ( MAKE-15PILE ?auto_662481 ?auto_662482 ?auto_662483 ?auto_662484 ?auto_662485 ?auto_662486 ?auto_662487 ?auto_662488 ?auto_662489 ?auto_662490 ?auto_662491 ?auto_662492 ?auto_662493 ?auto_662494 ?auto_662495 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_662543 - BLOCK
      ?auto_662544 - BLOCK
      ?auto_662545 - BLOCK
      ?auto_662546 - BLOCK
      ?auto_662547 - BLOCK
      ?auto_662548 - BLOCK
      ?auto_662549 - BLOCK
      ?auto_662550 - BLOCK
      ?auto_662551 - BLOCK
      ?auto_662552 - BLOCK
      ?auto_662553 - BLOCK
      ?auto_662554 - BLOCK
      ?auto_662555 - BLOCK
      ?auto_662556 - BLOCK
      ?auto_662557 - BLOCK
    )
    :vars
    (
      ?auto_662558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_662557 ?auto_662558 ) ( ON-TABLE ?auto_662543 ) ( ON ?auto_662544 ?auto_662543 ) ( ON ?auto_662545 ?auto_662544 ) ( not ( = ?auto_662543 ?auto_662544 ) ) ( not ( = ?auto_662543 ?auto_662545 ) ) ( not ( = ?auto_662543 ?auto_662546 ) ) ( not ( = ?auto_662543 ?auto_662547 ) ) ( not ( = ?auto_662543 ?auto_662548 ) ) ( not ( = ?auto_662543 ?auto_662549 ) ) ( not ( = ?auto_662543 ?auto_662550 ) ) ( not ( = ?auto_662543 ?auto_662551 ) ) ( not ( = ?auto_662543 ?auto_662552 ) ) ( not ( = ?auto_662543 ?auto_662553 ) ) ( not ( = ?auto_662543 ?auto_662554 ) ) ( not ( = ?auto_662543 ?auto_662555 ) ) ( not ( = ?auto_662543 ?auto_662556 ) ) ( not ( = ?auto_662543 ?auto_662557 ) ) ( not ( = ?auto_662543 ?auto_662558 ) ) ( not ( = ?auto_662544 ?auto_662545 ) ) ( not ( = ?auto_662544 ?auto_662546 ) ) ( not ( = ?auto_662544 ?auto_662547 ) ) ( not ( = ?auto_662544 ?auto_662548 ) ) ( not ( = ?auto_662544 ?auto_662549 ) ) ( not ( = ?auto_662544 ?auto_662550 ) ) ( not ( = ?auto_662544 ?auto_662551 ) ) ( not ( = ?auto_662544 ?auto_662552 ) ) ( not ( = ?auto_662544 ?auto_662553 ) ) ( not ( = ?auto_662544 ?auto_662554 ) ) ( not ( = ?auto_662544 ?auto_662555 ) ) ( not ( = ?auto_662544 ?auto_662556 ) ) ( not ( = ?auto_662544 ?auto_662557 ) ) ( not ( = ?auto_662544 ?auto_662558 ) ) ( not ( = ?auto_662545 ?auto_662546 ) ) ( not ( = ?auto_662545 ?auto_662547 ) ) ( not ( = ?auto_662545 ?auto_662548 ) ) ( not ( = ?auto_662545 ?auto_662549 ) ) ( not ( = ?auto_662545 ?auto_662550 ) ) ( not ( = ?auto_662545 ?auto_662551 ) ) ( not ( = ?auto_662545 ?auto_662552 ) ) ( not ( = ?auto_662545 ?auto_662553 ) ) ( not ( = ?auto_662545 ?auto_662554 ) ) ( not ( = ?auto_662545 ?auto_662555 ) ) ( not ( = ?auto_662545 ?auto_662556 ) ) ( not ( = ?auto_662545 ?auto_662557 ) ) ( not ( = ?auto_662545 ?auto_662558 ) ) ( not ( = ?auto_662546 ?auto_662547 ) ) ( not ( = ?auto_662546 ?auto_662548 ) ) ( not ( = ?auto_662546 ?auto_662549 ) ) ( not ( = ?auto_662546 ?auto_662550 ) ) ( not ( = ?auto_662546 ?auto_662551 ) ) ( not ( = ?auto_662546 ?auto_662552 ) ) ( not ( = ?auto_662546 ?auto_662553 ) ) ( not ( = ?auto_662546 ?auto_662554 ) ) ( not ( = ?auto_662546 ?auto_662555 ) ) ( not ( = ?auto_662546 ?auto_662556 ) ) ( not ( = ?auto_662546 ?auto_662557 ) ) ( not ( = ?auto_662546 ?auto_662558 ) ) ( not ( = ?auto_662547 ?auto_662548 ) ) ( not ( = ?auto_662547 ?auto_662549 ) ) ( not ( = ?auto_662547 ?auto_662550 ) ) ( not ( = ?auto_662547 ?auto_662551 ) ) ( not ( = ?auto_662547 ?auto_662552 ) ) ( not ( = ?auto_662547 ?auto_662553 ) ) ( not ( = ?auto_662547 ?auto_662554 ) ) ( not ( = ?auto_662547 ?auto_662555 ) ) ( not ( = ?auto_662547 ?auto_662556 ) ) ( not ( = ?auto_662547 ?auto_662557 ) ) ( not ( = ?auto_662547 ?auto_662558 ) ) ( not ( = ?auto_662548 ?auto_662549 ) ) ( not ( = ?auto_662548 ?auto_662550 ) ) ( not ( = ?auto_662548 ?auto_662551 ) ) ( not ( = ?auto_662548 ?auto_662552 ) ) ( not ( = ?auto_662548 ?auto_662553 ) ) ( not ( = ?auto_662548 ?auto_662554 ) ) ( not ( = ?auto_662548 ?auto_662555 ) ) ( not ( = ?auto_662548 ?auto_662556 ) ) ( not ( = ?auto_662548 ?auto_662557 ) ) ( not ( = ?auto_662548 ?auto_662558 ) ) ( not ( = ?auto_662549 ?auto_662550 ) ) ( not ( = ?auto_662549 ?auto_662551 ) ) ( not ( = ?auto_662549 ?auto_662552 ) ) ( not ( = ?auto_662549 ?auto_662553 ) ) ( not ( = ?auto_662549 ?auto_662554 ) ) ( not ( = ?auto_662549 ?auto_662555 ) ) ( not ( = ?auto_662549 ?auto_662556 ) ) ( not ( = ?auto_662549 ?auto_662557 ) ) ( not ( = ?auto_662549 ?auto_662558 ) ) ( not ( = ?auto_662550 ?auto_662551 ) ) ( not ( = ?auto_662550 ?auto_662552 ) ) ( not ( = ?auto_662550 ?auto_662553 ) ) ( not ( = ?auto_662550 ?auto_662554 ) ) ( not ( = ?auto_662550 ?auto_662555 ) ) ( not ( = ?auto_662550 ?auto_662556 ) ) ( not ( = ?auto_662550 ?auto_662557 ) ) ( not ( = ?auto_662550 ?auto_662558 ) ) ( not ( = ?auto_662551 ?auto_662552 ) ) ( not ( = ?auto_662551 ?auto_662553 ) ) ( not ( = ?auto_662551 ?auto_662554 ) ) ( not ( = ?auto_662551 ?auto_662555 ) ) ( not ( = ?auto_662551 ?auto_662556 ) ) ( not ( = ?auto_662551 ?auto_662557 ) ) ( not ( = ?auto_662551 ?auto_662558 ) ) ( not ( = ?auto_662552 ?auto_662553 ) ) ( not ( = ?auto_662552 ?auto_662554 ) ) ( not ( = ?auto_662552 ?auto_662555 ) ) ( not ( = ?auto_662552 ?auto_662556 ) ) ( not ( = ?auto_662552 ?auto_662557 ) ) ( not ( = ?auto_662552 ?auto_662558 ) ) ( not ( = ?auto_662553 ?auto_662554 ) ) ( not ( = ?auto_662553 ?auto_662555 ) ) ( not ( = ?auto_662553 ?auto_662556 ) ) ( not ( = ?auto_662553 ?auto_662557 ) ) ( not ( = ?auto_662553 ?auto_662558 ) ) ( not ( = ?auto_662554 ?auto_662555 ) ) ( not ( = ?auto_662554 ?auto_662556 ) ) ( not ( = ?auto_662554 ?auto_662557 ) ) ( not ( = ?auto_662554 ?auto_662558 ) ) ( not ( = ?auto_662555 ?auto_662556 ) ) ( not ( = ?auto_662555 ?auto_662557 ) ) ( not ( = ?auto_662555 ?auto_662558 ) ) ( not ( = ?auto_662556 ?auto_662557 ) ) ( not ( = ?auto_662556 ?auto_662558 ) ) ( not ( = ?auto_662557 ?auto_662558 ) ) ( ON ?auto_662556 ?auto_662557 ) ( ON ?auto_662555 ?auto_662556 ) ( ON ?auto_662554 ?auto_662555 ) ( ON ?auto_662553 ?auto_662554 ) ( ON ?auto_662552 ?auto_662553 ) ( ON ?auto_662551 ?auto_662552 ) ( ON ?auto_662550 ?auto_662551 ) ( ON ?auto_662549 ?auto_662550 ) ( ON ?auto_662548 ?auto_662549 ) ( ON ?auto_662547 ?auto_662548 ) ( CLEAR ?auto_662545 ) ( ON ?auto_662546 ?auto_662547 ) ( CLEAR ?auto_662546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_662543 ?auto_662544 ?auto_662545 ?auto_662546 )
      ( MAKE-15PILE ?auto_662543 ?auto_662544 ?auto_662545 ?auto_662546 ?auto_662547 ?auto_662548 ?auto_662549 ?auto_662550 ?auto_662551 ?auto_662552 ?auto_662553 ?auto_662554 ?auto_662555 ?auto_662556 ?auto_662557 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_662605 - BLOCK
      ?auto_662606 - BLOCK
      ?auto_662607 - BLOCK
      ?auto_662608 - BLOCK
      ?auto_662609 - BLOCK
      ?auto_662610 - BLOCK
      ?auto_662611 - BLOCK
      ?auto_662612 - BLOCK
      ?auto_662613 - BLOCK
      ?auto_662614 - BLOCK
      ?auto_662615 - BLOCK
      ?auto_662616 - BLOCK
      ?auto_662617 - BLOCK
      ?auto_662618 - BLOCK
      ?auto_662619 - BLOCK
    )
    :vars
    (
      ?auto_662620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_662619 ?auto_662620 ) ( ON-TABLE ?auto_662605 ) ( ON ?auto_662606 ?auto_662605 ) ( not ( = ?auto_662605 ?auto_662606 ) ) ( not ( = ?auto_662605 ?auto_662607 ) ) ( not ( = ?auto_662605 ?auto_662608 ) ) ( not ( = ?auto_662605 ?auto_662609 ) ) ( not ( = ?auto_662605 ?auto_662610 ) ) ( not ( = ?auto_662605 ?auto_662611 ) ) ( not ( = ?auto_662605 ?auto_662612 ) ) ( not ( = ?auto_662605 ?auto_662613 ) ) ( not ( = ?auto_662605 ?auto_662614 ) ) ( not ( = ?auto_662605 ?auto_662615 ) ) ( not ( = ?auto_662605 ?auto_662616 ) ) ( not ( = ?auto_662605 ?auto_662617 ) ) ( not ( = ?auto_662605 ?auto_662618 ) ) ( not ( = ?auto_662605 ?auto_662619 ) ) ( not ( = ?auto_662605 ?auto_662620 ) ) ( not ( = ?auto_662606 ?auto_662607 ) ) ( not ( = ?auto_662606 ?auto_662608 ) ) ( not ( = ?auto_662606 ?auto_662609 ) ) ( not ( = ?auto_662606 ?auto_662610 ) ) ( not ( = ?auto_662606 ?auto_662611 ) ) ( not ( = ?auto_662606 ?auto_662612 ) ) ( not ( = ?auto_662606 ?auto_662613 ) ) ( not ( = ?auto_662606 ?auto_662614 ) ) ( not ( = ?auto_662606 ?auto_662615 ) ) ( not ( = ?auto_662606 ?auto_662616 ) ) ( not ( = ?auto_662606 ?auto_662617 ) ) ( not ( = ?auto_662606 ?auto_662618 ) ) ( not ( = ?auto_662606 ?auto_662619 ) ) ( not ( = ?auto_662606 ?auto_662620 ) ) ( not ( = ?auto_662607 ?auto_662608 ) ) ( not ( = ?auto_662607 ?auto_662609 ) ) ( not ( = ?auto_662607 ?auto_662610 ) ) ( not ( = ?auto_662607 ?auto_662611 ) ) ( not ( = ?auto_662607 ?auto_662612 ) ) ( not ( = ?auto_662607 ?auto_662613 ) ) ( not ( = ?auto_662607 ?auto_662614 ) ) ( not ( = ?auto_662607 ?auto_662615 ) ) ( not ( = ?auto_662607 ?auto_662616 ) ) ( not ( = ?auto_662607 ?auto_662617 ) ) ( not ( = ?auto_662607 ?auto_662618 ) ) ( not ( = ?auto_662607 ?auto_662619 ) ) ( not ( = ?auto_662607 ?auto_662620 ) ) ( not ( = ?auto_662608 ?auto_662609 ) ) ( not ( = ?auto_662608 ?auto_662610 ) ) ( not ( = ?auto_662608 ?auto_662611 ) ) ( not ( = ?auto_662608 ?auto_662612 ) ) ( not ( = ?auto_662608 ?auto_662613 ) ) ( not ( = ?auto_662608 ?auto_662614 ) ) ( not ( = ?auto_662608 ?auto_662615 ) ) ( not ( = ?auto_662608 ?auto_662616 ) ) ( not ( = ?auto_662608 ?auto_662617 ) ) ( not ( = ?auto_662608 ?auto_662618 ) ) ( not ( = ?auto_662608 ?auto_662619 ) ) ( not ( = ?auto_662608 ?auto_662620 ) ) ( not ( = ?auto_662609 ?auto_662610 ) ) ( not ( = ?auto_662609 ?auto_662611 ) ) ( not ( = ?auto_662609 ?auto_662612 ) ) ( not ( = ?auto_662609 ?auto_662613 ) ) ( not ( = ?auto_662609 ?auto_662614 ) ) ( not ( = ?auto_662609 ?auto_662615 ) ) ( not ( = ?auto_662609 ?auto_662616 ) ) ( not ( = ?auto_662609 ?auto_662617 ) ) ( not ( = ?auto_662609 ?auto_662618 ) ) ( not ( = ?auto_662609 ?auto_662619 ) ) ( not ( = ?auto_662609 ?auto_662620 ) ) ( not ( = ?auto_662610 ?auto_662611 ) ) ( not ( = ?auto_662610 ?auto_662612 ) ) ( not ( = ?auto_662610 ?auto_662613 ) ) ( not ( = ?auto_662610 ?auto_662614 ) ) ( not ( = ?auto_662610 ?auto_662615 ) ) ( not ( = ?auto_662610 ?auto_662616 ) ) ( not ( = ?auto_662610 ?auto_662617 ) ) ( not ( = ?auto_662610 ?auto_662618 ) ) ( not ( = ?auto_662610 ?auto_662619 ) ) ( not ( = ?auto_662610 ?auto_662620 ) ) ( not ( = ?auto_662611 ?auto_662612 ) ) ( not ( = ?auto_662611 ?auto_662613 ) ) ( not ( = ?auto_662611 ?auto_662614 ) ) ( not ( = ?auto_662611 ?auto_662615 ) ) ( not ( = ?auto_662611 ?auto_662616 ) ) ( not ( = ?auto_662611 ?auto_662617 ) ) ( not ( = ?auto_662611 ?auto_662618 ) ) ( not ( = ?auto_662611 ?auto_662619 ) ) ( not ( = ?auto_662611 ?auto_662620 ) ) ( not ( = ?auto_662612 ?auto_662613 ) ) ( not ( = ?auto_662612 ?auto_662614 ) ) ( not ( = ?auto_662612 ?auto_662615 ) ) ( not ( = ?auto_662612 ?auto_662616 ) ) ( not ( = ?auto_662612 ?auto_662617 ) ) ( not ( = ?auto_662612 ?auto_662618 ) ) ( not ( = ?auto_662612 ?auto_662619 ) ) ( not ( = ?auto_662612 ?auto_662620 ) ) ( not ( = ?auto_662613 ?auto_662614 ) ) ( not ( = ?auto_662613 ?auto_662615 ) ) ( not ( = ?auto_662613 ?auto_662616 ) ) ( not ( = ?auto_662613 ?auto_662617 ) ) ( not ( = ?auto_662613 ?auto_662618 ) ) ( not ( = ?auto_662613 ?auto_662619 ) ) ( not ( = ?auto_662613 ?auto_662620 ) ) ( not ( = ?auto_662614 ?auto_662615 ) ) ( not ( = ?auto_662614 ?auto_662616 ) ) ( not ( = ?auto_662614 ?auto_662617 ) ) ( not ( = ?auto_662614 ?auto_662618 ) ) ( not ( = ?auto_662614 ?auto_662619 ) ) ( not ( = ?auto_662614 ?auto_662620 ) ) ( not ( = ?auto_662615 ?auto_662616 ) ) ( not ( = ?auto_662615 ?auto_662617 ) ) ( not ( = ?auto_662615 ?auto_662618 ) ) ( not ( = ?auto_662615 ?auto_662619 ) ) ( not ( = ?auto_662615 ?auto_662620 ) ) ( not ( = ?auto_662616 ?auto_662617 ) ) ( not ( = ?auto_662616 ?auto_662618 ) ) ( not ( = ?auto_662616 ?auto_662619 ) ) ( not ( = ?auto_662616 ?auto_662620 ) ) ( not ( = ?auto_662617 ?auto_662618 ) ) ( not ( = ?auto_662617 ?auto_662619 ) ) ( not ( = ?auto_662617 ?auto_662620 ) ) ( not ( = ?auto_662618 ?auto_662619 ) ) ( not ( = ?auto_662618 ?auto_662620 ) ) ( not ( = ?auto_662619 ?auto_662620 ) ) ( ON ?auto_662618 ?auto_662619 ) ( ON ?auto_662617 ?auto_662618 ) ( ON ?auto_662616 ?auto_662617 ) ( ON ?auto_662615 ?auto_662616 ) ( ON ?auto_662614 ?auto_662615 ) ( ON ?auto_662613 ?auto_662614 ) ( ON ?auto_662612 ?auto_662613 ) ( ON ?auto_662611 ?auto_662612 ) ( ON ?auto_662610 ?auto_662611 ) ( ON ?auto_662609 ?auto_662610 ) ( ON ?auto_662608 ?auto_662609 ) ( CLEAR ?auto_662606 ) ( ON ?auto_662607 ?auto_662608 ) ( CLEAR ?auto_662607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_662605 ?auto_662606 ?auto_662607 )
      ( MAKE-15PILE ?auto_662605 ?auto_662606 ?auto_662607 ?auto_662608 ?auto_662609 ?auto_662610 ?auto_662611 ?auto_662612 ?auto_662613 ?auto_662614 ?auto_662615 ?auto_662616 ?auto_662617 ?auto_662618 ?auto_662619 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_662667 - BLOCK
      ?auto_662668 - BLOCK
      ?auto_662669 - BLOCK
      ?auto_662670 - BLOCK
      ?auto_662671 - BLOCK
      ?auto_662672 - BLOCK
      ?auto_662673 - BLOCK
      ?auto_662674 - BLOCK
      ?auto_662675 - BLOCK
      ?auto_662676 - BLOCK
      ?auto_662677 - BLOCK
      ?auto_662678 - BLOCK
      ?auto_662679 - BLOCK
      ?auto_662680 - BLOCK
      ?auto_662681 - BLOCK
    )
    :vars
    (
      ?auto_662682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_662681 ?auto_662682 ) ( ON-TABLE ?auto_662667 ) ( not ( = ?auto_662667 ?auto_662668 ) ) ( not ( = ?auto_662667 ?auto_662669 ) ) ( not ( = ?auto_662667 ?auto_662670 ) ) ( not ( = ?auto_662667 ?auto_662671 ) ) ( not ( = ?auto_662667 ?auto_662672 ) ) ( not ( = ?auto_662667 ?auto_662673 ) ) ( not ( = ?auto_662667 ?auto_662674 ) ) ( not ( = ?auto_662667 ?auto_662675 ) ) ( not ( = ?auto_662667 ?auto_662676 ) ) ( not ( = ?auto_662667 ?auto_662677 ) ) ( not ( = ?auto_662667 ?auto_662678 ) ) ( not ( = ?auto_662667 ?auto_662679 ) ) ( not ( = ?auto_662667 ?auto_662680 ) ) ( not ( = ?auto_662667 ?auto_662681 ) ) ( not ( = ?auto_662667 ?auto_662682 ) ) ( not ( = ?auto_662668 ?auto_662669 ) ) ( not ( = ?auto_662668 ?auto_662670 ) ) ( not ( = ?auto_662668 ?auto_662671 ) ) ( not ( = ?auto_662668 ?auto_662672 ) ) ( not ( = ?auto_662668 ?auto_662673 ) ) ( not ( = ?auto_662668 ?auto_662674 ) ) ( not ( = ?auto_662668 ?auto_662675 ) ) ( not ( = ?auto_662668 ?auto_662676 ) ) ( not ( = ?auto_662668 ?auto_662677 ) ) ( not ( = ?auto_662668 ?auto_662678 ) ) ( not ( = ?auto_662668 ?auto_662679 ) ) ( not ( = ?auto_662668 ?auto_662680 ) ) ( not ( = ?auto_662668 ?auto_662681 ) ) ( not ( = ?auto_662668 ?auto_662682 ) ) ( not ( = ?auto_662669 ?auto_662670 ) ) ( not ( = ?auto_662669 ?auto_662671 ) ) ( not ( = ?auto_662669 ?auto_662672 ) ) ( not ( = ?auto_662669 ?auto_662673 ) ) ( not ( = ?auto_662669 ?auto_662674 ) ) ( not ( = ?auto_662669 ?auto_662675 ) ) ( not ( = ?auto_662669 ?auto_662676 ) ) ( not ( = ?auto_662669 ?auto_662677 ) ) ( not ( = ?auto_662669 ?auto_662678 ) ) ( not ( = ?auto_662669 ?auto_662679 ) ) ( not ( = ?auto_662669 ?auto_662680 ) ) ( not ( = ?auto_662669 ?auto_662681 ) ) ( not ( = ?auto_662669 ?auto_662682 ) ) ( not ( = ?auto_662670 ?auto_662671 ) ) ( not ( = ?auto_662670 ?auto_662672 ) ) ( not ( = ?auto_662670 ?auto_662673 ) ) ( not ( = ?auto_662670 ?auto_662674 ) ) ( not ( = ?auto_662670 ?auto_662675 ) ) ( not ( = ?auto_662670 ?auto_662676 ) ) ( not ( = ?auto_662670 ?auto_662677 ) ) ( not ( = ?auto_662670 ?auto_662678 ) ) ( not ( = ?auto_662670 ?auto_662679 ) ) ( not ( = ?auto_662670 ?auto_662680 ) ) ( not ( = ?auto_662670 ?auto_662681 ) ) ( not ( = ?auto_662670 ?auto_662682 ) ) ( not ( = ?auto_662671 ?auto_662672 ) ) ( not ( = ?auto_662671 ?auto_662673 ) ) ( not ( = ?auto_662671 ?auto_662674 ) ) ( not ( = ?auto_662671 ?auto_662675 ) ) ( not ( = ?auto_662671 ?auto_662676 ) ) ( not ( = ?auto_662671 ?auto_662677 ) ) ( not ( = ?auto_662671 ?auto_662678 ) ) ( not ( = ?auto_662671 ?auto_662679 ) ) ( not ( = ?auto_662671 ?auto_662680 ) ) ( not ( = ?auto_662671 ?auto_662681 ) ) ( not ( = ?auto_662671 ?auto_662682 ) ) ( not ( = ?auto_662672 ?auto_662673 ) ) ( not ( = ?auto_662672 ?auto_662674 ) ) ( not ( = ?auto_662672 ?auto_662675 ) ) ( not ( = ?auto_662672 ?auto_662676 ) ) ( not ( = ?auto_662672 ?auto_662677 ) ) ( not ( = ?auto_662672 ?auto_662678 ) ) ( not ( = ?auto_662672 ?auto_662679 ) ) ( not ( = ?auto_662672 ?auto_662680 ) ) ( not ( = ?auto_662672 ?auto_662681 ) ) ( not ( = ?auto_662672 ?auto_662682 ) ) ( not ( = ?auto_662673 ?auto_662674 ) ) ( not ( = ?auto_662673 ?auto_662675 ) ) ( not ( = ?auto_662673 ?auto_662676 ) ) ( not ( = ?auto_662673 ?auto_662677 ) ) ( not ( = ?auto_662673 ?auto_662678 ) ) ( not ( = ?auto_662673 ?auto_662679 ) ) ( not ( = ?auto_662673 ?auto_662680 ) ) ( not ( = ?auto_662673 ?auto_662681 ) ) ( not ( = ?auto_662673 ?auto_662682 ) ) ( not ( = ?auto_662674 ?auto_662675 ) ) ( not ( = ?auto_662674 ?auto_662676 ) ) ( not ( = ?auto_662674 ?auto_662677 ) ) ( not ( = ?auto_662674 ?auto_662678 ) ) ( not ( = ?auto_662674 ?auto_662679 ) ) ( not ( = ?auto_662674 ?auto_662680 ) ) ( not ( = ?auto_662674 ?auto_662681 ) ) ( not ( = ?auto_662674 ?auto_662682 ) ) ( not ( = ?auto_662675 ?auto_662676 ) ) ( not ( = ?auto_662675 ?auto_662677 ) ) ( not ( = ?auto_662675 ?auto_662678 ) ) ( not ( = ?auto_662675 ?auto_662679 ) ) ( not ( = ?auto_662675 ?auto_662680 ) ) ( not ( = ?auto_662675 ?auto_662681 ) ) ( not ( = ?auto_662675 ?auto_662682 ) ) ( not ( = ?auto_662676 ?auto_662677 ) ) ( not ( = ?auto_662676 ?auto_662678 ) ) ( not ( = ?auto_662676 ?auto_662679 ) ) ( not ( = ?auto_662676 ?auto_662680 ) ) ( not ( = ?auto_662676 ?auto_662681 ) ) ( not ( = ?auto_662676 ?auto_662682 ) ) ( not ( = ?auto_662677 ?auto_662678 ) ) ( not ( = ?auto_662677 ?auto_662679 ) ) ( not ( = ?auto_662677 ?auto_662680 ) ) ( not ( = ?auto_662677 ?auto_662681 ) ) ( not ( = ?auto_662677 ?auto_662682 ) ) ( not ( = ?auto_662678 ?auto_662679 ) ) ( not ( = ?auto_662678 ?auto_662680 ) ) ( not ( = ?auto_662678 ?auto_662681 ) ) ( not ( = ?auto_662678 ?auto_662682 ) ) ( not ( = ?auto_662679 ?auto_662680 ) ) ( not ( = ?auto_662679 ?auto_662681 ) ) ( not ( = ?auto_662679 ?auto_662682 ) ) ( not ( = ?auto_662680 ?auto_662681 ) ) ( not ( = ?auto_662680 ?auto_662682 ) ) ( not ( = ?auto_662681 ?auto_662682 ) ) ( ON ?auto_662680 ?auto_662681 ) ( ON ?auto_662679 ?auto_662680 ) ( ON ?auto_662678 ?auto_662679 ) ( ON ?auto_662677 ?auto_662678 ) ( ON ?auto_662676 ?auto_662677 ) ( ON ?auto_662675 ?auto_662676 ) ( ON ?auto_662674 ?auto_662675 ) ( ON ?auto_662673 ?auto_662674 ) ( ON ?auto_662672 ?auto_662673 ) ( ON ?auto_662671 ?auto_662672 ) ( ON ?auto_662670 ?auto_662671 ) ( ON ?auto_662669 ?auto_662670 ) ( CLEAR ?auto_662667 ) ( ON ?auto_662668 ?auto_662669 ) ( CLEAR ?auto_662668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_662667 ?auto_662668 )
      ( MAKE-15PILE ?auto_662667 ?auto_662668 ?auto_662669 ?auto_662670 ?auto_662671 ?auto_662672 ?auto_662673 ?auto_662674 ?auto_662675 ?auto_662676 ?auto_662677 ?auto_662678 ?auto_662679 ?auto_662680 ?auto_662681 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_662729 - BLOCK
      ?auto_662730 - BLOCK
      ?auto_662731 - BLOCK
      ?auto_662732 - BLOCK
      ?auto_662733 - BLOCK
      ?auto_662734 - BLOCK
      ?auto_662735 - BLOCK
      ?auto_662736 - BLOCK
      ?auto_662737 - BLOCK
      ?auto_662738 - BLOCK
      ?auto_662739 - BLOCK
      ?auto_662740 - BLOCK
      ?auto_662741 - BLOCK
      ?auto_662742 - BLOCK
      ?auto_662743 - BLOCK
    )
    :vars
    (
      ?auto_662744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_662743 ?auto_662744 ) ( not ( = ?auto_662729 ?auto_662730 ) ) ( not ( = ?auto_662729 ?auto_662731 ) ) ( not ( = ?auto_662729 ?auto_662732 ) ) ( not ( = ?auto_662729 ?auto_662733 ) ) ( not ( = ?auto_662729 ?auto_662734 ) ) ( not ( = ?auto_662729 ?auto_662735 ) ) ( not ( = ?auto_662729 ?auto_662736 ) ) ( not ( = ?auto_662729 ?auto_662737 ) ) ( not ( = ?auto_662729 ?auto_662738 ) ) ( not ( = ?auto_662729 ?auto_662739 ) ) ( not ( = ?auto_662729 ?auto_662740 ) ) ( not ( = ?auto_662729 ?auto_662741 ) ) ( not ( = ?auto_662729 ?auto_662742 ) ) ( not ( = ?auto_662729 ?auto_662743 ) ) ( not ( = ?auto_662729 ?auto_662744 ) ) ( not ( = ?auto_662730 ?auto_662731 ) ) ( not ( = ?auto_662730 ?auto_662732 ) ) ( not ( = ?auto_662730 ?auto_662733 ) ) ( not ( = ?auto_662730 ?auto_662734 ) ) ( not ( = ?auto_662730 ?auto_662735 ) ) ( not ( = ?auto_662730 ?auto_662736 ) ) ( not ( = ?auto_662730 ?auto_662737 ) ) ( not ( = ?auto_662730 ?auto_662738 ) ) ( not ( = ?auto_662730 ?auto_662739 ) ) ( not ( = ?auto_662730 ?auto_662740 ) ) ( not ( = ?auto_662730 ?auto_662741 ) ) ( not ( = ?auto_662730 ?auto_662742 ) ) ( not ( = ?auto_662730 ?auto_662743 ) ) ( not ( = ?auto_662730 ?auto_662744 ) ) ( not ( = ?auto_662731 ?auto_662732 ) ) ( not ( = ?auto_662731 ?auto_662733 ) ) ( not ( = ?auto_662731 ?auto_662734 ) ) ( not ( = ?auto_662731 ?auto_662735 ) ) ( not ( = ?auto_662731 ?auto_662736 ) ) ( not ( = ?auto_662731 ?auto_662737 ) ) ( not ( = ?auto_662731 ?auto_662738 ) ) ( not ( = ?auto_662731 ?auto_662739 ) ) ( not ( = ?auto_662731 ?auto_662740 ) ) ( not ( = ?auto_662731 ?auto_662741 ) ) ( not ( = ?auto_662731 ?auto_662742 ) ) ( not ( = ?auto_662731 ?auto_662743 ) ) ( not ( = ?auto_662731 ?auto_662744 ) ) ( not ( = ?auto_662732 ?auto_662733 ) ) ( not ( = ?auto_662732 ?auto_662734 ) ) ( not ( = ?auto_662732 ?auto_662735 ) ) ( not ( = ?auto_662732 ?auto_662736 ) ) ( not ( = ?auto_662732 ?auto_662737 ) ) ( not ( = ?auto_662732 ?auto_662738 ) ) ( not ( = ?auto_662732 ?auto_662739 ) ) ( not ( = ?auto_662732 ?auto_662740 ) ) ( not ( = ?auto_662732 ?auto_662741 ) ) ( not ( = ?auto_662732 ?auto_662742 ) ) ( not ( = ?auto_662732 ?auto_662743 ) ) ( not ( = ?auto_662732 ?auto_662744 ) ) ( not ( = ?auto_662733 ?auto_662734 ) ) ( not ( = ?auto_662733 ?auto_662735 ) ) ( not ( = ?auto_662733 ?auto_662736 ) ) ( not ( = ?auto_662733 ?auto_662737 ) ) ( not ( = ?auto_662733 ?auto_662738 ) ) ( not ( = ?auto_662733 ?auto_662739 ) ) ( not ( = ?auto_662733 ?auto_662740 ) ) ( not ( = ?auto_662733 ?auto_662741 ) ) ( not ( = ?auto_662733 ?auto_662742 ) ) ( not ( = ?auto_662733 ?auto_662743 ) ) ( not ( = ?auto_662733 ?auto_662744 ) ) ( not ( = ?auto_662734 ?auto_662735 ) ) ( not ( = ?auto_662734 ?auto_662736 ) ) ( not ( = ?auto_662734 ?auto_662737 ) ) ( not ( = ?auto_662734 ?auto_662738 ) ) ( not ( = ?auto_662734 ?auto_662739 ) ) ( not ( = ?auto_662734 ?auto_662740 ) ) ( not ( = ?auto_662734 ?auto_662741 ) ) ( not ( = ?auto_662734 ?auto_662742 ) ) ( not ( = ?auto_662734 ?auto_662743 ) ) ( not ( = ?auto_662734 ?auto_662744 ) ) ( not ( = ?auto_662735 ?auto_662736 ) ) ( not ( = ?auto_662735 ?auto_662737 ) ) ( not ( = ?auto_662735 ?auto_662738 ) ) ( not ( = ?auto_662735 ?auto_662739 ) ) ( not ( = ?auto_662735 ?auto_662740 ) ) ( not ( = ?auto_662735 ?auto_662741 ) ) ( not ( = ?auto_662735 ?auto_662742 ) ) ( not ( = ?auto_662735 ?auto_662743 ) ) ( not ( = ?auto_662735 ?auto_662744 ) ) ( not ( = ?auto_662736 ?auto_662737 ) ) ( not ( = ?auto_662736 ?auto_662738 ) ) ( not ( = ?auto_662736 ?auto_662739 ) ) ( not ( = ?auto_662736 ?auto_662740 ) ) ( not ( = ?auto_662736 ?auto_662741 ) ) ( not ( = ?auto_662736 ?auto_662742 ) ) ( not ( = ?auto_662736 ?auto_662743 ) ) ( not ( = ?auto_662736 ?auto_662744 ) ) ( not ( = ?auto_662737 ?auto_662738 ) ) ( not ( = ?auto_662737 ?auto_662739 ) ) ( not ( = ?auto_662737 ?auto_662740 ) ) ( not ( = ?auto_662737 ?auto_662741 ) ) ( not ( = ?auto_662737 ?auto_662742 ) ) ( not ( = ?auto_662737 ?auto_662743 ) ) ( not ( = ?auto_662737 ?auto_662744 ) ) ( not ( = ?auto_662738 ?auto_662739 ) ) ( not ( = ?auto_662738 ?auto_662740 ) ) ( not ( = ?auto_662738 ?auto_662741 ) ) ( not ( = ?auto_662738 ?auto_662742 ) ) ( not ( = ?auto_662738 ?auto_662743 ) ) ( not ( = ?auto_662738 ?auto_662744 ) ) ( not ( = ?auto_662739 ?auto_662740 ) ) ( not ( = ?auto_662739 ?auto_662741 ) ) ( not ( = ?auto_662739 ?auto_662742 ) ) ( not ( = ?auto_662739 ?auto_662743 ) ) ( not ( = ?auto_662739 ?auto_662744 ) ) ( not ( = ?auto_662740 ?auto_662741 ) ) ( not ( = ?auto_662740 ?auto_662742 ) ) ( not ( = ?auto_662740 ?auto_662743 ) ) ( not ( = ?auto_662740 ?auto_662744 ) ) ( not ( = ?auto_662741 ?auto_662742 ) ) ( not ( = ?auto_662741 ?auto_662743 ) ) ( not ( = ?auto_662741 ?auto_662744 ) ) ( not ( = ?auto_662742 ?auto_662743 ) ) ( not ( = ?auto_662742 ?auto_662744 ) ) ( not ( = ?auto_662743 ?auto_662744 ) ) ( ON ?auto_662742 ?auto_662743 ) ( ON ?auto_662741 ?auto_662742 ) ( ON ?auto_662740 ?auto_662741 ) ( ON ?auto_662739 ?auto_662740 ) ( ON ?auto_662738 ?auto_662739 ) ( ON ?auto_662737 ?auto_662738 ) ( ON ?auto_662736 ?auto_662737 ) ( ON ?auto_662735 ?auto_662736 ) ( ON ?auto_662734 ?auto_662735 ) ( ON ?auto_662733 ?auto_662734 ) ( ON ?auto_662732 ?auto_662733 ) ( ON ?auto_662731 ?auto_662732 ) ( ON ?auto_662730 ?auto_662731 ) ( ON ?auto_662729 ?auto_662730 ) ( CLEAR ?auto_662729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_662729 )
      ( MAKE-15PILE ?auto_662729 ?auto_662730 ?auto_662731 ?auto_662732 ?auto_662733 ?auto_662734 ?auto_662735 ?auto_662736 ?auto_662737 ?auto_662738 ?auto_662739 ?auto_662740 ?auto_662741 ?auto_662742 ?auto_662743 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_662792 - BLOCK
      ?auto_662793 - BLOCK
      ?auto_662794 - BLOCK
      ?auto_662795 - BLOCK
      ?auto_662796 - BLOCK
      ?auto_662797 - BLOCK
      ?auto_662798 - BLOCK
      ?auto_662799 - BLOCK
      ?auto_662800 - BLOCK
      ?auto_662801 - BLOCK
      ?auto_662802 - BLOCK
      ?auto_662803 - BLOCK
      ?auto_662804 - BLOCK
      ?auto_662805 - BLOCK
      ?auto_662806 - BLOCK
      ?auto_662807 - BLOCK
    )
    :vars
    (
      ?auto_662808 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_662806 ) ( ON ?auto_662807 ?auto_662808 ) ( CLEAR ?auto_662807 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_662792 ) ( ON ?auto_662793 ?auto_662792 ) ( ON ?auto_662794 ?auto_662793 ) ( ON ?auto_662795 ?auto_662794 ) ( ON ?auto_662796 ?auto_662795 ) ( ON ?auto_662797 ?auto_662796 ) ( ON ?auto_662798 ?auto_662797 ) ( ON ?auto_662799 ?auto_662798 ) ( ON ?auto_662800 ?auto_662799 ) ( ON ?auto_662801 ?auto_662800 ) ( ON ?auto_662802 ?auto_662801 ) ( ON ?auto_662803 ?auto_662802 ) ( ON ?auto_662804 ?auto_662803 ) ( ON ?auto_662805 ?auto_662804 ) ( ON ?auto_662806 ?auto_662805 ) ( not ( = ?auto_662792 ?auto_662793 ) ) ( not ( = ?auto_662792 ?auto_662794 ) ) ( not ( = ?auto_662792 ?auto_662795 ) ) ( not ( = ?auto_662792 ?auto_662796 ) ) ( not ( = ?auto_662792 ?auto_662797 ) ) ( not ( = ?auto_662792 ?auto_662798 ) ) ( not ( = ?auto_662792 ?auto_662799 ) ) ( not ( = ?auto_662792 ?auto_662800 ) ) ( not ( = ?auto_662792 ?auto_662801 ) ) ( not ( = ?auto_662792 ?auto_662802 ) ) ( not ( = ?auto_662792 ?auto_662803 ) ) ( not ( = ?auto_662792 ?auto_662804 ) ) ( not ( = ?auto_662792 ?auto_662805 ) ) ( not ( = ?auto_662792 ?auto_662806 ) ) ( not ( = ?auto_662792 ?auto_662807 ) ) ( not ( = ?auto_662792 ?auto_662808 ) ) ( not ( = ?auto_662793 ?auto_662794 ) ) ( not ( = ?auto_662793 ?auto_662795 ) ) ( not ( = ?auto_662793 ?auto_662796 ) ) ( not ( = ?auto_662793 ?auto_662797 ) ) ( not ( = ?auto_662793 ?auto_662798 ) ) ( not ( = ?auto_662793 ?auto_662799 ) ) ( not ( = ?auto_662793 ?auto_662800 ) ) ( not ( = ?auto_662793 ?auto_662801 ) ) ( not ( = ?auto_662793 ?auto_662802 ) ) ( not ( = ?auto_662793 ?auto_662803 ) ) ( not ( = ?auto_662793 ?auto_662804 ) ) ( not ( = ?auto_662793 ?auto_662805 ) ) ( not ( = ?auto_662793 ?auto_662806 ) ) ( not ( = ?auto_662793 ?auto_662807 ) ) ( not ( = ?auto_662793 ?auto_662808 ) ) ( not ( = ?auto_662794 ?auto_662795 ) ) ( not ( = ?auto_662794 ?auto_662796 ) ) ( not ( = ?auto_662794 ?auto_662797 ) ) ( not ( = ?auto_662794 ?auto_662798 ) ) ( not ( = ?auto_662794 ?auto_662799 ) ) ( not ( = ?auto_662794 ?auto_662800 ) ) ( not ( = ?auto_662794 ?auto_662801 ) ) ( not ( = ?auto_662794 ?auto_662802 ) ) ( not ( = ?auto_662794 ?auto_662803 ) ) ( not ( = ?auto_662794 ?auto_662804 ) ) ( not ( = ?auto_662794 ?auto_662805 ) ) ( not ( = ?auto_662794 ?auto_662806 ) ) ( not ( = ?auto_662794 ?auto_662807 ) ) ( not ( = ?auto_662794 ?auto_662808 ) ) ( not ( = ?auto_662795 ?auto_662796 ) ) ( not ( = ?auto_662795 ?auto_662797 ) ) ( not ( = ?auto_662795 ?auto_662798 ) ) ( not ( = ?auto_662795 ?auto_662799 ) ) ( not ( = ?auto_662795 ?auto_662800 ) ) ( not ( = ?auto_662795 ?auto_662801 ) ) ( not ( = ?auto_662795 ?auto_662802 ) ) ( not ( = ?auto_662795 ?auto_662803 ) ) ( not ( = ?auto_662795 ?auto_662804 ) ) ( not ( = ?auto_662795 ?auto_662805 ) ) ( not ( = ?auto_662795 ?auto_662806 ) ) ( not ( = ?auto_662795 ?auto_662807 ) ) ( not ( = ?auto_662795 ?auto_662808 ) ) ( not ( = ?auto_662796 ?auto_662797 ) ) ( not ( = ?auto_662796 ?auto_662798 ) ) ( not ( = ?auto_662796 ?auto_662799 ) ) ( not ( = ?auto_662796 ?auto_662800 ) ) ( not ( = ?auto_662796 ?auto_662801 ) ) ( not ( = ?auto_662796 ?auto_662802 ) ) ( not ( = ?auto_662796 ?auto_662803 ) ) ( not ( = ?auto_662796 ?auto_662804 ) ) ( not ( = ?auto_662796 ?auto_662805 ) ) ( not ( = ?auto_662796 ?auto_662806 ) ) ( not ( = ?auto_662796 ?auto_662807 ) ) ( not ( = ?auto_662796 ?auto_662808 ) ) ( not ( = ?auto_662797 ?auto_662798 ) ) ( not ( = ?auto_662797 ?auto_662799 ) ) ( not ( = ?auto_662797 ?auto_662800 ) ) ( not ( = ?auto_662797 ?auto_662801 ) ) ( not ( = ?auto_662797 ?auto_662802 ) ) ( not ( = ?auto_662797 ?auto_662803 ) ) ( not ( = ?auto_662797 ?auto_662804 ) ) ( not ( = ?auto_662797 ?auto_662805 ) ) ( not ( = ?auto_662797 ?auto_662806 ) ) ( not ( = ?auto_662797 ?auto_662807 ) ) ( not ( = ?auto_662797 ?auto_662808 ) ) ( not ( = ?auto_662798 ?auto_662799 ) ) ( not ( = ?auto_662798 ?auto_662800 ) ) ( not ( = ?auto_662798 ?auto_662801 ) ) ( not ( = ?auto_662798 ?auto_662802 ) ) ( not ( = ?auto_662798 ?auto_662803 ) ) ( not ( = ?auto_662798 ?auto_662804 ) ) ( not ( = ?auto_662798 ?auto_662805 ) ) ( not ( = ?auto_662798 ?auto_662806 ) ) ( not ( = ?auto_662798 ?auto_662807 ) ) ( not ( = ?auto_662798 ?auto_662808 ) ) ( not ( = ?auto_662799 ?auto_662800 ) ) ( not ( = ?auto_662799 ?auto_662801 ) ) ( not ( = ?auto_662799 ?auto_662802 ) ) ( not ( = ?auto_662799 ?auto_662803 ) ) ( not ( = ?auto_662799 ?auto_662804 ) ) ( not ( = ?auto_662799 ?auto_662805 ) ) ( not ( = ?auto_662799 ?auto_662806 ) ) ( not ( = ?auto_662799 ?auto_662807 ) ) ( not ( = ?auto_662799 ?auto_662808 ) ) ( not ( = ?auto_662800 ?auto_662801 ) ) ( not ( = ?auto_662800 ?auto_662802 ) ) ( not ( = ?auto_662800 ?auto_662803 ) ) ( not ( = ?auto_662800 ?auto_662804 ) ) ( not ( = ?auto_662800 ?auto_662805 ) ) ( not ( = ?auto_662800 ?auto_662806 ) ) ( not ( = ?auto_662800 ?auto_662807 ) ) ( not ( = ?auto_662800 ?auto_662808 ) ) ( not ( = ?auto_662801 ?auto_662802 ) ) ( not ( = ?auto_662801 ?auto_662803 ) ) ( not ( = ?auto_662801 ?auto_662804 ) ) ( not ( = ?auto_662801 ?auto_662805 ) ) ( not ( = ?auto_662801 ?auto_662806 ) ) ( not ( = ?auto_662801 ?auto_662807 ) ) ( not ( = ?auto_662801 ?auto_662808 ) ) ( not ( = ?auto_662802 ?auto_662803 ) ) ( not ( = ?auto_662802 ?auto_662804 ) ) ( not ( = ?auto_662802 ?auto_662805 ) ) ( not ( = ?auto_662802 ?auto_662806 ) ) ( not ( = ?auto_662802 ?auto_662807 ) ) ( not ( = ?auto_662802 ?auto_662808 ) ) ( not ( = ?auto_662803 ?auto_662804 ) ) ( not ( = ?auto_662803 ?auto_662805 ) ) ( not ( = ?auto_662803 ?auto_662806 ) ) ( not ( = ?auto_662803 ?auto_662807 ) ) ( not ( = ?auto_662803 ?auto_662808 ) ) ( not ( = ?auto_662804 ?auto_662805 ) ) ( not ( = ?auto_662804 ?auto_662806 ) ) ( not ( = ?auto_662804 ?auto_662807 ) ) ( not ( = ?auto_662804 ?auto_662808 ) ) ( not ( = ?auto_662805 ?auto_662806 ) ) ( not ( = ?auto_662805 ?auto_662807 ) ) ( not ( = ?auto_662805 ?auto_662808 ) ) ( not ( = ?auto_662806 ?auto_662807 ) ) ( not ( = ?auto_662806 ?auto_662808 ) ) ( not ( = ?auto_662807 ?auto_662808 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_662807 ?auto_662808 )
      ( !STACK ?auto_662807 ?auto_662806 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_662858 - BLOCK
      ?auto_662859 - BLOCK
      ?auto_662860 - BLOCK
      ?auto_662861 - BLOCK
      ?auto_662862 - BLOCK
      ?auto_662863 - BLOCK
      ?auto_662864 - BLOCK
      ?auto_662865 - BLOCK
      ?auto_662866 - BLOCK
      ?auto_662867 - BLOCK
      ?auto_662868 - BLOCK
      ?auto_662869 - BLOCK
      ?auto_662870 - BLOCK
      ?auto_662871 - BLOCK
      ?auto_662872 - BLOCK
      ?auto_662873 - BLOCK
    )
    :vars
    (
      ?auto_662874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_662873 ?auto_662874 ) ( ON-TABLE ?auto_662858 ) ( ON ?auto_662859 ?auto_662858 ) ( ON ?auto_662860 ?auto_662859 ) ( ON ?auto_662861 ?auto_662860 ) ( ON ?auto_662862 ?auto_662861 ) ( ON ?auto_662863 ?auto_662862 ) ( ON ?auto_662864 ?auto_662863 ) ( ON ?auto_662865 ?auto_662864 ) ( ON ?auto_662866 ?auto_662865 ) ( ON ?auto_662867 ?auto_662866 ) ( ON ?auto_662868 ?auto_662867 ) ( ON ?auto_662869 ?auto_662868 ) ( ON ?auto_662870 ?auto_662869 ) ( ON ?auto_662871 ?auto_662870 ) ( not ( = ?auto_662858 ?auto_662859 ) ) ( not ( = ?auto_662858 ?auto_662860 ) ) ( not ( = ?auto_662858 ?auto_662861 ) ) ( not ( = ?auto_662858 ?auto_662862 ) ) ( not ( = ?auto_662858 ?auto_662863 ) ) ( not ( = ?auto_662858 ?auto_662864 ) ) ( not ( = ?auto_662858 ?auto_662865 ) ) ( not ( = ?auto_662858 ?auto_662866 ) ) ( not ( = ?auto_662858 ?auto_662867 ) ) ( not ( = ?auto_662858 ?auto_662868 ) ) ( not ( = ?auto_662858 ?auto_662869 ) ) ( not ( = ?auto_662858 ?auto_662870 ) ) ( not ( = ?auto_662858 ?auto_662871 ) ) ( not ( = ?auto_662858 ?auto_662872 ) ) ( not ( = ?auto_662858 ?auto_662873 ) ) ( not ( = ?auto_662858 ?auto_662874 ) ) ( not ( = ?auto_662859 ?auto_662860 ) ) ( not ( = ?auto_662859 ?auto_662861 ) ) ( not ( = ?auto_662859 ?auto_662862 ) ) ( not ( = ?auto_662859 ?auto_662863 ) ) ( not ( = ?auto_662859 ?auto_662864 ) ) ( not ( = ?auto_662859 ?auto_662865 ) ) ( not ( = ?auto_662859 ?auto_662866 ) ) ( not ( = ?auto_662859 ?auto_662867 ) ) ( not ( = ?auto_662859 ?auto_662868 ) ) ( not ( = ?auto_662859 ?auto_662869 ) ) ( not ( = ?auto_662859 ?auto_662870 ) ) ( not ( = ?auto_662859 ?auto_662871 ) ) ( not ( = ?auto_662859 ?auto_662872 ) ) ( not ( = ?auto_662859 ?auto_662873 ) ) ( not ( = ?auto_662859 ?auto_662874 ) ) ( not ( = ?auto_662860 ?auto_662861 ) ) ( not ( = ?auto_662860 ?auto_662862 ) ) ( not ( = ?auto_662860 ?auto_662863 ) ) ( not ( = ?auto_662860 ?auto_662864 ) ) ( not ( = ?auto_662860 ?auto_662865 ) ) ( not ( = ?auto_662860 ?auto_662866 ) ) ( not ( = ?auto_662860 ?auto_662867 ) ) ( not ( = ?auto_662860 ?auto_662868 ) ) ( not ( = ?auto_662860 ?auto_662869 ) ) ( not ( = ?auto_662860 ?auto_662870 ) ) ( not ( = ?auto_662860 ?auto_662871 ) ) ( not ( = ?auto_662860 ?auto_662872 ) ) ( not ( = ?auto_662860 ?auto_662873 ) ) ( not ( = ?auto_662860 ?auto_662874 ) ) ( not ( = ?auto_662861 ?auto_662862 ) ) ( not ( = ?auto_662861 ?auto_662863 ) ) ( not ( = ?auto_662861 ?auto_662864 ) ) ( not ( = ?auto_662861 ?auto_662865 ) ) ( not ( = ?auto_662861 ?auto_662866 ) ) ( not ( = ?auto_662861 ?auto_662867 ) ) ( not ( = ?auto_662861 ?auto_662868 ) ) ( not ( = ?auto_662861 ?auto_662869 ) ) ( not ( = ?auto_662861 ?auto_662870 ) ) ( not ( = ?auto_662861 ?auto_662871 ) ) ( not ( = ?auto_662861 ?auto_662872 ) ) ( not ( = ?auto_662861 ?auto_662873 ) ) ( not ( = ?auto_662861 ?auto_662874 ) ) ( not ( = ?auto_662862 ?auto_662863 ) ) ( not ( = ?auto_662862 ?auto_662864 ) ) ( not ( = ?auto_662862 ?auto_662865 ) ) ( not ( = ?auto_662862 ?auto_662866 ) ) ( not ( = ?auto_662862 ?auto_662867 ) ) ( not ( = ?auto_662862 ?auto_662868 ) ) ( not ( = ?auto_662862 ?auto_662869 ) ) ( not ( = ?auto_662862 ?auto_662870 ) ) ( not ( = ?auto_662862 ?auto_662871 ) ) ( not ( = ?auto_662862 ?auto_662872 ) ) ( not ( = ?auto_662862 ?auto_662873 ) ) ( not ( = ?auto_662862 ?auto_662874 ) ) ( not ( = ?auto_662863 ?auto_662864 ) ) ( not ( = ?auto_662863 ?auto_662865 ) ) ( not ( = ?auto_662863 ?auto_662866 ) ) ( not ( = ?auto_662863 ?auto_662867 ) ) ( not ( = ?auto_662863 ?auto_662868 ) ) ( not ( = ?auto_662863 ?auto_662869 ) ) ( not ( = ?auto_662863 ?auto_662870 ) ) ( not ( = ?auto_662863 ?auto_662871 ) ) ( not ( = ?auto_662863 ?auto_662872 ) ) ( not ( = ?auto_662863 ?auto_662873 ) ) ( not ( = ?auto_662863 ?auto_662874 ) ) ( not ( = ?auto_662864 ?auto_662865 ) ) ( not ( = ?auto_662864 ?auto_662866 ) ) ( not ( = ?auto_662864 ?auto_662867 ) ) ( not ( = ?auto_662864 ?auto_662868 ) ) ( not ( = ?auto_662864 ?auto_662869 ) ) ( not ( = ?auto_662864 ?auto_662870 ) ) ( not ( = ?auto_662864 ?auto_662871 ) ) ( not ( = ?auto_662864 ?auto_662872 ) ) ( not ( = ?auto_662864 ?auto_662873 ) ) ( not ( = ?auto_662864 ?auto_662874 ) ) ( not ( = ?auto_662865 ?auto_662866 ) ) ( not ( = ?auto_662865 ?auto_662867 ) ) ( not ( = ?auto_662865 ?auto_662868 ) ) ( not ( = ?auto_662865 ?auto_662869 ) ) ( not ( = ?auto_662865 ?auto_662870 ) ) ( not ( = ?auto_662865 ?auto_662871 ) ) ( not ( = ?auto_662865 ?auto_662872 ) ) ( not ( = ?auto_662865 ?auto_662873 ) ) ( not ( = ?auto_662865 ?auto_662874 ) ) ( not ( = ?auto_662866 ?auto_662867 ) ) ( not ( = ?auto_662866 ?auto_662868 ) ) ( not ( = ?auto_662866 ?auto_662869 ) ) ( not ( = ?auto_662866 ?auto_662870 ) ) ( not ( = ?auto_662866 ?auto_662871 ) ) ( not ( = ?auto_662866 ?auto_662872 ) ) ( not ( = ?auto_662866 ?auto_662873 ) ) ( not ( = ?auto_662866 ?auto_662874 ) ) ( not ( = ?auto_662867 ?auto_662868 ) ) ( not ( = ?auto_662867 ?auto_662869 ) ) ( not ( = ?auto_662867 ?auto_662870 ) ) ( not ( = ?auto_662867 ?auto_662871 ) ) ( not ( = ?auto_662867 ?auto_662872 ) ) ( not ( = ?auto_662867 ?auto_662873 ) ) ( not ( = ?auto_662867 ?auto_662874 ) ) ( not ( = ?auto_662868 ?auto_662869 ) ) ( not ( = ?auto_662868 ?auto_662870 ) ) ( not ( = ?auto_662868 ?auto_662871 ) ) ( not ( = ?auto_662868 ?auto_662872 ) ) ( not ( = ?auto_662868 ?auto_662873 ) ) ( not ( = ?auto_662868 ?auto_662874 ) ) ( not ( = ?auto_662869 ?auto_662870 ) ) ( not ( = ?auto_662869 ?auto_662871 ) ) ( not ( = ?auto_662869 ?auto_662872 ) ) ( not ( = ?auto_662869 ?auto_662873 ) ) ( not ( = ?auto_662869 ?auto_662874 ) ) ( not ( = ?auto_662870 ?auto_662871 ) ) ( not ( = ?auto_662870 ?auto_662872 ) ) ( not ( = ?auto_662870 ?auto_662873 ) ) ( not ( = ?auto_662870 ?auto_662874 ) ) ( not ( = ?auto_662871 ?auto_662872 ) ) ( not ( = ?auto_662871 ?auto_662873 ) ) ( not ( = ?auto_662871 ?auto_662874 ) ) ( not ( = ?auto_662872 ?auto_662873 ) ) ( not ( = ?auto_662872 ?auto_662874 ) ) ( not ( = ?auto_662873 ?auto_662874 ) ) ( CLEAR ?auto_662871 ) ( ON ?auto_662872 ?auto_662873 ) ( CLEAR ?auto_662872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_662858 ?auto_662859 ?auto_662860 ?auto_662861 ?auto_662862 ?auto_662863 ?auto_662864 ?auto_662865 ?auto_662866 ?auto_662867 ?auto_662868 ?auto_662869 ?auto_662870 ?auto_662871 ?auto_662872 )
      ( MAKE-16PILE ?auto_662858 ?auto_662859 ?auto_662860 ?auto_662861 ?auto_662862 ?auto_662863 ?auto_662864 ?auto_662865 ?auto_662866 ?auto_662867 ?auto_662868 ?auto_662869 ?auto_662870 ?auto_662871 ?auto_662872 ?auto_662873 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_662924 - BLOCK
      ?auto_662925 - BLOCK
      ?auto_662926 - BLOCK
      ?auto_662927 - BLOCK
      ?auto_662928 - BLOCK
      ?auto_662929 - BLOCK
      ?auto_662930 - BLOCK
      ?auto_662931 - BLOCK
      ?auto_662932 - BLOCK
      ?auto_662933 - BLOCK
      ?auto_662934 - BLOCK
      ?auto_662935 - BLOCK
      ?auto_662936 - BLOCK
      ?auto_662937 - BLOCK
      ?auto_662938 - BLOCK
      ?auto_662939 - BLOCK
    )
    :vars
    (
      ?auto_662940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_662939 ?auto_662940 ) ( ON-TABLE ?auto_662924 ) ( ON ?auto_662925 ?auto_662924 ) ( ON ?auto_662926 ?auto_662925 ) ( ON ?auto_662927 ?auto_662926 ) ( ON ?auto_662928 ?auto_662927 ) ( ON ?auto_662929 ?auto_662928 ) ( ON ?auto_662930 ?auto_662929 ) ( ON ?auto_662931 ?auto_662930 ) ( ON ?auto_662932 ?auto_662931 ) ( ON ?auto_662933 ?auto_662932 ) ( ON ?auto_662934 ?auto_662933 ) ( ON ?auto_662935 ?auto_662934 ) ( ON ?auto_662936 ?auto_662935 ) ( not ( = ?auto_662924 ?auto_662925 ) ) ( not ( = ?auto_662924 ?auto_662926 ) ) ( not ( = ?auto_662924 ?auto_662927 ) ) ( not ( = ?auto_662924 ?auto_662928 ) ) ( not ( = ?auto_662924 ?auto_662929 ) ) ( not ( = ?auto_662924 ?auto_662930 ) ) ( not ( = ?auto_662924 ?auto_662931 ) ) ( not ( = ?auto_662924 ?auto_662932 ) ) ( not ( = ?auto_662924 ?auto_662933 ) ) ( not ( = ?auto_662924 ?auto_662934 ) ) ( not ( = ?auto_662924 ?auto_662935 ) ) ( not ( = ?auto_662924 ?auto_662936 ) ) ( not ( = ?auto_662924 ?auto_662937 ) ) ( not ( = ?auto_662924 ?auto_662938 ) ) ( not ( = ?auto_662924 ?auto_662939 ) ) ( not ( = ?auto_662924 ?auto_662940 ) ) ( not ( = ?auto_662925 ?auto_662926 ) ) ( not ( = ?auto_662925 ?auto_662927 ) ) ( not ( = ?auto_662925 ?auto_662928 ) ) ( not ( = ?auto_662925 ?auto_662929 ) ) ( not ( = ?auto_662925 ?auto_662930 ) ) ( not ( = ?auto_662925 ?auto_662931 ) ) ( not ( = ?auto_662925 ?auto_662932 ) ) ( not ( = ?auto_662925 ?auto_662933 ) ) ( not ( = ?auto_662925 ?auto_662934 ) ) ( not ( = ?auto_662925 ?auto_662935 ) ) ( not ( = ?auto_662925 ?auto_662936 ) ) ( not ( = ?auto_662925 ?auto_662937 ) ) ( not ( = ?auto_662925 ?auto_662938 ) ) ( not ( = ?auto_662925 ?auto_662939 ) ) ( not ( = ?auto_662925 ?auto_662940 ) ) ( not ( = ?auto_662926 ?auto_662927 ) ) ( not ( = ?auto_662926 ?auto_662928 ) ) ( not ( = ?auto_662926 ?auto_662929 ) ) ( not ( = ?auto_662926 ?auto_662930 ) ) ( not ( = ?auto_662926 ?auto_662931 ) ) ( not ( = ?auto_662926 ?auto_662932 ) ) ( not ( = ?auto_662926 ?auto_662933 ) ) ( not ( = ?auto_662926 ?auto_662934 ) ) ( not ( = ?auto_662926 ?auto_662935 ) ) ( not ( = ?auto_662926 ?auto_662936 ) ) ( not ( = ?auto_662926 ?auto_662937 ) ) ( not ( = ?auto_662926 ?auto_662938 ) ) ( not ( = ?auto_662926 ?auto_662939 ) ) ( not ( = ?auto_662926 ?auto_662940 ) ) ( not ( = ?auto_662927 ?auto_662928 ) ) ( not ( = ?auto_662927 ?auto_662929 ) ) ( not ( = ?auto_662927 ?auto_662930 ) ) ( not ( = ?auto_662927 ?auto_662931 ) ) ( not ( = ?auto_662927 ?auto_662932 ) ) ( not ( = ?auto_662927 ?auto_662933 ) ) ( not ( = ?auto_662927 ?auto_662934 ) ) ( not ( = ?auto_662927 ?auto_662935 ) ) ( not ( = ?auto_662927 ?auto_662936 ) ) ( not ( = ?auto_662927 ?auto_662937 ) ) ( not ( = ?auto_662927 ?auto_662938 ) ) ( not ( = ?auto_662927 ?auto_662939 ) ) ( not ( = ?auto_662927 ?auto_662940 ) ) ( not ( = ?auto_662928 ?auto_662929 ) ) ( not ( = ?auto_662928 ?auto_662930 ) ) ( not ( = ?auto_662928 ?auto_662931 ) ) ( not ( = ?auto_662928 ?auto_662932 ) ) ( not ( = ?auto_662928 ?auto_662933 ) ) ( not ( = ?auto_662928 ?auto_662934 ) ) ( not ( = ?auto_662928 ?auto_662935 ) ) ( not ( = ?auto_662928 ?auto_662936 ) ) ( not ( = ?auto_662928 ?auto_662937 ) ) ( not ( = ?auto_662928 ?auto_662938 ) ) ( not ( = ?auto_662928 ?auto_662939 ) ) ( not ( = ?auto_662928 ?auto_662940 ) ) ( not ( = ?auto_662929 ?auto_662930 ) ) ( not ( = ?auto_662929 ?auto_662931 ) ) ( not ( = ?auto_662929 ?auto_662932 ) ) ( not ( = ?auto_662929 ?auto_662933 ) ) ( not ( = ?auto_662929 ?auto_662934 ) ) ( not ( = ?auto_662929 ?auto_662935 ) ) ( not ( = ?auto_662929 ?auto_662936 ) ) ( not ( = ?auto_662929 ?auto_662937 ) ) ( not ( = ?auto_662929 ?auto_662938 ) ) ( not ( = ?auto_662929 ?auto_662939 ) ) ( not ( = ?auto_662929 ?auto_662940 ) ) ( not ( = ?auto_662930 ?auto_662931 ) ) ( not ( = ?auto_662930 ?auto_662932 ) ) ( not ( = ?auto_662930 ?auto_662933 ) ) ( not ( = ?auto_662930 ?auto_662934 ) ) ( not ( = ?auto_662930 ?auto_662935 ) ) ( not ( = ?auto_662930 ?auto_662936 ) ) ( not ( = ?auto_662930 ?auto_662937 ) ) ( not ( = ?auto_662930 ?auto_662938 ) ) ( not ( = ?auto_662930 ?auto_662939 ) ) ( not ( = ?auto_662930 ?auto_662940 ) ) ( not ( = ?auto_662931 ?auto_662932 ) ) ( not ( = ?auto_662931 ?auto_662933 ) ) ( not ( = ?auto_662931 ?auto_662934 ) ) ( not ( = ?auto_662931 ?auto_662935 ) ) ( not ( = ?auto_662931 ?auto_662936 ) ) ( not ( = ?auto_662931 ?auto_662937 ) ) ( not ( = ?auto_662931 ?auto_662938 ) ) ( not ( = ?auto_662931 ?auto_662939 ) ) ( not ( = ?auto_662931 ?auto_662940 ) ) ( not ( = ?auto_662932 ?auto_662933 ) ) ( not ( = ?auto_662932 ?auto_662934 ) ) ( not ( = ?auto_662932 ?auto_662935 ) ) ( not ( = ?auto_662932 ?auto_662936 ) ) ( not ( = ?auto_662932 ?auto_662937 ) ) ( not ( = ?auto_662932 ?auto_662938 ) ) ( not ( = ?auto_662932 ?auto_662939 ) ) ( not ( = ?auto_662932 ?auto_662940 ) ) ( not ( = ?auto_662933 ?auto_662934 ) ) ( not ( = ?auto_662933 ?auto_662935 ) ) ( not ( = ?auto_662933 ?auto_662936 ) ) ( not ( = ?auto_662933 ?auto_662937 ) ) ( not ( = ?auto_662933 ?auto_662938 ) ) ( not ( = ?auto_662933 ?auto_662939 ) ) ( not ( = ?auto_662933 ?auto_662940 ) ) ( not ( = ?auto_662934 ?auto_662935 ) ) ( not ( = ?auto_662934 ?auto_662936 ) ) ( not ( = ?auto_662934 ?auto_662937 ) ) ( not ( = ?auto_662934 ?auto_662938 ) ) ( not ( = ?auto_662934 ?auto_662939 ) ) ( not ( = ?auto_662934 ?auto_662940 ) ) ( not ( = ?auto_662935 ?auto_662936 ) ) ( not ( = ?auto_662935 ?auto_662937 ) ) ( not ( = ?auto_662935 ?auto_662938 ) ) ( not ( = ?auto_662935 ?auto_662939 ) ) ( not ( = ?auto_662935 ?auto_662940 ) ) ( not ( = ?auto_662936 ?auto_662937 ) ) ( not ( = ?auto_662936 ?auto_662938 ) ) ( not ( = ?auto_662936 ?auto_662939 ) ) ( not ( = ?auto_662936 ?auto_662940 ) ) ( not ( = ?auto_662937 ?auto_662938 ) ) ( not ( = ?auto_662937 ?auto_662939 ) ) ( not ( = ?auto_662937 ?auto_662940 ) ) ( not ( = ?auto_662938 ?auto_662939 ) ) ( not ( = ?auto_662938 ?auto_662940 ) ) ( not ( = ?auto_662939 ?auto_662940 ) ) ( ON ?auto_662938 ?auto_662939 ) ( CLEAR ?auto_662936 ) ( ON ?auto_662937 ?auto_662938 ) ( CLEAR ?auto_662937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_662924 ?auto_662925 ?auto_662926 ?auto_662927 ?auto_662928 ?auto_662929 ?auto_662930 ?auto_662931 ?auto_662932 ?auto_662933 ?auto_662934 ?auto_662935 ?auto_662936 ?auto_662937 )
      ( MAKE-16PILE ?auto_662924 ?auto_662925 ?auto_662926 ?auto_662927 ?auto_662928 ?auto_662929 ?auto_662930 ?auto_662931 ?auto_662932 ?auto_662933 ?auto_662934 ?auto_662935 ?auto_662936 ?auto_662937 ?auto_662938 ?auto_662939 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_662990 - BLOCK
      ?auto_662991 - BLOCK
      ?auto_662992 - BLOCK
      ?auto_662993 - BLOCK
      ?auto_662994 - BLOCK
      ?auto_662995 - BLOCK
      ?auto_662996 - BLOCK
      ?auto_662997 - BLOCK
      ?auto_662998 - BLOCK
      ?auto_662999 - BLOCK
      ?auto_663000 - BLOCK
      ?auto_663001 - BLOCK
      ?auto_663002 - BLOCK
      ?auto_663003 - BLOCK
      ?auto_663004 - BLOCK
      ?auto_663005 - BLOCK
    )
    :vars
    (
      ?auto_663006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_663005 ?auto_663006 ) ( ON-TABLE ?auto_662990 ) ( ON ?auto_662991 ?auto_662990 ) ( ON ?auto_662992 ?auto_662991 ) ( ON ?auto_662993 ?auto_662992 ) ( ON ?auto_662994 ?auto_662993 ) ( ON ?auto_662995 ?auto_662994 ) ( ON ?auto_662996 ?auto_662995 ) ( ON ?auto_662997 ?auto_662996 ) ( ON ?auto_662998 ?auto_662997 ) ( ON ?auto_662999 ?auto_662998 ) ( ON ?auto_663000 ?auto_662999 ) ( ON ?auto_663001 ?auto_663000 ) ( not ( = ?auto_662990 ?auto_662991 ) ) ( not ( = ?auto_662990 ?auto_662992 ) ) ( not ( = ?auto_662990 ?auto_662993 ) ) ( not ( = ?auto_662990 ?auto_662994 ) ) ( not ( = ?auto_662990 ?auto_662995 ) ) ( not ( = ?auto_662990 ?auto_662996 ) ) ( not ( = ?auto_662990 ?auto_662997 ) ) ( not ( = ?auto_662990 ?auto_662998 ) ) ( not ( = ?auto_662990 ?auto_662999 ) ) ( not ( = ?auto_662990 ?auto_663000 ) ) ( not ( = ?auto_662990 ?auto_663001 ) ) ( not ( = ?auto_662990 ?auto_663002 ) ) ( not ( = ?auto_662990 ?auto_663003 ) ) ( not ( = ?auto_662990 ?auto_663004 ) ) ( not ( = ?auto_662990 ?auto_663005 ) ) ( not ( = ?auto_662990 ?auto_663006 ) ) ( not ( = ?auto_662991 ?auto_662992 ) ) ( not ( = ?auto_662991 ?auto_662993 ) ) ( not ( = ?auto_662991 ?auto_662994 ) ) ( not ( = ?auto_662991 ?auto_662995 ) ) ( not ( = ?auto_662991 ?auto_662996 ) ) ( not ( = ?auto_662991 ?auto_662997 ) ) ( not ( = ?auto_662991 ?auto_662998 ) ) ( not ( = ?auto_662991 ?auto_662999 ) ) ( not ( = ?auto_662991 ?auto_663000 ) ) ( not ( = ?auto_662991 ?auto_663001 ) ) ( not ( = ?auto_662991 ?auto_663002 ) ) ( not ( = ?auto_662991 ?auto_663003 ) ) ( not ( = ?auto_662991 ?auto_663004 ) ) ( not ( = ?auto_662991 ?auto_663005 ) ) ( not ( = ?auto_662991 ?auto_663006 ) ) ( not ( = ?auto_662992 ?auto_662993 ) ) ( not ( = ?auto_662992 ?auto_662994 ) ) ( not ( = ?auto_662992 ?auto_662995 ) ) ( not ( = ?auto_662992 ?auto_662996 ) ) ( not ( = ?auto_662992 ?auto_662997 ) ) ( not ( = ?auto_662992 ?auto_662998 ) ) ( not ( = ?auto_662992 ?auto_662999 ) ) ( not ( = ?auto_662992 ?auto_663000 ) ) ( not ( = ?auto_662992 ?auto_663001 ) ) ( not ( = ?auto_662992 ?auto_663002 ) ) ( not ( = ?auto_662992 ?auto_663003 ) ) ( not ( = ?auto_662992 ?auto_663004 ) ) ( not ( = ?auto_662992 ?auto_663005 ) ) ( not ( = ?auto_662992 ?auto_663006 ) ) ( not ( = ?auto_662993 ?auto_662994 ) ) ( not ( = ?auto_662993 ?auto_662995 ) ) ( not ( = ?auto_662993 ?auto_662996 ) ) ( not ( = ?auto_662993 ?auto_662997 ) ) ( not ( = ?auto_662993 ?auto_662998 ) ) ( not ( = ?auto_662993 ?auto_662999 ) ) ( not ( = ?auto_662993 ?auto_663000 ) ) ( not ( = ?auto_662993 ?auto_663001 ) ) ( not ( = ?auto_662993 ?auto_663002 ) ) ( not ( = ?auto_662993 ?auto_663003 ) ) ( not ( = ?auto_662993 ?auto_663004 ) ) ( not ( = ?auto_662993 ?auto_663005 ) ) ( not ( = ?auto_662993 ?auto_663006 ) ) ( not ( = ?auto_662994 ?auto_662995 ) ) ( not ( = ?auto_662994 ?auto_662996 ) ) ( not ( = ?auto_662994 ?auto_662997 ) ) ( not ( = ?auto_662994 ?auto_662998 ) ) ( not ( = ?auto_662994 ?auto_662999 ) ) ( not ( = ?auto_662994 ?auto_663000 ) ) ( not ( = ?auto_662994 ?auto_663001 ) ) ( not ( = ?auto_662994 ?auto_663002 ) ) ( not ( = ?auto_662994 ?auto_663003 ) ) ( not ( = ?auto_662994 ?auto_663004 ) ) ( not ( = ?auto_662994 ?auto_663005 ) ) ( not ( = ?auto_662994 ?auto_663006 ) ) ( not ( = ?auto_662995 ?auto_662996 ) ) ( not ( = ?auto_662995 ?auto_662997 ) ) ( not ( = ?auto_662995 ?auto_662998 ) ) ( not ( = ?auto_662995 ?auto_662999 ) ) ( not ( = ?auto_662995 ?auto_663000 ) ) ( not ( = ?auto_662995 ?auto_663001 ) ) ( not ( = ?auto_662995 ?auto_663002 ) ) ( not ( = ?auto_662995 ?auto_663003 ) ) ( not ( = ?auto_662995 ?auto_663004 ) ) ( not ( = ?auto_662995 ?auto_663005 ) ) ( not ( = ?auto_662995 ?auto_663006 ) ) ( not ( = ?auto_662996 ?auto_662997 ) ) ( not ( = ?auto_662996 ?auto_662998 ) ) ( not ( = ?auto_662996 ?auto_662999 ) ) ( not ( = ?auto_662996 ?auto_663000 ) ) ( not ( = ?auto_662996 ?auto_663001 ) ) ( not ( = ?auto_662996 ?auto_663002 ) ) ( not ( = ?auto_662996 ?auto_663003 ) ) ( not ( = ?auto_662996 ?auto_663004 ) ) ( not ( = ?auto_662996 ?auto_663005 ) ) ( not ( = ?auto_662996 ?auto_663006 ) ) ( not ( = ?auto_662997 ?auto_662998 ) ) ( not ( = ?auto_662997 ?auto_662999 ) ) ( not ( = ?auto_662997 ?auto_663000 ) ) ( not ( = ?auto_662997 ?auto_663001 ) ) ( not ( = ?auto_662997 ?auto_663002 ) ) ( not ( = ?auto_662997 ?auto_663003 ) ) ( not ( = ?auto_662997 ?auto_663004 ) ) ( not ( = ?auto_662997 ?auto_663005 ) ) ( not ( = ?auto_662997 ?auto_663006 ) ) ( not ( = ?auto_662998 ?auto_662999 ) ) ( not ( = ?auto_662998 ?auto_663000 ) ) ( not ( = ?auto_662998 ?auto_663001 ) ) ( not ( = ?auto_662998 ?auto_663002 ) ) ( not ( = ?auto_662998 ?auto_663003 ) ) ( not ( = ?auto_662998 ?auto_663004 ) ) ( not ( = ?auto_662998 ?auto_663005 ) ) ( not ( = ?auto_662998 ?auto_663006 ) ) ( not ( = ?auto_662999 ?auto_663000 ) ) ( not ( = ?auto_662999 ?auto_663001 ) ) ( not ( = ?auto_662999 ?auto_663002 ) ) ( not ( = ?auto_662999 ?auto_663003 ) ) ( not ( = ?auto_662999 ?auto_663004 ) ) ( not ( = ?auto_662999 ?auto_663005 ) ) ( not ( = ?auto_662999 ?auto_663006 ) ) ( not ( = ?auto_663000 ?auto_663001 ) ) ( not ( = ?auto_663000 ?auto_663002 ) ) ( not ( = ?auto_663000 ?auto_663003 ) ) ( not ( = ?auto_663000 ?auto_663004 ) ) ( not ( = ?auto_663000 ?auto_663005 ) ) ( not ( = ?auto_663000 ?auto_663006 ) ) ( not ( = ?auto_663001 ?auto_663002 ) ) ( not ( = ?auto_663001 ?auto_663003 ) ) ( not ( = ?auto_663001 ?auto_663004 ) ) ( not ( = ?auto_663001 ?auto_663005 ) ) ( not ( = ?auto_663001 ?auto_663006 ) ) ( not ( = ?auto_663002 ?auto_663003 ) ) ( not ( = ?auto_663002 ?auto_663004 ) ) ( not ( = ?auto_663002 ?auto_663005 ) ) ( not ( = ?auto_663002 ?auto_663006 ) ) ( not ( = ?auto_663003 ?auto_663004 ) ) ( not ( = ?auto_663003 ?auto_663005 ) ) ( not ( = ?auto_663003 ?auto_663006 ) ) ( not ( = ?auto_663004 ?auto_663005 ) ) ( not ( = ?auto_663004 ?auto_663006 ) ) ( not ( = ?auto_663005 ?auto_663006 ) ) ( ON ?auto_663004 ?auto_663005 ) ( ON ?auto_663003 ?auto_663004 ) ( CLEAR ?auto_663001 ) ( ON ?auto_663002 ?auto_663003 ) ( CLEAR ?auto_663002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_662990 ?auto_662991 ?auto_662992 ?auto_662993 ?auto_662994 ?auto_662995 ?auto_662996 ?auto_662997 ?auto_662998 ?auto_662999 ?auto_663000 ?auto_663001 ?auto_663002 )
      ( MAKE-16PILE ?auto_662990 ?auto_662991 ?auto_662992 ?auto_662993 ?auto_662994 ?auto_662995 ?auto_662996 ?auto_662997 ?auto_662998 ?auto_662999 ?auto_663000 ?auto_663001 ?auto_663002 ?auto_663003 ?auto_663004 ?auto_663005 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_663056 - BLOCK
      ?auto_663057 - BLOCK
      ?auto_663058 - BLOCK
      ?auto_663059 - BLOCK
      ?auto_663060 - BLOCK
      ?auto_663061 - BLOCK
      ?auto_663062 - BLOCK
      ?auto_663063 - BLOCK
      ?auto_663064 - BLOCK
      ?auto_663065 - BLOCK
      ?auto_663066 - BLOCK
      ?auto_663067 - BLOCK
      ?auto_663068 - BLOCK
      ?auto_663069 - BLOCK
      ?auto_663070 - BLOCK
      ?auto_663071 - BLOCK
    )
    :vars
    (
      ?auto_663072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_663071 ?auto_663072 ) ( ON-TABLE ?auto_663056 ) ( ON ?auto_663057 ?auto_663056 ) ( ON ?auto_663058 ?auto_663057 ) ( ON ?auto_663059 ?auto_663058 ) ( ON ?auto_663060 ?auto_663059 ) ( ON ?auto_663061 ?auto_663060 ) ( ON ?auto_663062 ?auto_663061 ) ( ON ?auto_663063 ?auto_663062 ) ( ON ?auto_663064 ?auto_663063 ) ( ON ?auto_663065 ?auto_663064 ) ( ON ?auto_663066 ?auto_663065 ) ( not ( = ?auto_663056 ?auto_663057 ) ) ( not ( = ?auto_663056 ?auto_663058 ) ) ( not ( = ?auto_663056 ?auto_663059 ) ) ( not ( = ?auto_663056 ?auto_663060 ) ) ( not ( = ?auto_663056 ?auto_663061 ) ) ( not ( = ?auto_663056 ?auto_663062 ) ) ( not ( = ?auto_663056 ?auto_663063 ) ) ( not ( = ?auto_663056 ?auto_663064 ) ) ( not ( = ?auto_663056 ?auto_663065 ) ) ( not ( = ?auto_663056 ?auto_663066 ) ) ( not ( = ?auto_663056 ?auto_663067 ) ) ( not ( = ?auto_663056 ?auto_663068 ) ) ( not ( = ?auto_663056 ?auto_663069 ) ) ( not ( = ?auto_663056 ?auto_663070 ) ) ( not ( = ?auto_663056 ?auto_663071 ) ) ( not ( = ?auto_663056 ?auto_663072 ) ) ( not ( = ?auto_663057 ?auto_663058 ) ) ( not ( = ?auto_663057 ?auto_663059 ) ) ( not ( = ?auto_663057 ?auto_663060 ) ) ( not ( = ?auto_663057 ?auto_663061 ) ) ( not ( = ?auto_663057 ?auto_663062 ) ) ( not ( = ?auto_663057 ?auto_663063 ) ) ( not ( = ?auto_663057 ?auto_663064 ) ) ( not ( = ?auto_663057 ?auto_663065 ) ) ( not ( = ?auto_663057 ?auto_663066 ) ) ( not ( = ?auto_663057 ?auto_663067 ) ) ( not ( = ?auto_663057 ?auto_663068 ) ) ( not ( = ?auto_663057 ?auto_663069 ) ) ( not ( = ?auto_663057 ?auto_663070 ) ) ( not ( = ?auto_663057 ?auto_663071 ) ) ( not ( = ?auto_663057 ?auto_663072 ) ) ( not ( = ?auto_663058 ?auto_663059 ) ) ( not ( = ?auto_663058 ?auto_663060 ) ) ( not ( = ?auto_663058 ?auto_663061 ) ) ( not ( = ?auto_663058 ?auto_663062 ) ) ( not ( = ?auto_663058 ?auto_663063 ) ) ( not ( = ?auto_663058 ?auto_663064 ) ) ( not ( = ?auto_663058 ?auto_663065 ) ) ( not ( = ?auto_663058 ?auto_663066 ) ) ( not ( = ?auto_663058 ?auto_663067 ) ) ( not ( = ?auto_663058 ?auto_663068 ) ) ( not ( = ?auto_663058 ?auto_663069 ) ) ( not ( = ?auto_663058 ?auto_663070 ) ) ( not ( = ?auto_663058 ?auto_663071 ) ) ( not ( = ?auto_663058 ?auto_663072 ) ) ( not ( = ?auto_663059 ?auto_663060 ) ) ( not ( = ?auto_663059 ?auto_663061 ) ) ( not ( = ?auto_663059 ?auto_663062 ) ) ( not ( = ?auto_663059 ?auto_663063 ) ) ( not ( = ?auto_663059 ?auto_663064 ) ) ( not ( = ?auto_663059 ?auto_663065 ) ) ( not ( = ?auto_663059 ?auto_663066 ) ) ( not ( = ?auto_663059 ?auto_663067 ) ) ( not ( = ?auto_663059 ?auto_663068 ) ) ( not ( = ?auto_663059 ?auto_663069 ) ) ( not ( = ?auto_663059 ?auto_663070 ) ) ( not ( = ?auto_663059 ?auto_663071 ) ) ( not ( = ?auto_663059 ?auto_663072 ) ) ( not ( = ?auto_663060 ?auto_663061 ) ) ( not ( = ?auto_663060 ?auto_663062 ) ) ( not ( = ?auto_663060 ?auto_663063 ) ) ( not ( = ?auto_663060 ?auto_663064 ) ) ( not ( = ?auto_663060 ?auto_663065 ) ) ( not ( = ?auto_663060 ?auto_663066 ) ) ( not ( = ?auto_663060 ?auto_663067 ) ) ( not ( = ?auto_663060 ?auto_663068 ) ) ( not ( = ?auto_663060 ?auto_663069 ) ) ( not ( = ?auto_663060 ?auto_663070 ) ) ( not ( = ?auto_663060 ?auto_663071 ) ) ( not ( = ?auto_663060 ?auto_663072 ) ) ( not ( = ?auto_663061 ?auto_663062 ) ) ( not ( = ?auto_663061 ?auto_663063 ) ) ( not ( = ?auto_663061 ?auto_663064 ) ) ( not ( = ?auto_663061 ?auto_663065 ) ) ( not ( = ?auto_663061 ?auto_663066 ) ) ( not ( = ?auto_663061 ?auto_663067 ) ) ( not ( = ?auto_663061 ?auto_663068 ) ) ( not ( = ?auto_663061 ?auto_663069 ) ) ( not ( = ?auto_663061 ?auto_663070 ) ) ( not ( = ?auto_663061 ?auto_663071 ) ) ( not ( = ?auto_663061 ?auto_663072 ) ) ( not ( = ?auto_663062 ?auto_663063 ) ) ( not ( = ?auto_663062 ?auto_663064 ) ) ( not ( = ?auto_663062 ?auto_663065 ) ) ( not ( = ?auto_663062 ?auto_663066 ) ) ( not ( = ?auto_663062 ?auto_663067 ) ) ( not ( = ?auto_663062 ?auto_663068 ) ) ( not ( = ?auto_663062 ?auto_663069 ) ) ( not ( = ?auto_663062 ?auto_663070 ) ) ( not ( = ?auto_663062 ?auto_663071 ) ) ( not ( = ?auto_663062 ?auto_663072 ) ) ( not ( = ?auto_663063 ?auto_663064 ) ) ( not ( = ?auto_663063 ?auto_663065 ) ) ( not ( = ?auto_663063 ?auto_663066 ) ) ( not ( = ?auto_663063 ?auto_663067 ) ) ( not ( = ?auto_663063 ?auto_663068 ) ) ( not ( = ?auto_663063 ?auto_663069 ) ) ( not ( = ?auto_663063 ?auto_663070 ) ) ( not ( = ?auto_663063 ?auto_663071 ) ) ( not ( = ?auto_663063 ?auto_663072 ) ) ( not ( = ?auto_663064 ?auto_663065 ) ) ( not ( = ?auto_663064 ?auto_663066 ) ) ( not ( = ?auto_663064 ?auto_663067 ) ) ( not ( = ?auto_663064 ?auto_663068 ) ) ( not ( = ?auto_663064 ?auto_663069 ) ) ( not ( = ?auto_663064 ?auto_663070 ) ) ( not ( = ?auto_663064 ?auto_663071 ) ) ( not ( = ?auto_663064 ?auto_663072 ) ) ( not ( = ?auto_663065 ?auto_663066 ) ) ( not ( = ?auto_663065 ?auto_663067 ) ) ( not ( = ?auto_663065 ?auto_663068 ) ) ( not ( = ?auto_663065 ?auto_663069 ) ) ( not ( = ?auto_663065 ?auto_663070 ) ) ( not ( = ?auto_663065 ?auto_663071 ) ) ( not ( = ?auto_663065 ?auto_663072 ) ) ( not ( = ?auto_663066 ?auto_663067 ) ) ( not ( = ?auto_663066 ?auto_663068 ) ) ( not ( = ?auto_663066 ?auto_663069 ) ) ( not ( = ?auto_663066 ?auto_663070 ) ) ( not ( = ?auto_663066 ?auto_663071 ) ) ( not ( = ?auto_663066 ?auto_663072 ) ) ( not ( = ?auto_663067 ?auto_663068 ) ) ( not ( = ?auto_663067 ?auto_663069 ) ) ( not ( = ?auto_663067 ?auto_663070 ) ) ( not ( = ?auto_663067 ?auto_663071 ) ) ( not ( = ?auto_663067 ?auto_663072 ) ) ( not ( = ?auto_663068 ?auto_663069 ) ) ( not ( = ?auto_663068 ?auto_663070 ) ) ( not ( = ?auto_663068 ?auto_663071 ) ) ( not ( = ?auto_663068 ?auto_663072 ) ) ( not ( = ?auto_663069 ?auto_663070 ) ) ( not ( = ?auto_663069 ?auto_663071 ) ) ( not ( = ?auto_663069 ?auto_663072 ) ) ( not ( = ?auto_663070 ?auto_663071 ) ) ( not ( = ?auto_663070 ?auto_663072 ) ) ( not ( = ?auto_663071 ?auto_663072 ) ) ( ON ?auto_663070 ?auto_663071 ) ( ON ?auto_663069 ?auto_663070 ) ( ON ?auto_663068 ?auto_663069 ) ( CLEAR ?auto_663066 ) ( ON ?auto_663067 ?auto_663068 ) ( CLEAR ?auto_663067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_663056 ?auto_663057 ?auto_663058 ?auto_663059 ?auto_663060 ?auto_663061 ?auto_663062 ?auto_663063 ?auto_663064 ?auto_663065 ?auto_663066 ?auto_663067 )
      ( MAKE-16PILE ?auto_663056 ?auto_663057 ?auto_663058 ?auto_663059 ?auto_663060 ?auto_663061 ?auto_663062 ?auto_663063 ?auto_663064 ?auto_663065 ?auto_663066 ?auto_663067 ?auto_663068 ?auto_663069 ?auto_663070 ?auto_663071 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_663122 - BLOCK
      ?auto_663123 - BLOCK
      ?auto_663124 - BLOCK
      ?auto_663125 - BLOCK
      ?auto_663126 - BLOCK
      ?auto_663127 - BLOCK
      ?auto_663128 - BLOCK
      ?auto_663129 - BLOCK
      ?auto_663130 - BLOCK
      ?auto_663131 - BLOCK
      ?auto_663132 - BLOCK
      ?auto_663133 - BLOCK
      ?auto_663134 - BLOCK
      ?auto_663135 - BLOCK
      ?auto_663136 - BLOCK
      ?auto_663137 - BLOCK
    )
    :vars
    (
      ?auto_663138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_663137 ?auto_663138 ) ( ON-TABLE ?auto_663122 ) ( ON ?auto_663123 ?auto_663122 ) ( ON ?auto_663124 ?auto_663123 ) ( ON ?auto_663125 ?auto_663124 ) ( ON ?auto_663126 ?auto_663125 ) ( ON ?auto_663127 ?auto_663126 ) ( ON ?auto_663128 ?auto_663127 ) ( ON ?auto_663129 ?auto_663128 ) ( ON ?auto_663130 ?auto_663129 ) ( ON ?auto_663131 ?auto_663130 ) ( not ( = ?auto_663122 ?auto_663123 ) ) ( not ( = ?auto_663122 ?auto_663124 ) ) ( not ( = ?auto_663122 ?auto_663125 ) ) ( not ( = ?auto_663122 ?auto_663126 ) ) ( not ( = ?auto_663122 ?auto_663127 ) ) ( not ( = ?auto_663122 ?auto_663128 ) ) ( not ( = ?auto_663122 ?auto_663129 ) ) ( not ( = ?auto_663122 ?auto_663130 ) ) ( not ( = ?auto_663122 ?auto_663131 ) ) ( not ( = ?auto_663122 ?auto_663132 ) ) ( not ( = ?auto_663122 ?auto_663133 ) ) ( not ( = ?auto_663122 ?auto_663134 ) ) ( not ( = ?auto_663122 ?auto_663135 ) ) ( not ( = ?auto_663122 ?auto_663136 ) ) ( not ( = ?auto_663122 ?auto_663137 ) ) ( not ( = ?auto_663122 ?auto_663138 ) ) ( not ( = ?auto_663123 ?auto_663124 ) ) ( not ( = ?auto_663123 ?auto_663125 ) ) ( not ( = ?auto_663123 ?auto_663126 ) ) ( not ( = ?auto_663123 ?auto_663127 ) ) ( not ( = ?auto_663123 ?auto_663128 ) ) ( not ( = ?auto_663123 ?auto_663129 ) ) ( not ( = ?auto_663123 ?auto_663130 ) ) ( not ( = ?auto_663123 ?auto_663131 ) ) ( not ( = ?auto_663123 ?auto_663132 ) ) ( not ( = ?auto_663123 ?auto_663133 ) ) ( not ( = ?auto_663123 ?auto_663134 ) ) ( not ( = ?auto_663123 ?auto_663135 ) ) ( not ( = ?auto_663123 ?auto_663136 ) ) ( not ( = ?auto_663123 ?auto_663137 ) ) ( not ( = ?auto_663123 ?auto_663138 ) ) ( not ( = ?auto_663124 ?auto_663125 ) ) ( not ( = ?auto_663124 ?auto_663126 ) ) ( not ( = ?auto_663124 ?auto_663127 ) ) ( not ( = ?auto_663124 ?auto_663128 ) ) ( not ( = ?auto_663124 ?auto_663129 ) ) ( not ( = ?auto_663124 ?auto_663130 ) ) ( not ( = ?auto_663124 ?auto_663131 ) ) ( not ( = ?auto_663124 ?auto_663132 ) ) ( not ( = ?auto_663124 ?auto_663133 ) ) ( not ( = ?auto_663124 ?auto_663134 ) ) ( not ( = ?auto_663124 ?auto_663135 ) ) ( not ( = ?auto_663124 ?auto_663136 ) ) ( not ( = ?auto_663124 ?auto_663137 ) ) ( not ( = ?auto_663124 ?auto_663138 ) ) ( not ( = ?auto_663125 ?auto_663126 ) ) ( not ( = ?auto_663125 ?auto_663127 ) ) ( not ( = ?auto_663125 ?auto_663128 ) ) ( not ( = ?auto_663125 ?auto_663129 ) ) ( not ( = ?auto_663125 ?auto_663130 ) ) ( not ( = ?auto_663125 ?auto_663131 ) ) ( not ( = ?auto_663125 ?auto_663132 ) ) ( not ( = ?auto_663125 ?auto_663133 ) ) ( not ( = ?auto_663125 ?auto_663134 ) ) ( not ( = ?auto_663125 ?auto_663135 ) ) ( not ( = ?auto_663125 ?auto_663136 ) ) ( not ( = ?auto_663125 ?auto_663137 ) ) ( not ( = ?auto_663125 ?auto_663138 ) ) ( not ( = ?auto_663126 ?auto_663127 ) ) ( not ( = ?auto_663126 ?auto_663128 ) ) ( not ( = ?auto_663126 ?auto_663129 ) ) ( not ( = ?auto_663126 ?auto_663130 ) ) ( not ( = ?auto_663126 ?auto_663131 ) ) ( not ( = ?auto_663126 ?auto_663132 ) ) ( not ( = ?auto_663126 ?auto_663133 ) ) ( not ( = ?auto_663126 ?auto_663134 ) ) ( not ( = ?auto_663126 ?auto_663135 ) ) ( not ( = ?auto_663126 ?auto_663136 ) ) ( not ( = ?auto_663126 ?auto_663137 ) ) ( not ( = ?auto_663126 ?auto_663138 ) ) ( not ( = ?auto_663127 ?auto_663128 ) ) ( not ( = ?auto_663127 ?auto_663129 ) ) ( not ( = ?auto_663127 ?auto_663130 ) ) ( not ( = ?auto_663127 ?auto_663131 ) ) ( not ( = ?auto_663127 ?auto_663132 ) ) ( not ( = ?auto_663127 ?auto_663133 ) ) ( not ( = ?auto_663127 ?auto_663134 ) ) ( not ( = ?auto_663127 ?auto_663135 ) ) ( not ( = ?auto_663127 ?auto_663136 ) ) ( not ( = ?auto_663127 ?auto_663137 ) ) ( not ( = ?auto_663127 ?auto_663138 ) ) ( not ( = ?auto_663128 ?auto_663129 ) ) ( not ( = ?auto_663128 ?auto_663130 ) ) ( not ( = ?auto_663128 ?auto_663131 ) ) ( not ( = ?auto_663128 ?auto_663132 ) ) ( not ( = ?auto_663128 ?auto_663133 ) ) ( not ( = ?auto_663128 ?auto_663134 ) ) ( not ( = ?auto_663128 ?auto_663135 ) ) ( not ( = ?auto_663128 ?auto_663136 ) ) ( not ( = ?auto_663128 ?auto_663137 ) ) ( not ( = ?auto_663128 ?auto_663138 ) ) ( not ( = ?auto_663129 ?auto_663130 ) ) ( not ( = ?auto_663129 ?auto_663131 ) ) ( not ( = ?auto_663129 ?auto_663132 ) ) ( not ( = ?auto_663129 ?auto_663133 ) ) ( not ( = ?auto_663129 ?auto_663134 ) ) ( not ( = ?auto_663129 ?auto_663135 ) ) ( not ( = ?auto_663129 ?auto_663136 ) ) ( not ( = ?auto_663129 ?auto_663137 ) ) ( not ( = ?auto_663129 ?auto_663138 ) ) ( not ( = ?auto_663130 ?auto_663131 ) ) ( not ( = ?auto_663130 ?auto_663132 ) ) ( not ( = ?auto_663130 ?auto_663133 ) ) ( not ( = ?auto_663130 ?auto_663134 ) ) ( not ( = ?auto_663130 ?auto_663135 ) ) ( not ( = ?auto_663130 ?auto_663136 ) ) ( not ( = ?auto_663130 ?auto_663137 ) ) ( not ( = ?auto_663130 ?auto_663138 ) ) ( not ( = ?auto_663131 ?auto_663132 ) ) ( not ( = ?auto_663131 ?auto_663133 ) ) ( not ( = ?auto_663131 ?auto_663134 ) ) ( not ( = ?auto_663131 ?auto_663135 ) ) ( not ( = ?auto_663131 ?auto_663136 ) ) ( not ( = ?auto_663131 ?auto_663137 ) ) ( not ( = ?auto_663131 ?auto_663138 ) ) ( not ( = ?auto_663132 ?auto_663133 ) ) ( not ( = ?auto_663132 ?auto_663134 ) ) ( not ( = ?auto_663132 ?auto_663135 ) ) ( not ( = ?auto_663132 ?auto_663136 ) ) ( not ( = ?auto_663132 ?auto_663137 ) ) ( not ( = ?auto_663132 ?auto_663138 ) ) ( not ( = ?auto_663133 ?auto_663134 ) ) ( not ( = ?auto_663133 ?auto_663135 ) ) ( not ( = ?auto_663133 ?auto_663136 ) ) ( not ( = ?auto_663133 ?auto_663137 ) ) ( not ( = ?auto_663133 ?auto_663138 ) ) ( not ( = ?auto_663134 ?auto_663135 ) ) ( not ( = ?auto_663134 ?auto_663136 ) ) ( not ( = ?auto_663134 ?auto_663137 ) ) ( not ( = ?auto_663134 ?auto_663138 ) ) ( not ( = ?auto_663135 ?auto_663136 ) ) ( not ( = ?auto_663135 ?auto_663137 ) ) ( not ( = ?auto_663135 ?auto_663138 ) ) ( not ( = ?auto_663136 ?auto_663137 ) ) ( not ( = ?auto_663136 ?auto_663138 ) ) ( not ( = ?auto_663137 ?auto_663138 ) ) ( ON ?auto_663136 ?auto_663137 ) ( ON ?auto_663135 ?auto_663136 ) ( ON ?auto_663134 ?auto_663135 ) ( ON ?auto_663133 ?auto_663134 ) ( CLEAR ?auto_663131 ) ( ON ?auto_663132 ?auto_663133 ) ( CLEAR ?auto_663132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_663122 ?auto_663123 ?auto_663124 ?auto_663125 ?auto_663126 ?auto_663127 ?auto_663128 ?auto_663129 ?auto_663130 ?auto_663131 ?auto_663132 )
      ( MAKE-16PILE ?auto_663122 ?auto_663123 ?auto_663124 ?auto_663125 ?auto_663126 ?auto_663127 ?auto_663128 ?auto_663129 ?auto_663130 ?auto_663131 ?auto_663132 ?auto_663133 ?auto_663134 ?auto_663135 ?auto_663136 ?auto_663137 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_663188 - BLOCK
      ?auto_663189 - BLOCK
      ?auto_663190 - BLOCK
      ?auto_663191 - BLOCK
      ?auto_663192 - BLOCK
      ?auto_663193 - BLOCK
      ?auto_663194 - BLOCK
      ?auto_663195 - BLOCK
      ?auto_663196 - BLOCK
      ?auto_663197 - BLOCK
      ?auto_663198 - BLOCK
      ?auto_663199 - BLOCK
      ?auto_663200 - BLOCK
      ?auto_663201 - BLOCK
      ?auto_663202 - BLOCK
      ?auto_663203 - BLOCK
    )
    :vars
    (
      ?auto_663204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_663203 ?auto_663204 ) ( ON-TABLE ?auto_663188 ) ( ON ?auto_663189 ?auto_663188 ) ( ON ?auto_663190 ?auto_663189 ) ( ON ?auto_663191 ?auto_663190 ) ( ON ?auto_663192 ?auto_663191 ) ( ON ?auto_663193 ?auto_663192 ) ( ON ?auto_663194 ?auto_663193 ) ( ON ?auto_663195 ?auto_663194 ) ( ON ?auto_663196 ?auto_663195 ) ( not ( = ?auto_663188 ?auto_663189 ) ) ( not ( = ?auto_663188 ?auto_663190 ) ) ( not ( = ?auto_663188 ?auto_663191 ) ) ( not ( = ?auto_663188 ?auto_663192 ) ) ( not ( = ?auto_663188 ?auto_663193 ) ) ( not ( = ?auto_663188 ?auto_663194 ) ) ( not ( = ?auto_663188 ?auto_663195 ) ) ( not ( = ?auto_663188 ?auto_663196 ) ) ( not ( = ?auto_663188 ?auto_663197 ) ) ( not ( = ?auto_663188 ?auto_663198 ) ) ( not ( = ?auto_663188 ?auto_663199 ) ) ( not ( = ?auto_663188 ?auto_663200 ) ) ( not ( = ?auto_663188 ?auto_663201 ) ) ( not ( = ?auto_663188 ?auto_663202 ) ) ( not ( = ?auto_663188 ?auto_663203 ) ) ( not ( = ?auto_663188 ?auto_663204 ) ) ( not ( = ?auto_663189 ?auto_663190 ) ) ( not ( = ?auto_663189 ?auto_663191 ) ) ( not ( = ?auto_663189 ?auto_663192 ) ) ( not ( = ?auto_663189 ?auto_663193 ) ) ( not ( = ?auto_663189 ?auto_663194 ) ) ( not ( = ?auto_663189 ?auto_663195 ) ) ( not ( = ?auto_663189 ?auto_663196 ) ) ( not ( = ?auto_663189 ?auto_663197 ) ) ( not ( = ?auto_663189 ?auto_663198 ) ) ( not ( = ?auto_663189 ?auto_663199 ) ) ( not ( = ?auto_663189 ?auto_663200 ) ) ( not ( = ?auto_663189 ?auto_663201 ) ) ( not ( = ?auto_663189 ?auto_663202 ) ) ( not ( = ?auto_663189 ?auto_663203 ) ) ( not ( = ?auto_663189 ?auto_663204 ) ) ( not ( = ?auto_663190 ?auto_663191 ) ) ( not ( = ?auto_663190 ?auto_663192 ) ) ( not ( = ?auto_663190 ?auto_663193 ) ) ( not ( = ?auto_663190 ?auto_663194 ) ) ( not ( = ?auto_663190 ?auto_663195 ) ) ( not ( = ?auto_663190 ?auto_663196 ) ) ( not ( = ?auto_663190 ?auto_663197 ) ) ( not ( = ?auto_663190 ?auto_663198 ) ) ( not ( = ?auto_663190 ?auto_663199 ) ) ( not ( = ?auto_663190 ?auto_663200 ) ) ( not ( = ?auto_663190 ?auto_663201 ) ) ( not ( = ?auto_663190 ?auto_663202 ) ) ( not ( = ?auto_663190 ?auto_663203 ) ) ( not ( = ?auto_663190 ?auto_663204 ) ) ( not ( = ?auto_663191 ?auto_663192 ) ) ( not ( = ?auto_663191 ?auto_663193 ) ) ( not ( = ?auto_663191 ?auto_663194 ) ) ( not ( = ?auto_663191 ?auto_663195 ) ) ( not ( = ?auto_663191 ?auto_663196 ) ) ( not ( = ?auto_663191 ?auto_663197 ) ) ( not ( = ?auto_663191 ?auto_663198 ) ) ( not ( = ?auto_663191 ?auto_663199 ) ) ( not ( = ?auto_663191 ?auto_663200 ) ) ( not ( = ?auto_663191 ?auto_663201 ) ) ( not ( = ?auto_663191 ?auto_663202 ) ) ( not ( = ?auto_663191 ?auto_663203 ) ) ( not ( = ?auto_663191 ?auto_663204 ) ) ( not ( = ?auto_663192 ?auto_663193 ) ) ( not ( = ?auto_663192 ?auto_663194 ) ) ( not ( = ?auto_663192 ?auto_663195 ) ) ( not ( = ?auto_663192 ?auto_663196 ) ) ( not ( = ?auto_663192 ?auto_663197 ) ) ( not ( = ?auto_663192 ?auto_663198 ) ) ( not ( = ?auto_663192 ?auto_663199 ) ) ( not ( = ?auto_663192 ?auto_663200 ) ) ( not ( = ?auto_663192 ?auto_663201 ) ) ( not ( = ?auto_663192 ?auto_663202 ) ) ( not ( = ?auto_663192 ?auto_663203 ) ) ( not ( = ?auto_663192 ?auto_663204 ) ) ( not ( = ?auto_663193 ?auto_663194 ) ) ( not ( = ?auto_663193 ?auto_663195 ) ) ( not ( = ?auto_663193 ?auto_663196 ) ) ( not ( = ?auto_663193 ?auto_663197 ) ) ( not ( = ?auto_663193 ?auto_663198 ) ) ( not ( = ?auto_663193 ?auto_663199 ) ) ( not ( = ?auto_663193 ?auto_663200 ) ) ( not ( = ?auto_663193 ?auto_663201 ) ) ( not ( = ?auto_663193 ?auto_663202 ) ) ( not ( = ?auto_663193 ?auto_663203 ) ) ( not ( = ?auto_663193 ?auto_663204 ) ) ( not ( = ?auto_663194 ?auto_663195 ) ) ( not ( = ?auto_663194 ?auto_663196 ) ) ( not ( = ?auto_663194 ?auto_663197 ) ) ( not ( = ?auto_663194 ?auto_663198 ) ) ( not ( = ?auto_663194 ?auto_663199 ) ) ( not ( = ?auto_663194 ?auto_663200 ) ) ( not ( = ?auto_663194 ?auto_663201 ) ) ( not ( = ?auto_663194 ?auto_663202 ) ) ( not ( = ?auto_663194 ?auto_663203 ) ) ( not ( = ?auto_663194 ?auto_663204 ) ) ( not ( = ?auto_663195 ?auto_663196 ) ) ( not ( = ?auto_663195 ?auto_663197 ) ) ( not ( = ?auto_663195 ?auto_663198 ) ) ( not ( = ?auto_663195 ?auto_663199 ) ) ( not ( = ?auto_663195 ?auto_663200 ) ) ( not ( = ?auto_663195 ?auto_663201 ) ) ( not ( = ?auto_663195 ?auto_663202 ) ) ( not ( = ?auto_663195 ?auto_663203 ) ) ( not ( = ?auto_663195 ?auto_663204 ) ) ( not ( = ?auto_663196 ?auto_663197 ) ) ( not ( = ?auto_663196 ?auto_663198 ) ) ( not ( = ?auto_663196 ?auto_663199 ) ) ( not ( = ?auto_663196 ?auto_663200 ) ) ( not ( = ?auto_663196 ?auto_663201 ) ) ( not ( = ?auto_663196 ?auto_663202 ) ) ( not ( = ?auto_663196 ?auto_663203 ) ) ( not ( = ?auto_663196 ?auto_663204 ) ) ( not ( = ?auto_663197 ?auto_663198 ) ) ( not ( = ?auto_663197 ?auto_663199 ) ) ( not ( = ?auto_663197 ?auto_663200 ) ) ( not ( = ?auto_663197 ?auto_663201 ) ) ( not ( = ?auto_663197 ?auto_663202 ) ) ( not ( = ?auto_663197 ?auto_663203 ) ) ( not ( = ?auto_663197 ?auto_663204 ) ) ( not ( = ?auto_663198 ?auto_663199 ) ) ( not ( = ?auto_663198 ?auto_663200 ) ) ( not ( = ?auto_663198 ?auto_663201 ) ) ( not ( = ?auto_663198 ?auto_663202 ) ) ( not ( = ?auto_663198 ?auto_663203 ) ) ( not ( = ?auto_663198 ?auto_663204 ) ) ( not ( = ?auto_663199 ?auto_663200 ) ) ( not ( = ?auto_663199 ?auto_663201 ) ) ( not ( = ?auto_663199 ?auto_663202 ) ) ( not ( = ?auto_663199 ?auto_663203 ) ) ( not ( = ?auto_663199 ?auto_663204 ) ) ( not ( = ?auto_663200 ?auto_663201 ) ) ( not ( = ?auto_663200 ?auto_663202 ) ) ( not ( = ?auto_663200 ?auto_663203 ) ) ( not ( = ?auto_663200 ?auto_663204 ) ) ( not ( = ?auto_663201 ?auto_663202 ) ) ( not ( = ?auto_663201 ?auto_663203 ) ) ( not ( = ?auto_663201 ?auto_663204 ) ) ( not ( = ?auto_663202 ?auto_663203 ) ) ( not ( = ?auto_663202 ?auto_663204 ) ) ( not ( = ?auto_663203 ?auto_663204 ) ) ( ON ?auto_663202 ?auto_663203 ) ( ON ?auto_663201 ?auto_663202 ) ( ON ?auto_663200 ?auto_663201 ) ( ON ?auto_663199 ?auto_663200 ) ( ON ?auto_663198 ?auto_663199 ) ( CLEAR ?auto_663196 ) ( ON ?auto_663197 ?auto_663198 ) ( CLEAR ?auto_663197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_663188 ?auto_663189 ?auto_663190 ?auto_663191 ?auto_663192 ?auto_663193 ?auto_663194 ?auto_663195 ?auto_663196 ?auto_663197 )
      ( MAKE-16PILE ?auto_663188 ?auto_663189 ?auto_663190 ?auto_663191 ?auto_663192 ?auto_663193 ?auto_663194 ?auto_663195 ?auto_663196 ?auto_663197 ?auto_663198 ?auto_663199 ?auto_663200 ?auto_663201 ?auto_663202 ?auto_663203 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_663254 - BLOCK
      ?auto_663255 - BLOCK
      ?auto_663256 - BLOCK
      ?auto_663257 - BLOCK
      ?auto_663258 - BLOCK
      ?auto_663259 - BLOCK
      ?auto_663260 - BLOCK
      ?auto_663261 - BLOCK
      ?auto_663262 - BLOCK
      ?auto_663263 - BLOCK
      ?auto_663264 - BLOCK
      ?auto_663265 - BLOCK
      ?auto_663266 - BLOCK
      ?auto_663267 - BLOCK
      ?auto_663268 - BLOCK
      ?auto_663269 - BLOCK
    )
    :vars
    (
      ?auto_663270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_663269 ?auto_663270 ) ( ON-TABLE ?auto_663254 ) ( ON ?auto_663255 ?auto_663254 ) ( ON ?auto_663256 ?auto_663255 ) ( ON ?auto_663257 ?auto_663256 ) ( ON ?auto_663258 ?auto_663257 ) ( ON ?auto_663259 ?auto_663258 ) ( ON ?auto_663260 ?auto_663259 ) ( ON ?auto_663261 ?auto_663260 ) ( not ( = ?auto_663254 ?auto_663255 ) ) ( not ( = ?auto_663254 ?auto_663256 ) ) ( not ( = ?auto_663254 ?auto_663257 ) ) ( not ( = ?auto_663254 ?auto_663258 ) ) ( not ( = ?auto_663254 ?auto_663259 ) ) ( not ( = ?auto_663254 ?auto_663260 ) ) ( not ( = ?auto_663254 ?auto_663261 ) ) ( not ( = ?auto_663254 ?auto_663262 ) ) ( not ( = ?auto_663254 ?auto_663263 ) ) ( not ( = ?auto_663254 ?auto_663264 ) ) ( not ( = ?auto_663254 ?auto_663265 ) ) ( not ( = ?auto_663254 ?auto_663266 ) ) ( not ( = ?auto_663254 ?auto_663267 ) ) ( not ( = ?auto_663254 ?auto_663268 ) ) ( not ( = ?auto_663254 ?auto_663269 ) ) ( not ( = ?auto_663254 ?auto_663270 ) ) ( not ( = ?auto_663255 ?auto_663256 ) ) ( not ( = ?auto_663255 ?auto_663257 ) ) ( not ( = ?auto_663255 ?auto_663258 ) ) ( not ( = ?auto_663255 ?auto_663259 ) ) ( not ( = ?auto_663255 ?auto_663260 ) ) ( not ( = ?auto_663255 ?auto_663261 ) ) ( not ( = ?auto_663255 ?auto_663262 ) ) ( not ( = ?auto_663255 ?auto_663263 ) ) ( not ( = ?auto_663255 ?auto_663264 ) ) ( not ( = ?auto_663255 ?auto_663265 ) ) ( not ( = ?auto_663255 ?auto_663266 ) ) ( not ( = ?auto_663255 ?auto_663267 ) ) ( not ( = ?auto_663255 ?auto_663268 ) ) ( not ( = ?auto_663255 ?auto_663269 ) ) ( not ( = ?auto_663255 ?auto_663270 ) ) ( not ( = ?auto_663256 ?auto_663257 ) ) ( not ( = ?auto_663256 ?auto_663258 ) ) ( not ( = ?auto_663256 ?auto_663259 ) ) ( not ( = ?auto_663256 ?auto_663260 ) ) ( not ( = ?auto_663256 ?auto_663261 ) ) ( not ( = ?auto_663256 ?auto_663262 ) ) ( not ( = ?auto_663256 ?auto_663263 ) ) ( not ( = ?auto_663256 ?auto_663264 ) ) ( not ( = ?auto_663256 ?auto_663265 ) ) ( not ( = ?auto_663256 ?auto_663266 ) ) ( not ( = ?auto_663256 ?auto_663267 ) ) ( not ( = ?auto_663256 ?auto_663268 ) ) ( not ( = ?auto_663256 ?auto_663269 ) ) ( not ( = ?auto_663256 ?auto_663270 ) ) ( not ( = ?auto_663257 ?auto_663258 ) ) ( not ( = ?auto_663257 ?auto_663259 ) ) ( not ( = ?auto_663257 ?auto_663260 ) ) ( not ( = ?auto_663257 ?auto_663261 ) ) ( not ( = ?auto_663257 ?auto_663262 ) ) ( not ( = ?auto_663257 ?auto_663263 ) ) ( not ( = ?auto_663257 ?auto_663264 ) ) ( not ( = ?auto_663257 ?auto_663265 ) ) ( not ( = ?auto_663257 ?auto_663266 ) ) ( not ( = ?auto_663257 ?auto_663267 ) ) ( not ( = ?auto_663257 ?auto_663268 ) ) ( not ( = ?auto_663257 ?auto_663269 ) ) ( not ( = ?auto_663257 ?auto_663270 ) ) ( not ( = ?auto_663258 ?auto_663259 ) ) ( not ( = ?auto_663258 ?auto_663260 ) ) ( not ( = ?auto_663258 ?auto_663261 ) ) ( not ( = ?auto_663258 ?auto_663262 ) ) ( not ( = ?auto_663258 ?auto_663263 ) ) ( not ( = ?auto_663258 ?auto_663264 ) ) ( not ( = ?auto_663258 ?auto_663265 ) ) ( not ( = ?auto_663258 ?auto_663266 ) ) ( not ( = ?auto_663258 ?auto_663267 ) ) ( not ( = ?auto_663258 ?auto_663268 ) ) ( not ( = ?auto_663258 ?auto_663269 ) ) ( not ( = ?auto_663258 ?auto_663270 ) ) ( not ( = ?auto_663259 ?auto_663260 ) ) ( not ( = ?auto_663259 ?auto_663261 ) ) ( not ( = ?auto_663259 ?auto_663262 ) ) ( not ( = ?auto_663259 ?auto_663263 ) ) ( not ( = ?auto_663259 ?auto_663264 ) ) ( not ( = ?auto_663259 ?auto_663265 ) ) ( not ( = ?auto_663259 ?auto_663266 ) ) ( not ( = ?auto_663259 ?auto_663267 ) ) ( not ( = ?auto_663259 ?auto_663268 ) ) ( not ( = ?auto_663259 ?auto_663269 ) ) ( not ( = ?auto_663259 ?auto_663270 ) ) ( not ( = ?auto_663260 ?auto_663261 ) ) ( not ( = ?auto_663260 ?auto_663262 ) ) ( not ( = ?auto_663260 ?auto_663263 ) ) ( not ( = ?auto_663260 ?auto_663264 ) ) ( not ( = ?auto_663260 ?auto_663265 ) ) ( not ( = ?auto_663260 ?auto_663266 ) ) ( not ( = ?auto_663260 ?auto_663267 ) ) ( not ( = ?auto_663260 ?auto_663268 ) ) ( not ( = ?auto_663260 ?auto_663269 ) ) ( not ( = ?auto_663260 ?auto_663270 ) ) ( not ( = ?auto_663261 ?auto_663262 ) ) ( not ( = ?auto_663261 ?auto_663263 ) ) ( not ( = ?auto_663261 ?auto_663264 ) ) ( not ( = ?auto_663261 ?auto_663265 ) ) ( not ( = ?auto_663261 ?auto_663266 ) ) ( not ( = ?auto_663261 ?auto_663267 ) ) ( not ( = ?auto_663261 ?auto_663268 ) ) ( not ( = ?auto_663261 ?auto_663269 ) ) ( not ( = ?auto_663261 ?auto_663270 ) ) ( not ( = ?auto_663262 ?auto_663263 ) ) ( not ( = ?auto_663262 ?auto_663264 ) ) ( not ( = ?auto_663262 ?auto_663265 ) ) ( not ( = ?auto_663262 ?auto_663266 ) ) ( not ( = ?auto_663262 ?auto_663267 ) ) ( not ( = ?auto_663262 ?auto_663268 ) ) ( not ( = ?auto_663262 ?auto_663269 ) ) ( not ( = ?auto_663262 ?auto_663270 ) ) ( not ( = ?auto_663263 ?auto_663264 ) ) ( not ( = ?auto_663263 ?auto_663265 ) ) ( not ( = ?auto_663263 ?auto_663266 ) ) ( not ( = ?auto_663263 ?auto_663267 ) ) ( not ( = ?auto_663263 ?auto_663268 ) ) ( not ( = ?auto_663263 ?auto_663269 ) ) ( not ( = ?auto_663263 ?auto_663270 ) ) ( not ( = ?auto_663264 ?auto_663265 ) ) ( not ( = ?auto_663264 ?auto_663266 ) ) ( not ( = ?auto_663264 ?auto_663267 ) ) ( not ( = ?auto_663264 ?auto_663268 ) ) ( not ( = ?auto_663264 ?auto_663269 ) ) ( not ( = ?auto_663264 ?auto_663270 ) ) ( not ( = ?auto_663265 ?auto_663266 ) ) ( not ( = ?auto_663265 ?auto_663267 ) ) ( not ( = ?auto_663265 ?auto_663268 ) ) ( not ( = ?auto_663265 ?auto_663269 ) ) ( not ( = ?auto_663265 ?auto_663270 ) ) ( not ( = ?auto_663266 ?auto_663267 ) ) ( not ( = ?auto_663266 ?auto_663268 ) ) ( not ( = ?auto_663266 ?auto_663269 ) ) ( not ( = ?auto_663266 ?auto_663270 ) ) ( not ( = ?auto_663267 ?auto_663268 ) ) ( not ( = ?auto_663267 ?auto_663269 ) ) ( not ( = ?auto_663267 ?auto_663270 ) ) ( not ( = ?auto_663268 ?auto_663269 ) ) ( not ( = ?auto_663268 ?auto_663270 ) ) ( not ( = ?auto_663269 ?auto_663270 ) ) ( ON ?auto_663268 ?auto_663269 ) ( ON ?auto_663267 ?auto_663268 ) ( ON ?auto_663266 ?auto_663267 ) ( ON ?auto_663265 ?auto_663266 ) ( ON ?auto_663264 ?auto_663265 ) ( ON ?auto_663263 ?auto_663264 ) ( CLEAR ?auto_663261 ) ( ON ?auto_663262 ?auto_663263 ) ( CLEAR ?auto_663262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_663254 ?auto_663255 ?auto_663256 ?auto_663257 ?auto_663258 ?auto_663259 ?auto_663260 ?auto_663261 ?auto_663262 )
      ( MAKE-16PILE ?auto_663254 ?auto_663255 ?auto_663256 ?auto_663257 ?auto_663258 ?auto_663259 ?auto_663260 ?auto_663261 ?auto_663262 ?auto_663263 ?auto_663264 ?auto_663265 ?auto_663266 ?auto_663267 ?auto_663268 ?auto_663269 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_663320 - BLOCK
      ?auto_663321 - BLOCK
      ?auto_663322 - BLOCK
      ?auto_663323 - BLOCK
      ?auto_663324 - BLOCK
      ?auto_663325 - BLOCK
      ?auto_663326 - BLOCK
      ?auto_663327 - BLOCK
      ?auto_663328 - BLOCK
      ?auto_663329 - BLOCK
      ?auto_663330 - BLOCK
      ?auto_663331 - BLOCK
      ?auto_663332 - BLOCK
      ?auto_663333 - BLOCK
      ?auto_663334 - BLOCK
      ?auto_663335 - BLOCK
    )
    :vars
    (
      ?auto_663336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_663335 ?auto_663336 ) ( ON-TABLE ?auto_663320 ) ( ON ?auto_663321 ?auto_663320 ) ( ON ?auto_663322 ?auto_663321 ) ( ON ?auto_663323 ?auto_663322 ) ( ON ?auto_663324 ?auto_663323 ) ( ON ?auto_663325 ?auto_663324 ) ( ON ?auto_663326 ?auto_663325 ) ( not ( = ?auto_663320 ?auto_663321 ) ) ( not ( = ?auto_663320 ?auto_663322 ) ) ( not ( = ?auto_663320 ?auto_663323 ) ) ( not ( = ?auto_663320 ?auto_663324 ) ) ( not ( = ?auto_663320 ?auto_663325 ) ) ( not ( = ?auto_663320 ?auto_663326 ) ) ( not ( = ?auto_663320 ?auto_663327 ) ) ( not ( = ?auto_663320 ?auto_663328 ) ) ( not ( = ?auto_663320 ?auto_663329 ) ) ( not ( = ?auto_663320 ?auto_663330 ) ) ( not ( = ?auto_663320 ?auto_663331 ) ) ( not ( = ?auto_663320 ?auto_663332 ) ) ( not ( = ?auto_663320 ?auto_663333 ) ) ( not ( = ?auto_663320 ?auto_663334 ) ) ( not ( = ?auto_663320 ?auto_663335 ) ) ( not ( = ?auto_663320 ?auto_663336 ) ) ( not ( = ?auto_663321 ?auto_663322 ) ) ( not ( = ?auto_663321 ?auto_663323 ) ) ( not ( = ?auto_663321 ?auto_663324 ) ) ( not ( = ?auto_663321 ?auto_663325 ) ) ( not ( = ?auto_663321 ?auto_663326 ) ) ( not ( = ?auto_663321 ?auto_663327 ) ) ( not ( = ?auto_663321 ?auto_663328 ) ) ( not ( = ?auto_663321 ?auto_663329 ) ) ( not ( = ?auto_663321 ?auto_663330 ) ) ( not ( = ?auto_663321 ?auto_663331 ) ) ( not ( = ?auto_663321 ?auto_663332 ) ) ( not ( = ?auto_663321 ?auto_663333 ) ) ( not ( = ?auto_663321 ?auto_663334 ) ) ( not ( = ?auto_663321 ?auto_663335 ) ) ( not ( = ?auto_663321 ?auto_663336 ) ) ( not ( = ?auto_663322 ?auto_663323 ) ) ( not ( = ?auto_663322 ?auto_663324 ) ) ( not ( = ?auto_663322 ?auto_663325 ) ) ( not ( = ?auto_663322 ?auto_663326 ) ) ( not ( = ?auto_663322 ?auto_663327 ) ) ( not ( = ?auto_663322 ?auto_663328 ) ) ( not ( = ?auto_663322 ?auto_663329 ) ) ( not ( = ?auto_663322 ?auto_663330 ) ) ( not ( = ?auto_663322 ?auto_663331 ) ) ( not ( = ?auto_663322 ?auto_663332 ) ) ( not ( = ?auto_663322 ?auto_663333 ) ) ( not ( = ?auto_663322 ?auto_663334 ) ) ( not ( = ?auto_663322 ?auto_663335 ) ) ( not ( = ?auto_663322 ?auto_663336 ) ) ( not ( = ?auto_663323 ?auto_663324 ) ) ( not ( = ?auto_663323 ?auto_663325 ) ) ( not ( = ?auto_663323 ?auto_663326 ) ) ( not ( = ?auto_663323 ?auto_663327 ) ) ( not ( = ?auto_663323 ?auto_663328 ) ) ( not ( = ?auto_663323 ?auto_663329 ) ) ( not ( = ?auto_663323 ?auto_663330 ) ) ( not ( = ?auto_663323 ?auto_663331 ) ) ( not ( = ?auto_663323 ?auto_663332 ) ) ( not ( = ?auto_663323 ?auto_663333 ) ) ( not ( = ?auto_663323 ?auto_663334 ) ) ( not ( = ?auto_663323 ?auto_663335 ) ) ( not ( = ?auto_663323 ?auto_663336 ) ) ( not ( = ?auto_663324 ?auto_663325 ) ) ( not ( = ?auto_663324 ?auto_663326 ) ) ( not ( = ?auto_663324 ?auto_663327 ) ) ( not ( = ?auto_663324 ?auto_663328 ) ) ( not ( = ?auto_663324 ?auto_663329 ) ) ( not ( = ?auto_663324 ?auto_663330 ) ) ( not ( = ?auto_663324 ?auto_663331 ) ) ( not ( = ?auto_663324 ?auto_663332 ) ) ( not ( = ?auto_663324 ?auto_663333 ) ) ( not ( = ?auto_663324 ?auto_663334 ) ) ( not ( = ?auto_663324 ?auto_663335 ) ) ( not ( = ?auto_663324 ?auto_663336 ) ) ( not ( = ?auto_663325 ?auto_663326 ) ) ( not ( = ?auto_663325 ?auto_663327 ) ) ( not ( = ?auto_663325 ?auto_663328 ) ) ( not ( = ?auto_663325 ?auto_663329 ) ) ( not ( = ?auto_663325 ?auto_663330 ) ) ( not ( = ?auto_663325 ?auto_663331 ) ) ( not ( = ?auto_663325 ?auto_663332 ) ) ( not ( = ?auto_663325 ?auto_663333 ) ) ( not ( = ?auto_663325 ?auto_663334 ) ) ( not ( = ?auto_663325 ?auto_663335 ) ) ( not ( = ?auto_663325 ?auto_663336 ) ) ( not ( = ?auto_663326 ?auto_663327 ) ) ( not ( = ?auto_663326 ?auto_663328 ) ) ( not ( = ?auto_663326 ?auto_663329 ) ) ( not ( = ?auto_663326 ?auto_663330 ) ) ( not ( = ?auto_663326 ?auto_663331 ) ) ( not ( = ?auto_663326 ?auto_663332 ) ) ( not ( = ?auto_663326 ?auto_663333 ) ) ( not ( = ?auto_663326 ?auto_663334 ) ) ( not ( = ?auto_663326 ?auto_663335 ) ) ( not ( = ?auto_663326 ?auto_663336 ) ) ( not ( = ?auto_663327 ?auto_663328 ) ) ( not ( = ?auto_663327 ?auto_663329 ) ) ( not ( = ?auto_663327 ?auto_663330 ) ) ( not ( = ?auto_663327 ?auto_663331 ) ) ( not ( = ?auto_663327 ?auto_663332 ) ) ( not ( = ?auto_663327 ?auto_663333 ) ) ( not ( = ?auto_663327 ?auto_663334 ) ) ( not ( = ?auto_663327 ?auto_663335 ) ) ( not ( = ?auto_663327 ?auto_663336 ) ) ( not ( = ?auto_663328 ?auto_663329 ) ) ( not ( = ?auto_663328 ?auto_663330 ) ) ( not ( = ?auto_663328 ?auto_663331 ) ) ( not ( = ?auto_663328 ?auto_663332 ) ) ( not ( = ?auto_663328 ?auto_663333 ) ) ( not ( = ?auto_663328 ?auto_663334 ) ) ( not ( = ?auto_663328 ?auto_663335 ) ) ( not ( = ?auto_663328 ?auto_663336 ) ) ( not ( = ?auto_663329 ?auto_663330 ) ) ( not ( = ?auto_663329 ?auto_663331 ) ) ( not ( = ?auto_663329 ?auto_663332 ) ) ( not ( = ?auto_663329 ?auto_663333 ) ) ( not ( = ?auto_663329 ?auto_663334 ) ) ( not ( = ?auto_663329 ?auto_663335 ) ) ( not ( = ?auto_663329 ?auto_663336 ) ) ( not ( = ?auto_663330 ?auto_663331 ) ) ( not ( = ?auto_663330 ?auto_663332 ) ) ( not ( = ?auto_663330 ?auto_663333 ) ) ( not ( = ?auto_663330 ?auto_663334 ) ) ( not ( = ?auto_663330 ?auto_663335 ) ) ( not ( = ?auto_663330 ?auto_663336 ) ) ( not ( = ?auto_663331 ?auto_663332 ) ) ( not ( = ?auto_663331 ?auto_663333 ) ) ( not ( = ?auto_663331 ?auto_663334 ) ) ( not ( = ?auto_663331 ?auto_663335 ) ) ( not ( = ?auto_663331 ?auto_663336 ) ) ( not ( = ?auto_663332 ?auto_663333 ) ) ( not ( = ?auto_663332 ?auto_663334 ) ) ( not ( = ?auto_663332 ?auto_663335 ) ) ( not ( = ?auto_663332 ?auto_663336 ) ) ( not ( = ?auto_663333 ?auto_663334 ) ) ( not ( = ?auto_663333 ?auto_663335 ) ) ( not ( = ?auto_663333 ?auto_663336 ) ) ( not ( = ?auto_663334 ?auto_663335 ) ) ( not ( = ?auto_663334 ?auto_663336 ) ) ( not ( = ?auto_663335 ?auto_663336 ) ) ( ON ?auto_663334 ?auto_663335 ) ( ON ?auto_663333 ?auto_663334 ) ( ON ?auto_663332 ?auto_663333 ) ( ON ?auto_663331 ?auto_663332 ) ( ON ?auto_663330 ?auto_663331 ) ( ON ?auto_663329 ?auto_663330 ) ( ON ?auto_663328 ?auto_663329 ) ( CLEAR ?auto_663326 ) ( ON ?auto_663327 ?auto_663328 ) ( CLEAR ?auto_663327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_663320 ?auto_663321 ?auto_663322 ?auto_663323 ?auto_663324 ?auto_663325 ?auto_663326 ?auto_663327 )
      ( MAKE-16PILE ?auto_663320 ?auto_663321 ?auto_663322 ?auto_663323 ?auto_663324 ?auto_663325 ?auto_663326 ?auto_663327 ?auto_663328 ?auto_663329 ?auto_663330 ?auto_663331 ?auto_663332 ?auto_663333 ?auto_663334 ?auto_663335 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_663386 - BLOCK
      ?auto_663387 - BLOCK
      ?auto_663388 - BLOCK
      ?auto_663389 - BLOCK
      ?auto_663390 - BLOCK
      ?auto_663391 - BLOCK
      ?auto_663392 - BLOCK
      ?auto_663393 - BLOCK
      ?auto_663394 - BLOCK
      ?auto_663395 - BLOCK
      ?auto_663396 - BLOCK
      ?auto_663397 - BLOCK
      ?auto_663398 - BLOCK
      ?auto_663399 - BLOCK
      ?auto_663400 - BLOCK
      ?auto_663401 - BLOCK
    )
    :vars
    (
      ?auto_663402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_663401 ?auto_663402 ) ( ON-TABLE ?auto_663386 ) ( ON ?auto_663387 ?auto_663386 ) ( ON ?auto_663388 ?auto_663387 ) ( ON ?auto_663389 ?auto_663388 ) ( ON ?auto_663390 ?auto_663389 ) ( ON ?auto_663391 ?auto_663390 ) ( not ( = ?auto_663386 ?auto_663387 ) ) ( not ( = ?auto_663386 ?auto_663388 ) ) ( not ( = ?auto_663386 ?auto_663389 ) ) ( not ( = ?auto_663386 ?auto_663390 ) ) ( not ( = ?auto_663386 ?auto_663391 ) ) ( not ( = ?auto_663386 ?auto_663392 ) ) ( not ( = ?auto_663386 ?auto_663393 ) ) ( not ( = ?auto_663386 ?auto_663394 ) ) ( not ( = ?auto_663386 ?auto_663395 ) ) ( not ( = ?auto_663386 ?auto_663396 ) ) ( not ( = ?auto_663386 ?auto_663397 ) ) ( not ( = ?auto_663386 ?auto_663398 ) ) ( not ( = ?auto_663386 ?auto_663399 ) ) ( not ( = ?auto_663386 ?auto_663400 ) ) ( not ( = ?auto_663386 ?auto_663401 ) ) ( not ( = ?auto_663386 ?auto_663402 ) ) ( not ( = ?auto_663387 ?auto_663388 ) ) ( not ( = ?auto_663387 ?auto_663389 ) ) ( not ( = ?auto_663387 ?auto_663390 ) ) ( not ( = ?auto_663387 ?auto_663391 ) ) ( not ( = ?auto_663387 ?auto_663392 ) ) ( not ( = ?auto_663387 ?auto_663393 ) ) ( not ( = ?auto_663387 ?auto_663394 ) ) ( not ( = ?auto_663387 ?auto_663395 ) ) ( not ( = ?auto_663387 ?auto_663396 ) ) ( not ( = ?auto_663387 ?auto_663397 ) ) ( not ( = ?auto_663387 ?auto_663398 ) ) ( not ( = ?auto_663387 ?auto_663399 ) ) ( not ( = ?auto_663387 ?auto_663400 ) ) ( not ( = ?auto_663387 ?auto_663401 ) ) ( not ( = ?auto_663387 ?auto_663402 ) ) ( not ( = ?auto_663388 ?auto_663389 ) ) ( not ( = ?auto_663388 ?auto_663390 ) ) ( not ( = ?auto_663388 ?auto_663391 ) ) ( not ( = ?auto_663388 ?auto_663392 ) ) ( not ( = ?auto_663388 ?auto_663393 ) ) ( not ( = ?auto_663388 ?auto_663394 ) ) ( not ( = ?auto_663388 ?auto_663395 ) ) ( not ( = ?auto_663388 ?auto_663396 ) ) ( not ( = ?auto_663388 ?auto_663397 ) ) ( not ( = ?auto_663388 ?auto_663398 ) ) ( not ( = ?auto_663388 ?auto_663399 ) ) ( not ( = ?auto_663388 ?auto_663400 ) ) ( not ( = ?auto_663388 ?auto_663401 ) ) ( not ( = ?auto_663388 ?auto_663402 ) ) ( not ( = ?auto_663389 ?auto_663390 ) ) ( not ( = ?auto_663389 ?auto_663391 ) ) ( not ( = ?auto_663389 ?auto_663392 ) ) ( not ( = ?auto_663389 ?auto_663393 ) ) ( not ( = ?auto_663389 ?auto_663394 ) ) ( not ( = ?auto_663389 ?auto_663395 ) ) ( not ( = ?auto_663389 ?auto_663396 ) ) ( not ( = ?auto_663389 ?auto_663397 ) ) ( not ( = ?auto_663389 ?auto_663398 ) ) ( not ( = ?auto_663389 ?auto_663399 ) ) ( not ( = ?auto_663389 ?auto_663400 ) ) ( not ( = ?auto_663389 ?auto_663401 ) ) ( not ( = ?auto_663389 ?auto_663402 ) ) ( not ( = ?auto_663390 ?auto_663391 ) ) ( not ( = ?auto_663390 ?auto_663392 ) ) ( not ( = ?auto_663390 ?auto_663393 ) ) ( not ( = ?auto_663390 ?auto_663394 ) ) ( not ( = ?auto_663390 ?auto_663395 ) ) ( not ( = ?auto_663390 ?auto_663396 ) ) ( not ( = ?auto_663390 ?auto_663397 ) ) ( not ( = ?auto_663390 ?auto_663398 ) ) ( not ( = ?auto_663390 ?auto_663399 ) ) ( not ( = ?auto_663390 ?auto_663400 ) ) ( not ( = ?auto_663390 ?auto_663401 ) ) ( not ( = ?auto_663390 ?auto_663402 ) ) ( not ( = ?auto_663391 ?auto_663392 ) ) ( not ( = ?auto_663391 ?auto_663393 ) ) ( not ( = ?auto_663391 ?auto_663394 ) ) ( not ( = ?auto_663391 ?auto_663395 ) ) ( not ( = ?auto_663391 ?auto_663396 ) ) ( not ( = ?auto_663391 ?auto_663397 ) ) ( not ( = ?auto_663391 ?auto_663398 ) ) ( not ( = ?auto_663391 ?auto_663399 ) ) ( not ( = ?auto_663391 ?auto_663400 ) ) ( not ( = ?auto_663391 ?auto_663401 ) ) ( not ( = ?auto_663391 ?auto_663402 ) ) ( not ( = ?auto_663392 ?auto_663393 ) ) ( not ( = ?auto_663392 ?auto_663394 ) ) ( not ( = ?auto_663392 ?auto_663395 ) ) ( not ( = ?auto_663392 ?auto_663396 ) ) ( not ( = ?auto_663392 ?auto_663397 ) ) ( not ( = ?auto_663392 ?auto_663398 ) ) ( not ( = ?auto_663392 ?auto_663399 ) ) ( not ( = ?auto_663392 ?auto_663400 ) ) ( not ( = ?auto_663392 ?auto_663401 ) ) ( not ( = ?auto_663392 ?auto_663402 ) ) ( not ( = ?auto_663393 ?auto_663394 ) ) ( not ( = ?auto_663393 ?auto_663395 ) ) ( not ( = ?auto_663393 ?auto_663396 ) ) ( not ( = ?auto_663393 ?auto_663397 ) ) ( not ( = ?auto_663393 ?auto_663398 ) ) ( not ( = ?auto_663393 ?auto_663399 ) ) ( not ( = ?auto_663393 ?auto_663400 ) ) ( not ( = ?auto_663393 ?auto_663401 ) ) ( not ( = ?auto_663393 ?auto_663402 ) ) ( not ( = ?auto_663394 ?auto_663395 ) ) ( not ( = ?auto_663394 ?auto_663396 ) ) ( not ( = ?auto_663394 ?auto_663397 ) ) ( not ( = ?auto_663394 ?auto_663398 ) ) ( not ( = ?auto_663394 ?auto_663399 ) ) ( not ( = ?auto_663394 ?auto_663400 ) ) ( not ( = ?auto_663394 ?auto_663401 ) ) ( not ( = ?auto_663394 ?auto_663402 ) ) ( not ( = ?auto_663395 ?auto_663396 ) ) ( not ( = ?auto_663395 ?auto_663397 ) ) ( not ( = ?auto_663395 ?auto_663398 ) ) ( not ( = ?auto_663395 ?auto_663399 ) ) ( not ( = ?auto_663395 ?auto_663400 ) ) ( not ( = ?auto_663395 ?auto_663401 ) ) ( not ( = ?auto_663395 ?auto_663402 ) ) ( not ( = ?auto_663396 ?auto_663397 ) ) ( not ( = ?auto_663396 ?auto_663398 ) ) ( not ( = ?auto_663396 ?auto_663399 ) ) ( not ( = ?auto_663396 ?auto_663400 ) ) ( not ( = ?auto_663396 ?auto_663401 ) ) ( not ( = ?auto_663396 ?auto_663402 ) ) ( not ( = ?auto_663397 ?auto_663398 ) ) ( not ( = ?auto_663397 ?auto_663399 ) ) ( not ( = ?auto_663397 ?auto_663400 ) ) ( not ( = ?auto_663397 ?auto_663401 ) ) ( not ( = ?auto_663397 ?auto_663402 ) ) ( not ( = ?auto_663398 ?auto_663399 ) ) ( not ( = ?auto_663398 ?auto_663400 ) ) ( not ( = ?auto_663398 ?auto_663401 ) ) ( not ( = ?auto_663398 ?auto_663402 ) ) ( not ( = ?auto_663399 ?auto_663400 ) ) ( not ( = ?auto_663399 ?auto_663401 ) ) ( not ( = ?auto_663399 ?auto_663402 ) ) ( not ( = ?auto_663400 ?auto_663401 ) ) ( not ( = ?auto_663400 ?auto_663402 ) ) ( not ( = ?auto_663401 ?auto_663402 ) ) ( ON ?auto_663400 ?auto_663401 ) ( ON ?auto_663399 ?auto_663400 ) ( ON ?auto_663398 ?auto_663399 ) ( ON ?auto_663397 ?auto_663398 ) ( ON ?auto_663396 ?auto_663397 ) ( ON ?auto_663395 ?auto_663396 ) ( ON ?auto_663394 ?auto_663395 ) ( ON ?auto_663393 ?auto_663394 ) ( CLEAR ?auto_663391 ) ( ON ?auto_663392 ?auto_663393 ) ( CLEAR ?auto_663392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_663386 ?auto_663387 ?auto_663388 ?auto_663389 ?auto_663390 ?auto_663391 ?auto_663392 )
      ( MAKE-16PILE ?auto_663386 ?auto_663387 ?auto_663388 ?auto_663389 ?auto_663390 ?auto_663391 ?auto_663392 ?auto_663393 ?auto_663394 ?auto_663395 ?auto_663396 ?auto_663397 ?auto_663398 ?auto_663399 ?auto_663400 ?auto_663401 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_663452 - BLOCK
      ?auto_663453 - BLOCK
      ?auto_663454 - BLOCK
      ?auto_663455 - BLOCK
      ?auto_663456 - BLOCK
      ?auto_663457 - BLOCK
      ?auto_663458 - BLOCK
      ?auto_663459 - BLOCK
      ?auto_663460 - BLOCK
      ?auto_663461 - BLOCK
      ?auto_663462 - BLOCK
      ?auto_663463 - BLOCK
      ?auto_663464 - BLOCK
      ?auto_663465 - BLOCK
      ?auto_663466 - BLOCK
      ?auto_663467 - BLOCK
    )
    :vars
    (
      ?auto_663468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_663467 ?auto_663468 ) ( ON-TABLE ?auto_663452 ) ( ON ?auto_663453 ?auto_663452 ) ( ON ?auto_663454 ?auto_663453 ) ( ON ?auto_663455 ?auto_663454 ) ( ON ?auto_663456 ?auto_663455 ) ( not ( = ?auto_663452 ?auto_663453 ) ) ( not ( = ?auto_663452 ?auto_663454 ) ) ( not ( = ?auto_663452 ?auto_663455 ) ) ( not ( = ?auto_663452 ?auto_663456 ) ) ( not ( = ?auto_663452 ?auto_663457 ) ) ( not ( = ?auto_663452 ?auto_663458 ) ) ( not ( = ?auto_663452 ?auto_663459 ) ) ( not ( = ?auto_663452 ?auto_663460 ) ) ( not ( = ?auto_663452 ?auto_663461 ) ) ( not ( = ?auto_663452 ?auto_663462 ) ) ( not ( = ?auto_663452 ?auto_663463 ) ) ( not ( = ?auto_663452 ?auto_663464 ) ) ( not ( = ?auto_663452 ?auto_663465 ) ) ( not ( = ?auto_663452 ?auto_663466 ) ) ( not ( = ?auto_663452 ?auto_663467 ) ) ( not ( = ?auto_663452 ?auto_663468 ) ) ( not ( = ?auto_663453 ?auto_663454 ) ) ( not ( = ?auto_663453 ?auto_663455 ) ) ( not ( = ?auto_663453 ?auto_663456 ) ) ( not ( = ?auto_663453 ?auto_663457 ) ) ( not ( = ?auto_663453 ?auto_663458 ) ) ( not ( = ?auto_663453 ?auto_663459 ) ) ( not ( = ?auto_663453 ?auto_663460 ) ) ( not ( = ?auto_663453 ?auto_663461 ) ) ( not ( = ?auto_663453 ?auto_663462 ) ) ( not ( = ?auto_663453 ?auto_663463 ) ) ( not ( = ?auto_663453 ?auto_663464 ) ) ( not ( = ?auto_663453 ?auto_663465 ) ) ( not ( = ?auto_663453 ?auto_663466 ) ) ( not ( = ?auto_663453 ?auto_663467 ) ) ( not ( = ?auto_663453 ?auto_663468 ) ) ( not ( = ?auto_663454 ?auto_663455 ) ) ( not ( = ?auto_663454 ?auto_663456 ) ) ( not ( = ?auto_663454 ?auto_663457 ) ) ( not ( = ?auto_663454 ?auto_663458 ) ) ( not ( = ?auto_663454 ?auto_663459 ) ) ( not ( = ?auto_663454 ?auto_663460 ) ) ( not ( = ?auto_663454 ?auto_663461 ) ) ( not ( = ?auto_663454 ?auto_663462 ) ) ( not ( = ?auto_663454 ?auto_663463 ) ) ( not ( = ?auto_663454 ?auto_663464 ) ) ( not ( = ?auto_663454 ?auto_663465 ) ) ( not ( = ?auto_663454 ?auto_663466 ) ) ( not ( = ?auto_663454 ?auto_663467 ) ) ( not ( = ?auto_663454 ?auto_663468 ) ) ( not ( = ?auto_663455 ?auto_663456 ) ) ( not ( = ?auto_663455 ?auto_663457 ) ) ( not ( = ?auto_663455 ?auto_663458 ) ) ( not ( = ?auto_663455 ?auto_663459 ) ) ( not ( = ?auto_663455 ?auto_663460 ) ) ( not ( = ?auto_663455 ?auto_663461 ) ) ( not ( = ?auto_663455 ?auto_663462 ) ) ( not ( = ?auto_663455 ?auto_663463 ) ) ( not ( = ?auto_663455 ?auto_663464 ) ) ( not ( = ?auto_663455 ?auto_663465 ) ) ( not ( = ?auto_663455 ?auto_663466 ) ) ( not ( = ?auto_663455 ?auto_663467 ) ) ( not ( = ?auto_663455 ?auto_663468 ) ) ( not ( = ?auto_663456 ?auto_663457 ) ) ( not ( = ?auto_663456 ?auto_663458 ) ) ( not ( = ?auto_663456 ?auto_663459 ) ) ( not ( = ?auto_663456 ?auto_663460 ) ) ( not ( = ?auto_663456 ?auto_663461 ) ) ( not ( = ?auto_663456 ?auto_663462 ) ) ( not ( = ?auto_663456 ?auto_663463 ) ) ( not ( = ?auto_663456 ?auto_663464 ) ) ( not ( = ?auto_663456 ?auto_663465 ) ) ( not ( = ?auto_663456 ?auto_663466 ) ) ( not ( = ?auto_663456 ?auto_663467 ) ) ( not ( = ?auto_663456 ?auto_663468 ) ) ( not ( = ?auto_663457 ?auto_663458 ) ) ( not ( = ?auto_663457 ?auto_663459 ) ) ( not ( = ?auto_663457 ?auto_663460 ) ) ( not ( = ?auto_663457 ?auto_663461 ) ) ( not ( = ?auto_663457 ?auto_663462 ) ) ( not ( = ?auto_663457 ?auto_663463 ) ) ( not ( = ?auto_663457 ?auto_663464 ) ) ( not ( = ?auto_663457 ?auto_663465 ) ) ( not ( = ?auto_663457 ?auto_663466 ) ) ( not ( = ?auto_663457 ?auto_663467 ) ) ( not ( = ?auto_663457 ?auto_663468 ) ) ( not ( = ?auto_663458 ?auto_663459 ) ) ( not ( = ?auto_663458 ?auto_663460 ) ) ( not ( = ?auto_663458 ?auto_663461 ) ) ( not ( = ?auto_663458 ?auto_663462 ) ) ( not ( = ?auto_663458 ?auto_663463 ) ) ( not ( = ?auto_663458 ?auto_663464 ) ) ( not ( = ?auto_663458 ?auto_663465 ) ) ( not ( = ?auto_663458 ?auto_663466 ) ) ( not ( = ?auto_663458 ?auto_663467 ) ) ( not ( = ?auto_663458 ?auto_663468 ) ) ( not ( = ?auto_663459 ?auto_663460 ) ) ( not ( = ?auto_663459 ?auto_663461 ) ) ( not ( = ?auto_663459 ?auto_663462 ) ) ( not ( = ?auto_663459 ?auto_663463 ) ) ( not ( = ?auto_663459 ?auto_663464 ) ) ( not ( = ?auto_663459 ?auto_663465 ) ) ( not ( = ?auto_663459 ?auto_663466 ) ) ( not ( = ?auto_663459 ?auto_663467 ) ) ( not ( = ?auto_663459 ?auto_663468 ) ) ( not ( = ?auto_663460 ?auto_663461 ) ) ( not ( = ?auto_663460 ?auto_663462 ) ) ( not ( = ?auto_663460 ?auto_663463 ) ) ( not ( = ?auto_663460 ?auto_663464 ) ) ( not ( = ?auto_663460 ?auto_663465 ) ) ( not ( = ?auto_663460 ?auto_663466 ) ) ( not ( = ?auto_663460 ?auto_663467 ) ) ( not ( = ?auto_663460 ?auto_663468 ) ) ( not ( = ?auto_663461 ?auto_663462 ) ) ( not ( = ?auto_663461 ?auto_663463 ) ) ( not ( = ?auto_663461 ?auto_663464 ) ) ( not ( = ?auto_663461 ?auto_663465 ) ) ( not ( = ?auto_663461 ?auto_663466 ) ) ( not ( = ?auto_663461 ?auto_663467 ) ) ( not ( = ?auto_663461 ?auto_663468 ) ) ( not ( = ?auto_663462 ?auto_663463 ) ) ( not ( = ?auto_663462 ?auto_663464 ) ) ( not ( = ?auto_663462 ?auto_663465 ) ) ( not ( = ?auto_663462 ?auto_663466 ) ) ( not ( = ?auto_663462 ?auto_663467 ) ) ( not ( = ?auto_663462 ?auto_663468 ) ) ( not ( = ?auto_663463 ?auto_663464 ) ) ( not ( = ?auto_663463 ?auto_663465 ) ) ( not ( = ?auto_663463 ?auto_663466 ) ) ( not ( = ?auto_663463 ?auto_663467 ) ) ( not ( = ?auto_663463 ?auto_663468 ) ) ( not ( = ?auto_663464 ?auto_663465 ) ) ( not ( = ?auto_663464 ?auto_663466 ) ) ( not ( = ?auto_663464 ?auto_663467 ) ) ( not ( = ?auto_663464 ?auto_663468 ) ) ( not ( = ?auto_663465 ?auto_663466 ) ) ( not ( = ?auto_663465 ?auto_663467 ) ) ( not ( = ?auto_663465 ?auto_663468 ) ) ( not ( = ?auto_663466 ?auto_663467 ) ) ( not ( = ?auto_663466 ?auto_663468 ) ) ( not ( = ?auto_663467 ?auto_663468 ) ) ( ON ?auto_663466 ?auto_663467 ) ( ON ?auto_663465 ?auto_663466 ) ( ON ?auto_663464 ?auto_663465 ) ( ON ?auto_663463 ?auto_663464 ) ( ON ?auto_663462 ?auto_663463 ) ( ON ?auto_663461 ?auto_663462 ) ( ON ?auto_663460 ?auto_663461 ) ( ON ?auto_663459 ?auto_663460 ) ( ON ?auto_663458 ?auto_663459 ) ( CLEAR ?auto_663456 ) ( ON ?auto_663457 ?auto_663458 ) ( CLEAR ?auto_663457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_663452 ?auto_663453 ?auto_663454 ?auto_663455 ?auto_663456 ?auto_663457 )
      ( MAKE-16PILE ?auto_663452 ?auto_663453 ?auto_663454 ?auto_663455 ?auto_663456 ?auto_663457 ?auto_663458 ?auto_663459 ?auto_663460 ?auto_663461 ?auto_663462 ?auto_663463 ?auto_663464 ?auto_663465 ?auto_663466 ?auto_663467 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_663518 - BLOCK
      ?auto_663519 - BLOCK
      ?auto_663520 - BLOCK
      ?auto_663521 - BLOCK
      ?auto_663522 - BLOCK
      ?auto_663523 - BLOCK
      ?auto_663524 - BLOCK
      ?auto_663525 - BLOCK
      ?auto_663526 - BLOCK
      ?auto_663527 - BLOCK
      ?auto_663528 - BLOCK
      ?auto_663529 - BLOCK
      ?auto_663530 - BLOCK
      ?auto_663531 - BLOCK
      ?auto_663532 - BLOCK
      ?auto_663533 - BLOCK
    )
    :vars
    (
      ?auto_663534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_663533 ?auto_663534 ) ( ON-TABLE ?auto_663518 ) ( ON ?auto_663519 ?auto_663518 ) ( ON ?auto_663520 ?auto_663519 ) ( ON ?auto_663521 ?auto_663520 ) ( not ( = ?auto_663518 ?auto_663519 ) ) ( not ( = ?auto_663518 ?auto_663520 ) ) ( not ( = ?auto_663518 ?auto_663521 ) ) ( not ( = ?auto_663518 ?auto_663522 ) ) ( not ( = ?auto_663518 ?auto_663523 ) ) ( not ( = ?auto_663518 ?auto_663524 ) ) ( not ( = ?auto_663518 ?auto_663525 ) ) ( not ( = ?auto_663518 ?auto_663526 ) ) ( not ( = ?auto_663518 ?auto_663527 ) ) ( not ( = ?auto_663518 ?auto_663528 ) ) ( not ( = ?auto_663518 ?auto_663529 ) ) ( not ( = ?auto_663518 ?auto_663530 ) ) ( not ( = ?auto_663518 ?auto_663531 ) ) ( not ( = ?auto_663518 ?auto_663532 ) ) ( not ( = ?auto_663518 ?auto_663533 ) ) ( not ( = ?auto_663518 ?auto_663534 ) ) ( not ( = ?auto_663519 ?auto_663520 ) ) ( not ( = ?auto_663519 ?auto_663521 ) ) ( not ( = ?auto_663519 ?auto_663522 ) ) ( not ( = ?auto_663519 ?auto_663523 ) ) ( not ( = ?auto_663519 ?auto_663524 ) ) ( not ( = ?auto_663519 ?auto_663525 ) ) ( not ( = ?auto_663519 ?auto_663526 ) ) ( not ( = ?auto_663519 ?auto_663527 ) ) ( not ( = ?auto_663519 ?auto_663528 ) ) ( not ( = ?auto_663519 ?auto_663529 ) ) ( not ( = ?auto_663519 ?auto_663530 ) ) ( not ( = ?auto_663519 ?auto_663531 ) ) ( not ( = ?auto_663519 ?auto_663532 ) ) ( not ( = ?auto_663519 ?auto_663533 ) ) ( not ( = ?auto_663519 ?auto_663534 ) ) ( not ( = ?auto_663520 ?auto_663521 ) ) ( not ( = ?auto_663520 ?auto_663522 ) ) ( not ( = ?auto_663520 ?auto_663523 ) ) ( not ( = ?auto_663520 ?auto_663524 ) ) ( not ( = ?auto_663520 ?auto_663525 ) ) ( not ( = ?auto_663520 ?auto_663526 ) ) ( not ( = ?auto_663520 ?auto_663527 ) ) ( not ( = ?auto_663520 ?auto_663528 ) ) ( not ( = ?auto_663520 ?auto_663529 ) ) ( not ( = ?auto_663520 ?auto_663530 ) ) ( not ( = ?auto_663520 ?auto_663531 ) ) ( not ( = ?auto_663520 ?auto_663532 ) ) ( not ( = ?auto_663520 ?auto_663533 ) ) ( not ( = ?auto_663520 ?auto_663534 ) ) ( not ( = ?auto_663521 ?auto_663522 ) ) ( not ( = ?auto_663521 ?auto_663523 ) ) ( not ( = ?auto_663521 ?auto_663524 ) ) ( not ( = ?auto_663521 ?auto_663525 ) ) ( not ( = ?auto_663521 ?auto_663526 ) ) ( not ( = ?auto_663521 ?auto_663527 ) ) ( not ( = ?auto_663521 ?auto_663528 ) ) ( not ( = ?auto_663521 ?auto_663529 ) ) ( not ( = ?auto_663521 ?auto_663530 ) ) ( not ( = ?auto_663521 ?auto_663531 ) ) ( not ( = ?auto_663521 ?auto_663532 ) ) ( not ( = ?auto_663521 ?auto_663533 ) ) ( not ( = ?auto_663521 ?auto_663534 ) ) ( not ( = ?auto_663522 ?auto_663523 ) ) ( not ( = ?auto_663522 ?auto_663524 ) ) ( not ( = ?auto_663522 ?auto_663525 ) ) ( not ( = ?auto_663522 ?auto_663526 ) ) ( not ( = ?auto_663522 ?auto_663527 ) ) ( not ( = ?auto_663522 ?auto_663528 ) ) ( not ( = ?auto_663522 ?auto_663529 ) ) ( not ( = ?auto_663522 ?auto_663530 ) ) ( not ( = ?auto_663522 ?auto_663531 ) ) ( not ( = ?auto_663522 ?auto_663532 ) ) ( not ( = ?auto_663522 ?auto_663533 ) ) ( not ( = ?auto_663522 ?auto_663534 ) ) ( not ( = ?auto_663523 ?auto_663524 ) ) ( not ( = ?auto_663523 ?auto_663525 ) ) ( not ( = ?auto_663523 ?auto_663526 ) ) ( not ( = ?auto_663523 ?auto_663527 ) ) ( not ( = ?auto_663523 ?auto_663528 ) ) ( not ( = ?auto_663523 ?auto_663529 ) ) ( not ( = ?auto_663523 ?auto_663530 ) ) ( not ( = ?auto_663523 ?auto_663531 ) ) ( not ( = ?auto_663523 ?auto_663532 ) ) ( not ( = ?auto_663523 ?auto_663533 ) ) ( not ( = ?auto_663523 ?auto_663534 ) ) ( not ( = ?auto_663524 ?auto_663525 ) ) ( not ( = ?auto_663524 ?auto_663526 ) ) ( not ( = ?auto_663524 ?auto_663527 ) ) ( not ( = ?auto_663524 ?auto_663528 ) ) ( not ( = ?auto_663524 ?auto_663529 ) ) ( not ( = ?auto_663524 ?auto_663530 ) ) ( not ( = ?auto_663524 ?auto_663531 ) ) ( not ( = ?auto_663524 ?auto_663532 ) ) ( not ( = ?auto_663524 ?auto_663533 ) ) ( not ( = ?auto_663524 ?auto_663534 ) ) ( not ( = ?auto_663525 ?auto_663526 ) ) ( not ( = ?auto_663525 ?auto_663527 ) ) ( not ( = ?auto_663525 ?auto_663528 ) ) ( not ( = ?auto_663525 ?auto_663529 ) ) ( not ( = ?auto_663525 ?auto_663530 ) ) ( not ( = ?auto_663525 ?auto_663531 ) ) ( not ( = ?auto_663525 ?auto_663532 ) ) ( not ( = ?auto_663525 ?auto_663533 ) ) ( not ( = ?auto_663525 ?auto_663534 ) ) ( not ( = ?auto_663526 ?auto_663527 ) ) ( not ( = ?auto_663526 ?auto_663528 ) ) ( not ( = ?auto_663526 ?auto_663529 ) ) ( not ( = ?auto_663526 ?auto_663530 ) ) ( not ( = ?auto_663526 ?auto_663531 ) ) ( not ( = ?auto_663526 ?auto_663532 ) ) ( not ( = ?auto_663526 ?auto_663533 ) ) ( not ( = ?auto_663526 ?auto_663534 ) ) ( not ( = ?auto_663527 ?auto_663528 ) ) ( not ( = ?auto_663527 ?auto_663529 ) ) ( not ( = ?auto_663527 ?auto_663530 ) ) ( not ( = ?auto_663527 ?auto_663531 ) ) ( not ( = ?auto_663527 ?auto_663532 ) ) ( not ( = ?auto_663527 ?auto_663533 ) ) ( not ( = ?auto_663527 ?auto_663534 ) ) ( not ( = ?auto_663528 ?auto_663529 ) ) ( not ( = ?auto_663528 ?auto_663530 ) ) ( not ( = ?auto_663528 ?auto_663531 ) ) ( not ( = ?auto_663528 ?auto_663532 ) ) ( not ( = ?auto_663528 ?auto_663533 ) ) ( not ( = ?auto_663528 ?auto_663534 ) ) ( not ( = ?auto_663529 ?auto_663530 ) ) ( not ( = ?auto_663529 ?auto_663531 ) ) ( not ( = ?auto_663529 ?auto_663532 ) ) ( not ( = ?auto_663529 ?auto_663533 ) ) ( not ( = ?auto_663529 ?auto_663534 ) ) ( not ( = ?auto_663530 ?auto_663531 ) ) ( not ( = ?auto_663530 ?auto_663532 ) ) ( not ( = ?auto_663530 ?auto_663533 ) ) ( not ( = ?auto_663530 ?auto_663534 ) ) ( not ( = ?auto_663531 ?auto_663532 ) ) ( not ( = ?auto_663531 ?auto_663533 ) ) ( not ( = ?auto_663531 ?auto_663534 ) ) ( not ( = ?auto_663532 ?auto_663533 ) ) ( not ( = ?auto_663532 ?auto_663534 ) ) ( not ( = ?auto_663533 ?auto_663534 ) ) ( ON ?auto_663532 ?auto_663533 ) ( ON ?auto_663531 ?auto_663532 ) ( ON ?auto_663530 ?auto_663531 ) ( ON ?auto_663529 ?auto_663530 ) ( ON ?auto_663528 ?auto_663529 ) ( ON ?auto_663527 ?auto_663528 ) ( ON ?auto_663526 ?auto_663527 ) ( ON ?auto_663525 ?auto_663526 ) ( ON ?auto_663524 ?auto_663525 ) ( ON ?auto_663523 ?auto_663524 ) ( CLEAR ?auto_663521 ) ( ON ?auto_663522 ?auto_663523 ) ( CLEAR ?auto_663522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_663518 ?auto_663519 ?auto_663520 ?auto_663521 ?auto_663522 )
      ( MAKE-16PILE ?auto_663518 ?auto_663519 ?auto_663520 ?auto_663521 ?auto_663522 ?auto_663523 ?auto_663524 ?auto_663525 ?auto_663526 ?auto_663527 ?auto_663528 ?auto_663529 ?auto_663530 ?auto_663531 ?auto_663532 ?auto_663533 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_663584 - BLOCK
      ?auto_663585 - BLOCK
      ?auto_663586 - BLOCK
      ?auto_663587 - BLOCK
      ?auto_663588 - BLOCK
      ?auto_663589 - BLOCK
      ?auto_663590 - BLOCK
      ?auto_663591 - BLOCK
      ?auto_663592 - BLOCK
      ?auto_663593 - BLOCK
      ?auto_663594 - BLOCK
      ?auto_663595 - BLOCK
      ?auto_663596 - BLOCK
      ?auto_663597 - BLOCK
      ?auto_663598 - BLOCK
      ?auto_663599 - BLOCK
    )
    :vars
    (
      ?auto_663600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_663599 ?auto_663600 ) ( ON-TABLE ?auto_663584 ) ( ON ?auto_663585 ?auto_663584 ) ( ON ?auto_663586 ?auto_663585 ) ( not ( = ?auto_663584 ?auto_663585 ) ) ( not ( = ?auto_663584 ?auto_663586 ) ) ( not ( = ?auto_663584 ?auto_663587 ) ) ( not ( = ?auto_663584 ?auto_663588 ) ) ( not ( = ?auto_663584 ?auto_663589 ) ) ( not ( = ?auto_663584 ?auto_663590 ) ) ( not ( = ?auto_663584 ?auto_663591 ) ) ( not ( = ?auto_663584 ?auto_663592 ) ) ( not ( = ?auto_663584 ?auto_663593 ) ) ( not ( = ?auto_663584 ?auto_663594 ) ) ( not ( = ?auto_663584 ?auto_663595 ) ) ( not ( = ?auto_663584 ?auto_663596 ) ) ( not ( = ?auto_663584 ?auto_663597 ) ) ( not ( = ?auto_663584 ?auto_663598 ) ) ( not ( = ?auto_663584 ?auto_663599 ) ) ( not ( = ?auto_663584 ?auto_663600 ) ) ( not ( = ?auto_663585 ?auto_663586 ) ) ( not ( = ?auto_663585 ?auto_663587 ) ) ( not ( = ?auto_663585 ?auto_663588 ) ) ( not ( = ?auto_663585 ?auto_663589 ) ) ( not ( = ?auto_663585 ?auto_663590 ) ) ( not ( = ?auto_663585 ?auto_663591 ) ) ( not ( = ?auto_663585 ?auto_663592 ) ) ( not ( = ?auto_663585 ?auto_663593 ) ) ( not ( = ?auto_663585 ?auto_663594 ) ) ( not ( = ?auto_663585 ?auto_663595 ) ) ( not ( = ?auto_663585 ?auto_663596 ) ) ( not ( = ?auto_663585 ?auto_663597 ) ) ( not ( = ?auto_663585 ?auto_663598 ) ) ( not ( = ?auto_663585 ?auto_663599 ) ) ( not ( = ?auto_663585 ?auto_663600 ) ) ( not ( = ?auto_663586 ?auto_663587 ) ) ( not ( = ?auto_663586 ?auto_663588 ) ) ( not ( = ?auto_663586 ?auto_663589 ) ) ( not ( = ?auto_663586 ?auto_663590 ) ) ( not ( = ?auto_663586 ?auto_663591 ) ) ( not ( = ?auto_663586 ?auto_663592 ) ) ( not ( = ?auto_663586 ?auto_663593 ) ) ( not ( = ?auto_663586 ?auto_663594 ) ) ( not ( = ?auto_663586 ?auto_663595 ) ) ( not ( = ?auto_663586 ?auto_663596 ) ) ( not ( = ?auto_663586 ?auto_663597 ) ) ( not ( = ?auto_663586 ?auto_663598 ) ) ( not ( = ?auto_663586 ?auto_663599 ) ) ( not ( = ?auto_663586 ?auto_663600 ) ) ( not ( = ?auto_663587 ?auto_663588 ) ) ( not ( = ?auto_663587 ?auto_663589 ) ) ( not ( = ?auto_663587 ?auto_663590 ) ) ( not ( = ?auto_663587 ?auto_663591 ) ) ( not ( = ?auto_663587 ?auto_663592 ) ) ( not ( = ?auto_663587 ?auto_663593 ) ) ( not ( = ?auto_663587 ?auto_663594 ) ) ( not ( = ?auto_663587 ?auto_663595 ) ) ( not ( = ?auto_663587 ?auto_663596 ) ) ( not ( = ?auto_663587 ?auto_663597 ) ) ( not ( = ?auto_663587 ?auto_663598 ) ) ( not ( = ?auto_663587 ?auto_663599 ) ) ( not ( = ?auto_663587 ?auto_663600 ) ) ( not ( = ?auto_663588 ?auto_663589 ) ) ( not ( = ?auto_663588 ?auto_663590 ) ) ( not ( = ?auto_663588 ?auto_663591 ) ) ( not ( = ?auto_663588 ?auto_663592 ) ) ( not ( = ?auto_663588 ?auto_663593 ) ) ( not ( = ?auto_663588 ?auto_663594 ) ) ( not ( = ?auto_663588 ?auto_663595 ) ) ( not ( = ?auto_663588 ?auto_663596 ) ) ( not ( = ?auto_663588 ?auto_663597 ) ) ( not ( = ?auto_663588 ?auto_663598 ) ) ( not ( = ?auto_663588 ?auto_663599 ) ) ( not ( = ?auto_663588 ?auto_663600 ) ) ( not ( = ?auto_663589 ?auto_663590 ) ) ( not ( = ?auto_663589 ?auto_663591 ) ) ( not ( = ?auto_663589 ?auto_663592 ) ) ( not ( = ?auto_663589 ?auto_663593 ) ) ( not ( = ?auto_663589 ?auto_663594 ) ) ( not ( = ?auto_663589 ?auto_663595 ) ) ( not ( = ?auto_663589 ?auto_663596 ) ) ( not ( = ?auto_663589 ?auto_663597 ) ) ( not ( = ?auto_663589 ?auto_663598 ) ) ( not ( = ?auto_663589 ?auto_663599 ) ) ( not ( = ?auto_663589 ?auto_663600 ) ) ( not ( = ?auto_663590 ?auto_663591 ) ) ( not ( = ?auto_663590 ?auto_663592 ) ) ( not ( = ?auto_663590 ?auto_663593 ) ) ( not ( = ?auto_663590 ?auto_663594 ) ) ( not ( = ?auto_663590 ?auto_663595 ) ) ( not ( = ?auto_663590 ?auto_663596 ) ) ( not ( = ?auto_663590 ?auto_663597 ) ) ( not ( = ?auto_663590 ?auto_663598 ) ) ( not ( = ?auto_663590 ?auto_663599 ) ) ( not ( = ?auto_663590 ?auto_663600 ) ) ( not ( = ?auto_663591 ?auto_663592 ) ) ( not ( = ?auto_663591 ?auto_663593 ) ) ( not ( = ?auto_663591 ?auto_663594 ) ) ( not ( = ?auto_663591 ?auto_663595 ) ) ( not ( = ?auto_663591 ?auto_663596 ) ) ( not ( = ?auto_663591 ?auto_663597 ) ) ( not ( = ?auto_663591 ?auto_663598 ) ) ( not ( = ?auto_663591 ?auto_663599 ) ) ( not ( = ?auto_663591 ?auto_663600 ) ) ( not ( = ?auto_663592 ?auto_663593 ) ) ( not ( = ?auto_663592 ?auto_663594 ) ) ( not ( = ?auto_663592 ?auto_663595 ) ) ( not ( = ?auto_663592 ?auto_663596 ) ) ( not ( = ?auto_663592 ?auto_663597 ) ) ( not ( = ?auto_663592 ?auto_663598 ) ) ( not ( = ?auto_663592 ?auto_663599 ) ) ( not ( = ?auto_663592 ?auto_663600 ) ) ( not ( = ?auto_663593 ?auto_663594 ) ) ( not ( = ?auto_663593 ?auto_663595 ) ) ( not ( = ?auto_663593 ?auto_663596 ) ) ( not ( = ?auto_663593 ?auto_663597 ) ) ( not ( = ?auto_663593 ?auto_663598 ) ) ( not ( = ?auto_663593 ?auto_663599 ) ) ( not ( = ?auto_663593 ?auto_663600 ) ) ( not ( = ?auto_663594 ?auto_663595 ) ) ( not ( = ?auto_663594 ?auto_663596 ) ) ( not ( = ?auto_663594 ?auto_663597 ) ) ( not ( = ?auto_663594 ?auto_663598 ) ) ( not ( = ?auto_663594 ?auto_663599 ) ) ( not ( = ?auto_663594 ?auto_663600 ) ) ( not ( = ?auto_663595 ?auto_663596 ) ) ( not ( = ?auto_663595 ?auto_663597 ) ) ( not ( = ?auto_663595 ?auto_663598 ) ) ( not ( = ?auto_663595 ?auto_663599 ) ) ( not ( = ?auto_663595 ?auto_663600 ) ) ( not ( = ?auto_663596 ?auto_663597 ) ) ( not ( = ?auto_663596 ?auto_663598 ) ) ( not ( = ?auto_663596 ?auto_663599 ) ) ( not ( = ?auto_663596 ?auto_663600 ) ) ( not ( = ?auto_663597 ?auto_663598 ) ) ( not ( = ?auto_663597 ?auto_663599 ) ) ( not ( = ?auto_663597 ?auto_663600 ) ) ( not ( = ?auto_663598 ?auto_663599 ) ) ( not ( = ?auto_663598 ?auto_663600 ) ) ( not ( = ?auto_663599 ?auto_663600 ) ) ( ON ?auto_663598 ?auto_663599 ) ( ON ?auto_663597 ?auto_663598 ) ( ON ?auto_663596 ?auto_663597 ) ( ON ?auto_663595 ?auto_663596 ) ( ON ?auto_663594 ?auto_663595 ) ( ON ?auto_663593 ?auto_663594 ) ( ON ?auto_663592 ?auto_663593 ) ( ON ?auto_663591 ?auto_663592 ) ( ON ?auto_663590 ?auto_663591 ) ( ON ?auto_663589 ?auto_663590 ) ( ON ?auto_663588 ?auto_663589 ) ( CLEAR ?auto_663586 ) ( ON ?auto_663587 ?auto_663588 ) ( CLEAR ?auto_663587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_663584 ?auto_663585 ?auto_663586 ?auto_663587 )
      ( MAKE-16PILE ?auto_663584 ?auto_663585 ?auto_663586 ?auto_663587 ?auto_663588 ?auto_663589 ?auto_663590 ?auto_663591 ?auto_663592 ?auto_663593 ?auto_663594 ?auto_663595 ?auto_663596 ?auto_663597 ?auto_663598 ?auto_663599 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_663650 - BLOCK
      ?auto_663651 - BLOCK
      ?auto_663652 - BLOCK
      ?auto_663653 - BLOCK
      ?auto_663654 - BLOCK
      ?auto_663655 - BLOCK
      ?auto_663656 - BLOCK
      ?auto_663657 - BLOCK
      ?auto_663658 - BLOCK
      ?auto_663659 - BLOCK
      ?auto_663660 - BLOCK
      ?auto_663661 - BLOCK
      ?auto_663662 - BLOCK
      ?auto_663663 - BLOCK
      ?auto_663664 - BLOCK
      ?auto_663665 - BLOCK
    )
    :vars
    (
      ?auto_663666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_663665 ?auto_663666 ) ( ON-TABLE ?auto_663650 ) ( ON ?auto_663651 ?auto_663650 ) ( not ( = ?auto_663650 ?auto_663651 ) ) ( not ( = ?auto_663650 ?auto_663652 ) ) ( not ( = ?auto_663650 ?auto_663653 ) ) ( not ( = ?auto_663650 ?auto_663654 ) ) ( not ( = ?auto_663650 ?auto_663655 ) ) ( not ( = ?auto_663650 ?auto_663656 ) ) ( not ( = ?auto_663650 ?auto_663657 ) ) ( not ( = ?auto_663650 ?auto_663658 ) ) ( not ( = ?auto_663650 ?auto_663659 ) ) ( not ( = ?auto_663650 ?auto_663660 ) ) ( not ( = ?auto_663650 ?auto_663661 ) ) ( not ( = ?auto_663650 ?auto_663662 ) ) ( not ( = ?auto_663650 ?auto_663663 ) ) ( not ( = ?auto_663650 ?auto_663664 ) ) ( not ( = ?auto_663650 ?auto_663665 ) ) ( not ( = ?auto_663650 ?auto_663666 ) ) ( not ( = ?auto_663651 ?auto_663652 ) ) ( not ( = ?auto_663651 ?auto_663653 ) ) ( not ( = ?auto_663651 ?auto_663654 ) ) ( not ( = ?auto_663651 ?auto_663655 ) ) ( not ( = ?auto_663651 ?auto_663656 ) ) ( not ( = ?auto_663651 ?auto_663657 ) ) ( not ( = ?auto_663651 ?auto_663658 ) ) ( not ( = ?auto_663651 ?auto_663659 ) ) ( not ( = ?auto_663651 ?auto_663660 ) ) ( not ( = ?auto_663651 ?auto_663661 ) ) ( not ( = ?auto_663651 ?auto_663662 ) ) ( not ( = ?auto_663651 ?auto_663663 ) ) ( not ( = ?auto_663651 ?auto_663664 ) ) ( not ( = ?auto_663651 ?auto_663665 ) ) ( not ( = ?auto_663651 ?auto_663666 ) ) ( not ( = ?auto_663652 ?auto_663653 ) ) ( not ( = ?auto_663652 ?auto_663654 ) ) ( not ( = ?auto_663652 ?auto_663655 ) ) ( not ( = ?auto_663652 ?auto_663656 ) ) ( not ( = ?auto_663652 ?auto_663657 ) ) ( not ( = ?auto_663652 ?auto_663658 ) ) ( not ( = ?auto_663652 ?auto_663659 ) ) ( not ( = ?auto_663652 ?auto_663660 ) ) ( not ( = ?auto_663652 ?auto_663661 ) ) ( not ( = ?auto_663652 ?auto_663662 ) ) ( not ( = ?auto_663652 ?auto_663663 ) ) ( not ( = ?auto_663652 ?auto_663664 ) ) ( not ( = ?auto_663652 ?auto_663665 ) ) ( not ( = ?auto_663652 ?auto_663666 ) ) ( not ( = ?auto_663653 ?auto_663654 ) ) ( not ( = ?auto_663653 ?auto_663655 ) ) ( not ( = ?auto_663653 ?auto_663656 ) ) ( not ( = ?auto_663653 ?auto_663657 ) ) ( not ( = ?auto_663653 ?auto_663658 ) ) ( not ( = ?auto_663653 ?auto_663659 ) ) ( not ( = ?auto_663653 ?auto_663660 ) ) ( not ( = ?auto_663653 ?auto_663661 ) ) ( not ( = ?auto_663653 ?auto_663662 ) ) ( not ( = ?auto_663653 ?auto_663663 ) ) ( not ( = ?auto_663653 ?auto_663664 ) ) ( not ( = ?auto_663653 ?auto_663665 ) ) ( not ( = ?auto_663653 ?auto_663666 ) ) ( not ( = ?auto_663654 ?auto_663655 ) ) ( not ( = ?auto_663654 ?auto_663656 ) ) ( not ( = ?auto_663654 ?auto_663657 ) ) ( not ( = ?auto_663654 ?auto_663658 ) ) ( not ( = ?auto_663654 ?auto_663659 ) ) ( not ( = ?auto_663654 ?auto_663660 ) ) ( not ( = ?auto_663654 ?auto_663661 ) ) ( not ( = ?auto_663654 ?auto_663662 ) ) ( not ( = ?auto_663654 ?auto_663663 ) ) ( not ( = ?auto_663654 ?auto_663664 ) ) ( not ( = ?auto_663654 ?auto_663665 ) ) ( not ( = ?auto_663654 ?auto_663666 ) ) ( not ( = ?auto_663655 ?auto_663656 ) ) ( not ( = ?auto_663655 ?auto_663657 ) ) ( not ( = ?auto_663655 ?auto_663658 ) ) ( not ( = ?auto_663655 ?auto_663659 ) ) ( not ( = ?auto_663655 ?auto_663660 ) ) ( not ( = ?auto_663655 ?auto_663661 ) ) ( not ( = ?auto_663655 ?auto_663662 ) ) ( not ( = ?auto_663655 ?auto_663663 ) ) ( not ( = ?auto_663655 ?auto_663664 ) ) ( not ( = ?auto_663655 ?auto_663665 ) ) ( not ( = ?auto_663655 ?auto_663666 ) ) ( not ( = ?auto_663656 ?auto_663657 ) ) ( not ( = ?auto_663656 ?auto_663658 ) ) ( not ( = ?auto_663656 ?auto_663659 ) ) ( not ( = ?auto_663656 ?auto_663660 ) ) ( not ( = ?auto_663656 ?auto_663661 ) ) ( not ( = ?auto_663656 ?auto_663662 ) ) ( not ( = ?auto_663656 ?auto_663663 ) ) ( not ( = ?auto_663656 ?auto_663664 ) ) ( not ( = ?auto_663656 ?auto_663665 ) ) ( not ( = ?auto_663656 ?auto_663666 ) ) ( not ( = ?auto_663657 ?auto_663658 ) ) ( not ( = ?auto_663657 ?auto_663659 ) ) ( not ( = ?auto_663657 ?auto_663660 ) ) ( not ( = ?auto_663657 ?auto_663661 ) ) ( not ( = ?auto_663657 ?auto_663662 ) ) ( not ( = ?auto_663657 ?auto_663663 ) ) ( not ( = ?auto_663657 ?auto_663664 ) ) ( not ( = ?auto_663657 ?auto_663665 ) ) ( not ( = ?auto_663657 ?auto_663666 ) ) ( not ( = ?auto_663658 ?auto_663659 ) ) ( not ( = ?auto_663658 ?auto_663660 ) ) ( not ( = ?auto_663658 ?auto_663661 ) ) ( not ( = ?auto_663658 ?auto_663662 ) ) ( not ( = ?auto_663658 ?auto_663663 ) ) ( not ( = ?auto_663658 ?auto_663664 ) ) ( not ( = ?auto_663658 ?auto_663665 ) ) ( not ( = ?auto_663658 ?auto_663666 ) ) ( not ( = ?auto_663659 ?auto_663660 ) ) ( not ( = ?auto_663659 ?auto_663661 ) ) ( not ( = ?auto_663659 ?auto_663662 ) ) ( not ( = ?auto_663659 ?auto_663663 ) ) ( not ( = ?auto_663659 ?auto_663664 ) ) ( not ( = ?auto_663659 ?auto_663665 ) ) ( not ( = ?auto_663659 ?auto_663666 ) ) ( not ( = ?auto_663660 ?auto_663661 ) ) ( not ( = ?auto_663660 ?auto_663662 ) ) ( not ( = ?auto_663660 ?auto_663663 ) ) ( not ( = ?auto_663660 ?auto_663664 ) ) ( not ( = ?auto_663660 ?auto_663665 ) ) ( not ( = ?auto_663660 ?auto_663666 ) ) ( not ( = ?auto_663661 ?auto_663662 ) ) ( not ( = ?auto_663661 ?auto_663663 ) ) ( not ( = ?auto_663661 ?auto_663664 ) ) ( not ( = ?auto_663661 ?auto_663665 ) ) ( not ( = ?auto_663661 ?auto_663666 ) ) ( not ( = ?auto_663662 ?auto_663663 ) ) ( not ( = ?auto_663662 ?auto_663664 ) ) ( not ( = ?auto_663662 ?auto_663665 ) ) ( not ( = ?auto_663662 ?auto_663666 ) ) ( not ( = ?auto_663663 ?auto_663664 ) ) ( not ( = ?auto_663663 ?auto_663665 ) ) ( not ( = ?auto_663663 ?auto_663666 ) ) ( not ( = ?auto_663664 ?auto_663665 ) ) ( not ( = ?auto_663664 ?auto_663666 ) ) ( not ( = ?auto_663665 ?auto_663666 ) ) ( ON ?auto_663664 ?auto_663665 ) ( ON ?auto_663663 ?auto_663664 ) ( ON ?auto_663662 ?auto_663663 ) ( ON ?auto_663661 ?auto_663662 ) ( ON ?auto_663660 ?auto_663661 ) ( ON ?auto_663659 ?auto_663660 ) ( ON ?auto_663658 ?auto_663659 ) ( ON ?auto_663657 ?auto_663658 ) ( ON ?auto_663656 ?auto_663657 ) ( ON ?auto_663655 ?auto_663656 ) ( ON ?auto_663654 ?auto_663655 ) ( ON ?auto_663653 ?auto_663654 ) ( CLEAR ?auto_663651 ) ( ON ?auto_663652 ?auto_663653 ) ( CLEAR ?auto_663652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_663650 ?auto_663651 ?auto_663652 )
      ( MAKE-16PILE ?auto_663650 ?auto_663651 ?auto_663652 ?auto_663653 ?auto_663654 ?auto_663655 ?auto_663656 ?auto_663657 ?auto_663658 ?auto_663659 ?auto_663660 ?auto_663661 ?auto_663662 ?auto_663663 ?auto_663664 ?auto_663665 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_663716 - BLOCK
      ?auto_663717 - BLOCK
      ?auto_663718 - BLOCK
      ?auto_663719 - BLOCK
      ?auto_663720 - BLOCK
      ?auto_663721 - BLOCK
      ?auto_663722 - BLOCK
      ?auto_663723 - BLOCK
      ?auto_663724 - BLOCK
      ?auto_663725 - BLOCK
      ?auto_663726 - BLOCK
      ?auto_663727 - BLOCK
      ?auto_663728 - BLOCK
      ?auto_663729 - BLOCK
      ?auto_663730 - BLOCK
      ?auto_663731 - BLOCK
    )
    :vars
    (
      ?auto_663732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_663731 ?auto_663732 ) ( ON-TABLE ?auto_663716 ) ( not ( = ?auto_663716 ?auto_663717 ) ) ( not ( = ?auto_663716 ?auto_663718 ) ) ( not ( = ?auto_663716 ?auto_663719 ) ) ( not ( = ?auto_663716 ?auto_663720 ) ) ( not ( = ?auto_663716 ?auto_663721 ) ) ( not ( = ?auto_663716 ?auto_663722 ) ) ( not ( = ?auto_663716 ?auto_663723 ) ) ( not ( = ?auto_663716 ?auto_663724 ) ) ( not ( = ?auto_663716 ?auto_663725 ) ) ( not ( = ?auto_663716 ?auto_663726 ) ) ( not ( = ?auto_663716 ?auto_663727 ) ) ( not ( = ?auto_663716 ?auto_663728 ) ) ( not ( = ?auto_663716 ?auto_663729 ) ) ( not ( = ?auto_663716 ?auto_663730 ) ) ( not ( = ?auto_663716 ?auto_663731 ) ) ( not ( = ?auto_663716 ?auto_663732 ) ) ( not ( = ?auto_663717 ?auto_663718 ) ) ( not ( = ?auto_663717 ?auto_663719 ) ) ( not ( = ?auto_663717 ?auto_663720 ) ) ( not ( = ?auto_663717 ?auto_663721 ) ) ( not ( = ?auto_663717 ?auto_663722 ) ) ( not ( = ?auto_663717 ?auto_663723 ) ) ( not ( = ?auto_663717 ?auto_663724 ) ) ( not ( = ?auto_663717 ?auto_663725 ) ) ( not ( = ?auto_663717 ?auto_663726 ) ) ( not ( = ?auto_663717 ?auto_663727 ) ) ( not ( = ?auto_663717 ?auto_663728 ) ) ( not ( = ?auto_663717 ?auto_663729 ) ) ( not ( = ?auto_663717 ?auto_663730 ) ) ( not ( = ?auto_663717 ?auto_663731 ) ) ( not ( = ?auto_663717 ?auto_663732 ) ) ( not ( = ?auto_663718 ?auto_663719 ) ) ( not ( = ?auto_663718 ?auto_663720 ) ) ( not ( = ?auto_663718 ?auto_663721 ) ) ( not ( = ?auto_663718 ?auto_663722 ) ) ( not ( = ?auto_663718 ?auto_663723 ) ) ( not ( = ?auto_663718 ?auto_663724 ) ) ( not ( = ?auto_663718 ?auto_663725 ) ) ( not ( = ?auto_663718 ?auto_663726 ) ) ( not ( = ?auto_663718 ?auto_663727 ) ) ( not ( = ?auto_663718 ?auto_663728 ) ) ( not ( = ?auto_663718 ?auto_663729 ) ) ( not ( = ?auto_663718 ?auto_663730 ) ) ( not ( = ?auto_663718 ?auto_663731 ) ) ( not ( = ?auto_663718 ?auto_663732 ) ) ( not ( = ?auto_663719 ?auto_663720 ) ) ( not ( = ?auto_663719 ?auto_663721 ) ) ( not ( = ?auto_663719 ?auto_663722 ) ) ( not ( = ?auto_663719 ?auto_663723 ) ) ( not ( = ?auto_663719 ?auto_663724 ) ) ( not ( = ?auto_663719 ?auto_663725 ) ) ( not ( = ?auto_663719 ?auto_663726 ) ) ( not ( = ?auto_663719 ?auto_663727 ) ) ( not ( = ?auto_663719 ?auto_663728 ) ) ( not ( = ?auto_663719 ?auto_663729 ) ) ( not ( = ?auto_663719 ?auto_663730 ) ) ( not ( = ?auto_663719 ?auto_663731 ) ) ( not ( = ?auto_663719 ?auto_663732 ) ) ( not ( = ?auto_663720 ?auto_663721 ) ) ( not ( = ?auto_663720 ?auto_663722 ) ) ( not ( = ?auto_663720 ?auto_663723 ) ) ( not ( = ?auto_663720 ?auto_663724 ) ) ( not ( = ?auto_663720 ?auto_663725 ) ) ( not ( = ?auto_663720 ?auto_663726 ) ) ( not ( = ?auto_663720 ?auto_663727 ) ) ( not ( = ?auto_663720 ?auto_663728 ) ) ( not ( = ?auto_663720 ?auto_663729 ) ) ( not ( = ?auto_663720 ?auto_663730 ) ) ( not ( = ?auto_663720 ?auto_663731 ) ) ( not ( = ?auto_663720 ?auto_663732 ) ) ( not ( = ?auto_663721 ?auto_663722 ) ) ( not ( = ?auto_663721 ?auto_663723 ) ) ( not ( = ?auto_663721 ?auto_663724 ) ) ( not ( = ?auto_663721 ?auto_663725 ) ) ( not ( = ?auto_663721 ?auto_663726 ) ) ( not ( = ?auto_663721 ?auto_663727 ) ) ( not ( = ?auto_663721 ?auto_663728 ) ) ( not ( = ?auto_663721 ?auto_663729 ) ) ( not ( = ?auto_663721 ?auto_663730 ) ) ( not ( = ?auto_663721 ?auto_663731 ) ) ( not ( = ?auto_663721 ?auto_663732 ) ) ( not ( = ?auto_663722 ?auto_663723 ) ) ( not ( = ?auto_663722 ?auto_663724 ) ) ( not ( = ?auto_663722 ?auto_663725 ) ) ( not ( = ?auto_663722 ?auto_663726 ) ) ( not ( = ?auto_663722 ?auto_663727 ) ) ( not ( = ?auto_663722 ?auto_663728 ) ) ( not ( = ?auto_663722 ?auto_663729 ) ) ( not ( = ?auto_663722 ?auto_663730 ) ) ( not ( = ?auto_663722 ?auto_663731 ) ) ( not ( = ?auto_663722 ?auto_663732 ) ) ( not ( = ?auto_663723 ?auto_663724 ) ) ( not ( = ?auto_663723 ?auto_663725 ) ) ( not ( = ?auto_663723 ?auto_663726 ) ) ( not ( = ?auto_663723 ?auto_663727 ) ) ( not ( = ?auto_663723 ?auto_663728 ) ) ( not ( = ?auto_663723 ?auto_663729 ) ) ( not ( = ?auto_663723 ?auto_663730 ) ) ( not ( = ?auto_663723 ?auto_663731 ) ) ( not ( = ?auto_663723 ?auto_663732 ) ) ( not ( = ?auto_663724 ?auto_663725 ) ) ( not ( = ?auto_663724 ?auto_663726 ) ) ( not ( = ?auto_663724 ?auto_663727 ) ) ( not ( = ?auto_663724 ?auto_663728 ) ) ( not ( = ?auto_663724 ?auto_663729 ) ) ( not ( = ?auto_663724 ?auto_663730 ) ) ( not ( = ?auto_663724 ?auto_663731 ) ) ( not ( = ?auto_663724 ?auto_663732 ) ) ( not ( = ?auto_663725 ?auto_663726 ) ) ( not ( = ?auto_663725 ?auto_663727 ) ) ( not ( = ?auto_663725 ?auto_663728 ) ) ( not ( = ?auto_663725 ?auto_663729 ) ) ( not ( = ?auto_663725 ?auto_663730 ) ) ( not ( = ?auto_663725 ?auto_663731 ) ) ( not ( = ?auto_663725 ?auto_663732 ) ) ( not ( = ?auto_663726 ?auto_663727 ) ) ( not ( = ?auto_663726 ?auto_663728 ) ) ( not ( = ?auto_663726 ?auto_663729 ) ) ( not ( = ?auto_663726 ?auto_663730 ) ) ( not ( = ?auto_663726 ?auto_663731 ) ) ( not ( = ?auto_663726 ?auto_663732 ) ) ( not ( = ?auto_663727 ?auto_663728 ) ) ( not ( = ?auto_663727 ?auto_663729 ) ) ( not ( = ?auto_663727 ?auto_663730 ) ) ( not ( = ?auto_663727 ?auto_663731 ) ) ( not ( = ?auto_663727 ?auto_663732 ) ) ( not ( = ?auto_663728 ?auto_663729 ) ) ( not ( = ?auto_663728 ?auto_663730 ) ) ( not ( = ?auto_663728 ?auto_663731 ) ) ( not ( = ?auto_663728 ?auto_663732 ) ) ( not ( = ?auto_663729 ?auto_663730 ) ) ( not ( = ?auto_663729 ?auto_663731 ) ) ( not ( = ?auto_663729 ?auto_663732 ) ) ( not ( = ?auto_663730 ?auto_663731 ) ) ( not ( = ?auto_663730 ?auto_663732 ) ) ( not ( = ?auto_663731 ?auto_663732 ) ) ( ON ?auto_663730 ?auto_663731 ) ( ON ?auto_663729 ?auto_663730 ) ( ON ?auto_663728 ?auto_663729 ) ( ON ?auto_663727 ?auto_663728 ) ( ON ?auto_663726 ?auto_663727 ) ( ON ?auto_663725 ?auto_663726 ) ( ON ?auto_663724 ?auto_663725 ) ( ON ?auto_663723 ?auto_663724 ) ( ON ?auto_663722 ?auto_663723 ) ( ON ?auto_663721 ?auto_663722 ) ( ON ?auto_663720 ?auto_663721 ) ( ON ?auto_663719 ?auto_663720 ) ( ON ?auto_663718 ?auto_663719 ) ( CLEAR ?auto_663716 ) ( ON ?auto_663717 ?auto_663718 ) ( CLEAR ?auto_663717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_663716 ?auto_663717 )
      ( MAKE-16PILE ?auto_663716 ?auto_663717 ?auto_663718 ?auto_663719 ?auto_663720 ?auto_663721 ?auto_663722 ?auto_663723 ?auto_663724 ?auto_663725 ?auto_663726 ?auto_663727 ?auto_663728 ?auto_663729 ?auto_663730 ?auto_663731 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_663782 - BLOCK
      ?auto_663783 - BLOCK
      ?auto_663784 - BLOCK
      ?auto_663785 - BLOCK
      ?auto_663786 - BLOCK
      ?auto_663787 - BLOCK
      ?auto_663788 - BLOCK
      ?auto_663789 - BLOCK
      ?auto_663790 - BLOCK
      ?auto_663791 - BLOCK
      ?auto_663792 - BLOCK
      ?auto_663793 - BLOCK
      ?auto_663794 - BLOCK
      ?auto_663795 - BLOCK
      ?auto_663796 - BLOCK
      ?auto_663797 - BLOCK
    )
    :vars
    (
      ?auto_663798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_663797 ?auto_663798 ) ( not ( = ?auto_663782 ?auto_663783 ) ) ( not ( = ?auto_663782 ?auto_663784 ) ) ( not ( = ?auto_663782 ?auto_663785 ) ) ( not ( = ?auto_663782 ?auto_663786 ) ) ( not ( = ?auto_663782 ?auto_663787 ) ) ( not ( = ?auto_663782 ?auto_663788 ) ) ( not ( = ?auto_663782 ?auto_663789 ) ) ( not ( = ?auto_663782 ?auto_663790 ) ) ( not ( = ?auto_663782 ?auto_663791 ) ) ( not ( = ?auto_663782 ?auto_663792 ) ) ( not ( = ?auto_663782 ?auto_663793 ) ) ( not ( = ?auto_663782 ?auto_663794 ) ) ( not ( = ?auto_663782 ?auto_663795 ) ) ( not ( = ?auto_663782 ?auto_663796 ) ) ( not ( = ?auto_663782 ?auto_663797 ) ) ( not ( = ?auto_663782 ?auto_663798 ) ) ( not ( = ?auto_663783 ?auto_663784 ) ) ( not ( = ?auto_663783 ?auto_663785 ) ) ( not ( = ?auto_663783 ?auto_663786 ) ) ( not ( = ?auto_663783 ?auto_663787 ) ) ( not ( = ?auto_663783 ?auto_663788 ) ) ( not ( = ?auto_663783 ?auto_663789 ) ) ( not ( = ?auto_663783 ?auto_663790 ) ) ( not ( = ?auto_663783 ?auto_663791 ) ) ( not ( = ?auto_663783 ?auto_663792 ) ) ( not ( = ?auto_663783 ?auto_663793 ) ) ( not ( = ?auto_663783 ?auto_663794 ) ) ( not ( = ?auto_663783 ?auto_663795 ) ) ( not ( = ?auto_663783 ?auto_663796 ) ) ( not ( = ?auto_663783 ?auto_663797 ) ) ( not ( = ?auto_663783 ?auto_663798 ) ) ( not ( = ?auto_663784 ?auto_663785 ) ) ( not ( = ?auto_663784 ?auto_663786 ) ) ( not ( = ?auto_663784 ?auto_663787 ) ) ( not ( = ?auto_663784 ?auto_663788 ) ) ( not ( = ?auto_663784 ?auto_663789 ) ) ( not ( = ?auto_663784 ?auto_663790 ) ) ( not ( = ?auto_663784 ?auto_663791 ) ) ( not ( = ?auto_663784 ?auto_663792 ) ) ( not ( = ?auto_663784 ?auto_663793 ) ) ( not ( = ?auto_663784 ?auto_663794 ) ) ( not ( = ?auto_663784 ?auto_663795 ) ) ( not ( = ?auto_663784 ?auto_663796 ) ) ( not ( = ?auto_663784 ?auto_663797 ) ) ( not ( = ?auto_663784 ?auto_663798 ) ) ( not ( = ?auto_663785 ?auto_663786 ) ) ( not ( = ?auto_663785 ?auto_663787 ) ) ( not ( = ?auto_663785 ?auto_663788 ) ) ( not ( = ?auto_663785 ?auto_663789 ) ) ( not ( = ?auto_663785 ?auto_663790 ) ) ( not ( = ?auto_663785 ?auto_663791 ) ) ( not ( = ?auto_663785 ?auto_663792 ) ) ( not ( = ?auto_663785 ?auto_663793 ) ) ( not ( = ?auto_663785 ?auto_663794 ) ) ( not ( = ?auto_663785 ?auto_663795 ) ) ( not ( = ?auto_663785 ?auto_663796 ) ) ( not ( = ?auto_663785 ?auto_663797 ) ) ( not ( = ?auto_663785 ?auto_663798 ) ) ( not ( = ?auto_663786 ?auto_663787 ) ) ( not ( = ?auto_663786 ?auto_663788 ) ) ( not ( = ?auto_663786 ?auto_663789 ) ) ( not ( = ?auto_663786 ?auto_663790 ) ) ( not ( = ?auto_663786 ?auto_663791 ) ) ( not ( = ?auto_663786 ?auto_663792 ) ) ( not ( = ?auto_663786 ?auto_663793 ) ) ( not ( = ?auto_663786 ?auto_663794 ) ) ( not ( = ?auto_663786 ?auto_663795 ) ) ( not ( = ?auto_663786 ?auto_663796 ) ) ( not ( = ?auto_663786 ?auto_663797 ) ) ( not ( = ?auto_663786 ?auto_663798 ) ) ( not ( = ?auto_663787 ?auto_663788 ) ) ( not ( = ?auto_663787 ?auto_663789 ) ) ( not ( = ?auto_663787 ?auto_663790 ) ) ( not ( = ?auto_663787 ?auto_663791 ) ) ( not ( = ?auto_663787 ?auto_663792 ) ) ( not ( = ?auto_663787 ?auto_663793 ) ) ( not ( = ?auto_663787 ?auto_663794 ) ) ( not ( = ?auto_663787 ?auto_663795 ) ) ( not ( = ?auto_663787 ?auto_663796 ) ) ( not ( = ?auto_663787 ?auto_663797 ) ) ( not ( = ?auto_663787 ?auto_663798 ) ) ( not ( = ?auto_663788 ?auto_663789 ) ) ( not ( = ?auto_663788 ?auto_663790 ) ) ( not ( = ?auto_663788 ?auto_663791 ) ) ( not ( = ?auto_663788 ?auto_663792 ) ) ( not ( = ?auto_663788 ?auto_663793 ) ) ( not ( = ?auto_663788 ?auto_663794 ) ) ( not ( = ?auto_663788 ?auto_663795 ) ) ( not ( = ?auto_663788 ?auto_663796 ) ) ( not ( = ?auto_663788 ?auto_663797 ) ) ( not ( = ?auto_663788 ?auto_663798 ) ) ( not ( = ?auto_663789 ?auto_663790 ) ) ( not ( = ?auto_663789 ?auto_663791 ) ) ( not ( = ?auto_663789 ?auto_663792 ) ) ( not ( = ?auto_663789 ?auto_663793 ) ) ( not ( = ?auto_663789 ?auto_663794 ) ) ( not ( = ?auto_663789 ?auto_663795 ) ) ( not ( = ?auto_663789 ?auto_663796 ) ) ( not ( = ?auto_663789 ?auto_663797 ) ) ( not ( = ?auto_663789 ?auto_663798 ) ) ( not ( = ?auto_663790 ?auto_663791 ) ) ( not ( = ?auto_663790 ?auto_663792 ) ) ( not ( = ?auto_663790 ?auto_663793 ) ) ( not ( = ?auto_663790 ?auto_663794 ) ) ( not ( = ?auto_663790 ?auto_663795 ) ) ( not ( = ?auto_663790 ?auto_663796 ) ) ( not ( = ?auto_663790 ?auto_663797 ) ) ( not ( = ?auto_663790 ?auto_663798 ) ) ( not ( = ?auto_663791 ?auto_663792 ) ) ( not ( = ?auto_663791 ?auto_663793 ) ) ( not ( = ?auto_663791 ?auto_663794 ) ) ( not ( = ?auto_663791 ?auto_663795 ) ) ( not ( = ?auto_663791 ?auto_663796 ) ) ( not ( = ?auto_663791 ?auto_663797 ) ) ( not ( = ?auto_663791 ?auto_663798 ) ) ( not ( = ?auto_663792 ?auto_663793 ) ) ( not ( = ?auto_663792 ?auto_663794 ) ) ( not ( = ?auto_663792 ?auto_663795 ) ) ( not ( = ?auto_663792 ?auto_663796 ) ) ( not ( = ?auto_663792 ?auto_663797 ) ) ( not ( = ?auto_663792 ?auto_663798 ) ) ( not ( = ?auto_663793 ?auto_663794 ) ) ( not ( = ?auto_663793 ?auto_663795 ) ) ( not ( = ?auto_663793 ?auto_663796 ) ) ( not ( = ?auto_663793 ?auto_663797 ) ) ( not ( = ?auto_663793 ?auto_663798 ) ) ( not ( = ?auto_663794 ?auto_663795 ) ) ( not ( = ?auto_663794 ?auto_663796 ) ) ( not ( = ?auto_663794 ?auto_663797 ) ) ( not ( = ?auto_663794 ?auto_663798 ) ) ( not ( = ?auto_663795 ?auto_663796 ) ) ( not ( = ?auto_663795 ?auto_663797 ) ) ( not ( = ?auto_663795 ?auto_663798 ) ) ( not ( = ?auto_663796 ?auto_663797 ) ) ( not ( = ?auto_663796 ?auto_663798 ) ) ( not ( = ?auto_663797 ?auto_663798 ) ) ( ON ?auto_663796 ?auto_663797 ) ( ON ?auto_663795 ?auto_663796 ) ( ON ?auto_663794 ?auto_663795 ) ( ON ?auto_663793 ?auto_663794 ) ( ON ?auto_663792 ?auto_663793 ) ( ON ?auto_663791 ?auto_663792 ) ( ON ?auto_663790 ?auto_663791 ) ( ON ?auto_663789 ?auto_663790 ) ( ON ?auto_663788 ?auto_663789 ) ( ON ?auto_663787 ?auto_663788 ) ( ON ?auto_663786 ?auto_663787 ) ( ON ?auto_663785 ?auto_663786 ) ( ON ?auto_663784 ?auto_663785 ) ( ON ?auto_663783 ?auto_663784 ) ( ON ?auto_663782 ?auto_663783 ) ( CLEAR ?auto_663782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_663782 )
      ( MAKE-16PILE ?auto_663782 ?auto_663783 ?auto_663784 ?auto_663785 ?auto_663786 ?auto_663787 ?auto_663788 ?auto_663789 ?auto_663790 ?auto_663791 ?auto_663792 ?auto_663793 ?auto_663794 ?auto_663795 ?auto_663796 ?auto_663797 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_663849 - BLOCK
      ?auto_663850 - BLOCK
      ?auto_663851 - BLOCK
      ?auto_663852 - BLOCK
      ?auto_663853 - BLOCK
      ?auto_663854 - BLOCK
      ?auto_663855 - BLOCK
      ?auto_663856 - BLOCK
      ?auto_663857 - BLOCK
      ?auto_663858 - BLOCK
      ?auto_663859 - BLOCK
      ?auto_663860 - BLOCK
      ?auto_663861 - BLOCK
      ?auto_663862 - BLOCK
      ?auto_663863 - BLOCK
      ?auto_663864 - BLOCK
      ?auto_663865 - BLOCK
    )
    :vars
    (
      ?auto_663866 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_663864 ) ( ON ?auto_663865 ?auto_663866 ) ( CLEAR ?auto_663865 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_663849 ) ( ON ?auto_663850 ?auto_663849 ) ( ON ?auto_663851 ?auto_663850 ) ( ON ?auto_663852 ?auto_663851 ) ( ON ?auto_663853 ?auto_663852 ) ( ON ?auto_663854 ?auto_663853 ) ( ON ?auto_663855 ?auto_663854 ) ( ON ?auto_663856 ?auto_663855 ) ( ON ?auto_663857 ?auto_663856 ) ( ON ?auto_663858 ?auto_663857 ) ( ON ?auto_663859 ?auto_663858 ) ( ON ?auto_663860 ?auto_663859 ) ( ON ?auto_663861 ?auto_663860 ) ( ON ?auto_663862 ?auto_663861 ) ( ON ?auto_663863 ?auto_663862 ) ( ON ?auto_663864 ?auto_663863 ) ( not ( = ?auto_663849 ?auto_663850 ) ) ( not ( = ?auto_663849 ?auto_663851 ) ) ( not ( = ?auto_663849 ?auto_663852 ) ) ( not ( = ?auto_663849 ?auto_663853 ) ) ( not ( = ?auto_663849 ?auto_663854 ) ) ( not ( = ?auto_663849 ?auto_663855 ) ) ( not ( = ?auto_663849 ?auto_663856 ) ) ( not ( = ?auto_663849 ?auto_663857 ) ) ( not ( = ?auto_663849 ?auto_663858 ) ) ( not ( = ?auto_663849 ?auto_663859 ) ) ( not ( = ?auto_663849 ?auto_663860 ) ) ( not ( = ?auto_663849 ?auto_663861 ) ) ( not ( = ?auto_663849 ?auto_663862 ) ) ( not ( = ?auto_663849 ?auto_663863 ) ) ( not ( = ?auto_663849 ?auto_663864 ) ) ( not ( = ?auto_663849 ?auto_663865 ) ) ( not ( = ?auto_663849 ?auto_663866 ) ) ( not ( = ?auto_663850 ?auto_663851 ) ) ( not ( = ?auto_663850 ?auto_663852 ) ) ( not ( = ?auto_663850 ?auto_663853 ) ) ( not ( = ?auto_663850 ?auto_663854 ) ) ( not ( = ?auto_663850 ?auto_663855 ) ) ( not ( = ?auto_663850 ?auto_663856 ) ) ( not ( = ?auto_663850 ?auto_663857 ) ) ( not ( = ?auto_663850 ?auto_663858 ) ) ( not ( = ?auto_663850 ?auto_663859 ) ) ( not ( = ?auto_663850 ?auto_663860 ) ) ( not ( = ?auto_663850 ?auto_663861 ) ) ( not ( = ?auto_663850 ?auto_663862 ) ) ( not ( = ?auto_663850 ?auto_663863 ) ) ( not ( = ?auto_663850 ?auto_663864 ) ) ( not ( = ?auto_663850 ?auto_663865 ) ) ( not ( = ?auto_663850 ?auto_663866 ) ) ( not ( = ?auto_663851 ?auto_663852 ) ) ( not ( = ?auto_663851 ?auto_663853 ) ) ( not ( = ?auto_663851 ?auto_663854 ) ) ( not ( = ?auto_663851 ?auto_663855 ) ) ( not ( = ?auto_663851 ?auto_663856 ) ) ( not ( = ?auto_663851 ?auto_663857 ) ) ( not ( = ?auto_663851 ?auto_663858 ) ) ( not ( = ?auto_663851 ?auto_663859 ) ) ( not ( = ?auto_663851 ?auto_663860 ) ) ( not ( = ?auto_663851 ?auto_663861 ) ) ( not ( = ?auto_663851 ?auto_663862 ) ) ( not ( = ?auto_663851 ?auto_663863 ) ) ( not ( = ?auto_663851 ?auto_663864 ) ) ( not ( = ?auto_663851 ?auto_663865 ) ) ( not ( = ?auto_663851 ?auto_663866 ) ) ( not ( = ?auto_663852 ?auto_663853 ) ) ( not ( = ?auto_663852 ?auto_663854 ) ) ( not ( = ?auto_663852 ?auto_663855 ) ) ( not ( = ?auto_663852 ?auto_663856 ) ) ( not ( = ?auto_663852 ?auto_663857 ) ) ( not ( = ?auto_663852 ?auto_663858 ) ) ( not ( = ?auto_663852 ?auto_663859 ) ) ( not ( = ?auto_663852 ?auto_663860 ) ) ( not ( = ?auto_663852 ?auto_663861 ) ) ( not ( = ?auto_663852 ?auto_663862 ) ) ( not ( = ?auto_663852 ?auto_663863 ) ) ( not ( = ?auto_663852 ?auto_663864 ) ) ( not ( = ?auto_663852 ?auto_663865 ) ) ( not ( = ?auto_663852 ?auto_663866 ) ) ( not ( = ?auto_663853 ?auto_663854 ) ) ( not ( = ?auto_663853 ?auto_663855 ) ) ( not ( = ?auto_663853 ?auto_663856 ) ) ( not ( = ?auto_663853 ?auto_663857 ) ) ( not ( = ?auto_663853 ?auto_663858 ) ) ( not ( = ?auto_663853 ?auto_663859 ) ) ( not ( = ?auto_663853 ?auto_663860 ) ) ( not ( = ?auto_663853 ?auto_663861 ) ) ( not ( = ?auto_663853 ?auto_663862 ) ) ( not ( = ?auto_663853 ?auto_663863 ) ) ( not ( = ?auto_663853 ?auto_663864 ) ) ( not ( = ?auto_663853 ?auto_663865 ) ) ( not ( = ?auto_663853 ?auto_663866 ) ) ( not ( = ?auto_663854 ?auto_663855 ) ) ( not ( = ?auto_663854 ?auto_663856 ) ) ( not ( = ?auto_663854 ?auto_663857 ) ) ( not ( = ?auto_663854 ?auto_663858 ) ) ( not ( = ?auto_663854 ?auto_663859 ) ) ( not ( = ?auto_663854 ?auto_663860 ) ) ( not ( = ?auto_663854 ?auto_663861 ) ) ( not ( = ?auto_663854 ?auto_663862 ) ) ( not ( = ?auto_663854 ?auto_663863 ) ) ( not ( = ?auto_663854 ?auto_663864 ) ) ( not ( = ?auto_663854 ?auto_663865 ) ) ( not ( = ?auto_663854 ?auto_663866 ) ) ( not ( = ?auto_663855 ?auto_663856 ) ) ( not ( = ?auto_663855 ?auto_663857 ) ) ( not ( = ?auto_663855 ?auto_663858 ) ) ( not ( = ?auto_663855 ?auto_663859 ) ) ( not ( = ?auto_663855 ?auto_663860 ) ) ( not ( = ?auto_663855 ?auto_663861 ) ) ( not ( = ?auto_663855 ?auto_663862 ) ) ( not ( = ?auto_663855 ?auto_663863 ) ) ( not ( = ?auto_663855 ?auto_663864 ) ) ( not ( = ?auto_663855 ?auto_663865 ) ) ( not ( = ?auto_663855 ?auto_663866 ) ) ( not ( = ?auto_663856 ?auto_663857 ) ) ( not ( = ?auto_663856 ?auto_663858 ) ) ( not ( = ?auto_663856 ?auto_663859 ) ) ( not ( = ?auto_663856 ?auto_663860 ) ) ( not ( = ?auto_663856 ?auto_663861 ) ) ( not ( = ?auto_663856 ?auto_663862 ) ) ( not ( = ?auto_663856 ?auto_663863 ) ) ( not ( = ?auto_663856 ?auto_663864 ) ) ( not ( = ?auto_663856 ?auto_663865 ) ) ( not ( = ?auto_663856 ?auto_663866 ) ) ( not ( = ?auto_663857 ?auto_663858 ) ) ( not ( = ?auto_663857 ?auto_663859 ) ) ( not ( = ?auto_663857 ?auto_663860 ) ) ( not ( = ?auto_663857 ?auto_663861 ) ) ( not ( = ?auto_663857 ?auto_663862 ) ) ( not ( = ?auto_663857 ?auto_663863 ) ) ( not ( = ?auto_663857 ?auto_663864 ) ) ( not ( = ?auto_663857 ?auto_663865 ) ) ( not ( = ?auto_663857 ?auto_663866 ) ) ( not ( = ?auto_663858 ?auto_663859 ) ) ( not ( = ?auto_663858 ?auto_663860 ) ) ( not ( = ?auto_663858 ?auto_663861 ) ) ( not ( = ?auto_663858 ?auto_663862 ) ) ( not ( = ?auto_663858 ?auto_663863 ) ) ( not ( = ?auto_663858 ?auto_663864 ) ) ( not ( = ?auto_663858 ?auto_663865 ) ) ( not ( = ?auto_663858 ?auto_663866 ) ) ( not ( = ?auto_663859 ?auto_663860 ) ) ( not ( = ?auto_663859 ?auto_663861 ) ) ( not ( = ?auto_663859 ?auto_663862 ) ) ( not ( = ?auto_663859 ?auto_663863 ) ) ( not ( = ?auto_663859 ?auto_663864 ) ) ( not ( = ?auto_663859 ?auto_663865 ) ) ( not ( = ?auto_663859 ?auto_663866 ) ) ( not ( = ?auto_663860 ?auto_663861 ) ) ( not ( = ?auto_663860 ?auto_663862 ) ) ( not ( = ?auto_663860 ?auto_663863 ) ) ( not ( = ?auto_663860 ?auto_663864 ) ) ( not ( = ?auto_663860 ?auto_663865 ) ) ( not ( = ?auto_663860 ?auto_663866 ) ) ( not ( = ?auto_663861 ?auto_663862 ) ) ( not ( = ?auto_663861 ?auto_663863 ) ) ( not ( = ?auto_663861 ?auto_663864 ) ) ( not ( = ?auto_663861 ?auto_663865 ) ) ( not ( = ?auto_663861 ?auto_663866 ) ) ( not ( = ?auto_663862 ?auto_663863 ) ) ( not ( = ?auto_663862 ?auto_663864 ) ) ( not ( = ?auto_663862 ?auto_663865 ) ) ( not ( = ?auto_663862 ?auto_663866 ) ) ( not ( = ?auto_663863 ?auto_663864 ) ) ( not ( = ?auto_663863 ?auto_663865 ) ) ( not ( = ?auto_663863 ?auto_663866 ) ) ( not ( = ?auto_663864 ?auto_663865 ) ) ( not ( = ?auto_663864 ?auto_663866 ) ) ( not ( = ?auto_663865 ?auto_663866 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_663865 ?auto_663866 )
      ( !STACK ?auto_663865 ?auto_663864 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_663884 - BLOCK
      ?auto_663885 - BLOCK
      ?auto_663886 - BLOCK
      ?auto_663887 - BLOCK
      ?auto_663888 - BLOCK
      ?auto_663889 - BLOCK
      ?auto_663890 - BLOCK
      ?auto_663891 - BLOCK
      ?auto_663892 - BLOCK
      ?auto_663893 - BLOCK
      ?auto_663894 - BLOCK
      ?auto_663895 - BLOCK
      ?auto_663896 - BLOCK
      ?auto_663897 - BLOCK
      ?auto_663898 - BLOCK
      ?auto_663899 - BLOCK
      ?auto_663900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_663899 ) ( ON-TABLE ?auto_663900 ) ( CLEAR ?auto_663900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_663884 ) ( ON ?auto_663885 ?auto_663884 ) ( ON ?auto_663886 ?auto_663885 ) ( ON ?auto_663887 ?auto_663886 ) ( ON ?auto_663888 ?auto_663887 ) ( ON ?auto_663889 ?auto_663888 ) ( ON ?auto_663890 ?auto_663889 ) ( ON ?auto_663891 ?auto_663890 ) ( ON ?auto_663892 ?auto_663891 ) ( ON ?auto_663893 ?auto_663892 ) ( ON ?auto_663894 ?auto_663893 ) ( ON ?auto_663895 ?auto_663894 ) ( ON ?auto_663896 ?auto_663895 ) ( ON ?auto_663897 ?auto_663896 ) ( ON ?auto_663898 ?auto_663897 ) ( ON ?auto_663899 ?auto_663898 ) ( not ( = ?auto_663884 ?auto_663885 ) ) ( not ( = ?auto_663884 ?auto_663886 ) ) ( not ( = ?auto_663884 ?auto_663887 ) ) ( not ( = ?auto_663884 ?auto_663888 ) ) ( not ( = ?auto_663884 ?auto_663889 ) ) ( not ( = ?auto_663884 ?auto_663890 ) ) ( not ( = ?auto_663884 ?auto_663891 ) ) ( not ( = ?auto_663884 ?auto_663892 ) ) ( not ( = ?auto_663884 ?auto_663893 ) ) ( not ( = ?auto_663884 ?auto_663894 ) ) ( not ( = ?auto_663884 ?auto_663895 ) ) ( not ( = ?auto_663884 ?auto_663896 ) ) ( not ( = ?auto_663884 ?auto_663897 ) ) ( not ( = ?auto_663884 ?auto_663898 ) ) ( not ( = ?auto_663884 ?auto_663899 ) ) ( not ( = ?auto_663884 ?auto_663900 ) ) ( not ( = ?auto_663885 ?auto_663886 ) ) ( not ( = ?auto_663885 ?auto_663887 ) ) ( not ( = ?auto_663885 ?auto_663888 ) ) ( not ( = ?auto_663885 ?auto_663889 ) ) ( not ( = ?auto_663885 ?auto_663890 ) ) ( not ( = ?auto_663885 ?auto_663891 ) ) ( not ( = ?auto_663885 ?auto_663892 ) ) ( not ( = ?auto_663885 ?auto_663893 ) ) ( not ( = ?auto_663885 ?auto_663894 ) ) ( not ( = ?auto_663885 ?auto_663895 ) ) ( not ( = ?auto_663885 ?auto_663896 ) ) ( not ( = ?auto_663885 ?auto_663897 ) ) ( not ( = ?auto_663885 ?auto_663898 ) ) ( not ( = ?auto_663885 ?auto_663899 ) ) ( not ( = ?auto_663885 ?auto_663900 ) ) ( not ( = ?auto_663886 ?auto_663887 ) ) ( not ( = ?auto_663886 ?auto_663888 ) ) ( not ( = ?auto_663886 ?auto_663889 ) ) ( not ( = ?auto_663886 ?auto_663890 ) ) ( not ( = ?auto_663886 ?auto_663891 ) ) ( not ( = ?auto_663886 ?auto_663892 ) ) ( not ( = ?auto_663886 ?auto_663893 ) ) ( not ( = ?auto_663886 ?auto_663894 ) ) ( not ( = ?auto_663886 ?auto_663895 ) ) ( not ( = ?auto_663886 ?auto_663896 ) ) ( not ( = ?auto_663886 ?auto_663897 ) ) ( not ( = ?auto_663886 ?auto_663898 ) ) ( not ( = ?auto_663886 ?auto_663899 ) ) ( not ( = ?auto_663886 ?auto_663900 ) ) ( not ( = ?auto_663887 ?auto_663888 ) ) ( not ( = ?auto_663887 ?auto_663889 ) ) ( not ( = ?auto_663887 ?auto_663890 ) ) ( not ( = ?auto_663887 ?auto_663891 ) ) ( not ( = ?auto_663887 ?auto_663892 ) ) ( not ( = ?auto_663887 ?auto_663893 ) ) ( not ( = ?auto_663887 ?auto_663894 ) ) ( not ( = ?auto_663887 ?auto_663895 ) ) ( not ( = ?auto_663887 ?auto_663896 ) ) ( not ( = ?auto_663887 ?auto_663897 ) ) ( not ( = ?auto_663887 ?auto_663898 ) ) ( not ( = ?auto_663887 ?auto_663899 ) ) ( not ( = ?auto_663887 ?auto_663900 ) ) ( not ( = ?auto_663888 ?auto_663889 ) ) ( not ( = ?auto_663888 ?auto_663890 ) ) ( not ( = ?auto_663888 ?auto_663891 ) ) ( not ( = ?auto_663888 ?auto_663892 ) ) ( not ( = ?auto_663888 ?auto_663893 ) ) ( not ( = ?auto_663888 ?auto_663894 ) ) ( not ( = ?auto_663888 ?auto_663895 ) ) ( not ( = ?auto_663888 ?auto_663896 ) ) ( not ( = ?auto_663888 ?auto_663897 ) ) ( not ( = ?auto_663888 ?auto_663898 ) ) ( not ( = ?auto_663888 ?auto_663899 ) ) ( not ( = ?auto_663888 ?auto_663900 ) ) ( not ( = ?auto_663889 ?auto_663890 ) ) ( not ( = ?auto_663889 ?auto_663891 ) ) ( not ( = ?auto_663889 ?auto_663892 ) ) ( not ( = ?auto_663889 ?auto_663893 ) ) ( not ( = ?auto_663889 ?auto_663894 ) ) ( not ( = ?auto_663889 ?auto_663895 ) ) ( not ( = ?auto_663889 ?auto_663896 ) ) ( not ( = ?auto_663889 ?auto_663897 ) ) ( not ( = ?auto_663889 ?auto_663898 ) ) ( not ( = ?auto_663889 ?auto_663899 ) ) ( not ( = ?auto_663889 ?auto_663900 ) ) ( not ( = ?auto_663890 ?auto_663891 ) ) ( not ( = ?auto_663890 ?auto_663892 ) ) ( not ( = ?auto_663890 ?auto_663893 ) ) ( not ( = ?auto_663890 ?auto_663894 ) ) ( not ( = ?auto_663890 ?auto_663895 ) ) ( not ( = ?auto_663890 ?auto_663896 ) ) ( not ( = ?auto_663890 ?auto_663897 ) ) ( not ( = ?auto_663890 ?auto_663898 ) ) ( not ( = ?auto_663890 ?auto_663899 ) ) ( not ( = ?auto_663890 ?auto_663900 ) ) ( not ( = ?auto_663891 ?auto_663892 ) ) ( not ( = ?auto_663891 ?auto_663893 ) ) ( not ( = ?auto_663891 ?auto_663894 ) ) ( not ( = ?auto_663891 ?auto_663895 ) ) ( not ( = ?auto_663891 ?auto_663896 ) ) ( not ( = ?auto_663891 ?auto_663897 ) ) ( not ( = ?auto_663891 ?auto_663898 ) ) ( not ( = ?auto_663891 ?auto_663899 ) ) ( not ( = ?auto_663891 ?auto_663900 ) ) ( not ( = ?auto_663892 ?auto_663893 ) ) ( not ( = ?auto_663892 ?auto_663894 ) ) ( not ( = ?auto_663892 ?auto_663895 ) ) ( not ( = ?auto_663892 ?auto_663896 ) ) ( not ( = ?auto_663892 ?auto_663897 ) ) ( not ( = ?auto_663892 ?auto_663898 ) ) ( not ( = ?auto_663892 ?auto_663899 ) ) ( not ( = ?auto_663892 ?auto_663900 ) ) ( not ( = ?auto_663893 ?auto_663894 ) ) ( not ( = ?auto_663893 ?auto_663895 ) ) ( not ( = ?auto_663893 ?auto_663896 ) ) ( not ( = ?auto_663893 ?auto_663897 ) ) ( not ( = ?auto_663893 ?auto_663898 ) ) ( not ( = ?auto_663893 ?auto_663899 ) ) ( not ( = ?auto_663893 ?auto_663900 ) ) ( not ( = ?auto_663894 ?auto_663895 ) ) ( not ( = ?auto_663894 ?auto_663896 ) ) ( not ( = ?auto_663894 ?auto_663897 ) ) ( not ( = ?auto_663894 ?auto_663898 ) ) ( not ( = ?auto_663894 ?auto_663899 ) ) ( not ( = ?auto_663894 ?auto_663900 ) ) ( not ( = ?auto_663895 ?auto_663896 ) ) ( not ( = ?auto_663895 ?auto_663897 ) ) ( not ( = ?auto_663895 ?auto_663898 ) ) ( not ( = ?auto_663895 ?auto_663899 ) ) ( not ( = ?auto_663895 ?auto_663900 ) ) ( not ( = ?auto_663896 ?auto_663897 ) ) ( not ( = ?auto_663896 ?auto_663898 ) ) ( not ( = ?auto_663896 ?auto_663899 ) ) ( not ( = ?auto_663896 ?auto_663900 ) ) ( not ( = ?auto_663897 ?auto_663898 ) ) ( not ( = ?auto_663897 ?auto_663899 ) ) ( not ( = ?auto_663897 ?auto_663900 ) ) ( not ( = ?auto_663898 ?auto_663899 ) ) ( not ( = ?auto_663898 ?auto_663900 ) ) ( not ( = ?auto_663899 ?auto_663900 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_663900 )
      ( !STACK ?auto_663900 ?auto_663899 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_663918 - BLOCK
      ?auto_663919 - BLOCK
      ?auto_663920 - BLOCK
      ?auto_663921 - BLOCK
      ?auto_663922 - BLOCK
      ?auto_663923 - BLOCK
      ?auto_663924 - BLOCK
      ?auto_663925 - BLOCK
      ?auto_663926 - BLOCK
      ?auto_663927 - BLOCK
      ?auto_663928 - BLOCK
      ?auto_663929 - BLOCK
      ?auto_663930 - BLOCK
      ?auto_663931 - BLOCK
      ?auto_663932 - BLOCK
      ?auto_663933 - BLOCK
      ?auto_663934 - BLOCK
    )
    :vars
    (
      ?auto_663935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_663934 ?auto_663935 ) ( ON-TABLE ?auto_663918 ) ( ON ?auto_663919 ?auto_663918 ) ( ON ?auto_663920 ?auto_663919 ) ( ON ?auto_663921 ?auto_663920 ) ( ON ?auto_663922 ?auto_663921 ) ( ON ?auto_663923 ?auto_663922 ) ( ON ?auto_663924 ?auto_663923 ) ( ON ?auto_663925 ?auto_663924 ) ( ON ?auto_663926 ?auto_663925 ) ( ON ?auto_663927 ?auto_663926 ) ( ON ?auto_663928 ?auto_663927 ) ( ON ?auto_663929 ?auto_663928 ) ( ON ?auto_663930 ?auto_663929 ) ( ON ?auto_663931 ?auto_663930 ) ( ON ?auto_663932 ?auto_663931 ) ( not ( = ?auto_663918 ?auto_663919 ) ) ( not ( = ?auto_663918 ?auto_663920 ) ) ( not ( = ?auto_663918 ?auto_663921 ) ) ( not ( = ?auto_663918 ?auto_663922 ) ) ( not ( = ?auto_663918 ?auto_663923 ) ) ( not ( = ?auto_663918 ?auto_663924 ) ) ( not ( = ?auto_663918 ?auto_663925 ) ) ( not ( = ?auto_663918 ?auto_663926 ) ) ( not ( = ?auto_663918 ?auto_663927 ) ) ( not ( = ?auto_663918 ?auto_663928 ) ) ( not ( = ?auto_663918 ?auto_663929 ) ) ( not ( = ?auto_663918 ?auto_663930 ) ) ( not ( = ?auto_663918 ?auto_663931 ) ) ( not ( = ?auto_663918 ?auto_663932 ) ) ( not ( = ?auto_663918 ?auto_663933 ) ) ( not ( = ?auto_663918 ?auto_663934 ) ) ( not ( = ?auto_663918 ?auto_663935 ) ) ( not ( = ?auto_663919 ?auto_663920 ) ) ( not ( = ?auto_663919 ?auto_663921 ) ) ( not ( = ?auto_663919 ?auto_663922 ) ) ( not ( = ?auto_663919 ?auto_663923 ) ) ( not ( = ?auto_663919 ?auto_663924 ) ) ( not ( = ?auto_663919 ?auto_663925 ) ) ( not ( = ?auto_663919 ?auto_663926 ) ) ( not ( = ?auto_663919 ?auto_663927 ) ) ( not ( = ?auto_663919 ?auto_663928 ) ) ( not ( = ?auto_663919 ?auto_663929 ) ) ( not ( = ?auto_663919 ?auto_663930 ) ) ( not ( = ?auto_663919 ?auto_663931 ) ) ( not ( = ?auto_663919 ?auto_663932 ) ) ( not ( = ?auto_663919 ?auto_663933 ) ) ( not ( = ?auto_663919 ?auto_663934 ) ) ( not ( = ?auto_663919 ?auto_663935 ) ) ( not ( = ?auto_663920 ?auto_663921 ) ) ( not ( = ?auto_663920 ?auto_663922 ) ) ( not ( = ?auto_663920 ?auto_663923 ) ) ( not ( = ?auto_663920 ?auto_663924 ) ) ( not ( = ?auto_663920 ?auto_663925 ) ) ( not ( = ?auto_663920 ?auto_663926 ) ) ( not ( = ?auto_663920 ?auto_663927 ) ) ( not ( = ?auto_663920 ?auto_663928 ) ) ( not ( = ?auto_663920 ?auto_663929 ) ) ( not ( = ?auto_663920 ?auto_663930 ) ) ( not ( = ?auto_663920 ?auto_663931 ) ) ( not ( = ?auto_663920 ?auto_663932 ) ) ( not ( = ?auto_663920 ?auto_663933 ) ) ( not ( = ?auto_663920 ?auto_663934 ) ) ( not ( = ?auto_663920 ?auto_663935 ) ) ( not ( = ?auto_663921 ?auto_663922 ) ) ( not ( = ?auto_663921 ?auto_663923 ) ) ( not ( = ?auto_663921 ?auto_663924 ) ) ( not ( = ?auto_663921 ?auto_663925 ) ) ( not ( = ?auto_663921 ?auto_663926 ) ) ( not ( = ?auto_663921 ?auto_663927 ) ) ( not ( = ?auto_663921 ?auto_663928 ) ) ( not ( = ?auto_663921 ?auto_663929 ) ) ( not ( = ?auto_663921 ?auto_663930 ) ) ( not ( = ?auto_663921 ?auto_663931 ) ) ( not ( = ?auto_663921 ?auto_663932 ) ) ( not ( = ?auto_663921 ?auto_663933 ) ) ( not ( = ?auto_663921 ?auto_663934 ) ) ( not ( = ?auto_663921 ?auto_663935 ) ) ( not ( = ?auto_663922 ?auto_663923 ) ) ( not ( = ?auto_663922 ?auto_663924 ) ) ( not ( = ?auto_663922 ?auto_663925 ) ) ( not ( = ?auto_663922 ?auto_663926 ) ) ( not ( = ?auto_663922 ?auto_663927 ) ) ( not ( = ?auto_663922 ?auto_663928 ) ) ( not ( = ?auto_663922 ?auto_663929 ) ) ( not ( = ?auto_663922 ?auto_663930 ) ) ( not ( = ?auto_663922 ?auto_663931 ) ) ( not ( = ?auto_663922 ?auto_663932 ) ) ( not ( = ?auto_663922 ?auto_663933 ) ) ( not ( = ?auto_663922 ?auto_663934 ) ) ( not ( = ?auto_663922 ?auto_663935 ) ) ( not ( = ?auto_663923 ?auto_663924 ) ) ( not ( = ?auto_663923 ?auto_663925 ) ) ( not ( = ?auto_663923 ?auto_663926 ) ) ( not ( = ?auto_663923 ?auto_663927 ) ) ( not ( = ?auto_663923 ?auto_663928 ) ) ( not ( = ?auto_663923 ?auto_663929 ) ) ( not ( = ?auto_663923 ?auto_663930 ) ) ( not ( = ?auto_663923 ?auto_663931 ) ) ( not ( = ?auto_663923 ?auto_663932 ) ) ( not ( = ?auto_663923 ?auto_663933 ) ) ( not ( = ?auto_663923 ?auto_663934 ) ) ( not ( = ?auto_663923 ?auto_663935 ) ) ( not ( = ?auto_663924 ?auto_663925 ) ) ( not ( = ?auto_663924 ?auto_663926 ) ) ( not ( = ?auto_663924 ?auto_663927 ) ) ( not ( = ?auto_663924 ?auto_663928 ) ) ( not ( = ?auto_663924 ?auto_663929 ) ) ( not ( = ?auto_663924 ?auto_663930 ) ) ( not ( = ?auto_663924 ?auto_663931 ) ) ( not ( = ?auto_663924 ?auto_663932 ) ) ( not ( = ?auto_663924 ?auto_663933 ) ) ( not ( = ?auto_663924 ?auto_663934 ) ) ( not ( = ?auto_663924 ?auto_663935 ) ) ( not ( = ?auto_663925 ?auto_663926 ) ) ( not ( = ?auto_663925 ?auto_663927 ) ) ( not ( = ?auto_663925 ?auto_663928 ) ) ( not ( = ?auto_663925 ?auto_663929 ) ) ( not ( = ?auto_663925 ?auto_663930 ) ) ( not ( = ?auto_663925 ?auto_663931 ) ) ( not ( = ?auto_663925 ?auto_663932 ) ) ( not ( = ?auto_663925 ?auto_663933 ) ) ( not ( = ?auto_663925 ?auto_663934 ) ) ( not ( = ?auto_663925 ?auto_663935 ) ) ( not ( = ?auto_663926 ?auto_663927 ) ) ( not ( = ?auto_663926 ?auto_663928 ) ) ( not ( = ?auto_663926 ?auto_663929 ) ) ( not ( = ?auto_663926 ?auto_663930 ) ) ( not ( = ?auto_663926 ?auto_663931 ) ) ( not ( = ?auto_663926 ?auto_663932 ) ) ( not ( = ?auto_663926 ?auto_663933 ) ) ( not ( = ?auto_663926 ?auto_663934 ) ) ( not ( = ?auto_663926 ?auto_663935 ) ) ( not ( = ?auto_663927 ?auto_663928 ) ) ( not ( = ?auto_663927 ?auto_663929 ) ) ( not ( = ?auto_663927 ?auto_663930 ) ) ( not ( = ?auto_663927 ?auto_663931 ) ) ( not ( = ?auto_663927 ?auto_663932 ) ) ( not ( = ?auto_663927 ?auto_663933 ) ) ( not ( = ?auto_663927 ?auto_663934 ) ) ( not ( = ?auto_663927 ?auto_663935 ) ) ( not ( = ?auto_663928 ?auto_663929 ) ) ( not ( = ?auto_663928 ?auto_663930 ) ) ( not ( = ?auto_663928 ?auto_663931 ) ) ( not ( = ?auto_663928 ?auto_663932 ) ) ( not ( = ?auto_663928 ?auto_663933 ) ) ( not ( = ?auto_663928 ?auto_663934 ) ) ( not ( = ?auto_663928 ?auto_663935 ) ) ( not ( = ?auto_663929 ?auto_663930 ) ) ( not ( = ?auto_663929 ?auto_663931 ) ) ( not ( = ?auto_663929 ?auto_663932 ) ) ( not ( = ?auto_663929 ?auto_663933 ) ) ( not ( = ?auto_663929 ?auto_663934 ) ) ( not ( = ?auto_663929 ?auto_663935 ) ) ( not ( = ?auto_663930 ?auto_663931 ) ) ( not ( = ?auto_663930 ?auto_663932 ) ) ( not ( = ?auto_663930 ?auto_663933 ) ) ( not ( = ?auto_663930 ?auto_663934 ) ) ( not ( = ?auto_663930 ?auto_663935 ) ) ( not ( = ?auto_663931 ?auto_663932 ) ) ( not ( = ?auto_663931 ?auto_663933 ) ) ( not ( = ?auto_663931 ?auto_663934 ) ) ( not ( = ?auto_663931 ?auto_663935 ) ) ( not ( = ?auto_663932 ?auto_663933 ) ) ( not ( = ?auto_663932 ?auto_663934 ) ) ( not ( = ?auto_663932 ?auto_663935 ) ) ( not ( = ?auto_663933 ?auto_663934 ) ) ( not ( = ?auto_663933 ?auto_663935 ) ) ( not ( = ?auto_663934 ?auto_663935 ) ) ( CLEAR ?auto_663932 ) ( ON ?auto_663933 ?auto_663934 ) ( CLEAR ?auto_663933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_663918 ?auto_663919 ?auto_663920 ?auto_663921 ?auto_663922 ?auto_663923 ?auto_663924 ?auto_663925 ?auto_663926 ?auto_663927 ?auto_663928 ?auto_663929 ?auto_663930 ?auto_663931 ?auto_663932 ?auto_663933 )
      ( MAKE-17PILE ?auto_663918 ?auto_663919 ?auto_663920 ?auto_663921 ?auto_663922 ?auto_663923 ?auto_663924 ?auto_663925 ?auto_663926 ?auto_663927 ?auto_663928 ?auto_663929 ?auto_663930 ?auto_663931 ?auto_663932 ?auto_663933 ?auto_663934 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_663953 - BLOCK
      ?auto_663954 - BLOCK
      ?auto_663955 - BLOCK
      ?auto_663956 - BLOCK
      ?auto_663957 - BLOCK
      ?auto_663958 - BLOCK
      ?auto_663959 - BLOCK
      ?auto_663960 - BLOCK
      ?auto_663961 - BLOCK
      ?auto_663962 - BLOCK
      ?auto_663963 - BLOCK
      ?auto_663964 - BLOCK
      ?auto_663965 - BLOCK
      ?auto_663966 - BLOCK
      ?auto_663967 - BLOCK
      ?auto_663968 - BLOCK
      ?auto_663969 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_663969 ) ( ON-TABLE ?auto_663953 ) ( ON ?auto_663954 ?auto_663953 ) ( ON ?auto_663955 ?auto_663954 ) ( ON ?auto_663956 ?auto_663955 ) ( ON ?auto_663957 ?auto_663956 ) ( ON ?auto_663958 ?auto_663957 ) ( ON ?auto_663959 ?auto_663958 ) ( ON ?auto_663960 ?auto_663959 ) ( ON ?auto_663961 ?auto_663960 ) ( ON ?auto_663962 ?auto_663961 ) ( ON ?auto_663963 ?auto_663962 ) ( ON ?auto_663964 ?auto_663963 ) ( ON ?auto_663965 ?auto_663964 ) ( ON ?auto_663966 ?auto_663965 ) ( ON ?auto_663967 ?auto_663966 ) ( not ( = ?auto_663953 ?auto_663954 ) ) ( not ( = ?auto_663953 ?auto_663955 ) ) ( not ( = ?auto_663953 ?auto_663956 ) ) ( not ( = ?auto_663953 ?auto_663957 ) ) ( not ( = ?auto_663953 ?auto_663958 ) ) ( not ( = ?auto_663953 ?auto_663959 ) ) ( not ( = ?auto_663953 ?auto_663960 ) ) ( not ( = ?auto_663953 ?auto_663961 ) ) ( not ( = ?auto_663953 ?auto_663962 ) ) ( not ( = ?auto_663953 ?auto_663963 ) ) ( not ( = ?auto_663953 ?auto_663964 ) ) ( not ( = ?auto_663953 ?auto_663965 ) ) ( not ( = ?auto_663953 ?auto_663966 ) ) ( not ( = ?auto_663953 ?auto_663967 ) ) ( not ( = ?auto_663953 ?auto_663968 ) ) ( not ( = ?auto_663953 ?auto_663969 ) ) ( not ( = ?auto_663954 ?auto_663955 ) ) ( not ( = ?auto_663954 ?auto_663956 ) ) ( not ( = ?auto_663954 ?auto_663957 ) ) ( not ( = ?auto_663954 ?auto_663958 ) ) ( not ( = ?auto_663954 ?auto_663959 ) ) ( not ( = ?auto_663954 ?auto_663960 ) ) ( not ( = ?auto_663954 ?auto_663961 ) ) ( not ( = ?auto_663954 ?auto_663962 ) ) ( not ( = ?auto_663954 ?auto_663963 ) ) ( not ( = ?auto_663954 ?auto_663964 ) ) ( not ( = ?auto_663954 ?auto_663965 ) ) ( not ( = ?auto_663954 ?auto_663966 ) ) ( not ( = ?auto_663954 ?auto_663967 ) ) ( not ( = ?auto_663954 ?auto_663968 ) ) ( not ( = ?auto_663954 ?auto_663969 ) ) ( not ( = ?auto_663955 ?auto_663956 ) ) ( not ( = ?auto_663955 ?auto_663957 ) ) ( not ( = ?auto_663955 ?auto_663958 ) ) ( not ( = ?auto_663955 ?auto_663959 ) ) ( not ( = ?auto_663955 ?auto_663960 ) ) ( not ( = ?auto_663955 ?auto_663961 ) ) ( not ( = ?auto_663955 ?auto_663962 ) ) ( not ( = ?auto_663955 ?auto_663963 ) ) ( not ( = ?auto_663955 ?auto_663964 ) ) ( not ( = ?auto_663955 ?auto_663965 ) ) ( not ( = ?auto_663955 ?auto_663966 ) ) ( not ( = ?auto_663955 ?auto_663967 ) ) ( not ( = ?auto_663955 ?auto_663968 ) ) ( not ( = ?auto_663955 ?auto_663969 ) ) ( not ( = ?auto_663956 ?auto_663957 ) ) ( not ( = ?auto_663956 ?auto_663958 ) ) ( not ( = ?auto_663956 ?auto_663959 ) ) ( not ( = ?auto_663956 ?auto_663960 ) ) ( not ( = ?auto_663956 ?auto_663961 ) ) ( not ( = ?auto_663956 ?auto_663962 ) ) ( not ( = ?auto_663956 ?auto_663963 ) ) ( not ( = ?auto_663956 ?auto_663964 ) ) ( not ( = ?auto_663956 ?auto_663965 ) ) ( not ( = ?auto_663956 ?auto_663966 ) ) ( not ( = ?auto_663956 ?auto_663967 ) ) ( not ( = ?auto_663956 ?auto_663968 ) ) ( not ( = ?auto_663956 ?auto_663969 ) ) ( not ( = ?auto_663957 ?auto_663958 ) ) ( not ( = ?auto_663957 ?auto_663959 ) ) ( not ( = ?auto_663957 ?auto_663960 ) ) ( not ( = ?auto_663957 ?auto_663961 ) ) ( not ( = ?auto_663957 ?auto_663962 ) ) ( not ( = ?auto_663957 ?auto_663963 ) ) ( not ( = ?auto_663957 ?auto_663964 ) ) ( not ( = ?auto_663957 ?auto_663965 ) ) ( not ( = ?auto_663957 ?auto_663966 ) ) ( not ( = ?auto_663957 ?auto_663967 ) ) ( not ( = ?auto_663957 ?auto_663968 ) ) ( not ( = ?auto_663957 ?auto_663969 ) ) ( not ( = ?auto_663958 ?auto_663959 ) ) ( not ( = ?auto_663958 ?auto_663960 ) ) ( not ( = ?auto_663958 ?auto_663961 ) ) ( not ( = ?auto_663958 ?auto_663962 ) ) ( not ( = ?auto_663958 ?auto_663963 ) ) ( not ( = ?auto_663958 ?auto_663964 ) ) ( not ( = ?auto_663958 ?auto_663965 ) ) ( not ( = ?auto_663958 ?auto_663966 ) ) ( not ( = ?auto_663958 ?auto_663967 ) ) ( not ( = ?auto_663958 ?auto_663968 ) ) ( not ( = ?auto_663958 ?auto_663969 ) ) ( not ( = ?auto_663959 ?auto_663960 ) ) ( not ( = ?auto_663959 ?auto_663961 ) ) ( not ( = ?auto_663959 ?auto_663962 ) ) ( not ( = ?auto_663959 ?auto_663963 ) ) ( not ( = ?auto_663959 ?auto_663964 ) ) ( not ( = ?auto_663959 ?auto_663965 ) ) ( not ( = ?auto_663959 ?auto_663966 ) ) ( not ( = ?auto_663959 ?auto_663967 ) ) ( not ( = ?auto_663959 ?auto_663968 ) ) ( not ( = ?auto_663959 ?auto_663969 ) ) ( not ( = ?auto_663960 ?auto_663961 ) ) ( not ( = ?auto_663960 ?auto_663962 ) ) ( not ( = ?auto_663960 ?auto_663963 ) ) ( not ( = ?auto_663960 ?auto_663964 ) ) ( not ( = ?auto_663960 ?auto_663965 ) ) ( not ( = ?auto_663960 ?auto_663966 ) ) ( not ( = ?auto_663960 ?auto_663967 ) ) ( not ( = ?auto_663960 ?auto_663968 ) ) ( not ( = ?auto_663960 ?auto_663969 ) ) ( not ( = ?auto_663961 ?auto_663962 ) ) ( not ( = ?auto_663961 ?auto_663963 ) ) ( not ( = ?auto_663961 ?auto_663964 ) ) ( not ( = ?auto_663961 ?auto_663965 ) ) ( not ( = ?auto_663961 ?auto_663966 ) ) ( not ( = ?auto_663961 ?auto_663967 ) ) ( not ( = ?auto_663961 ?auto_663968 ) ) ( not ( = ?auto_663961 ?auto_663969 ) ) ( not ( = ?auto_663962 ?auto_663963 ) ) ( not ( = ?auto_663962 ?auto_663964 ) ) ( not ( = ?auto_663962 ?auto_663965 ) ) ( not ( = ?auto_663962 ?auto_663966 ) ) ( not ( = ?auto_663962 ?auto_663967 ) ) ( not ( = ?auto_663962 ?auto_663968 ) ) ( not ( = ?auto_663962 ?auto_663969 ) ) ( not ( = ?auto_663963 ?auto_663964 ) ) ( not ( = ?auto_663963 ?auto_663965 ) ) ( not ( = ?auto_663963 ?auto_663966 ) ) ( not ( = ?auto_663963 ?auto_663967 ) ) ( not ( = ?auto_663963 ?auto_663968 ) ) ( not ( = ?auto_663963 ?auto_663969 ) ) ( not ( = ?auto_663964 ?auto_663965 ) ) ( not ( = ?auto_663964 ?auto_663966 ) ) ( not ( = ?auto_663964 ?auto_663967 ) ) ( not ( = ?auto_663964 ?auto_663968 ) ) ( not ( = ?auto_663964 ?auto_663969 ) ) ( not ( = ?auto_663965 ?auto_663966 ) ) ( not ( = ?auto_663965 ?auto_663967 ) ) ( not ( = ?auto_663965 ?auto_663968 ) ) ( not ( = ?auto_663965 ?auto_663969 ) ) ( not ( = ?auto_663966 ?auto_663967 ) ) ( not ( = ?auto_663966 ?auto_663968 ) ) ( not ( = ?auto_663966 ?auto_663969 ) ) ( not ( = ?auto_663967 ?auto_663968 ) ) ( not ( = ?auto_663967 ?auto_663969 ) ) ( not ( = ?auto_663968 ?auto_663969 ) ) ( CLEAR ?auto_663967 ) ( ON ?auto_663968 ?auto_663969 ) ( CLEAR ?auto_663968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_663953 ?auto_663954 ?auto_663955 ?auto_663956 ?auto_663957 ?auto_663958 ?auto_663959 ?auto_663960 ?auto_663961 ?auto_663962 ?auto_663963 ?auto_663964 ?auto_663965 ?auto_663966 ?auto_663967 ?auto_663968 )
      ( MAKE-17PILE ?auto_663953 ?auto_663954 ?auto_663955 ?auto_663956 ?auto_663957 ?auto_663958 ?auto_663959 ?auto_663960 ?auto_663961 ?auto_663962 ?auto_663963 ?auto_663964 ?auto_663965 ?auto_663966 ?auto_663967 ?auto_663968 ?auto_663969 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_663987 - BLOCK
      ?auto_663988 - BLOCK
      ?auto_663989 - BLOCK
      ?auto_663990 - BLOCK
      ?auto_663991 - BLOCK
      ?auto_663992 - BLOCK
      ?auto_663993 - BLOCK
      ?auto_663994 - BLOCK
      ?auto_663995 - BLOCK
      ?auto_663996 - BLOCK
      ?auto_663997 - BLOCK
      ?auto_663998 - BLOCK
      ?auto_663999 - BLOCK
      ?auto_664000 - BLOCK
      ?auto_664001 - BLOCK
      ?auto_664002 - BLOCK
      ?auto_664003 - BLOCK
    )
    :vars
    (
      ?auto_664004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664003 ?auto_664004 ) ( ON-TABLE ?auto_663987 ) ( ON ?auto_663988 ?auto_663987 ) ( ON ?auto_663989 ?auto_663988 ) ( ON ?auto_663990 ?auto_663989 ) ( ON ?auto_663991 ?auto_663990 ) ( ON ?auto_663992 ?auto_663991 ) ( ON ?auto_663993 ?auto_663992 ) ( ON ?auto_663994 ?auto_663993 ) ( ON ?auto_663995 ?auto_663994 ) ( ON ?auto_663996 ?auto_663995 ) ( ON ?auto_663997 ?auto_663996 ) ( ON ?auto_663998 ?auto_663997 ) ( ON ?auto_663999 ?auto_663998 ) ( ON ?auto_664000 ?auto_663999 ) ( not ( = ?auto_663987 ?auto_663988 ) ) ( not ( = ?auto_663987 ?auto_663989 ) ) ( not ( = ?auto_663987 ?auto_663990 ) ) ( not ( = ?auto_663987 ?auto_663991 ) ) ( not ( = ?auto_663987 ?auto_663992 ) ) ( not ( = ?auto_663987 ?auto_663993 ) ) ( not ( = ?auto_663987 ?auto_663994 ) ) ( not ( = ?auto_663987 ?auto_663995 ) ) ( not ( = ?auto_663987 ?auto_663996 ) ) ( not ( = ?auto_663987 ?auto_663997 ) ) ( not ( = ?auto_663987 ?auto_663998 ) ) ( not ( = ?auto_663987 ?auto_663999 ) ) ( not ( = ?auto_663987 ?auto_664000 ) ) ( not ( = ?auto_663987 ?auto_664001 ) ) ( not ( = ?auto_663987 ?auto_664002 ) ) ( not ( = ?auto_663987 ?auto_664003 ) ) ( not ( = ?auto_663987 ?auto_664004 ) ) ( not ( = ?auto_663988 ?auto_663989 ) ) ( not ( = ?auto_663988 ?auto_663990 ) ) ( not ( = ?auto_663988 ?auto_663991 ) ) ( not ( = ?auto_663988 ?auto_663992 ) ) ( not ( = ?auto_663988 ?auto_663993 ) ) ( not ( = ?auto_663988 ?auto_663994 ) ) ( not ( = ?auto_663988 ?auto_663995 ) ) ( not ( = ?auto_663988 ?auto_663996 ) ) ( not ( = ?auto_663988 ?auto_663997 ) ) ( not ( = ?auto_663988 ?auto_663998 ) ) ( not ( = ?auto_663988 ?auto_663999 ) ) ( not ( = ?auto_663988 ?auto_664000 ) ) ( not ( = ?auto_663988 ?auto_664001 ) ) ( not ( = ?auto_663988 ?auto_664002 ) ) ( not ( = ?auto_663988 ?auto_664003 ) ) ( not ( = ?auto_663988 ?auto_664004 ) ) ( not ( = ?auto_663989 ?auto_663990 ) ) ( not ( = ?auto_663989 ?auto_663991 ) ) ( not ( = ?auto_663989 ?auto_663992 ) ) ( not ( = ?auto_663989 ?auto_663993 ) ) ( not ( = ?auto_663989 ?auto_663994 ) ) ( not ( = ?auto_663989 ?auto_663995 ) ) ( not ( = ?auto_663989 ?auto_663996 ) ) ( not ( = ?auto_663989 ?auto_663997 ) ) ( not ( = ?auto_663989 ?auto_663998 ) ) ( not ( = ?auto_663989 ?auto_663999 ) ) ( not ( = ?auto_663989 ?auto_664000 ) ) ( not ( = ?auto_663989 ?auto_664001 ) ) ( not ( = ?auto_663989 ?auto_664002 ) ) ( not ( = ?auto_663989 ?auto_664003 ) ) ( not ( = ?auto_663989 ?auto_664004 ) ) ( not ( = ?auto_663990 ?auto_663991 ) ) ( not ( = ?auto_663990 ?auto_663992 ) ) ( not ( = ?auto_663990 ?auto_663993 ) ) ( not ( = ?auto_663990 ?auto_663994 ) ) ( not ( = ?auto_663990 ?auto_663995 ) ) ( not ( = ?auto_663990 ?auto_663996 ) ) ( not ( = ?auto_663990 ?auto_663997 ) ) ( not ( = ?auto_663990 ?auto_663998 ) ) ( not ( = ?auto_663990 ?auto_663999 ) ) ( not ( = ?auto_663990 ?auto_664000 ) ) ( not ( = ?auto_663990 ?auto_664001 ) ) ( not ( = ?auto_663990 ?auto_664002 ) ) ( not ( = ?auto_663990 ?auto_664003 ) ) ( not ( = ?auto_663990 ?auto_664004 ) ) ( not ( = ?auto_663991 ?auto_663992 ) ) ( not ( = ?auto_663991 ?auto_663993 ) ) ( not ( = ?auto_663991 ?auto_663994 ) ) ( not ( = ?auto_663991 ?auto_663995 ) ) ( not ( = ?auto_663991 ?auto_663996 ) ) ( not ( = ?auto_663991 ?auto_663997 ) ) ( not ( = ?auto_663991 ?auto_663998 ) ) ( not ( = ?auto_663991 ?auto_663999 ) ) ( not ( = ?auto_663991 ?auto_664000 ) ) ( not ( = ?auto_663991 ?auto_664001 ) ) ( not ( = ?auto_663991 ?auto_664002 ) ) ( not ( = ?auto_663991 ?auto_664003 ) ) ( not ( = ?auto_663991 ?auto_664004 ) ) ( not ( = ?auto_663992 ?auto_663993 ) ) ( not ( = ?auto_663992 ?auto_663994 ) ) ( not ( = ?auto_663992 ?auto_663995 ) ) ( not ( = ?auto_663992 ?auto_663996 ) ) ( not ( = ?auto_663992 ?auto_663997 ) ) ( not ( = ?auto_663992 ?auto_663998 ) ) ( not ( = ?auto_663992 ?auto_663999 ) ) ( not ( = ?auto_663992 ?auto_664000 ) ) ( not ( = ?auto_663992 ?auto_664001 ) ) ( not ( = ?auto_663992 ?auto_664002 ) ) ( not ( = ?auto_663992 ?auto_664003 ) ) ( not ( = ?auto_663992 ?auto_664004 ) ) ( not ( = ?auto_663993 ?auto_663994 ) ) ( not ( = ?auto_663993 ?auto_663995 ) ) ( not ( = ?auto_663993 ?auto_663996 ) ) ( not ( = ?auto_663993 ?auto_663997 ) ) ( not ( = ?auto_663993 ?auto_663998 ) ) ( not ( = ?auto_663993 ?auto_663999 ) ) ( not ( = ?auto_663993 ?auto_664000 ) ) ( not ( = ?auto_663993 ?auto_664001 ) ) ( not ( = ?auto_663993 ?auto_664002 ) ) ( not ( = ?auto_663993 ?auto_664003 ) ) ( not ( = ?auto_663993 ?auto_664004 ) ) ( not ( = ?auto_663994 ?auto_663995 ) ) ( not ( = ?auto_663994 ?auto_663996 ) ) ( not ( = ?auto_663994 ?auto_663997 ) ) ( not ( = ?auto_663994 ?auto_663998 ) ) ( not ( = ?auto_663994 ?auto_663999 ) ) ( not ( = ?auto_663994 ?auto_664000 ) ) ( not ( = ?auto_663994 ?auto_664001 ) ) ( not ( = ?auto_663994 ?auto_664002 ) ) ( not ( = ?auto_663994 ?auto_664003 ) ) ( not ( = ?auto_663994 ?auto_664004 ) ) ( not ( = ?auto_663995 ?auto_663996 ) ) ( not ( = ?auto_663995 ?auto_663997 ) ) ( not ( = ?auto_663995 ?auto_663998 ) ) ( not ( = ?auto_663995 ?auto_663999 ) ) ( not ( = ?auto_663995 ?auto_664000 ) ) ( not ( = ?auto_663995 ?auto_664001 ) ) ( not ( = ?auto_663995 ?auto_664002 ) ) ( not ( = ?auto_663995 ?auto_664003 ) ) ( not ( = ?auto_663995 ?auto_664004 ) ) ( not ( = ?auto_663996 ?auto_663997 ) ) ( not ( = ?auto_663996 ?auto_663998 ) ) ( not ( = ?auto_663996 ?auto_663999 ) ) ( not ( = ?auto_663996 ?auto_664000 ) ) ( not ( = ?auto_663996 ?auto_664001 ) ) ( not ( = ?auto_663996 ?auto_664002 ) ) ( not ( = ?auto_663996 ?auto_664003 ) ) ( not ( = ?auto_663996 ?auto_664004 ) ) ( not ( = ?auto_663997 ?auto_663998 ) ) ( not ( = ?auto_663997 ?auto_663999 ) ) ( not ( = ?auto_663997 ?auto_664000 ) ) ( not ( = ?auto_663997 ?auto_664001 ) ) ( not ( = ?auto_663997 ?auto_664002 ) ) ( not ( = ?auto_663997 ?auto_664003 ) ) ( not ( = ?auto_663997 ?auto_664004 ) ) ( not ( = ?auto_663998 ?auto_663999 ) ) ( not ( = ?auto_663998 ?auto_664000 ) ) ( not ( = ?auto_663998 ?auto_664001 ) ) ( not ( = ?auto_663998 ?auto_664002 ) ) ( not ( = ?auto_663998 ?auto_664003 ) ) ( not ( = ?auto_663998 ?auto_664004 ) ) ( not ( = ?auto_663999 ?auto_664000 ) ) ( not ( = ?auto_663999 ?auto_664001 ) ) ( not ( = ?auto_663999 ?auto_664002 ) ) ( not ( = ?auto_663999 ?auto_664003 ) ) ( not ( = ?auto_663999 ?auto_664004 ) ) ( not ( = ?auto_664000 ?auto_664001 ) ) ( not ( = ?auto_664000 ?auto_664002 ) ) ( not ( = ?auto_664000 ?auto_664003 ) ) ( not ( = ?auto_664000 ?auto_664004 ) ) ( not ( = ?auto_664001 ?auto_664002 ) ) ( not ( = ?auto_664001 ?auto_664003 ) ) ( not ( = ?auto_664001 ?auto_664004 ) ) ( not ( = ?auto_664002 ?auto_664003 ) ) ( not ( = ?auto_664002 ?auto_664004 ) ) ( not ( = ?auto_664003 ?auto_664004 ) ) ( ON ?auto_664002 ?auto_664003 ) ( CLEAR ?auto_664000 ) ( ON ?auto_664001 ?auto_664002 ) ( CLEAR ?auto_664001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_663987 ?auto_663988 ?auto_663989 ?auto_663990 ?auto_663991 ?auto_663992 ?auto_663993 ?auto_663994 ?auto_663995 ?auto_663996 ?auto_663997 ?auto_663998 ?auto_663999 ?auto_664000 ?auto_664001 )
      ( MAKE-17PILE ?auto_663987 ?auto_663988 ?auto_663989 ?auto_663990 ?auto_663991 ?auto_663992 ?auto_663993 ?auto_663994 ?auto_663995 ?auto_663996 ?auto_663997 ?auto_663998 ?auto_663999 ?auto_664000 ?auto_664001 ?auto_664002 ?auto_664003 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664022 - BLOCK
      ?auto_664023 - BLOCK
      ?auto_664024 - BLOCK
      ?auto_664025 - BLOCK
      ?auto_664026 - BLOCK
      ?auto_664027 - BLOCK
      ?auto_664028 - BLOCK
      ?auto_664029 - BLOCK
      ?auto_664030 - BLOCK
      ?auto_664031 - BLOCK
      ?auto_664032 - BLOCK
      ?auto_664033 - BLOCK
      ?auto_664034 - BLOCK
      ?auto_664035 - BLOCK
      ?auto_664036 - BLOCK
      ?auto_664037 - BLOCK
      ?auto_664038 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_664038 ) ( ON-TABLE ?auto_664022 ) ( ON ?auto_664023 ?auto_664022 ) ( ON ?auto_664024 ?auto_664023 ) ( ON ?auto_664025 ?auto_664024 ) ( ON ?auto_664026 ?auto_664025 ) ( ON ?auto_664027 ?auto_664026 ) ( ON ?auto_664028 ?auto_664027 ) ( ON ?auto_664029 ?auto_664028 ) ( ON ?auto_664030 ?auto_664029 ) ( ON ?auto_664031 ?auto_664030 ) ( ON ?auto_664032 ?auto_664031 ) ( ON ?auto_664033 ?auto_664032 ) ( ON ?auto_664034 ?auto_664033 ) ( ON ?auto_664035 ?auto_664034 ) ( not ( = ?auto_664022 ?auto_664023 ) ) ( not ( = ?auto_664022 ?auto_664024 ) ) ( not ( = ?auto_664022 ?auto_664025 ) ) ( not ( = ?auto_664022 ?auto_664026 ) ) ( not ( = ?auto_664022 ?auto_664027 ) ) ( not ( = ?auto_664022 ?auto_664028 ) ) ( not ( = ?auto_664022 ?auto_664029 ) ) ( not ( = ?auto_664022 ?auto_664030 ) ) ( not ( = ?auto_664022 ?auto_664031 ) ) ( not ( = ?auto_664022 ?auto_664032 ) ) ( not ( = ?auto_664022 ?auto_664033 ) ) ( not ( = ?auto_664022 ?auto_664034 ) ) ( not ( = ?auto_664022 ?auto_664035 ) ) ( not ( = ?auto_664022 ?auto_664036 ) ) ( not ( = ?auto_664022 ?auto_664037 ) ) ( not ( = ?auto_664022 ?auto_664038 ) ) ( not ( = ?auto_664023 ?auto_664024 ) ) ( not ( = ?auto_664023 ?auto_664025 ) ) ( not ( = ?auto_664023 ?auto_664026 ) ) ( not ( = ?auto_664023 ?auto_664027 ) ) ( not ( = ?auto_664023 ?auto_664028 ) ) ( not ( = ?auto_664023 ?auto_664029 ) ) ( not ( = ?auto_664023 ?auto_664030 ) ) ( not ( = ?auto_664023 ?auto_664031 ) ) ( not ( = ?auto_664023 ?auto_664032 ) ) ( not ( = ?auto_664023 ?auto_664033 ) ) ( not ( = ?auto_664023 ?auto_664034 ) ) ( not ( = ?auto_664023 ?auto_664035 ) ) ( not ( = ?auto_664023 ?auto_664036 ) ) ( not ( = ?auto_664023 ?auto_664037 ) ) ( not ( = ?auto_664023 ?auto_664038 ) ) ( not ( = ?auto_664024 ?auto_664025 ) ) ( not ( = ?auto_664024 ?auto_664026 ) ) ( not ( = ?auto_664024 ?auto_664027 ) ) ( not ( = ?auto_664024 ?auto_664028 ) ) ( not ( = ?auto_664024 ?auto_664029 ) ) ( not ( = ?auto_664024 ?auto_664030 ) ) ( not ( = ?auto_664024 ?auto_664031 ) ) ( not ( = ?auto_664024 ?auto_664032 ) ) ( not ( = ?auto_664024 ?auto_664033 ) ) ( not ( = ?auto_664024 ?auto_664034 ) ) ( not ( = ?auto_664024 ?auto_664035 ) ) ( not ( = ?auto_664024 ?auto_664036 ) ) ( not ( = ?auto_664024 ?auto_664037 ) ) ( not ( = ?auto_664024 ?auto_664038 ) ) ( not ( = ?auto_664025 ?auto_664026 ) ) ( not ( = ?auto_664025 ?auto_664027 ) ) ( not ( = ?auto_664025 ?auto_664028 ) ) ( not ( = ?auto_664025 ?auto_664029 ) ) ( not ( = ?auto_664025 ?auto_664030 ) ) ( not ( = ?auto_664025 ?auto_664031 ) ) ( not ( = ?auto_664025 ?auto_664032 ) ) ( not ( = ?auto_664025 ?auto_664033 ) ) ( not ( = ?auto_664025 ?auto_664034 ) ) ( not ( = ?auto_664025 ?auto_664035 ) ) ( not ( = ?auto_664025 ?auto_664036 ) ) ( not ( = ?auto_664025 ?auto_664037 ) ) ( not ( = ?auto_664025 ?auto_664038 ) ) ( not ( = ?auto_664026 ?auto_664027 ) ) ( not ( = ?auto_664026 ?auto_664028 ) ) ( not ( = ?auto_664026 ?auto_664029 ) ) ( not ( = ?auto_664026 ?auto_664030 ) ) ( not ( = ?auto_664026 ?auto_664031 ) ) ( not ( = ?auto_664026 ?auto_664032 ) ) ( not ( = ?auto_664026 ?auto_664033 ) ) ( not ( = ?auto_664026 ?auto_664034 ) ) ( not ( = ?auto_664026 ?auto_664035 ) ) ( not ( = ?auto_664026 ?auto_664036 ) ) ( not ( = ?auto_664026 ?auto_664037 ) ) ( not ( = ?auto_664026 ?auto_664038 ) ) ( not ( = ?auto_664027 ?auto_664028 ) ) ( not ( = ?auto_664027 ?auto_664029 ) ) ( not ( = ?auto_664027 ?auto_664030 ) ) ( not ( = ?auto_664027 ?auto_664031 ) ) ( not ( = ?auto_664027 ?auto_664032 ) ) ( not ( = ?auto_664027 ?auto_664033 ) ) ( not ( = ?auto_664027 ?auto_664034 ) ) ( not ( = ?auto_664027 ?auto_664035 ) ) ( not ( = ?auto_664027 ?auto_664036 ) ) ( not ( = ?auto_664027 ?auto_664037 ) ) ( not ( = ?auto_664027 ?auto_664038 ) ) ( not ( = ?auto_664028 ?auto_664029 ) ) ( not ( = ?auto_664028 ?auto_664030 ) ) ( not ( = ?auto_664028 ?auto_664031 ) ) ( not ( = ?auto_664028 ?auto_664032 ) ) ( not ( = ?auto_664028 ?auto_664033 ) ) ( not ( = ?auto_664028 ?auto_664034 ) ) ( not ( = ?auto_664028 ?auto_664035 ) ) ( not ( = ?auto_664028 ?auto_664036 ) ) ( not ( = ?auto_664028 ?auto_664037 ) ) ( not ( = ?auto_664028 ?auto_664038 ) ) ( not ( = ?auto_664029 ?auto_664030 ) ) ( not ( = ?auto_664029 ?auto_664031 ) ) ( not ( = ?auto_664029 ?auto_664032 ) ) ( not ( = ?auto_664029 ?auto_664033 ) ) ( not ( = ?auto_664029 ?auto_664034 ) ) ( not ( = ?auto_664029 ?auto_664035 ) ) ( not ( = ?auto_664029 ?auto_664036 ) ) ( not ( = ?auto_664029 ?auto_664037 ) ) ( not ( = ?auto_664029 ?auto_664038 ) ) ( not ( = ?auto_664030 ?auto_664031 ) ) ( not ( = ?auto_664030 ?auto_664032 ) ) ( not ( = ?auto_664030 ?auto_664033 ) ) ( not ( = ?auto_664030 ?auto_664034 ) ) ( not ( = ?auto_664030 ?auto_664035 ) ) ( not ( = ?auto_664030 ?auto_664036 ) ) ( not ( = ?auto_664030 ?auto_664037 ) ) ( not ( = ?auto_664030 ?auto_664038 ) ) ( not ( = ?auto_664031 ?auto_664032 ) ) ( not ( = ?auto_664031 ?auto_664033 ) ) ( not ( = ?auto_664031 ?auto_664034 ) ) ( not ( = ?auto_664031 ?auto_664035 ) ) ( not ( = ?auto_664031 ?auto_664036 ) ) ( not ( = ?auto_664031 ?auto_664037 ) ) ( not ( = ?auto_664031 ?auto_664038 ) ) ( not ( = ?auto_664032 ?auto_664033 ) ) ( not ( = ?auto_664032 ?auto_664034 ) ) ( not ( = ?auto_664032 ?auto_664035 ) ) ( not ( = ?auto_664032 ?auto_664036 ) ) ( not ( = ?auto_664032 ?auto_664037 ) ) ( not ( = ?auto_664032 ?auto_664038 ) ) ( not ( = ?auto_664033 ?auto_664034 ) ) ( not ( = ?auto_664033 ?auto_664035 ) ) ( not ( = ?auto_664033 ?auto_664036 ) ) ( not ( = ?auto_664033 ?auto_664037 ) ) ( not ( = ?auto_664033 ?auto_664038 ) ) ( not ( = ?auto_664034 ?auto_664035 ) ) ( not ( = ?auto_664034 ?auto_664036 ) ) ( not ( = ?auto_664034 ?auto_664037 ) ) ( not ( = ?auto_664034 ?auto_664038 ) ) ( not ( = ?auto_664035 ?auto_664036 ) ) ( not ( = ?auto_664035 ?auto_664037 ) ) ( not ( = ?auto_664035 ?auto_664038 ) ) ( not ( = ?auto_664036 ?auto_664037 ) ) ( not ( = ?auto_664036 ?auto_664038 ) ) ( not ( = ?auto_664037 ?auto_664038 ) ) ( ON ?auto_664037 ?auto_664038 ) ( CLEAR ?auto_664035 ) ( ON ?auto_664036 ?auto_664037 ) ( CLEAR ?auto_664036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_664022 ?auto_664023 ?auto_664024 ?auto_664025 ?auto_664026 ?auto_664027 ?auto_664028 ?auto_664029 ?auto_664030 ?auto_664031 ?auto_664032 ?auto_664033 ?auto_664034 ?auto_664035 ?auto_664036 )
      ( MAKE-17PILE ?auto_664022 ?auto_664023 ?auto_664024 ?auto_664025 ?auto_664026 ?auto_664027 ?auto_664028 ?auto_664029 ?auto_664030 ?auto_664031 ?auto_664032 ?auto_664033 ?auto_664034 ?auto_664035 ?auto_664036 ?auto_664037 ?auto_664038 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664056 - BLOCK
      ?auto_664057 - BLOCK
      ?auto_664058 - BLOCK
      ?auto_664059 - BLOCK
      ?auto_664060 - BLOCK
      ?auto_664061 - BLOCK
      ?auto_664062 - BLOCK
      ?auto_664063 - BLOCK
      ?auto_664064 - BLOCK
      ?auto_664065 - BLOCK
      ?auto_664066 - BLOCK
      ?auto_664067 - BLOCK
      ?auto_664068 - BLOCK
      ?auto_664069 - BLOCK
      ?auto_664070 - BLOCK
      ?auto_664071 - BLOCK
      ?auto_664072 - BLOCK
    )
    :vars
    (
      ?auto_664073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664072 ?auto_664073 ) ( ON-TABLE ?auto_664056 ) ( ON ?auto_664057 ?auto_664056 ) ( ON ?auto_664058 ?auto_664057 ) ( ON ?auto_664059 ?auto_664058 ) ( ON ?auto_664060 ?auto_664059 ) ( ON ?auto_664061 ?auto_664060 ) ( ON ?auto_664062 ?auto_664061 ) ( ON ?auto_664063 ?auto_664062 ) ( ON ?auto_664064 ?auto_664063 ) ( ON ?auto_664065 ?auto_664064 ) ( ON ?auto_664066 ?auto_664065 ) ( ON ?auto_664067 ?auto_664066 ) ( ON ?auto_664068 ?auto_664067 ) ( not ( = ?auto_664056 ?auto_664057 ) ) ( not ( = ?auto_664056 ?auto_664058 ) ) ( not ( = ?auto_664056 ?auto_664059 ) ) ( not ( = ?auto_664056 ?auto_664060 ) ) ( not ( = ?auto_664056 ?auto_664061 ) ) ( not ( = ?auto_664056 ?auto_664062 ) ) ( not ( = ?auto_664056 ?auto_664063 ) ) ( not ( = ?auto_664056 ?auto_664064 ) ) ( not ( = ?auto_664056 ?auto_664065 ) ) ( not ( = ?auto_664056 ?auto_664066 ) ) ( not ( = ?auto_664056 ?auto_664067 ) ) ( not ( = ?auto_664056 ?auto_664068 ) ) ( not ( = ?auto_664056 ?auto_664069 ) ) ( not ( = ?auto_664056 ?auto_664070 ) ) ( not ( = ?auto_664056 ?auto_664071 ) ) ( not ( = ?auto_664056 ?auto_664072 ) ) ( not ( = ?auto_664056 ?auto_664073 ) ) ( not ( = ?auto_664057 ?auto_664058 ) ) ( not ( = ?auto_664057 ?auto_664059 ) ) ( not ( = ?auto_664057 ?auto_664060 ) ) ( not ( = ?auto_664057 ?auto_664061 ) ) ( not ( = ?auto_664057 ?auto_664062 ) ) ( not ( = ?auto_664057 ?auto_664063 ) ) ( not ( = ?auto_664057 ?auto_664064 ) ) ( not ( = ?auto_664057 ?auto_664065 ) ) ( not ( = ?auto_664057 ?auto_664066 ) ) ( not ( = ?auto_664057 ?auto_664067 ) ) ( not ( = ?auto_664057 ?auto_664068 ) ) ( not ( = ?auto_664057 ?auto_664069 ) ) ( not ( = ?auto_664057 ?auto_664070 ) ) ( not ( = ?auto_664057 ?auto_664071 ) ) ( not ( = ?auto_664057 ?auto_664072 ) ) ( not ( = ?auto_664057 ?auto_664073 ) ) ( not ( = ?auto_664058 ?auto_664059 ) ) ( not ( = ?auto_664058 ?auto_664060 ) ) ( not ( = ?auto_664058 ?auto_664061 ) ) ( not ( = ?auto_664058 ?auto_664062 ) ) ( not ( = ?auto_664058 ?auto_664063 ) ) ( not ( = ?auto_664058 ?auto_664064 ) ) ( not ( = ?auto_664058 ?auto_664065 ) ) ( not ( = ?auto_664058 ?auto_664066 ) ) ( not ( = ?auto_664058 ?auto_664067 ) ) ( not ( = ?auto_664058 ?auto_664068 ) ) ( not ( = ?auto_664058 ?auto_664069 ) ) ( not ( = ?auto_664058 ?auto_664070 ) ) ( not ( = ?auto_664058 ?auto_664071 ) ) ( not ( = ?auto_664058 ?auto_664072 ) ) ( not ( = ?auto_664058 ?auto_664073 ) ) ( not ( = ?auto_664059 ?auto_664060 ) ) ( not ( = ?auto_664059 ?auto_664061 ) ) ( not ( = ?auto_664059 ?auto_664062 ) ) ( not ( = ?auto_664059 ?auto_664063 ) ) ( not ( = ?auto_664059 ?auto_664064 ) ) ( not ( = ?auto_664059 ?auto_664065 ) ) ( not ( = ?auto_664059 ?auto_664066 ) ) ( not ( = ?auto_664059 ?auto_664067 ) ) ( not ( = ?auto_664059 ?auto_664068 ) ) ( not ( = ?auto_664059 ?auto_664069 ) ) ( not ( = ?auto_664059 ?auto_664070 ) ) ( not ( = ?auto_664059 ?auto_664071 ) ) ( not ( = ?auto_664059 ?auto_664072 ) ) ( not ( = ?auto_664059 ?auto_664073 ) ) ( not ( = ?auto_664060 ?auto_664061 ) ) ( not ( = ?auto_664060 ?auto_664062 ) ) ( not ( = ?auto_664060 ?auto_664063 ) ) ( not ( = ?auto_664060 ?auto_664064 ) ) ( not ( = ?auto_664060 ?auto_664065 ) ) ( not ( = ?auto_664060 ?auto_664066 ) ) ( not ( = ?auto_664060 ?auto_664067 ) ) ( not ( = ?auto_664060 ?auto_664068 ) ) ( not ( = ?auto_664060 ?auto_664069 ) ) ( not ( = ?auto_664060 ?auto_664070 ) ) ( not ( = ?auto_664060 ?auto_664071 ) ) ( not ( = ?auto_664060 ?auto_664072 ) ) ( not ( = ?auto_664060 ?auto_664073 ) ) ( not ( = ?auto_664061 ?auto_664062 ) ) ( not ( = ?auto_664061 ?auto_664063 ) ) ( not ( = ?auto_664061 ?auto_664064 ) ) ( not ( = ?auto_664061 ?auto_664065 ) ) ( not ( = ?auto_664061 ?auto_664066 ) ) ( not ( = ?auto_664061 ?auto_664067 ) ) ( not ( = ?auto_664061 ?auto_664068 ) ) ( not ( = ?auto_664061 ?auto_664069 ) ) ( not ( = ?auto_664061 ?auto_664070 ) ) ( not ( = ?auto_664061 ?auto_664071 ) ) ( not ( = ?auto_664061 ?auto_664072 ) ) ( not ( = ?auto_664061 ?auto_664073 ) ) ( not ( = ?auto_664062 ?auto_664063 ) ) ( not ( = ?auto_664062 ?auto_664064 ) ) ( not ( = ?auto_664062 ?auto_664065 ) ) ( not ( = ?auto_664062 ?auto_664066 ) ) ( not ( = ?auto_664062 ?auto_664067 ) ) ( not ( = ?auto_664062 ?auto_664068 ) ) ( not ( = ?auto_664062 ?auto_664069 ) ) ( not ( = ?auto_664062 ?auto_664070 ) ) ( not ( = ?auto_664062 ?auto_664071 ) ) ( not ( = ?auto_664062 ?auto_664072 ) ) ( not ( = ?auto_664062 ?auto_664073 ) ) ( not ( = ?auto_664063 ?auto_664064 ) ) ( not ( = ?auto_664063 ?auto_664065 ) ) ( not ( = ?auto_664063 ?auto_664066 ) ) ( not ( = ?auto_664063 ?auto_664067 ) ) ( not ( = ?auto_664063 ?auto_664068 ) ) ( not ( = ?auto_664063 ?auto_664069 ) ) ( not ( = ?auto_664063 ?auto_664070 ) ) ( not ( = ?auto_664063 ?auto_664071 ) ) ( not ( = ?auto_664063 ?auto_664072 ) ) ( not ( = ?auto_664063 ?auto_664073 ) ) ( not ( = ?auto_664064 ?auto_664065 ) ) ( not ( = ?auto_664064 ?auto_664066 ) ) ( not ( = ?auto_664064 ?auto_664067 ) ) ( not ( = ?auto_664064 ?auto_664068 ) ) ( not ( = ?auto_664064 ?auto_664069 ) ) ( not ( = ?auto_664064 ?auto_664070 ) ) ( not ( = ?auto_664064 ?auto_664071 ) ) ( not ( = ?auto_664064 ?auto_664072 ) ) ( not ( = ?auto_664064 ?auto_664073 ) ) ( not ( = ?auto_664065 ?auto_664066 ) ) ( not ( = ?auto_664065 ?auto_664067 ) ) ( not ( = ?auto_664065 ?auto_664068 ) ) ( not ( = ?auto_664065 ?auto_664069 ) ) ( not ( = ?auto_664065 ?auto_664070 ) ) ( not ( = ?auto_664065 ?auto_664071 ) ) ( not ( = ?auto_664065 ?auto_664072 ) ) ( not ( = ?auto_664065 ?auto_664073 ) ) ( not ( = ?auto_664066 ?auto_664067 ) ) ( not ( = ?auto_664066 ?auto_664068 ) ) ( not ( = ?auto_664066 ?auto_664069 ) ) ( not ( = ?auto_664066 ?auto_664070 ) ) ( not ( = ?auto_664066 ?auto_664071 ) ) ( not ( = ?auto_664066 ?auto_664072 ) ) ( not ( = ?auto_664066 ?auto_664073 ) ) ( not ( = ?auto_664067 ?auto_664068 ) ) ( not ( = ?auto_664067 ?auto_664069 ) ) ( not ( = ?auto_664067 ?auto_664070 ) ) ( not ( = ?auto_664067 ?auto_664071 ) ) ( not ( = ?auto_664067 ?auto_664072 ) ) ( not ( = ?auto_664067 ?auto_664073 ) ) ( not ( = ?auto_664068 ?auto_664069 ) ) ( not ( = ?auto_664068 ?auto_664070 ) ) ( not ( = ?auto_664068 ?auto_664071 ) ) ( not ( = ?auto_664068 ?auto_664072 ) ) ( not ( = ?auto_664068 ?auto_664073 ) ) ( not ( = ?auto_664069 ?auto_664070 ) ) ( not ( = ?auto_664069 ?auto_664071 ) ) ( not ( = ?auto_664069 ?auto_664072 ) ) ( not ( = ?auto_664069 ?auto_664073 ) ) ( not ( = ?auto_664070 ?auto_664071 ) ) ( not ( = ?auto_664070 ?auto_664072 ) ) ( not ( = ?auto_664070 ?auto_664073 ) ) ( not ( = ?auto_664071 ?auto_664072 ) ) ( not ( = ?auto_664071 ?auto_664073 ) ) ( not ( = ?auto_664072 ?auto_664073 ) ) ( ON ?auto_664071 ?auto_664072 ) ( ON ?auto_664070 ?auto_664071 ) ( CLEAR ?auto_664068 ) ( ON ?auto_664069 ?auto_664070 ) ( CLEAR ?auto_664069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_664056 ?auto_664057 ?auto_664058 ?auto_664059 ?auto_664060 ?auto_664061 ?auto_664062 ?auto_664063 ?auto_664064 ?auto_664065 ?auto_664066 ?auto_664067 ?auto_664068 ?auto_664069 )
      ( MAKE-17PILE ?auto_664056 ?auto_664057 ?auto_664058 ?auto_664059 ?auto_664060 ?auto_664061 ?auto_664062 ?auto_664063 ?auto_664064 ?auto_664065 ?auto_664066 ?auto_664067 ?auto_664068 ?auto_664069 ?auto_664070 ?auto_664071 ?auto_664072 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664091 - BLOCK
      ?auto_664092 - BLOCK
      ?auto_664093 - BLOCK
      ?auto_664094 - BLOCK
      ?auto_664095 - BLOCK
      ?auto_664096 - BLOCK
      ?auto_664097 - BLOCK
      ?auto_664098 - BLOCK
      ?auto_664099 - BLOCK
      ?auto_664100 - BLOCK
      ?auto_664101 - BLOCK
      ?auto_664102 - BLOCK
      ?auto_664103 - BLOCK
      ?auto_664104 - BLOCK
      ?auto_664105 - BLOCK
      ?auto_664106 - BLOCK
      ?auto_664107 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_664107 ) ( ON-TABLE ?auto_664091 ) ( ON ?auto_664092 ?auto_664091 ) ( ON ?auto_664093 ?auto_664092 ) ( ON ?auto_664094 ?auto_664093 ) ( ON ?auto_664095 ?auto_664094 ) ( ON ?auto_664096 ?auto_664095 ) ( ON ?auto_664097 ?auto_664096 ) ( ON ?auto_664098 ?auto_664097 ) ( ON ?auto_664099 ?auto_664098 ) ( ON ?auto_664100 ?auto_664099 ) ( ON ?auto_664101 ?auto_664100 ) ( ON ?auto_664102 ?auto_664101 ) ( ON ?auto_664103 ?auto_664102 ) ( not ( = ?auto_664091 ?auto_664092 ) ) ( not ( = ?auto_664091 ?auto_664093 ) ) ( not ( = ?auto_664091 ?auto_664094 ) ) ( not ( = ?auto_664091 ?auto_664095 ) ) ( not ( = ?auto_664091 ?auto_664096 ) ) ( not ( = ?auto_664091 ?auto_664097 ) ) ( not ( = ?auto_664091 ?auto_664098 ) ) ( not ( = ?auto_664091 ?auto_664099 ) ) ( not ( = ?auto_664091 ?auto_664100 ) ) ( not ( = ?auto_664091 ?auto_664101 ) ) ( not ( = ?auto_664091 ?auto_664102 ) ) ( not ( = ?auto_664091 ?auto_664103 ) ) ( not ( = ?auto_664091 ?auto_664104 ) ) ( not ( = ?auto_664091 ?auto_664105 ) ) ( not ( = ?auto_664091 ?auto_664106 ) ) ( not ( = ?auto_664091 ?auto_664107 ) ) ( not ( = ?auto_664092 ?auto_664093 ) ) ( not ( = ?auto_664092 ?auto_664094 ) ) ( not ( = ?auto_664092 ?auto_664095 ) ) ( not ( = ?auto_664092 ?auto_664096 ) ) ( not ( = ?auto_664092 ?auto_664097 ) ) ( not ( = ?auto_664092 ?auto_664098 ) ) ( not ( = ?auto_664092 ?auto_664099 ) ) ( not ( = ?auto_664092 ?auto_664100 ) ) ( not ( = ?auto_664092 ?auto_664101 ) ) ( not ( = ?auto_664092 ?auto_664102 ) ) ( not ( = ?auto_664092 ?auto_664103 ) ) ( not ( = ?auto_664092 ?auto_664104 ) ) ( not ( = ?auto_664092 ?auto_664105 ) ) ( not ( = ?auto_664092 ?auto_664106 ) ) ( not ( = ?auto_664092 ?auto_664107 ) ) ( not ( = ?auto_664093 ?auto_664094 ) ) ( not ( = ?auto_664093 ?auto_664095 ) ) ( not ( = ?auto_664093 ?auto_664096 ) ) ( not ( = ?auto_664093 ?auto_664097 ) ) ( not ( = ?auto_664093 ?auto_664098 ) ) ( not ( = ?auto_664093 ?auto_664099 ) ) ( not ( = ?auto_664093 ?auto_664100 ) ) ( not ( = ?auto_664093 ?auto_664101 ) ) ( not ( = ?auto_664093 ?auto_664102 ) ) ( not ( = ?auto_664093 ?auto_664103 ) ) ( not ( = ?auto_664093 ?auto_664104 ) ) ( not ( = ?auto_664093 ?auto_664105 ) ) ( not ( = ?auto_664093 ?auto_664106 ) ) ( not ( = ?auto_664093 ?auto_664107 ) ) ( not ( = ?auto_664094 ?auto_664095 ) ) ( not ( = ?auto_664094 ?auto_664096 ) ) ( not ( = ?auto_664094 ?auto_664097 ) ) ( not ( = ?auto_664094 ?auto_664098 ) ) ( not ( = ?auto_664094 ?auto_664099 ) ) ( not ( = ?auto_664094 ?auto_664100 ) ) ( not ( = ?auto_664094 ?auto_664101 ) ) ( not ( = ?auto_664094 ?auto_664102 ) ) ( not ( = ?auto_664094 ?auto_664103 ) ) ( not ( = ?auto_664094 ?auto_664104 ) ) ( not ( = ?auto_664094 ?auto_664105 ) ) ( not ( = ?auto_664094 ?auto_664106 ) ) ( not ( = ?auto_664094 ?auto_664107 ) ) ( not ( = ?auto_664095 ?auto_664096 ) ) ( not ( = ?auto_664095 ?auto_664097 ) ) ( not ( = ?auto_664095 ?auto_664098 ) ) ( not ( = ?auto_664095 ?auto_664099 ) ) ( not ( = ?auto_664095 ?auto_664100 ) ) ( not ( = ?auto_664095 ?auto_664101 ) ) ( not ( = ?auto_664095 ?auto_664102 ) ) ( not ( = ?auto_664095 ?auto_664103 ) ) ( not ( = ?auto_664095 ?auto_664104 ) ) ( not ( = ?auto_664095 ?auto_664105 ) ) ( not ( = ?auto_664095 ?auto_664106 ) ) ( not ( = ?auto_664095 ?auto_664107 ) ) ( not ( = ?auto_664096 ?auto_664097 ) ) ( not ( = ?auto_664096 ?auto_664098 ) ) ( not ( = ?auto_664096 ?auto_664099 ) ) ( not ( = ?auto_664096 ?auto_664100 ) ) ( not ( = ?auto_664096 ?auto_664101 ) ) ( not ( = ?auto_664096 ?auto_664102 ) ) ( not ( = ?auto_664096 ?auto_664103 ) ) ( not ( = ?auto_664096 ?auto_664104 ) ) ( not ( = ?auto_664096 ?auto_664105 ) ) ( not ( = ?auto_664096 ?auto_664106 ) ) ( not ( = ?auto_664096 ?auto_664107 ) ) ( not ( = ?auto_664097 ?auto_664098 ) ) ( not ( = ?auto_664097 ?auto_664099 ) ) ( not ( = ?auto_664097 ?auto_664100 ) ) ( not ( = ?auto_664097 ?auto_664101 ) ) ( not ( = ?auto_664097 ?auto_664102 ) ) ( not ( = ?auto_664097 ?auto_664103 ) ) ( not ( = ?auto_664097 ?auto_664104 ) ) ( not ( = ?auto_664097 ?auto_664105 ) ) ( not ( = ?auto_664097 ?auto_664106 ) ) ( not ( = ?auto_664097 ?auto_664107 ) ) ( not ( = ?auto_664098 ?auto_664099 ) ) ( not ( = ?auto_664098 ?auto_664100 ) ) ( not ( = ?auto_664098 ?auto_664101 ) ) ( not ( = ?auto_664098 ?auto_664102 ) ) ( not ( = ?auto_664098 ?auto_664103 ) ) ( not ( = ?auto_664098 ?auto_664104 ) ) ( not ( = ?auto_664098 ?auto_664105 ) ) ( not ( = ?auto_664098 ?auto_664106 ) ) ( not ( = ?auto_664098 ?auto_664107 ) ) ( not ( = ?auto_664099 ?auto_664100 ) ) ( not ( = ?auto_664099 ?auto_664101 ) ) ( not ( = ?auto_664099 ?auto_664102 ) ) ( not ( = ?auto_664099 ?auto_664103 ) ) ( not ( = ?auto_664099 ?auto_664104 ) ) ( not ( = ?auto_664099 ?auto_664105 ) ) ( not ( = ?auto_664099 ?auto_664106 ) ) ( not ( = ?auto_664099 ?auto_664107 ) ) ( not ( = ?auto_664100 ?auto_664101 ) ) ( not ( = ?auto_664100 ?auto_664102 ) ) ( not ( = ?auto_664100 ?auto_664103 ) ) ( not ( = ?auto_664100 ?auto_664104 ) ) ( not ( = ?auto_664100 ?auto_664105 ) ) ( not ( = ?auto_664100 ?auto_664106 ) ) ( not ( = ?auto_664100 ?auto_664107 ) ) ( not ( = ?auto_664101 ?auto_664102 ) ) ( not ( = ?auto_664101 ?auto_664103 ) ) ( not ( = ?auto_664101 ?auto_664104 ) ) ( not ( = ?auto_664101 ?auto_664105 ) ) ( not ( = ?auto_664101 ?auto_664106 ) ) ( not ( = ?auto_664101 ?auto_664107 ) ) ( not ( = ?auto_664102 ?auto_664103 ) ) ( not ( = ?auto_664102 ?auto_664104 ) ) ( not ( = ?auto_664102 ?auto_664105 ) ) ( not ( = ?auto_664102 ?auto_664106 ) ) ( not ( = ?auto_664102 ?auto_664107 ) ) ( not ( = ?auto_664103 ?auto_664104 ) ) ( not ( = ?auto_664103 ?auto_664105 ) ) ( not ( = ?auto_664103 ?auto_664106 ) ) ( not ( = ?auto_664103 ?auto_664107 ) ) ( not ( = ?auto_664104 ?auto_664105 ) ) ( not ( = ?auto_664104 ?auto_664106 ) ) ( not ( = ?auto_664104 ?auto_664107 ) ) ( not ( = ?auto_664105 ?auto_664106 ) ) ( not ( = ?auto_664105 ?auto_664107 ) ) ( not ( = ?auto_664106 ?auto_664107 ) ) ( ON ?auto_664106 ?auto_664107 ) ( ON ?auto_664105 ?auto_664106 ) ( CLEAR ?auto_664103 ) ( ON ?auto_664104 ?auto_664105 ) ( CLEAR ?auto_664104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_664091 ?auto_664092 ?auto_664093 ?auto_664094 ?auto_664095 ?auto_664096 ?auto_664097 ?auto_664098 ?auto_664099 ?auto_664100 ?auto_664101 ?auto_664102 ?auto_664103 ?auto_664104 )
      ( MAKE-17PILE ?auto_664091 ?auto_664092 ?auto_664093 ?auto_664094 ?auto_664095 ?auto_664096 ?auto_664097 ?auto_664098 ?auto_664099 ?auto_664100 ?auto_664101 ?auto_664102 ?auto_664103 ?auto_664104 ?auto_664105 ?auto_664106 ?auto_664107 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664125 - BLOCK
      ?auto_664126 - BLOCK
      ?auto_664127 - BLOCK
      ?auto_664128 - BLOCK
      ?auto_664129 - BLOCK
      ?auto_664130 - BLOCK
      ?auto_664131 - BLOCK
      ?auto_664132 - BLOCK
      ?auto_664133 - BLOCK
      ?auto_664134 - BLOCK
      ?auto_664135 - BLOCK
      ?auto_664136 - BLOCK
      ?auto_664137 - BLOCK
      ?auto_664138 - BLOCK
      ?auto_664139 - BLOCK
      ?auto_664140 - BLOCK
      ?auto_664141 - BLOCK
    )
    :vars
    (
      ?auto_664142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664141 ?auto_664142 ) ( ON-TABLE ?auto_664125 ) ( ON ?auto_664126 ?auto_664125 ) ( ON ?auto_664127 ?auto_664126 ) ( ON ?auto_664128 ?auto_664127 ) ( ON ?auto_664129 ?auto_664128 ) ( ON ?auto_664130 ?auto_664129 ) ( ON ?auto_664131 ?auto_664130 ) ( ON ?auto_664132 ?auto_664131 ) ( ON ?auto_664133 ?auto_664132 ) ( ON ?auto_664134 ?auto_664133 ) ( ON ?auto_664135 ?auto_664134 ) ( ON ?auto_664136 ?auto_664135 ) ( not ( = ?auto_664125 ?auto_664126 ) ) ( not ( = ?auto_664125 ?auto_664127 ) ) ( not ( = ?auto_664125 ?auto_664128 ) ) ( not ( = ?auto_664125 ?auto_664129 ) ) ( not ( = ?auto_664125 ?auto_664130 ) ) ( not ( = ?auto_664125 ?auto_664131 ) ) ( not ( = ?auto_664125 ?auto_664132 ) ) ( not ( = ?auto_664125 ?auto_664133 ) ) ( not ( = ?auto_664125 ?auto_664134 ) ) ( not ( = ?auto_664125 ?auto_664135 ) ) ( not ( = ?auto_664125 ?auto_664136 ) ) ( not ( = ?auto_664125 ?auto_664137 ) ) ( not ( = ?auto_664125 ?auto_664138 ) ) ( not ( = ?auto_664125 ?auto_664139 ) ) ( not ( = ?auto_664125 ?auto_664140 ) ) ( not ( = ?auto_664125 ?auto_664141 ) ) ( not ( = ?auto_664125 ?auto_664142 ) ) ( not ( = ?auto_664126 ?auto_664127 ) ) ( not ( = ?auto_664126 ?auto_664128 ) ) ( not ( = ?auto_664126 ?auto_664129 ) ) ( not ( = ?auto_664126 ?auto_664130 ) ) ( not ( = ?auto_664126 ?auto_664131 ) ) ( not ( = ?auto_664126 ?auto_664132 ) ) ( not ( = ?auto_664126 ?auto_664133 ) ) ( not ( = ?auto_664126 ?auto_664134 ) ) ( not ( = ?auto_664126 ?auto_664135 ) ) ( not ( = ?auto_664126 ?auto_664136 ) ) ( not ( = ?auto_664126 ?auto_664137 ) ) ( not ( = ?auto_664126 ?auto_664138 ) ) ( not ( = ?auto_664126 ?auto_664139 ) ) ( not ( = ?auto_664126 ?auto_664140 ) ) ( not ( = ?auto_664126 ?auto_664141 ) ) ( not ( = ?auto_664126 ?auto_664142 ) ) ( not ( = ?auto_664127 ?auto_664128 ) ) ( not ( = ?auto_664127 ?auto_664129 ) ) ( not ( = ?auto_664127 ?auto_664130 ) ) ( not ( = ?auto_664127 ?auto_664131 ) ) ( not ( = ?auto_664127 ?auto_664132 ) ) ( not ( = ?auto_664127 ?auto_664133 ) ) ( not ( = ?auto_664127 ?auto_664134 ) ) ( not ( = ?auto_664127 ?auto_664135 ) ) ( not ( = ?auto_664127 ?auto_664136 ) ) ( not ( = ?auto_664127 ?auto_664137 ) ) ( not ( = ?auto_664127 ?auto_664138 ) ) ( not ( = ?auto_664127 ?auto_664139 ) ) ( not ( = ?auto_664127 ?auto_664140 ) ) ( not ( = ?auto_664127 ?auto_664141 ) ) ( not ( = ?auto_664127 ?auto_664142 ) ) ( not ( = ?auto_664128 ?auto_664129 ) ) ( not ( = ?auto_664128 ?auto_664130 ) ) ( not ( = ?auto_664128 ?auto_664131 ) ) ( not ( = ?auto_664128 ?auto_664132 ) ) ( not ( = ?auto_664128 ?auto_664133 ) ) ( not ( = ?auto_664128 ?auto_664134 ) ) ( not ( = ?auto_664128 ?auto_664135 ) ) ( not ( = ?auto_664128 ?auto_664136 ) ) ( not ( = ?auto_664128 ?auto_664137 ) ) ( not ( = ?auto_664128 ?auto_664138 ) ) ( not ( = ?auto_664128 ?auto_664139 ) ) ( not ( = ?auto_664128 ?auto_664140 ) ) ( not ( = ?auto_664128 ?auto_664141 ) ) ( not ( = ?auto_664128 ?auto_664142 ) ) ( not ( = ?auto_664129 ?auto_664130 ) ) ( not ( = ?auto_664129 ?auto_664131 ) ) ( not ( = ?auto_664129 ?auto_664132 ) ) ( not ( = ?auto_664129 ?auto_664133 ) ) ( not ( = ?auto_664129 ?auto_664134 ) ) ( not ( = ?auto_664129 ?auto_664135 ) ) ( not ( = ?auto_664129 ?auto_664136 ) ) ( not ( = ?auto_664129 ?auto_664137 ) ) ( not ( = ?auto_664129 ?auto_664138 ) ) ( not ( = ?auto_664129 ?auto_664139 ) ) ( not ( = ?auto_664129 ?auto_664140 ) ) ( not ( = ?auto_664129 ?auto_664141 ) ) ( not ( = ?auto_664129 ?auto_664142 ) ) ( not ( = ?auto_664130 ?auto_664131 ) ) ( not ( = ?auto_664130 ?auto_664132 ) ) ( not ( = ?auto_664130 ?auto_664133 ) ) ( not ( = ?auto_664130 ?auto_664134 ) ) ( not ( = ?auto_664130 ?auto_664135 ) ) ( not ( = ?auto_664130 ?auto_664136 ) ) ( not ( = ?auto_664130 ?auto_664137 ) ) ( not ( = ?auto_664130 ?auto_664138 ) ) ( not ( = ?auto_664130 ?auto_664139 ) ) ( not ( = ?auto_664130 ?auto_664140 ) ) ( not ( = ?auto_664130 ?auto_664141 ) ) ( not ( = ?auto_664130 ?auto_664142 ) ) ( not ( = ?auto_664131 ?auto_664132 ) ) ( not ( = ?auto_664131 ?auto_664133 ) ) ( not ( = ?auto_664131 ?auto_664134 ) ) ( not ( = ?auto_664131 ?auto_664135 ) ) ( not ( = ?auto_664131 ?auto_664136 ) ) ( not ( = ?auto_664131 ?auto_664137 ) ) ( not ( = ?auto_664131 ?auto_664138 ) ) ( not ( = ?auto_664131 ?auto_664139 ) ) ( not ( = ?auto_664131 ?auto_664140 ) ) ( not ( = ?auto_664131 ?auto_664141 ) ) ( not ( = ?auto_664131 ?auto_664142 ) ) ( not ( = ?auto_664132 ?auto_664133 ) ) ( not ( = ?auto_664132 ?auto_664134 ) ) ( not ( = ?auto_664132 ?auto_664135 ) ) ( not ( = ?auto_664132 ?auto_664136 ) ) ( not ( = ?auto_664132 ?auto_664137 ) ) ( not ( = ?auto_664132 ?auto_664138 ) ) ( not ( = ?auto_664132 ?auto_664139 ) ) ( not ( = ?auto_664132 ?auto_664140 ) ) ( not ( = ?auto_664132 ?auto_664141 ) ) ( not ( = ?auto_664132 ?auto_664142 ) ) ( not ( = ?auto_664133 ?auto_664134 ) ) ( not ( = ?auto_664133 ?auto_664135 ) ) ( not ( = ?auto_664133 ?auto_664136 ) ) ( not ( = ?auto_664133 ?auto_664137 ) ) ( not ( = ?auto_664133 ?auto_664138 ) ) ( not ( = ?auto_664133 ?auto_664139 ) ) ( not ( = ?auto_664133 ?auto_664140 ) ) ( not ( = ?auto_664133 ?auto_664141 ) ) ( not ( = ?auto_664133 ?auto_664142 ) ) ( not ( = ?auto_664134 ?auto_664135 ) ) ( not ( = ?auto_664134 ?auto_664136 ) ) ( not ( = ?auto_664134 ?auto_664137 ) ) ( not ( = ?auto_664134 ?auto_664138 ) ) ( not ( = ?auto_664134 ?auto_664139 ) ) ( not ( = ?auto_664134 ?auto_664140 ) ) ( not ( = ?auto_664134 ?auto_664141 ) ) ( not ( = ?auto_664134 ?auto_664142 ) ) ( not ( = ?auto_664135 ?auto_664136 ) ) ( not ( = ?auto_664135 ?auto_664137 ) ) ( not ( = ?auto_664135 ?auto_664138 ) ) ( not ( = ?auto_664135 ?auto_664139 ) ) ( not ( = ?auto_664135 ?auto_664140 ) ) ( not ( = ?auto_664135 ?auto_664141 ) ) ( not ( = ?auto_664135 ?auto_664142 ) ) ( not ( = ?auto_664136 ?auto_664137 ) ) ( not ( = ?auto_664136 ?auto_664138 ) ) ( not ( = ?auto_664136 ?auto_664139 ) ) ( not ( = ?auto_664136 ?auto_664140 ) ) ( not ( = ?auto_664136 ?auto_664141 ) ) ( not ( = ?auto_664136 ?auto_664142 ) ) ( not ( = ?auto_664137 ?auto_664138 ) ) ( not ( = ?auto_664137 ?auto_664139 ) ) ( not ( = ?auto_664137 ?auto_664140 ) ) ( not ( = ?auto_664137 ?auto_664141 ) ) ( not ( = ?auto_664137 ?auto_664142 ) ) ( not ( = ?auto_664138 ?auto_664139 ) ) ( not ( = ?auto_664138 ?auto_664140 ) ) ( not ( = ?auto_664138 ?auto_664141 ) ) ( not ( = ?auto_664138 ?auto_664142 ) ) ( not ( = ?auto_664139 ?auto_664140 ) ) ( not ( = ?auto_664139 ?auto_664141 ) ) ( not ( = ?auto_664139 ?auto_664142 ) ) ( not ( = ?auto_664140 ?auto_664141 ) ) ( not ( = ?auto_664140 ?auto_664142 ) ) ( not ( = ?auto_664141 ?auto_664142 ) ) ( ON ?auto_664140 ?auto_664141 ) ( ON ?auto_664139 ?auto_664140 ) ( ON ?auto_664138 ?auto_664139 ) ( CLEAR ?auto_664136 ) ( ON ?auto_664137 ?auto_664138 ) ( CLEAR ?auto_664137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_664125 ?auto_664126 ?auto_664127 ?auto_664128 ?auto_664129 ?auto_664130 ?auto_664131 ?auto_664132 ?auto_664133 ?auto_664134 ?auto_664135 ?auto_664136 ?auto_664137 )
      ( MAKE-17PILE ?auto_664125 ?auto_664126 ?auto_664127 ?auto_664128 ?auto_664129 ?auto_664130 ?auto_664131 ?auto_664132 ?auto_664133 ?auto_664134 ?auto_664135 ?auto_664136 ?auto_664137 ?auto_664138 ?auto_664139 ?auto_664140 ?auto_664141 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664160 - BLOCK
      ?auto_664161 - BLOCK
      ?auto_664162 - BLOCK
      ?auto_664163 - BLOCK
      ?auto_664164 - BLOCK
      ?auto_664165 - BLOCK
      ?auto_664166 - BLOCK
      ?auto_664167 - BLOCK
      ?auto_664168 - BLOCK
      ?auto_664169 - BLOCK
      ?auto_664170 - BLOCK
      ?auto_664171 - BLOCK
      ?auto_664172 - BLOCK
      ?auto_664173 - BLOCK
      ?auto_664174 - BLOCK
      ?auto_664175 - BLOCK
      ?auto_664176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_664176 ) ( ON-TABLE ?auto_664160 ) ( ON ?auto_664161 ?auto_664160 ) ( ON ?auto_664162 ?auto_664161 ) ( ON ?auto_664163 ?auto_664162 ) ( ON ?auto_664164 ?auto_664163 ) ( ON ?auto_664165 ?auto_664164 ) ( ON ?auto_664166 ?auto_664165 ) ( ON ?auto_664167 ?auto_664166 ) ( ON ?auto_664168 ?auto_664167 ) ( ON ?auto_664169 ?auto_664168 ) ( ON ?auto_664170 ?auto_664169 ) ( ON ?auto_664171 ?auto_664170 ) ( not ( = ?auto_664160 ?auto_664161 ) ) ( not ( = ?auto_664160 ?auto_664162 ) ) ( not ( = ?auto_664160 ?auto_664163 ) ) ( not ( = ?auto_664160 ?auto_664164 ) ) ( not ( = ?auto_664160 ?auto_664165 ) ) ( not ( = ?auto_664160 ?auto_664166 ) ) ( not ( = ?auto_664160 ?auto_664167 ) ) ( not ( = ?auto_664160 ?auto_664168 ) ) ( not ( = ?auto_664160 ?auto_664169 ) ) ( not ( = ?auto_664160 ?auto_664170 ) ) ( not ( = ?auto_664160 ?auto_664171 ) ) ( not ( = ?auto_664160 ?auto_664172 ) ) ( not ( = ?auto_664160 ?auto_664173 ) ) ( not ( = ?auto_664160 ?auto_664174 ) ) ( not ( = ?auto_664160 ?auto_664175 ) ) ( not ( = ?auto_664160 ?auto_664176 ) ) ( not ( = ?auto_664161 ?auto_664162 ) ) ( not ( = ?auto_664161 ?auto_664163 ) ) ( not ( = ?auto_664161 ?auto_664164 ) ) ( not ( = ?auto_664161 ?auto_664165 ) ) ( not ( = ?auto_664161 ?auto_664166 ) ) ( not ( = ?auto_664161 ?auto_664167 ) ) ( not ( = ?auto_664161 ?auto_664168 ) ) ( not ( = ?auto_664161 ?auto_664169 ) ) ( not ( = ?auto_664161 ?auto_664170 ) ) ( not ( = ?auto_664161 ?auto_664171 ) ) ( not ( = ?auto_664161 ?auto_664172 ) ) ( not ( = ?auto_664161 ?auto_664173 ) ) ( not ( = ?auto_664161 ?auto_664174 ) ) ( not ( = ?auto_664161 ?auto_664175 ) ) ( not ( = ?auto_664161 ?auto_664176 ) ) ( not ( = ?auto_664162 ?auto_664163 ) ) ( not ( = ?auto_664162 ?auto_664164 ) ) ( not ( = ?auto_664162 ?auto_664165 ) ) ( not ( = ?auto_664162 ?auto_664166 ) ) ( not ( = ?auto_664162 ?auto_664167 ) ) ( not ( = ?auto_664162 ?auto_664168 ) ) ( not ( = ?auto_664162 ?auto_664169 ) ) ( not ( = ?auto_664162 ?auto_664170 ) ) ( not ( = ?auto_664162 ?auto_664171 ) ) ( not ( = ?auto_664162 ?auto_664172 ) ) ( not ( = ?auto_664162 ?auto_664173 ) ) ( not ( = ?auto_664162 ?auto_664174 ) ) ( not ( = ?auto_664162 ?auto_664175 ) ) ( not ( = ?auto_664162 ?auto_664176 ) ) ( not ( = ?auto_664163 ?auto_664164 ) ) ( not ( = ?auto_664163 ?auto_664165 ) ) ( not ( = ?auto_664163 ?auto_664166 ) ) ( not ( = ?auto_664163 ?auto_664167 ) ) ( not ( = ?auto_664163 ?auto_664168 ) ) ( not ( = ?auto_664163 ?auto_664169 ) ) ( not ( = ?auto_664163 ?auto_664170 ) ) ( not ( = ?auto_664163 ?auto_664171 ) ) ( not ( = ?auto_664163 ?auto_664172 ) ) ( not ( = ?auto_664163 ?auto_664173 ) ) ( not ( = ?auto_664163 ?auto_664174 ) ) ( not ( = ?auto_664163 ?auto_664175 ) ) ( not ( = ?auto_664163 ?auto_664176 ) ) ( not ( = ?auto_664164 ?auto_664165 ) ) ( not ( = ?auto_664164 ?auto_664166 ) ) ( not ( = ?auto_664164 ?auto_664167 ) ) ( not ( = ?auto_664164 ?auto_664168 ) ) ( not ( = ?auto_664164 ?auto_664169 ) ) ( not ( = ?auto_664164 ?auto_664170 ) ) ( not ( = ?auto_664164 ?auto_664171 ) ) ( not ( = ?auto_664164 ?auto_664172 ) ) ( not ( = ?auto_664164 ?auto_664173 ) ) ( not ( = ?auto_664164 ?auto_664174 ) ) ( not ( = ?auto_664164 ?auto_664175 ) ) ( not ( = ?auto_664164 ?auto_664176 ) ) ( not ( = ?auto_664165 ?auto_664166 ) ) ( not ( = ?auto_664165 ?auto_664167 ) ) ( not ( = ?auto_664165 ?auto_664168 ) ) ( not ( = ?auto_664165 ?auto_664169 ) ) ( not ( = ?auto_664165 ?auto_664170 ) ) ( not ( = ?auto_664165 ?auto_664171 ) ) ( not ( = ?auto_664165 ?auto_664172 ) ) ( not ( = ?auto_664165 ?auto_664173 ) ) ( not ( = ?auto_664165 ?auto_664174 ) ) ( not ( = ?auto_664165 ?auto_664175 ) ) ( not ( = ?auto_664165 ?auto_664176 ) ) ( not ( = ?auto_664166 ?auto_664167 ) ) ( not ( = ?auto_664166 ?auto_664168 ) ) ( not ( = ?auto_664166 ?auto_664169 ) ) ( not ( = ?auto_664166 ?auto_664170 ) ) ( not ( = ?auto_664166 ?auto_664171 ) ) ( not ( = ?auto_664166 ?auto_664172 ) ) ( not ( = ?auto_664166 ?auto_664173 ) ) ( not ( = ?auto_664166 ?auto_664174 ) ) ( not ( = ?auto_664166 ?auto_664175 ) ) ( not ( = ?auto_664166 ?auto_664176 ) ) ( not ( = ?auto_664167 ?auto_664168 ) ) ( not ( = ?auto_664167 ?auto_664169 ) ) ( not ( = ?auto_664167 ?auto_664170 ) ) ( not ( = ?auto_664167 ?auto_664171 ) ) ( not ( = ?auto_664167 ?auto_664172 ) ) ( not ( = ?auto_664167 ?auto_664173 ) ) ( not ( = ?auto_664167 ?auto_664174 ) ) ( not ( = ?auto_664167 ?auto_664175 ) ) ( not ( = ?auto_664167 ?auto_664176 ) ) ( not ( = ?auto_664168 ?auto_664169 ) ) ( not ( = ?auto_664168 ?auto_664170 ) ) ( not ( = ?auto_664168 ?auto_664171 ) ) ( not ( = ?auto_664168 ?auto_664172 ) ) ( not ( = ?auto_664168 ?auto_664173 ) ) ( not ( = ?auto_664168 ?auto_664174 ) ) ( not ( = ?auto_664168 ?auto_664175 ) ) ( not ( = ?auto_664168 ?auto_664176 ) ) ( not ( = ?auto_664169 ?auto_664170 ) ) ( not ( = ?auto_664169 ?auto_664171 ) ) ( not ( = ?auto_664169 ?auto_664172 ) ) ( not ( = ?auto_664169 ?auto_664173 ) ) ( not ( = ?auto_664169 ?auto_664174 ) ) ( not ( = ?auto_664169 ?auto_664175 ) ) ( not ( = ?auto_664169 ?auto_664176 ) ) ( not ( = ?auto_664170 ?auto_664171 ) ) ( not ( = ?auto_664170 ?auto_664172 ) ) ( not ( = ?auto_664170 ?auto_664173 ) ) ( not ( = ?auto_664170 ?auto_664174 ) ) ( not ( = ?auto_664170 ?auto_664175 ) ) ( not ( = ?auto_664170 ?auto_664176 ) ) ( not ( = ?auto_664171 ?auto_664172 ) ) ( not ( = ?auto_664171 ?auto_664173 ) ) ( not ( = ?auto_664171 ?auto_664174 ) ) ( not ( = ?auto_664171 ?auto_664175 ) ) ( not ( = ?auto_664171 ?auto_664176 ) ) ( not ( = ?auto_664172 ?auto_664173 ) ) ( not ( = ?auto_664172 ?auto_664174 ) ) ( not ( = ?auto_664172 ?auto_664175 ) ) ( not ( = ?auto_664172 ?auto_664176 ) ) ( not ( = ?auto_664173 ?auto_664174 ) ) ( not ( = ?auto_664173 ?auto_664175 ) ) ( not ( = ?auto_664173 ?auto_664176 ) ) ( not ( = ?auto_664174 ?auto_664175 ) ) ( not ( = ?auto_664174 ?auto_664176 ) ) ( not ( = ?auto_664175 ?auto_664176 ) ) ( ON ?auto_664175 ?auto_664176 ) ( ON ?auto_664174 ?auto_664175 ) ( ON ?auto_664173 ?auto_664174 ) ( CLEAR ?auto_664171 ) ( ON ?auto_664172 ?auto_664173 ) ( CLEAR ?auto_664172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_664160 ?auto_664161 ?auto_664162 ?auto_664163 ?auto_664164 ?auto_664165 ?auto_664166 ?auto_664167 ?auto_664168 ?auto_664169 ?auto_664170 ?auto_664171 ?auto_664172 )
      ( MAKE-17PILE ?auto_664160 ?auto_664161 ?auto_664162 ?auto_664163 ?auto_664164 ?auto_664165 ?auto_664166 ?auto_664167 ?auto_664168 ?auto_664169 ?auto_664170 ?auto_664171 ?auto_664172 ?auto_664173 ?auto_664174 ?auto_664175 ?auto_664176 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664194 - BLOCK
      ?auto_664195 - BLOCK
      ?auto_664196 - BLOCK
      ?auto_664197 - BLOCK
      ?auto_664198 - BLOCK
      ?auto_664199 - BLOCK
      ?auto_664200 - BLOCK
      ?auto_664201 - BLOCK
      ?auto_664202 - BLOCK
      ?auto_664203 - BLOCK
      ?auto_664204 - BLOCK
      ?auto_664205 - BLOCK
      ?auto_664206 - BLOCK
      ?auto_664207 - BLOCK
      ?auto_664208 - BLOCK
      ?auto_664209 - BLOCK
      ?auto_664210 - BLOCK
    )
    :vars
    (
      ?auto_664211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664210 ?auto_664211 ) ( ON-TABLE ?auto_664194 ) ( ON ?auto_664195 ?auto_664194 ) ( ON ?auto_664196 ?auto_664195 ) ( ON ?auto_664197 ?auto_664196 ) ( ON ?auto_664198 ?auto_664197 ) ( ON ?auto_664199 ?auto_664198 ) ( ON ?auto_664200 ?auto_664199 ) ( ON ?auto_664201 ?auto_664200 ) ( ON ?auto_664202 ?auto_664201 ) ( ON ?auto_664203 ?auto_664202 ) ( ON ?auto_664204 ?auto_664203 ) ( not ( = ?auto_664194 ?auto_664195 ) ) ( not ( = ?auto_664194 ?auto_664196 ) ) ( not ( = ?auto_664194 ?auto_664197 ) ) ( not ( = ?auto_664194 ?auto_664198 ) ) ( not ( = ?auto_664194 ?auto_664199 ) ) ( not ( = ?auto_664194 ?auto_664200 ) ) ( not ( = ?auto_664194 ?auto_664201 ) ) ( not ( = ?auto_664194 ?auto_664202 ) ) ( not ( = ?auto_664194 ?auto_664203 ) ) ( not ( = ?auto_664194 ?auto_664204 ) ) ( not ( = ?auto_664194 ?auto_664205 ) ) ( not ( = ?auto_664194 ?auto_664206 ) ) ( not ( = ?auto_664194 ?auto_664207 ) ) ( not ( = ?auto_664194 ?auto_664208 ) ) ( not ( = ?auto_664194 ?auto_664209 ) ) ( not ( = ?auto_664194 ?auto_664210 ) ) ( not ( = ?auto_664194 ?auto_664211 ) ) ( not ( = ?auto_664195 ?auto_664196 ) ) ( not ( = ?auto_664195 ?auto_664197 ) ) ( not ( = ?auto_664195 ?auto_664198 ) ) ( not ( = ?auto_664195 ?auto_664199 ) ) ( not ( = ?auto_664195 ?auto_664200 ) ) ( not ( = ?auto_664195 ?auto_664201 ) ) ( not ( = ?auto_664195 ?auto_664202 ) ) ( not ( = ?auto_664195 ?auto_664203 ) ) ( not ( = ?auto_664195 ?auto_664204 ) ) ( not ( = ?auto_664195 ?auto_664205 ) ) ( not ( = ?auto_664195 ?auto_664206 ) ) ( not ( = ?auto_664195 ?auto_664207 ) ) ( not ( = ?auto_664195 ?auto_664208 ) ) ( not ( = ?auto_664195 ?auto_664209 ) ) ( not ( = ?auto_664195 ?auto_664210 ) ) ( not ( = ?auto_664195 ?auto_664211 ) ) ( not ( = ?auto_664196 ?auto_664197 ) ) ( not ( = ?auto_664196 ?auto_664198 ) ) ( not ( = ?auto_664196 ?auto_664199 ) ) ( not ( = ?auto_664196 ?auto_664200 ) ) ( not ( = ?auto_664196 ?auto_664201 ) ) ( not ( = ?auto_664196 ?auto_664202 ) ) ( not ( = ?auto_664196 ?auto_664203 ) ) ( not ( = ?auto_664196 ?auto_664204 ) ) ( not ( = ?auto_664196 ?auto_664205 ) ) ( not ( = ?auto_664196 ?auto_664206 ) ) ( not ( = ?auto_664196 ?auto_664207 ) ) ( not ( = ?auto_664196 ?auto_664208 ) ) ( not ( = ?auto_664196 ?auto_664209 ) ) ( not ( = ?auto_664196 ?auto_664210 ) ) ( not ( = ?auto_664196 ?auto_664211 ) ) ( not ( = ?auto_664197 ?auto_664198 ) ) ( not ( = ?auto_664197 ?auto_664199 ) ) ( not ( = ?auto_664197 ?auto_664200 ) ) ( not ( = ?auto_664197 ?auto_664201 ) ) ( not ( = ?auto_664197 ?auto_664202 ) ) ( not ( = ?auto_664197 ?auto_664203 ) ) ( not ( = ?auto_664197 ?auto_664204 ) ) ( not ( = ?auto_664197 ?auto_664205 ) ) ( not ( = ?auto_664197 ?auto_664206 ) ) ( not ( = ?auto_664197 ?auto_664207 ) ) ( not ( = ?auto_664197 ?auto_664208 ) ) ( not ( = ?auto_664197 ?auto_664209 ) ) ( not ( = ?auto_664197 ?auto_664210 ) ) ( not ( = ?auto_664197 ?auto_664211 ) ) ( not ( = ?auto_664198 ?auto_664199 ) ) ( not ( = ?auto_664198 ?auto_664200 ) ) ( not ( = ?auto_664198 ?auto_664201 ) ) ( not ( = ?auto_664198 ?auto_664202 ) ) ( not ( = ?auto_664198 ?auto_664203 ) ) ( not ( = ?auto_664198 ?auto_664204 ) ) ( not ( = ?auto_664198 ?auto_664205 ) ) ( not ( = ?auto_664198 ?auto_664206 ) ) ( not ( = ?auto_664198 ?auto_664207 ) ) ( not ( = ?auto_664198 ?auto_664208 ) ) ( not ( = ?auto_664198 ?auto_664209 ) ) ( not ( = ?auto_664198 ?auto_664210 ) ) ( not ( = ?auto_664198 ?auto_664211 ) ) ( not ( = ?auto_664199 ?auto_664200 ) ) ( not ( = ?auto_664199 ?auto_664201 ) ) ( not ( = ?auto_664199 ?auto_664202 ) ) ( not ( = ?auto_664199 ?auto_664203 ) ) ( not ( = ?auto_664199 ?auto_664204 ) ) ( not ( = ?auto_664199 ?auto_664205 ) ) ( not ( = ?auto_664199 ?auto_664206 ) ) ( not ( = ?auto_664199 ?auto_664207 ) ) ( not ( = ?auto_664199 ?auto_664208 ) ) ( not ( = ?auto_664199 ?auto_664209 ) ) ( not ( = ?auto_664199 ?auto_664210 ) ) ( not ( = ?auto_664199 ?auto_664211 ) ) ( not ( = ?auto_664200 ?auto_664201 ) ) ( not ( = ?auto_664200 ?auto_664202 ) ) ( not ( = ?auto_664200 ?auto_664203 ) ) ( not ( = ?auto_664200 ?auto_664204 ) ) ( not ( = ?auto_664200 ?auto_664205 ) ) ( not ( = ?auto_664200 ?auto_664206 ) ) ( not ( = ?auto_664200 ?auto_664207 ) ) ( not ( = ?auto_664200 ?auto_664208 ) ) ( not ( = ?auto_664200 ?auto_664209 ) ) ( not ( = ?auto_664200 ?auto_664210 ) ) ( not ( = ?auto_664200 ?auto_664211 ) ) ( not ( = ?auto_664201 ?auto_664202 ) ) ( not ( = ?auto_664201 ?auto_664203 ) ) ( not ( = ?auto_664201 ?auto_664204 ) ) ( not ( = ?auto_664201 ?auto_664205 ) ) ( not ( = ?auto_664201 ?auto_664206 ) ) ( not ( = ?auto_664201 ?auto_664207 ) ) ( not ( = ?auto_664201 ?auto_664208 ) ) ( not ( = ?auto_664201 ?auto_664209 ) ) ( not ( = ?auto_664201 ?auto_664210 ) ) ( not ( = ?auto_664201 ?auto_664211 ) ) ( not ( = ?auto_664202 ?auto_664203 ) ) ( not ( = ?auto_664202 ?auto_664204 ) ) ( not ( = ?auto_664202 ?auto_664205 ) ) ( not ( = ?auto_664202 ?auto_664206 ) ) ( not ( = ?auto_664202 ?auto_664207 ) ) ( not ( = ?auto_664202 ?auto_664208 ) ) ( not ( = ?auto_664202 ?auto_664209 ) ) ( not ( = ?auto_664202 ?auto_664210 ) ) ( not ( = ?auto_664202 ?auto_664211 ) ) ( not ( = ?auto_664203 ?auto_664204 ) ) ( not ( = ?auto_664203 ?auto_664205 ) ) ( not ( = ?auto_664203 ?auto_664206 ) ) ( not ( = ?auto_664203 ?auto_664207 ) ) ( not ( = ?auto_664203 ?auto_664208 ) ) ( not ( = ?auto_664203 ?auto_664209 ) ) ( not ( = ?auto_664203 ?auto_664210 ) ) ( not ( = ?auto_664203 ?auto_664211 ) ) ( not ( = ?auto_664204 ?auto_664205 ) ) ( not ( = ?auto_664204 ?auto_664206 ) ) ( not ( = ?auto_664204 ?auto_664207 ) ) ( not ( = ?auto_664204 ?auto_664208 ) ) ( not ( = ?auto_664204 ?auto_664209 ) ) ( not ( = ?auto_664204 ?auto_664210 ) ) ( not ( = ?auto_664204 ?auto_664211 ) ) ( not ( = ?auto_664205 ?auto_664206 ) ) ( not ( = ?auto_664205 ?auto_664207 ) ) ( not ( = ?auto_664205 ?auto_664208 ) ) ( not ( = ?auto_664205 ?auto_664209 ) ) ( not ( = ?auto_664205 ?auto_664210 ) ) ( not ( = ?auto_664205 ?auto_664211 ) ) ( not ( = ?auto_664206 ?auto_664207 ) ) ( not ( = ?auto_664206 ?auto_664208 ) ) ( not ( = ?auto_664206 ?auto_664209 ) ) ( not ( = ?auto_664206 ?auto_664210 ) ) ( not ( = ?auto_664206 ?auto_664211 ) ) ( not ( = ?auto_664207 ?auto_664208 ) ) ( not ( = ?auto_664207 ?auto_664209 ) ) ( not ( = ?auto_664207 ?auto_664210 ) ) ( not ( = ?auto_664207 ?auto_664211 ) ) ( not ( = ?auto_664208 ?auto_664209 ) ) ( not ( = ?auto_664208 ?auto_664210 ) ) ( not ( = ?auto_664208 ?auto_664211 ) ) ( not ( = ?auto_664209 ?auto_664210 ) ) ( not ( = ?auto_664209 ?auto_664211 ) ) ( not ( = ?auto_664210 ?auto_664211 ) ) ( ON ?auto_664209 ?auto_664210 ) ( ON ?auto_664208 ?auto_664209 ) ( ON ?auto_664207 ?auto_664208 ) ( ON ?auto_664206 ?auto_664207 ) ( CLEAR ?auto_664204 ) ( ON ?auto_664205 ?auto_664206 ) ( CLEAR ?auto_664205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_664194 ?auto_664195 ?auto_664196 ?auto_664197 ?auto_664198 ?auto_664199 ?auto_664200 ?auto_664201 ?auto_664202 ?auto_664203 ?auto_664204 ?auto_664205 )
      ( MAKE-17PILE ?auto_664194 ?auto_664195 ?auto_664196 ?auto_664197 ?auto_664198 ?auto_664199 ?auto_664200 ?auto_664201 ?auto_664202 ?auto_664203 ?auto_664204 ?auto_664205 ?auto_664206 ?auto_664207 ?auto_664208 ?auto_664209 ?auto_664210 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664229 - BLOCK
      ?auto_664230 - BLOCK
      ?auto_664231 - BLOCK
      ?auto_664232 - BLOCK
      ?auto_664233 - BLOCK
      ?auto_664234 - BLOCK
      ?auto_664235 - BLOCK
      ?auto_664236 - BLOCK
      ?auto_664237 - BLOCK
      ?auto_664238 - BLOCK
      ?auto_664239 - BLOCK
      ?auto_664240 - BLOCK
      ?auto_664241 - BLOCK
      ?auto_664242 - BLOCK
      ?auto_664243 - BLOCK
      ?auto_664244 - BLOCK
      ?auto_664245 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_664245 ) ( ON-TABLE ?auto_664229 ) ( ON ?auto_664230 ?auto_664229 ) ( ON ?auto_664231 ?auto_664230 ) ( ON ?auto_664232 ?auto_664231 ) ( ON ?auto_664233 ?auto_664232 ) ( ON ?auto_664234 ?auto_664233 ) ( ON ?auto_664235 ?auto_664234 ) ( ON ?auto_664236 ?auto_664235 ) ( ON ?auto_664237 ?auto_664236 ) ( ON ?auto_664238 ?auto_664237 ) ( ON ?auto_664239 ?auto_664238 ) ( not ( = ?auto_664229 ?auto_664230 ) ) ( not ( = ?auto_664229 ?auto_664231 ) ) ( not ( = ?auto_664229 ?auto_664232 ) ) ( not ( = ?auto_664229 ?auto_664233 ) ) ( not ( = ?auto_664229 ?auto_664234 ) ) ( not ( = ?auto_664229 ?auto_664235 ) ) ( not ( = ?auto_664229 ?auto_664236 ) ) ( not ( = ?auto_664229 ?auto_664237 ) ) ( not ( = ?auto_664229 ?auto_664238 ) ) ( not ( = ?auto_664229 ?auto_664239 ) ) ( not ( = ?auto_664229 ?auto_664240 ) ) ( not ( = ?auto_664229 ?auto_664241 ) ) ( not ( = ?auto_664229 ?auto_664242 ) ) ( not ( = ?auto_664229 ?auto_664243 ) ) ( not ( = ?auto_664229 ?auto_664244 ) ) ( not ( = ?auto_664229 ?auto_664245 ) ) ( not ( = ?auto_664230 ?auto_664231 ) ) ( not ( = ?auto_664230 ?auto_664232 ) ) ( not ( = ?auto_664230 ?auto_664233 ) ) ( not ( = ?auto_664230 ?auto_664234 ) ) ( not ( = ?auto_664230 ?auto_664235 ) ) ( not ( = ?auto_664230 ?auto_664236 ) ) ( not ( = ?auto_664230 ?auto_664237 ) ) ( not ( = ?auto_664230 ?auto_664238 ) ) ( not ( = ?auto_664230 ?auto_664239 ) ) ( not ( = ?auto_664230 ?auto_664240 ) ) ( not ( = ?auto_664230 ?auto_664241 ) ) ( not ( = ?auto_664230 ?auto_664242 ) ) ( not ( = ?auto_664230 ?auto_664243 ) ) ( not ( = ?auto_664230 ?auto_664244 ) ) ( not ( = ?auto_664230 ?auto_664245 ) ) ( not ( = ?auto_664231 ?auto_664232 ) ) ( not ( = ?auto_664231 ?auto_664233 ) ) ( not ( = ?auto_664231 ?auto_664234 ) ) ( not ( = ?auto_664231 ?auto_664235 ) ) ( not ( = ?auto_664231 ?auto_664236 ) ) ( not ( = ?auto_664231 ?auto_664237 ) ) ( not ( = ?auto_664231 ?auto_664238 ) ) ( not ( = ?auto_664231 ?auto_664239 ) ) ( not ( = ?auto_664231 ?auto_664240 ) ) ( not ( = ?auto_664231 ?auto_664241 ) ) ( not ( = ?auto_664231 ?auto_664242 ) ) ( not ( = ?auto_664231 ?auto_664243 ) ) ( not ( = ?auto_664231 ?auto_664244 ) ) ( not ( = ?auto_664231 ?auto_664245 ) ) ( not ( = ?auto_664232 ?auto_664233 ) ) ( not ( = ?auto_664232 ?auto_664234 ) ) ( not ( = ?auto_664232 ?auto_664235 ) ) ( not ( = ?auto_664232 ?auto_664236 ) ) ( not ( = ?auto_664232 ?auto_664237 ) ) ( not ( = ?auto_664232 ?auto_664238 ) ) ( not ( = ?auto_664232 ?auto_664239 ) ) ( not ( = ?auto_664232 ?auto_664240 ) ) ( not ( = ?auto_664232 ?auto_664241 ) ) ( not ( = ?auto_664232 ?auto_664242 ) ) ( not ( = ?auto_664232 ?auto_664243 ) ) ( not ( = ?auto_664232 ?auto_664244 ) ) ( not ( = ?auto_664232 ?auto_664245 ) ) ( not ( = ?auto_664233 ?auto_664234 ) ) ( not ( = ?auto_664233 ?auto_664235 ) ) ( not ( = ?auto_664233 ?auto_664236 ) ) ( not ( = ?auto_664233 ?auto_664237 ) ) ( not ( = ?auto_664233 ?auto_664238 ) ) ( not ( = ?auto_664233 ?auto_664239 ) ) ( not ( = ?auto_664233 ?auto_664240 ) ) ( not ( = ?auto_664233 ?auto_664241 ) ) ( not ( = ?auto_664233 ?auto_664242 ) ) ( not ( = ?auto_664233 ?auto_664243 ) ) ( not ( = ?auto_664233 ?auto_664244 ) ) ( not ( = ?auto_664233 ?auto_664245 ) ) ( not ( = ?auto_664234 ?auto_664235 ) ) ( not ( = ?auto_664234 ?auto_664236 ) ) ( not ( = ?auto_664234 ?auto_664237 ) ) ( not ( = ?auto_664234 ?auto_664238 ) ) ( not ( = ?auto_664234 ?auto_664239 ) ) ( not ( = ?auto_664234 ?auto_664240 ) ) ( not ( = ?auto_664234 ?auto_664241 ) ) ( not ( = ?auto_664234 ?auto_664242 ) ) ( not ( = ?auto_664234 ?auto_664243 ) ) ( not ( = ?auto_664234 ?auto_664244 ) ) ( not ( = ?auto_664234 ?auto_664245 ) ) ( not ( = ?auto_664235 ?auto_664236 ) ) ( not ( = ?auto_664235 ?auto_664237 ) ) ( not ( = ?auto_664235 ?auto_664238 ) ) ( not ( = ?auto_664235 ?auto_664239 ) ) ( not ( = ?auto_664235 ?auto_664240 ) ) ( not ( = ?auto_664235 ?auto_664241 ) ) ( not ( = ?auto_664235 ?auto_664242 ) ) ( not ( = ?auto_664235 ?auto_664243 ) ) ( not ( = ?auto_664235 ?auto_664244 ) ) ( not ( = ?auto_664235 ?auto_664245 ) ) ( not ( = ?auto_664236 ?auto_664237 ) ) ( not ( = ?auto_664236 ?auto_664238 ) ) ( not ( = ?auto_664236 ?auto_664239 ) ) ( not ( = ?auto_664236 ?auto_664240 ) ) ( not ( = ?auto_664236 ?auto_664241 ) ) ( not ( = ?auto_664236 ?auto_664242 ) ) ( not ( = ?auto_664236 ?auto_664243 ) ) ( not ( = ?auto_664236 ?auto_664244 ) ) ( not ( = ?auto_664236 ?auto_664245 ) ) ( not ( = ?auto_664237 ?auto_664238 ) ) ( not ( = ?auto_664237 ?auto_664239 ) ) ( not ( = ?auto_664237 ?auto_664240 ) ) ( not ( = ?auto_664237 ?auto_664241 ) ) ( not ( = ?auto_664237 ?auto_664242 ) ) ( not ( = ?auto_664237 ?auto_664243 ) ) ( not ( = ?auto_664237 ?auto_664244 ) ) ( not ( = ?auto_664237 ?auto_664245 ) ) ( not ( = ?auto_664238 ?auto_664239 ) ) ( not ( = ?auto_664238 ?auto_664240 ) ) ( not ( = ?auto_664238 ?auto_664241 ) ) ( not ( = ?auto_664238 ?auto_664242 ) ) ( not ( = ?auto_664238 ?auto_664243 ) ) ( not ( = ?auto_664238 ?auto_664244 ) ) ( not ( = ?auto_664238 ?auto_664245 ) ) ( not ( = ?auto_664239 ?auto_664240 ) ) ( not ( = ?auto_664239 ?auto_664241 ) ) ( not ( = ?auto_664239 ?auto_664242 ) ) ( not ( = ?auto_664239 ?auto_664243 ) ) ( not ( = ?auto_664239 ?auto_664244 ) ) ( not ( = ?auto_664239 ?auto_664245 ) ) ( not ( = ?auto_664240 ?auto_664241 ) ) ( not ( = ?auto_664240 ?auto_664242 ) ) ( not ( = ?auto_664240 ?auto_664243 ) ) ( not ( = ?auto_664240 ?auto_664244 ) ) ( not ( = ?auto_664240 ?auto_664245 ) ) ( not ( = ?auto_664241 ?auto_664242 ) ) ( not ( = ?auto_664241 ?auto_664243 ) ) ( not ( = ?auto_664241 ?auto_664244 ) ) ( not ( = ?auto_664241 ?auto_664245 ) ) ( not ( = ?auto_664242 ?auto_664243 ) ) ( not ( = ?auto_664242 ?auto_664244 ) ) ( not ( = ?auto_664242 ?auto_664245 ) ) ( not ( = ?auto_664243 ?auto_664244 ) ) ( not ( = ?auto_664243 ?auto_664245 ) ) ( not ( = ?auto_664244 ?auto_664245 ) ) ( ON ?auto_664244 ?auto_664245 ) ( ON ?auto_664243 ?auto_664244 ) ( ON ?auto_664242 ?auto_664243 ) ( ON ?auto_664241 ?auto_664242 ) ( CLEAR ?auto_664239 ) ( ON ?auto_664240 ?auto_664241 ) ( CLEAR ?auto_664240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_664229 ?auto_664230 ?auto_664231 ?auto_664232 ?auto_664233 ?auto_664234 ?auto_664235 ?auto_664236 ?auto_664237 ?auto_664238 ?auto_664239 ?auto_664240 )
      ( MAKE-17PILE ?auto_664229 ?auto_664230 ?auto_664231 ?auto_664232 ?auto_664233 ?auto_664234 ?auto_664235 ?auto_664236 ?auto_664237 ?auto_664238 ?auto_664239 ?auto_664240 ?auto_664241 ?auto_664242 ?auto_664243 ?auto_664244 ?auto_664245 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664263 - BLOCK
      ?auto_664264 - BLOCK
      ?auto_664265 - BLOCK
      ?auto_664266 - BLOCK
      ?auto_664267 - BLOCK
      ?auto_664268 - BLOCK
      ?auto_664269 - BLOCK
      ?auto_664270 - BLOCK
      ?auto_664271 - BLOCK
      ?auto_664272 - BLOCK
      ?auto_664273 - BLOCK
      ?auto_664274 - BLOCK
      ?auto_664275 - BLOCK
      ?auto_664276 - BLOCK
      ?auto_664277 - BLOCK
      ?auto_664278 - BLOCK
      ?auto_664279 - BLOCK
    )
    :vars
    (
      ?auto_664280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664279 ?auto_664280 ) ( ON-TABLE ?auto_664263 ) ( ON ?auto_664264 ?auto_664263 ) ( ON ?auto_664265 ?auto_664264 ) ( ON ?auto_664266 ?auto_664265 ) ( ON ?auto_664267 ?auto_664266 ) ( ON ?auto_664268 ?auto_664267 ) ( ON ?auto_664269 ?auto_664268 ) ( ON ?auto_664270 ?auto_664269 ) ( ON ?auto_664271 ?auto_664270 ) ( ON ?auto_664272 ?auto_664271 ) ( not ( = ?auto_664263 ?auto_664264 ) ) ( not ( = ?auto_664263 ?auto_664265 ) ) ( not ( = ?auto_664263 ?auto_664266 ) ) ( not ( = ?auto_664263 ?auto_664267 ) ) ( not ( = ?auto_664263 ?auto_664268 ) ) ( not ( = ?auto_664263 ?auto_664269 ) ) ( not ( = ?auto_664263 ?auto_664270 ) ) ( not ( = ?auto_664263 ?auto_664271 ) ) ( not ( = ?auto_664263 ?auto_664272 ) ) ( not ( = ?auto_664263 ?auto_664273 ) ) ( not ( = ?auto_664263 ?auto_664274 ) ) ( not ( = ?auto_664263 ?auto_664275 ) ) ( not ( = ?auto_664263 ?auto_664276 ) ) ( not ( = ?auto_664263 ?auto_664277 ) ) ( not ( = ?auto_664263 ?auto_664278 ) ) ( not ( = ?auto_664263 ?auto_664279 ) ) ( not ( = ?auto_664263 ?auto_664280 ) ) ( not ( = ?auto_664264 ?auto_664265 ) ) ( not ( = ?auto_664264 ?auto_664266 ) ) ( not ( = ?auto_664264 ?auto_664267 ) ) ( not ( = ?auto_664264 ?auto_664268 ) ) ( not ( = ?auto_664264 ?auto_664269 ) ) ( not ( = ?auto_664264 ?auto_664270 ) ) ( not ( = ?auto_664264 ?auto_664271 ) ) ( not ( = ?auto_664264 ?auto_664272 ) ) ( not ( = ?auto_664264 ?auto_664273 ) ) ( not ( = ?auto_664264 ?auto_664274 ) ) ( not ( = ?auto_664264 ?auto_664275 ) ) ( not ( = ?auto_664264 ?auto_664276 ) ) ( not ( = ?auto_664264 ?auto_664277 ) ) ( not ( = ?auto_664264 ?auto_664278 ) ) ( not ( = ?auto_664264 ?auto_664279 ) ) ( not ( = ?auto_664264 ?auto_664280 ) ) ( not ( = ?auto_664265 ?auto_664266 ) ) ( not ( = ?auto_664265 ?auto_664267 ) ) ( not ( = ?auto_664265 ?auto_664268 ) ) ( not ( = ?auto_664265 ?auto_664269 ) ) ( not ( = ?auto_664265 ?auto_664270 ) ) ( not ( = ?auto_664265 ?auto_664271 ) ) ( not ( = ?auto_664265 ?auto_664272 ) ) ( not ( = ?auto_664265 ?auto_664273 ) ) ( not ( = ?auto_664265 ?auto_664274 ) ) ( not ( = ?auto_664265 ?auto_664275 ) ) ( not ( = ?auto_664265 ?auto_664276 ) ) ( not ( = ?auto_664265 ?auto_664277 ) ) ( not ( = ?auto_664265 ?auto_664278 ) ) ( not ( = ?auto_664265 ?auto_664279 ) ) ( not ( = ?auto_664265 ?auto_664280 ) ) ( not ( = ?auto_664266 ?auto_664267 ) ) ( not ( = ?auto_664266 ?auto_664268 ) ) ( not ( = ?auto_664266 ?auto_664269 ) ) ( not ( = ?auto_664266 ?auto_664270 ) ) ( not ( = ?auto_664266 ?auto_664271 ) ) ( not ( = ?auto_664266 ?auto_664272 ) ) ( not ( = ?auto_664266 ?auto_664273 ) ) ( not ( = ?auto_664266 ?auto_664274 ) ) ( not ( = ?auto_664266 ?auto_664275 ) ) ( not ( = ?auto_664266 ?auto_664276 ) ) ( not ( = ?auto_664266 ?auto_664277 ) ) ( not ( = ?auto_664266 ?auto_664278 ) ) ( not ( = ?auto_664266 ?auto_664279 ) ) ( not ( = ?auto_664266 ?auto_664280 ) ) ( not ( = ?auto_664267 ?auto_664268 ) ) ( not ( = ?auto_664267 ?auto_664269 ) ) ( not ( = ?auto_664267 ?auto_664270 ) ) ( not ( = ?auto_664267 ?auto_664271 ) ) ( not ( = ?auto_664267 ?auto_664272 ) ) ( not ( = ?auto_664267 ?auto_664273 ) ) ( not ( = ?auto_664267 ?auto_664274 ) ) ( not ( = ?auto_664267 ?auto_664275 ) ) ( not ( = ?auto_664267 ?auto_664276 ) ) ( not ( = ?auto_664267 ?auto_664277 ) ) ( not ( = ?auto_664267 ?auto_664278 ) ) ( not ( = ?auto_664267 ?auto_664279 ) ) ( not ( = ?auto_664267 ?auto_664280 ) ) ( not ( = ?auto_664268 ?auto_664269 ) ) ( not ( = ?auto_664268 ?auto_664270 ) ) ( not ( = ?auto_664268 ?auto_664271 ) ) ( not ( = ?auto_664268 ?auto_664272 ) ) ( not ( = ?auto_664268 ?auto_664273 ) ) ( not ( = ?auto_664268 ?auto_664274 ) ) ( not ( = ?auto_664268 ?auto_664275 ) ) ( not ( = ?auto_664268 ?auto_664276 ) ) ( not ( = ?auto_664268 ?auto_664277 ) ) ( not ( = ?auto_664268 ?auto_664278 ) ) ( not ( = ?auto_664268 ?auto_664279 ) ) ( not ( = ?auto_664268 ?auto_664280 ) ) ( not ( = ?auto_664269 ?auto_664270 ) ) ( not ( = ?auto_664269 ?auto_664271 ) ) ( not ( = ?auto_664269 ?auto_664272 ) ) ( not ( = ?auto_664269 ?auto_664273 ) ) ( not ( = ?auto_664269 ?auto_664274 ) ) ( not ( = ?auto_664269 ?auto_664275 ) ) ( not ( = ?auto_664269 ?auto_664276 ) ) ( not ( = ?auto_664269 ?auto_664277 ) ) ( not ( = ?auto_664269 ?auto_664278 ) ) ( not ( = ?auto_664269 ?auto_664279 ) ) ( not ( = ?auto_664269 ?auto_664280 ) ) ( not ( = ?auto_664270 ?auto_664271 ) ) ( not ( = ?auto_664270 ?auto_664272 ) ) ( not ( = ?auto_664270 ?auto_664273 ) ) ( not ( = ?auto_664270 ?auto_664274 ) ) ( not ( = ?auto_664270 ?auto_664275 ) ) ( not ( = ?auto_664270 ?auto_664276 ) ) ( not ( = ?auto_664270 ?auto_664277 ) ) ( not ( = ?auto_664270 ?auto_664278 ) ) ( not ( = ?auto_664270 ?auto_664279 ) ) ( not ( = ?auto_664270 ?auto_664280 ) ) ( not ( = ?auto_664271 ?auto_664272 ) ) ( not ( = ?auto_664271 ?auto_664273 ) ) ( not ( = ?auto_664271 ?auto_664274 ) ) ( not ( = ?auto_664271 ?auto_664275 ) ) ( not ( = ?auto_664271 ?auto_664276 ) ) ( not ( = ?auto_664271 ?auto_664277 ) ) ( not ( = ?auto_664271 ?auto_664278 ) ) ( not ( = ?auto_664271 ?auto_664279 ) ) ( not ( = ?auto_664271 ?auto_664280 ) ) ( not ( = ?auto_664272 ?auto_664273 ) ) ( not ( = ?auto_664272 ?auto_664274 ) ) ( not ( = ?auto_664272 ?auto_664275 ) ) ( not ( = ?auto_664272 ?auto_664276 ) ) ( not ( = ?auto_664272 ?auto_664277 ) ) ( not ( = ?auto_664272 ?auto_664278 ) ) ( not ( = ?auto_664272 ?auto_664279 ) ) ( not ( = ?auto_664272 ?auto_664280 ) ) ( not ( = ?auto_664273 ?auto_664274 ) ) ( not ( = ?auto_664273 ?auto_664275 ) ) ( not ( = ?auto_664273 ?auto_664276 ) ) ( not ( = ?auto_664273 ?auto_664277 ) ) ( not ( = ?auto_664273 ?auto_664278 ) ) ( not ( = ?auto_664273 ?auto_664279 ) ) ( not ( = ?auto_664273 ?auto_664280 ) ) ( not ( = ?auto_664274 ?auto_664275 ) ) ( not ( = ?auto_664274 ?auto_664276 ) ) ( not ( = ?auto_664274 ?auto_664277 ) ) ( not ( = ?auto_664274 ?auto_664278 ) ) ( not ( = ?auto_664274 ?auto_664279 ) ) ( not ( = ?auto_664274 ?auto_664280 ) ) ( not ( = ?auto_664275 ?auto_664276 ) ) ( not ( = ?auto_664275 ?auto_664277 ) ) ( not ( = ?auto_664275 ?auto_664278 ) ) ( not ( = ?auto_664275 ?auto_664279 ) ) ( not ( = ?auto_664275 ?auto_664280 ) ) ( not ( = ?auto_664276 ?auto_664277 ) ) ( not ( = ?auto_664276 ?auto_664278 ) ) ( not ( = ?auto_664276 ?auto_664279 ) ) ( not ( = ?auto_664276 ?auto_664280 ) ) ( not ( = ?auto_664277 ?auto_664278 ) ) ( not ( = ?auto_664277 ?auto_664279 ) ) ( not ( = ?auto_664277 ?auto_664280 ) ) ( not ( = ?auto_664278 ?auto_664279 ) ) ( not ( = ?auto_664278 ?auto_664280 ) ) ( not ( = ?auto_664279 ?auto_664280 ) ) ( ON ?auto_664278 ?auto_664279 ) ( ON ?auto_664277 ?auto_664278 ) ( ON ?auto_664276 ?auto_664277 ) ( ON ?auto_664275 ?auto_664276 ) ( ON ?auto_664274 ?auto_664275 ) ( CLEAR ?auto_664272 ) ( ON ?auto_664273 ?auto_664274 ) ( CLEAR ?auto_664273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_664263 ?auto_664264 ?auto_664265 ?auto_664266 ?auto_664267 ?auto_664268 ?auto_664269 ?auto_664270 ?auto_664271 ?auto_664272 ?auto_664273 )
      ( MAKE-17PILE ?auto_664263 ?auto_664264 ?auto_664265 ?auto_664266 ?auto_664267 ?auto_664268 ?auto_664269 ?auto_664270 ?auto_664271 ?auto_664272 ?auto_664273 ?auto_664274 ?auto_664275 ?auto_664276 ?auto_664277 ?auto_664278 ?auto_664279 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664298 - BLOCK
      ?auto_664299 - BLOCK
      ?auto_664300 - BLOCK
      ?auto_664301 - BLOCK
      ?auto_664302 - BLOCK
      ?auto_664303 - BLOCK
      ?auto_664304 - BLOCK
      ?auto_664305 - BLOCK
      ?auto_664306 - BLOCK
      ?auto_664307 - BLOCK
      ?auto_664308 - BLOCK
      ?auto_664309 - BLOCK
      ?auto_664310 - BLOCK
      ?auto_664311 - BLOCK
      ?auto_664312 - BLOCK
      ?auto_664313 - BLOCK
      ?auto_664314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_664314 ) ( ON-TABLE ?auto_664298 ) ( ON ?auto_664299 ?auto_664298 ) ( ON ?auto_664300 ?auto_664299 ) ( ON ?auto_664301 ?auto_664300 ) ( ON ?auto_664302 ?auto_664301 ) ( ON ?auto_664303 ?auto_664302 ) ( ON ?auto_664304 ?auto_664303 ) ( ON ?auto_664305 ?auto_664304 ) ( ON ?auto_664306 ?auto_664305 ) ( ON ?auto_664307 ?auto_664306 ) ( not ( = ?auto_664298 ?auto_664299 ) ) ( not ( = ?auto_664298 ?auto_664300 ) ) ( not ( = ?auto_664298 ?auto_664301 ) ) ( not ( = ?auto_664298 ?auto_664302 ) ) ( not ( = ?auto_664298 ?auto_664303 ) ) ( not ( = ?auto_664298 ?auto_664304 ) ) ( not ( = ?auto_664298 ?auto_664305 ) ) ( not ( = ?auto_664298 ?auto_664306 ) ) ( not ( = ?auto_664298 ?auto_664307 ) ) ( not ( = ?auto_664298 ?auto_664308 ) ) ( not ( = ?auto_664298 ?auto_664309 ) ) ( not ( = ?auto_664298 ?auto_664310 ) ) ( not ( = ?auto_664298 ?auto_664311 ) ) ( not ( = ?auto_664298 ?auto_664312 ) ) ( not ( = ?auto_664298 ?auto_664313 ) ) ( not ( = ?auto_664298 ?auto_664314 ) ) ( not ( = ?auto_664299 ?auto_664300 ) ) ( not ( = ?auto_664299 ?auto_664301 ) ) ( not ( = ?auto_664299 ?auto_664302 ) ) ( not ( = ?auto_664299 ?auto_664303 ) ) ( not ( = ?auto_664299 ?auto_664304 ) ) ( not ( = ?auto_664299 ?auto_664305 ) ) ( not ( = ?auto_664299 ?auto_664306 ) ) ( not ( = ?auto_664299 ?auto_664307 ) ) ( not ( = ?auto_664299 ?auto_664308 ) ) ( not ( = ?auto_664299 ?auto_664309 ) ) ( not ( = ?auto_664299 ?auto_664310 ) ) ( not ( = ?auto_664299 ?auto_664311 ) ) ( not ( = ?auto_664299 ?auto_664312 ) ) ( not ( = ?auto_664299 ?auto_664313 ) ) ( not ( = ?auto_664299 ?auto_664314 ) ) ( not ( = ?auto_664300 ?auto_664301 ) ) ( not ( = ?auto_664300 ?auto_664302 ) ) ( not ( = ?auto_664300 ?auto_664303 ) ) ( not ( = ?auto_664300 ?auto_664304 ) ) ( not ( = ?auto_664300 ?auto_664305 ) ) ( not ( = ?auto_664300 ?auto_664306 ) ) ( not ( = ?auto_664300 ?auto_664307 ) ) ( not ( = ?auto_664300 ?auto_664308 ) ) ( not ( = ?auto_664300 ?auto_664309 ) ) ( not ( = ?auto_664300 ?auto_664310 ) ) ( not ( = ?auto_664300 ?auto_664311 ) ) ( not ( = ?auto_664300 ?auto_664312 ) ) ( not ( = ?auto_664300 ?auto_664313 ) ) ( not ( = ?auto_664300 ?auto_664314 ) ) ( not ( = ?auto_664301 ?auto_664302 ) ) ( not ( = ?auto_664301 ?auto_664303 ) ) ( not ( = ?auto_664301 ?auto_664304 ) ) ( not ( = ?auto_664301 ?auto_664305 ) ) ( not ( = ?auto_664301 ?auto_664306 ) ) ( not ( = ?auto_664301 ?auto_664307 ) ) ( not ( = ?auto_664301 ?auto_664308 ) ) ( not ( = ?auto_664301 ?auto_664309 ) ) ( not ( = ?auto_664301 ?auto_664310 ) ) ( not ( = ?auto_664301 ?auto_664311 ) ) ( not ( = ?auto_664301 ?auto_664312 ) ) ( not ( = ?auto_664301 ?auto_664313 ) ) ( not ( = ?auto_664301 ?auto_664314 ) ) ( not ( = ?auto_664302 ?auto_664303 ) ) ( not ( = ?auto_664302 ?auto_664304 ) ) ( not ( = ?auto_664302 ?auto_664305 ) ) ( not ( = ?auto_664302 ?auto_664306 ) ) ( not ( = ?auto_664302 ?auto_664307 ) ) ( not ( = ?auto_664302 ?auto_664308 ) ) ( not ( = ?auto_664302 ?auto_664309 ) ) ( not ( = ?auto_664302 ?auto_664310 ) ) ( not ( = ?auto_664302 ?auto_664311 ) ) ( not ( = ?auto_664302 ?auto_664312 ) ) ( not ( = ?auto_664302 ?auto_664313 ) ) ( not ( = ?auto_664302 ?auto_664314 ) ) ( not ( = ?auto_664303 ?auto_664304 ) ) ( not ( = ?auto_664303 ?auto_664305 ) ) ( not ( = ?auto_664303 ?auto_664306 ) ) ( not ( = ?auto_664303 ?auto_664307 ) ) ( not ( = ?auto_664303 ?auto_664308 ) ) ( not ( = ?auto_664303 ?auto_664309 ) ) ( not ( = ?auto_664303 ?auto_664310 ) ) ( not ( = ?auto_664303 ?auto_664311 ) ) ( not ( = ?auto_664303 ?auto_664312 ) ) ( not ( = ?auto_664303 ?auto_664313 ) ) ( not ( = ?auto_664303 ?auto_664314 ) ) ( not ( = ?auto_664304 ?auto_664305 ) ) ( not ( = ?auto_664304 ?auto_664306 ) ) ( not ( = ?auto_664304 ?auto_664307 ) ) ( not ( = ?auto_664304 ?auto_664308 ) ) ( not ( = ?auto_664304 ?auto_664309 ) ) ( not ( = ?auto_664304 ?auto_664310 ) ) ( not ( = ?auto_664304 ?auto_664311 ) ) ( not ( = ?auto_664304 ?auto_664312 ) ) ( not ( = ?auto_664304 ?auto_664313 ) ) ( not ( = ?auto_664304 ?auto_664314 ) ) ( not ( = ?auto_664305 ?auto_664306 ) ) ( not ( = ?auto_664305 ?auto_664307 ) ) ( not ( = ?auto_664305 ?auto_664308 ) ) ( not ( = ?auto_664305 ?auto_664309 ) ) ( not ( = ?auto_664305 ?auto_664310 ) ) ( not ( = ?auto_664305 ?auto_664311 ) ) ( not ( = ?auto_664305 ?auto_664312 ) ) ( not ( = ?auto_664305 ?auto_664313 ) ) ( not ( = ?auto_664305 ?auto_664314 ) ) ( not ( = ?auto_664306 ?auto_664307 ) ) ( not ( = ?auto_664306 ?auto_664308 ) ) ( not ( = ?auto_664306 ?auto_664309 ) ) ( not ( = ?auto_664306 ?auto_664310 ) ) ( not ( = ?auto_664306 ?auto_664311 ) ) ( not ( = ?auto_664306 ?auto_664312 ) ) ( not ( = ?auto_664306 ?auto_664313 ) ) ( not ( = ?auto_664306 ?auto_664314 ) ) ( not ( = ?auto_664307 ?auto_664308 ) ) ( not ( = ?auto_664307 ?auto_664309 ) ) ( not ( = ?auto_664307 ?auto_664310 ) ) ( not ( = ?auto_664307 ?auto_664311 ) ) ( not ( = ?auto_664307 ?auto_664312 ) ) ( not ( = ?auto_664307 ?auto_664313 ) ) ( not ( = ?auto_664307 ?auto_664314 ) ) ( not ( = ?auto_664308 ?auto_664309 ) ) ( not ( = ?auto_664308 ?auto_664310 ) ) ( not ( = ?auto_664308 ?auto_664311 ) ) ( not ( = ?auto_664308 ?auto_664312 ) ) ( not ( = ?auto_664308 ?auto_664313 ) ) ( not ( = ?auto_664308 ?auto_664314 ) ) ( not ( = ?auto_664309 ?auto_664310 ) ) ( not ( = ?auto_664309 ?auto_664311 ) ) ( not ( = ?auto_664309 ?auto_664312 ) ) ( not ( = ?auto_664309 ?auto_664313 ) ) ( not ( = ?auto_664309 ?auto_664314 ) ) ( not ( = ?auto_664310 ?auto_664311 ) ) ( not ( = ?auto_664310 ?auto_664312 ) ) ( not ( = ?auto_664310 ?auto_664313 ) ) ( not ( = ?auto_664310 ?auto_664314 ) ) ( not ( = ?auto_664311 ?auto_664312 ) ) ( not ( = ?auto_664311 ?auto_664313 ) ) ( not ( = ?auto_664311 ?auto_664314 ) ) ( not ( = ?auto_664312 ?auto_664313 ) ) ( not ( = ?auto_664312 ?auto_664314 ) ) ( not ( = ?auto_664313 ?auto_664314 ) ) ( ON ?auto_664313 ?auto_664314 ) ( ON ?auto_664312 ?auto_664313 ) ( ON ?auto_664311 ?auto_664312 ) ( ON ?auto_664310 ?auto_664311 ) ( ON ?auto_664309 ?auto_664310 ) ( CLEAR ?auto_664307 ) ( ON ?auto_664308 ?auto_664309 ) ( CLEAR ?auto_664308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_664298 ?auto_664299 ?auto_664300 ?auto_664301 ?auto_664302 ?auto_664303 ?auto_664304 ?auto_664305 ?auto_664306 ?auto_664307 ?auto_664308 )
      ( MAKE-17PILE ?auto_664298 ?auto_664299 ?auto_664300 ?auto_664301 ?auto_664302 ?auto_664303 ?auto_664304 ?auto_664305 ?auto_664306 ?auto_664307 ?auto_664308 ?auto_664309 ?auto_664310 ?auto_664311 ?auto_664312 ?auto_664313 ?auto_664314 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664332 - BLOCK
      ?auto_664333 - BLOCK
      ?auto_664334 - BLOCK
      ?auto_664335 - BLOCK
      ?auto_664336 - BLOCK
      ?auto_664337 - BLOCK
      ?auto_664338 - BLOCK
      ?auto_664339 - BLOCK
      ?auto_664340 - BLOCK
      ?auto_664341 - BLOCK
      ?auto_664342 - BLOCK
      ?auto_664343 - BLOCK
      ?auto_664344 - BLOCK
      ?auto_664345 - BLOCK
      ?auto_664346 - BLOCK
      ?auto_664347 - BLOCK
      ?auto_664348 - BLOCK
    )
    :vars
    (
      ?auto_664349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664348 ?auto_664349 ) ( ON-TABLE ?auto_664332 ) ( ON ?auto_664333 ?auto_664332 ) ( ON ?auto_664334 ?auto_664333 ) ( ON ?auto_664335 ?auto_664334 ) ( ON ?auto_664336 ?auto_664335 ) ( ON ?auto_664337 ?auto_664336 ) ( ON ?auto_664338 ?auto_664337 ) ( ON ?auto_664339 ?auto_664338 ) ( ON ?auto_664340 ?auto_664339 ) ( not ( = ?auto_664332 ?auto_664333 ) ) ( not ( = ?auto_664332 ?auto_664334 ) ) ( not ( = ?auto_664332 ?auto_664335 ) ) ( not ( = ?auto_664332 ?auto_664336 ) ) ( not ( = ?auto_664332 ?auto_664337 ) ) ( not ( = ?auto_664332 ?auto_664338 ) ) ( not ( = ?auto_664332 ?auto_664339 ) ) ( not ( = ?auto_664332 ?auto_664340 ) ) ( not ( = ?auto_664332 ?auto_664341 ) ) ( not ( = ?auto_664332 ?auto_664342 ) ) ( not ( = ?auto_664332 ?auto_664343 ) ) ( not ( = ?auto_664332 ?auto_664344 ) ) ( not ( = ?auto_664332 ?auto_664345 ) ) ( not ( = ?auto_664332 ?auto_664346 ) ) ( not ( = ?auto_664332 ?auto_664347 ) ) ( not ( = ?auto_664332 ?auto_664348 ) ) ( not ( = ?auto_664332 ?auto_664349 ) ) ( not ( = ?auto_664333 ?auto_664334 ) ) ( not ( = ?auto_664333 ?auto_664335 ) ) ( not ( = ?auto_664333 ?auto_664336 ) ) ( not ( = ?auto_664333 ?auto_664337 ) ) ( not ( = ?auto_664333 ?auto_664338 ) ) ( not ( = ?auto_664333 ?auto_664339 ) ) ( not ( = ?auto_664333 ?auto_664340 ) ) ( not ( = ?auto_664333 ?auto_664341 ) ) ( not ( = ?auto_664333 ?auto_664342 ) ) ( not ( = ?auto_664333 ?auto_664343 ) ) ( not ( = ?auto_664333 ?auto_664344 ) ) ( not ( = ?auto_664333 ?auto_664345 ) ) ( not ( = ?auto_664333 ?auto_664346 ) ) ( not ( = ?auto_664333 ?auto_664347 ) ) ( not ( = ?auto_664333 ?auto_664348 ) ) ( not ( = ?auto_664333 ?auto_664349 ) ) ( not ( = ?auto_664334 ?auto_664335 ) ) ( not ( = ?auto_664334 ?auto_664336 ) ) ( not ( = ?auto_664334 ?auto_664337 ) ) ( not ( = ?auto_664334 ?auto_664338 ) ) ( not ( = ?auto_664334 ?auto_664339 ) ) ( not ( = ?auto_664334 ?auto_664340 ) ) ( not ( = ?auto_664334 ?auto_664341 ) ) ( not ( = ?auto_664334 ?auto_664342 ) ) ( not ( = ?auto_664334 ?auto_664343 ) ) ( not ( = ?auto_664334 ?auto_664344 ) ) ( not ( = ?auto_664334 ?auto_664345 ) ) ( not ( = ?auto_664334 ?auto_664346 ) ) ( not ( = ?auto_664334 ?auto_664347 ) ) ( not ( = ?auto_664334 ?auto_664348 ) ) ( not ( = ?auto_664334 ?auto_664349 ) ) ( not ( = ?auto_664335 ?auto_664336 ) ) ( not ( = ?auto_664335 ?auto_664337 ) ) ( not ( = ?auto_664335 ?auto_664338 ) ) ( not ( = ?auto_664335 ?auto_664339 ) ) ( not ( = ?auto_664335 ?auto_664340 ) ) ( not ( = ?auto_664335 ?auto_664341 ) ) ( not ( = ?auto_664335 ?auto_664342 ) ) ( not ( = ?auto_664335 ?auto_664343 ) ) ( not ( = ?auto_664335 ?auto_664344 ) ) ( not ( = ?auto_664335 ?auto_664345 ) ) ( not ( = ?auto_664335 ?auto_664346 ) ) ( not ( = ?auto_664335 ?auto_664347 ) ) ( not ( = ?auto_664335 ?auto_664348 ) ) ( not ( = ?auto_664335 ?auto_664349 ) ) ( not ( = ?auto_664336 ?auto_664337 ) ) ( not ( = ?auto_664336 ?auto_664338 ) ) ( not ( = ?auto_664336 ?auto_664339 ) ) ( not ( = ?auto_664336 ?auto_664340 ) ) ( not ( = ?auto_664336 ?auto_664341 ) ) ( not ( = ?auto_664336 ?auto_664342 ) ) ( not ( = ?auto_664336 ?auto_664343 ) ) ( not ( = ?auto_664336 ?auto_664344 ) ) ( not ( = ?auto_664336 ?auto_664345 ) ) ( not ( = ?auto_664336 ?auto_664346 ) ) ( not ( = ?auto_664336 ?auto_664347 ) ) ( not ( = ?auto_664336 ?auto_664348 ) ) ( not ( = ?auto_664336 ?auto_664349 ) ) ( not ( = ?auto_664337 ?auto_664338 ) ) ( not ( = ?auto_664337 ?auto_664339 ) ) ( not ( = ?auto_664337 ?auto_664340 ) ) ( not ( = ?auto_664337 ?auto_664341 ) ) ( not ( = ?auto_664337 ?auto_664342 ) ) ( not ( = ?auto_664337 ?auto_664343 ) ) ( not ( = ?auto_664337 ?auto_664344 ) ) ( not ( = ?auto_664337 ?auto_664345 ) ) ( not ( = ?auto_664337 ?auto_664346 ) ) ( not ( = ?auto_664337 ?auto_664347 ) ) ( not ( = ?auto_664337 ?auto_664348 ) ) ( not ( = ?auto_664337 ?auto_664349 ) ) ( not ( = ?auto_664338 ?auto_664339 ) ) ( not ( = ?auto_664338 ?auto_664340 ) ) ( not ( = ?auto_664338 ?auto_664341 ) ) ( not ( = ?auto_664338 ?auto_664342 ) ) ( not ( = ?auto_664338 ?auto_664343 ) ) ( not ( = ?auto_664338 ?auto_664344 ) ) ( not ( = ?auto_664338 ?auto_664345 ) ) ( not ( = ?auto_664338 ?auto_664346 ) ) ( not ( = ?auto_664338 ?auto_664347 ) ) ( not ( = ?auto_664338 ?auto_664348 ) ) ( not ( = ?auto_664338 ?auto_664349 ) ) ( not ( = ?auto_664339 ?auto_664340 ) ) ( not ( = ?auto_664339 ?auto_664341 ) ) ( not ( = ?auto_664339 ?auto_664342 ) ) ( not ( = ?auto_664339 ?auto_664343 ) ) ( not ( = ?auto_664339 ?auto_664344 ) ) ( not ( = ?auto_664339 ?auto_664345 ) ) ( not ( = ?auto_664339 ?auto_664346 ) ) ( not ( = ?auto_664339 ?auto_664347 ) ) ( not ( = ?auto_664339 ?auto_664348 ) ) ( not ( = ?auto_664339 ?auto_664349 ) ) ( not ( = ?auto_664340 ?auto_664341 ) ) ( not ( = ?auto_664340 ?auto_664342 ) ) ( not ( = ?auto_664340 ?auto_664343 ) ) ( not ( = ?auto_664340 ?auto_664344 ) ) ( not ( = ?auto_664340 ?auto_664345 ) ) ( not ( = ?auto_664340 ?auto_664346 ) ) ( not ( = ?auto_664340 ?auto_664347 ) ) ( not ( = ?auto_664340 ?auto_664348 ) ) ( not ( = ?auto_664340 ?auto_664349 ) ) ( not ( = ?auto_664341 ?auto_664342 ) ) ( not ( = ?auto_664341 ?auto_664343 ) ) ( not ( = ?auto_664341 ?auto_664344 ) ) ( not ( = ?auto_664341 ?auto_664345 ) ) ( not ( = ?auto_664341 ?auto_664346 ) ) ( not ( = ?auto_664341 ?auto_664347 ) ) ( not ( = ?auto_664341 ?auto_664348 ) ) ( not ( = ?auto_664341 ?auto_664349 ) ) ( not ( = ?auto_664342 ?auto_664343 ) ) ( not ( = ?auto_664342 ?auto_664344 ) ) ( not ( = ?auto_664342 ?auto_664345 ) ) ( not ( = ?auto_664342 ?auto_664346 ) ) ( not ( = ?auto_664342 ?auto_664347 ) ) ( not ( = ?auto_664342 ?auto_664348 ) ) ( not ( = ?auto_664342 ?auto_664349 ) ) ( not ( = ?auto_664343 ?auto_664344 ) ) ( not ( = ?auto_664343 ?auto_664345 ) ) ( not ( = ?auto_664343 ?auto_664346 ) ) ( not ( = ?auto_664343 ?auto_664347 ) ) ( not ( = ?auto_664343 ?auto_664348 ) ) ( not ( = ?auto_664343 ?auto_664349 ) ) ( not ( = ?auto_664344 ?auto_664345 ) ) ( not ( = ?auto_664344 ?auto_664346 ) ) ( not ( = ?auto_664344 ?auto_664347 ) ) ( not ( = ?auto_664344 ?auto_664348 ) ) ( not ( = ?auto_664344 ?auto_664349 ) ) ( not ( = ?auto_664345 ?auto_664346 ) ) ( not ( = ?auto_664345 ?auto_664347 ) ) ( not ( = ?auto_664345 ?auto_664348 ) ) ( not ( = ?auto_664345 ?auto_664349 ) ) ( not ( = ?auto_664346 ?auto_664347 ) ) ( not ( = ?auto_664346 ?auto_664348 ) ) ( not ( = ?auto_664346 ?auto_664349 ) ) ( not ( = ?auto_664347 ?auto_664348 ) ) ( not ( = ?auto_664347 ?auto_664349 ) ) ( not ( = ?auto_664348 ?auto_664349 ) ) ( ON ?auto_664347 ?auto_664348 ) ( ON ?auto_664346 ?auto_664347 ) ( ON ?auto_664345 ?auto_664346 ) ( ON ?auto_664344 ?auto_664345 ) ( ON ?auto_664343 ?auto_664344 ) ( ON ?auto_664342 ?auto_664343 ) ( CLEAR ?auto_664340 ) ( ON ?auto_664341 ?auto_664342 ) ( CLEAR ?auto_664341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_664332 ?auto_664333 ?auto_664334 ?auto_664335 ?auto_664336 ?auto_664337 ?auto_664338 ?auto_664339 ?auto_664340 ?auto_664341 )
      ( MAKE-17PILE ?auto_664332 ?auto_664333 ?auto_664334 ?auto_664335 ?auto_664336 ?auto_664337 ?auto_664338 ?auto_664339 ?auto_664340 ?auto_664341 ?auto_664342 ?auto_664343 ?auto_664344 ?auto_664345 ?auto_664346 ?auto_664347 ?auto_664348 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664367 - BLOCK
      ?auto_664368 - BLOCK
      ?auto_664369 - BLOCK
      ?auto_664370 - BLOCK
      ?auto_664371 - BLOCK
      ?auto_664372 - BLOCK
      ?auto_664373 - BLOCK
      ?auto_664374 - BLOCK
      ?auto_664375 - BLOCK
      ?auto_664376 - BLOCK
      ?auto_664377 - BLOCK
      ?auto_664378 - BLOCK
      ?auto_664379 - BLOCK
      ?auto_664380 - BLOCK
      ?auto_664381 - BLOCK
      ?auto_664382 - BLOCK
      ?auto_664383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_664383 ) ( ON-TABLE ?auto_664367 ) ( ON ?auto_664368 ?auto_664367 ) ( ON ?auto_664369 ?auto_664368 ) ( ON ?auto_664370 ?auto_664369 ) ( ON ?auto_664371 ?auto_664370 ) ( ON ?auto_664372 ?auto_664371 ) ( ON ?auto_664373 ?auto_664372 ) ( ON ?auto_664374 ?auto_664373 ) ( ON ?auto_664375 ?auto_664374 ) ( not ( = ?auto_664367 ?auto_664368 ) ) ( not ( = ?auto_664367 ?auto_664369 ) ) ( not ( = ?auto_664367 ?auto_664370 ) ) ( not ( = ?auto_664367 ?auto_664371 ) ) ( not ( = ?auto_664367 ?auto_664372 ) ) ( not ( = ?auto_664367 ?auto_664373 ) ) ( not ( = ?auto_664367 ?auto_664374 ) ) ( not ( = ?auto_664367 ?auto_664375 ) ) ( not ( = ?auto_664367 ?auto_664376 ) ) ( not ( = ?auto_664367 ?auto_664377 ) ) ( not ( = ?auto_664367 ?auto_664378 ) ) ( not ( = ?auto_664367 ?auto_664379 ) ) ( not ( = ?auto_664367 ?auto_664380 ) ) ( not ( = ?auto_664367 ?auto_664381 ) ) ( not ( = ?auto_664367 ?auto_664382 ) ) ( not ( = ?auto_664367 ?auto_664383 ) ) ( not ( = ?auto_664368 ?auto_664369 ) ) ( not ( = ?auto_664368 ?auto_664370 ) ) ( not ( = ?auto_664368 ?auto_664371 ) ) ( not ( = ?auto_664368 ?auto_664372 ) ) ( not ( = ?auto_664368 ?auto_664373 ) ) ( not ( = ?auto_664368 ?auto_664374 ) ) ( not ( = ?auto_664368 ?auto_664375 ) ) ( not ( = ?auto_664368 ?auto_664376 ) ) ( not ( = ?auto_664368 ?auto_664377 ) ) ( not ( = ?auto_664368 ?auto_664378 ) ) ( not ( = ?auto_664368 ?auto_664379 ) ) ( not ( = ?auto_664368 ?auto_664380 ) ) ( not ( = ?auto_664368 ?auto_664381 ) ) ( not ( = ?auto_664368 ?auto_664382 ) ) ( not ( = ?auto_664368 ?auto_664383 ) ) ( not ( = ?auto_664369 ?auto_664370 ) ) ( not ( = ?auto_664369 ?auto_664371 ) ) ( not ( = ?auto_664369 ?auto_664372 ) ) ( not ( = ?auto_664369 ?auto_664373 ) ) ( not ( = ?auto_664369 ?auto_664374 ) ) ( not ( = ?auto_664369 ?auto_664375 ) ) ( not ( = ?auto_664369 ?auto_664376 ) ) ( not ( = ?auto_664369 ?auto_664377 ) ) ( not ( = ?auto_664369 ?auto_664378 ) ) ( not ( = ?auto_664369 ?auto_664379 ) ) ( not ( = ?auto_664369 ?auto_664380 ) ) ( not ( = ?auto_664369 ?auto_664381 ) ) ( not ( = ?auto_664369 ?auto_664382 ) ) ( not ( = ?auto_664369 ?auto_664383 ) ) ( not ( = ?auto_664370 ?auto_664371 ) ) ( not ( = ?auto_664370 ?auto_664372 ) ) ( not ( = ?auto_664370 ?auto_664373 ) ) ( not ( = ?auto_664370 ?auto_664374 ) ) ( not ( = ?auto_664370 ?auto_664375 ) ) ( not ( = ?auto_664370 ?auto_664376 ) ) ( not ( = ?auto_664370 ?auto_664377 ) ) ( not ( = ?auto_664370 ?auto_664378 ) ) ( not ( = ?auto_664370 ?auto_664379 ) ) ( not ( = ?auto_664370 ?auto_664380 ) ) ( not ( = ?auto_664370 ?auto_664381 ) ) ( not ( = ?auto_664370 ?auto_664382 ) ) ( not ( = ?auto_664370 ?auto_664383 ) ) ( not ( = ?auto_664371 ?auto_664372 ) ) ( not ( = ?auto_664371 ?auto_664373 ) ) ( not ( = ?auto_664371 ?auto_664374 ) ) ( not ( = ?auto_664371 ?auto_664375 ) ) ( not ( = ?auto_664371 ?auto_664376 ) ) ( not ( = ?auto_664371 ?auto_664377 ) ) ( not ( = ?auto_664371 ?auto_664378 ) ) ( not ( = ?auto_664371 ?auto_664379 ) ) ( not ( = ?auto_664371 ?auto_664380 ) ) ( not ( = ?auto_664371 ?auto_664381 ) ) ( not ( = ?auto_664371 ?auto_664382 ) ) ( not ( = ?auto_664371 ?auto_664383 ) ) ( not ( = ?auto_664372 ?auto_664373 ) ) ( not ( = ?auto_664372 ?auto_664374 ) ) ( not ( = ?auto_664372 ?auto_664375 ) ) ( not ( = ?auto_664372 ?auto_664376 ) ) ( not ( = ?auto_664372 ?auto_664377 ) ) ( not ( = ?auto_664372 ?auto_664378 ) ) ( not ( = ?auto_664372 ?auto_664379 ) ) ( not ( = ?auto_664372 ?auto_664380 ) ) ( not ( = ?auto_664372 ?auto_664381 ) ) ( not ( = ?auto_664372 ?auto_664382 ) ) ( not ( = ?auto_664372 ?auto_664383 ) ) ( not ( = ?auto_664373 ?auto_664374 ) ) ( not ( = ?auto_664373 ?auto_664375 ) ) ( not ( = ?auto_664373 ?auto_664376 ) ) ( not ( = ?auto_664373 ?auto_664377 ) ) ( not ( = ?auto_664373 ?auto_664378 ) ) ( not ( = ?auto_664373 ?auto_664379 ) ) ( not ( = ?auto_664373 ?auto_664380 ) ) ( not ( = ?auto_664373 ?auto_664381 ) ) ( not ( = ?auto_664373 ?auto_664382 ) ) ( not ( = ?auto_664373 ?auto_664383 ) ) ( not ( = ?auto_664374 ?auto_664375 ) ) ( not ( = ?auto_664374 ?auto_664376 ) ) ( not ( = ?auto_664374 ?auto_664377 ) ) ( not ( = ?auto_664374 ?auto_664378 ) ) ( not ( = ?auto_664374 ?auto_664379 ) ) ( not ( = ?auto_664374 ?auto_664380 ) ) ( not ( = ?auto_664374 ?auto_664381 ) ) ( not ( = ?auto_664374 ?auto_664382 ) ) ( not ( = ?auto_664374 ?auto_664383 ) ) ( not ( = ?auto_664375 ?auto_664376 ) ) ( not ( = ?auto_664375 ?auto_664377 ) ) ( not ( = ?auto_664375 ?auto_664378 ) ) ( not ( = ?auto_664375 ?auto_664379 ) ) ( not ( = ?auto_664375 ?auto_664380 ) ) ( not ( = ?auto_664375 ?auto_664381 ) ) ( not ( = ?auto_664375 ?auto_664382 ) ) ( not ( = ?auto_664375 ?auto_664383 ) ) ( not ( = ?auto_664376 ?auto_664377 ) ) ( not ( = ?auto_664376 ?auto_664378 ) ) ( not ( = ?auto_664376 ?auto_664379 ) ) ( not ( = ?auto_664376 ?auto_664380 ) ) ( not ( = ?auto_664376 ?auto_664381 ) ) ( not ( = ?auto_664376 ?auto_664382 ) ) ( not ( = ?auto_664376 ?auto_664383 ) ) ( not ( = ?auto_664377 ?auto_664378 ) ) ( not ( = ?auto_664377 ?auto_664379 ) ) ( not ( = ?auto_664377 ?auto_664380 ) ) ( not ( = ?auto_664377 ?auto_664381 ) ) ( not ( = ?auto_664377 ?auto_664382 ) ) ( not ( = ?auto_664377 ?auto_664383 ) ) ( not ( = ?auto_664378 ?auto_664379 ) ) ( not ( = ?auto_664378 ?auto_664380 ) ) ( not ( = ?auto_664378 ?auto_664381 ) ) ( not ( = ?auto_664378 ?auto_664382 ) ) ( not ( = ?auto_664378 ?auto_664383 ) ) ( not ( = ?auto_664379 ?auto_664380 ) ) ( not ( = ?auto_664379 ?auto_664381 ) ) ( not ( = ?auto_664379 ?auto_664382 ) ) ( not ( = ?auto_664379 ?auto_664383 ) ) ( not ( = ?auto_664380 ?auto_664381 ) ) ( not ( = ?auto_664380 ?auto_664382 ) ) ( not ( = ?auto_664380 ?auto_664383 ) ) ( not ( = ?auto_664381 ?auto_664382 ) ) ( not ( = ?auto_664381 ?auto_664383 ) ) ( not ( = ?auto_664382 ?auto_664383 ) ) ( ON ?auto_664382 ?auto_664383 ) ( ON ?auto_664381 ?auto_664382 ) ( ON ?auto_664380 ?auto_664381 ) ( ON ?auto_664379 ?auto_664380 ) ( ON ?auto_664378 ?auto_664379 ) ( ON ?auto_664377 ?auto_664378 ) ( CLEAR ?auto_664375 ) ( ON ?auto_664376 ?auto_664377 ) ( CLEAR ?auto_664376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_664367 ?auto_664368 ?auto_664369 ?auto_664370 ?auto_664371 ?auto_664372 ?auto_664373 ?auto_664374 ?auto_664375 ?auto_664376 )
      ( MAKE-17PILE ?auto_664367 ?auto_664368 ?auto_664369 ?auto_664370 ?auto_664371 ?auto_664372 ?auto_664373 ?auto_664374 ?auto_664375 ?auto_664376 ?auto_664377 ?auto_664378 ?auto_664379 ?auto_664380 ?auto_664381 ?auto_664382 ?auto_664383 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664401 - BLOCK
      ?auto_664402 - BLOCK
      ?auto_664403 - BLOCK
      ?auto_664404 - BLOCK
      ?auto_664405 - BLOCK
      ?auto_664406 - BLOCK
      ?auto_664407 - BLOCK
      ?auto_664408 - BLOCK
      ?auto_664409 - BLOCK
      ?auto_664410 - BLOCK
      ?auto_664411 - BLOCK
      ?auto_664412 - BLOCK
      ?auto_664413 - BLOCK
      ?auto_664414 - BLOCK
      ?auto_664415 - BLOCK
      ?auto_664416 - BLOCK
      ?auto_664417 - BLOCK
    )
    :vars
    (
      ?auto_664418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664417 ?auto_664418 ) ( ON-TABLE ?auto_664401 ) ( ON ?auto_664402 ?auto_664401 ) ( ON ?auto_664403 ?auto_664402 ) ( ON ?auto_664404 ?auto_664403 ) ( ON ?auto_664405 ?auto_664404 ) ( ON ?auto_664406 ?auto_664405 ) ( ON ?auto_664407 ?auto_664406 ) ( ON ?auto_664408 ?auto_664407 ) ( not ( = ?auto_664401 ?auto_664402 ) ) ( not ( = ?auto_664401 ?auto_664403 ) ) ( not ( = ?auto_664401 ?auto_664404 ) ) ( not ( = ?auto_664401 ?auto_664405 ) ) ( not ( = ?auto_664401 ?auto_664406 ) ) ( not ( = ?auto_664401 ?auto_664407 ) ) ( not ( = ?auto_664401 ?auto_664408 ) ) ( not ( = ?auto_664401 ?auto_664409 ) ) ( not ( = ?auto_664401 ?auto_664410 ) ) ( not ( = ?auto_664401 ?auto_664411 ) ) ( not ( = ?auto_664401 ?auto_664412 ) ) ( not ( = ?auto_664401 ?auto_664413 ) ) ( not ( = ?auto_664401 ?auto_664414 ) ) ( not ( = ?auto_664401 ?auto_664415 ) ) ( not ( = ?auto_664401 ?auto_664416 ) ) ( not ( = ?auto_664401 ?auto_664417 ) ) ( not ( = ?auto_664401 ?auto_664418 ) ) ( not ( = ?auto_664402 ?auto_664403 ) ) ( not ( = ?auto_664402 ?auto_664404 ) ) ( not ( = ?auto_664402 ?auto_664405 ) ) ( not ( = ?auto_664402 ?auto_664406 ) ) ( not ( = ?auto_664402 ?auto_664407 ) ) ( not ( = ?auto_664402 ?auto_664408 ) ) ( not ( = ?auto_664402 ?auto_664409 ) ) ( not ( = ?auto_664402 ?auto_664410 ) ) ( not ( = ?auto_664402 ?auto_664411 ) ) ( not ( = ?auto_664402 ?auto_664412 ) ) ( not ( = ?auto_664402 ?auto_664413 ) ) ( not ( = ?auto_664402 ?auto_664414 ) ) ( not ( = ?auto_664402 ?auto_664415 ) ) ( not ( = ?auto_664402 ?auto_664416 ) ) ( not ( = ?auto_664402 ?auto_664417 ) ) ( not ( = ?auto_664402 ?auto_664418 ) ) ( not ( = ?auto_664403 ?auto_664404 ) ) ( not ( = ?auto_664403 ?auto_664405 ) ) ( not ( = ?auto_664403 ?auto_664406 ) ) ( not ( = ?auto_664403 ?auto_664407 ) ) ( not ( = ?auto_664403 ?auto_664408 ) ) ( not ( = ?auto_664403 ?auto_664409 ) ) ( not ( = ?auto_664403 ?auto_664410 ) ) ( not ( = ?auto_664403 ?auto_664411 ) ) ( not ( = ?auto_664403 ?auto_664412 ) ) ( not ( = ?auto_664403 ?auto_664413 ) ) ( not ( = ?auto_664403 ?auto_664414 ) ) ( not ( = ?auto_664403 ?auto_664415 ) ) ( not ( = ?auto_664403 ?auto_664416 ) ) ( not ( = ?auto_664403 ?auto_664417 ) ) ( not ( = ?auto_664403 ?auto_664418 ) ) ( not ( = ?auto_664404 ?auto_664405 ) ) ( not ( = ?auto_664404 ?auto_664406 ) ) ( not ( = ?auto_664404 ?auto_664407 ) ) ( not ( = ?auto_664404 ?auto_664408 ) ) ( not ( = ?auto_664404 ?auto_664409 ) ) ( not ( = ?auto_664404 ?auto_664410 ) ) ( not ( = ?auto_664404 ?auto_664411 ) ) ( not ( = ?auto_664404 ?auto_664412 ) ) ( not ( = ?auto_664404 ?auto_664413 ) ) ( not ( = ?auto_664404 ?auto_664414 ) ) ( not ( = ?auto_664404 ?auto_664415 ) ) ( not ( = ?auto_664404 ?auto_664416 ) ) ( not ( = ?auto_664404 ?auto_664417 ) ) ( not ( = ?auto_664404 ?auto_664418 ) ) ( not ( = ?auto_664405 ?auto_664406 ) ) ( not ( = ?auto_664405 ?auto_664407 ) ) ( not ( = ?auto_664405 ?auto_664408 ) ) ( not ( = ?auto_664405 ?auto_664409 ) ) ( not ( = ?auto_664405 ?auto_664410 ) ) ( not ( = ?auto_664405 ?auto_664411 ) ) ( not ( = ?auto_664405 ?auto_664412 ) ) ( not ( = ?auto_664405 ?auto_664413 ) ) ( not ( = ?auto_664405 ?auto_664414 ) ) ( not ( = ?auto_664405 ?auto_664415 ) ) ( not ( = ?auto_664405 ?auto_664416 ) ) ( not ( = ?auto_664405 ?auto_664417 ) ) ( not ( = ?auto_664405 ?auto_664418 ) ) ( not ( = ?auto_664406 ?auto_664407 ) ) ( not ( = ?auto_664406 ?auto_664408 ) ) ( not ( = ?auto_664406 ?auto_664409 ) ) ( not ( = ?auto_664406 ?auto_664410 ) ) ( not ( = ?auto_664406 ?auto_664411 ) ) ( not ( = ?auto_664406 ?auto_664412 ) ) ( not ( = ?auto_664406 ?auto_664413 ) ) ( not ( = ?auto_664406 ?auto_664414 ) ) ( not ( = ?auto_664406 ?auto_664415 ) ) ( not ( = ?auto_664406 ?auto_664416 ) ) ( not ( = ?auto_664406 ?auto_664417 ) ) ( not ( = ?auto_664406 ?auto_664418 ) ) ( not ( = ?auto_664407 ?auto_664408 ) ) ( not ( = ?auto_664407 ?auto_664409 ) ) ( not ( = ?auto_664407 ?auto_664410 ) ) ( not ( = ?auto_664407 ?auto_664411 ) ) ( not ( = ?auto_664407 ?auto_664412 ) ) ( not ( = ?auto_664407 ?auto_664413 ) ) ( not ( = ?auto_664407 ?auto_664414 ) ) ( not ( = ?auto_664407 ?auto_664415 ) ) ( not ( = ?auto_664407 ?auto_664416 ) ) ( not ( = ?auto_664407 ?auto_664417 ) ) ( not ( = ?auto_664407 ?auto_664418 ) ) ( not ( = ?auto_664408 ?auto_664409 ) ) ( not ( = ?auto_664408 ?auto_664410 ) ) ( not ( = ?auto_664408 ?auto_664411 ) ) ( not ( = ?auto_664408 ?auto_664412 ) ) ( not ( = ?auto_664408 ?auto_664413 ) ) ( not ( = ?auto_664408 ?auto_664414 ) ) ( not ( = ?auto_664408 ?auto_664415 ) ) ( not ( = ?auto_664408 ?auto_664416 ) ) ( not ( = ?auto_664408 ?auto_664417 ) ) ( not ( = ?auto_664408 ?auto_664418 ) ) ( not ( = ?auto_664409 ?auto_664410 ) ) ( not ( = ?auto_664409 ?auto_664411 ) ) ( not ( = ?auto_664409 ?auto_664412 ) ) ( not ( = ?auto_664409 ?auto_664413 ) ) ( not ( = ?auto_664409 ?auto_664414 ) ) ( not ( = ?auto_664409 ?auto_664415 ) ) ( not ( = ?auto_664409 ?auto_664416 ) ) ( not ( = ?auto_664409 ?auto_664417 ) ) ( not ( = ?auto_664409 ?auto_664418 ) ) ( not ( = ?auto_664410 ?auto_664411 ) ) ( not ( = ?auto_664410 ?auto_664412 ) ) ( not ( = ?auto_664410 ?auto_664413 ) ) ( not ( = ?auto_664410 ?auto_664414 ) ) ( not ( = ?auto_664410 ?auto_664415 ) ) ( not ( = ?auto_664410 ?auto_664416 ) ) ( not ( = ?auto_664410 ?auto_664417 ) ) ( not ( = ?auto_664410 ?auto_664418 ) ) ( not ( = ?auto_664411 ?auto_664412 ) ) ( not ( = ?auto_664411 ?auto_664413 ) ) ( not ( = ?auto_664411 ?auto_664414 ) ) ( not ( = ?auto_664411 ?auto_664415 ) ) ( not ( = ?auto_664411 ?auto_664416 ) ) ( not ( = ?auto_664411 ?auto_664417 ) ) ( not ( = ?auto_664411 ?auto_664418 ) ) ( not ( = ?auto_664412 ?auto_664413 ) ) ( not ( = ?auto_664412 ?auto_664414 ) ) ( not ( = ?auto_664412 ?auto_664415 ) ) ( not ( = ?auto_664412 ?auto_664416 ) ) ( not ( = ?auto_664412 ?auto_664417 ) ) ( not ( = ?auto_664412 ?auto_664418 ) ) ( not ( = ?auto_664413 ?auto_664414 ) ) ( not ( = ?auto_664413 ?auto_664415 ) ) ( not ( = ?auto_664413 ?auto_664416 ) ) ( not ( = ?auto_664413 ?auto_664417 ) ) ( not ( = ?auto_664413 ?auto_664418 ) ) ( not ( = ?auto_664414 ?auto_664415 ) ) ( not ( = ?auto_664414 ?auto_664416 ) ) ( not ( = ?auto_664414 ?auto_664417 ) ) ( not ( = ?auto_664414 ?auto_664418 ) ) ( not ( = ?auto_664415 ?auto_664416 ) ) ( not ( = ?auto_664415 ?auto_664417 ) ) ( not ( = ?auto_664415 ?auto_664418 ) ) ( not ( = ?auto_664416 ?auto_664417 ) ) ( not ( = ?auto_664416 ?auto_664418 ) ) ( not ( = ?auto_664417 ?auto_664418 ) ) ( ON ?auto_664416 ?auto_664417 ) ( ON ?auto_664415 ?auto_664416 ) ( ON ?auto_664414 ?auto_664415 ) ( ON ?auto_664413 ?auto_664414 ) ( ON ?auto_664412 ?auto_664413 ) ( ON ?auto_664411 ?auto_664412 ) ( ON ?auto_664410 ?auto_664411 ) ( CLEAR ?auto_664408 ) ( ON ?auto_664409 ?auto_664410 ) ( CLEAR ?auto_664409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_664401 ?auto_664402 ?auto_664403 ?auto_664404 ?auto_664405 ?auto_664406 ?auto_664407 ?auto_664408 ?auto_664409 )
      ( MAKE-17PILE ?auto_664401 ?auto_664402 ?auto_664403 ?auto_664404 ?auto_664405 ?auto_664406 ?auto_664407 ?auto_664408 ?auto_664409 ?auto_664410 ?auto_664411 ?auto_664412 ?auto_664413 ?auto_664414 ?auto_664415 ?auto_664416 ?auto_664417 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664436 - BLOCK
      ?auto_664437 - BLOCK
      ?auto_664438 - BLOCK
      ?auto_664439 - BLOCK
      ?auto_664440 - BLOCK
      ?auto_664441 - BLOCK
      ?auto_664442 - BLOCK
      ?auto_664443 - BLOCK
      ?auto_664444 - BLOCK
      ?auto_664445 - BLOCK
      ?auto_664446 - BLOCK
      ?auto_664447 - BLOCK
      ?auto_664448 - BLOCK
      ?auto_664449 - BLOCK
      ?auto_664450 - BLOCK
      ?auto_664451 - BLOCK
      ?auto_664452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_664452 ) ( ON-TABLE ?auto_664436 ) ( ON ?auto_664437 ?auto_664436 ) ( ON ?auto_664438 ?auto_664437 ) ( ON ?auto_664439 ?auto_664438 ) ( ON ?auto_664440 ?auto_664439 ) ( ON ?auto_664441 ?auto_664440 ) ( ON ?auto_664442 ?auto_664441 ) ( ON ?auto_664443 ?auto_664442 ) ( not ( = ?auto_664436 ?auto_664437 ) ) ( not ( = ?auto_664436 ?auto_664438 ) ) ( not ( = ?auto_664436 ?auto_664439 ) ) ( not ( = ?auto_664436 ?auto_664440 ) ) ( not ( = ?auto_664436 ?auto_664441 ) ) ( not ( = ?auto_664436 ?auto_664442 ) ) ( not ( = ?auto_664436 ?auto_664443 ) ) ( not ( = ?auto_664436 ?auto_664444 ) ) ( not ( = ?auto_664436 ?auto_664445 ) ) ( not ( = ?auto_664436 ?auto_664446 ) ) ( not ( = ?auto_664436 ?auto_664447 ) ) ( not ( = ?auto_664436 ?auto_664448 ) ) ( not ( = ?auto_664436 ?auto_664449 ) ) ( not ( = ?auto_664436 ?auto_664450 ) ) ( not ( = ?auto_664436 ?auto_664451 ) ) ( not ( = ?auto_664436 ?auto_664452 ) ) ( not ( = ?auto_664437 ?auto_664438 ) ) ( not ( = ?auto_664437 ?auto_664439 ) ) ( not ( = ?auto_664437 ?auto_664440 ) ) ( not ( = ?auto_664437 ?auto_664441 ) ) ( not ( = ?auto_664437 ?auto_664442 ) ) ( not ( = ?auto_664437 ?auto_664443 ) ) ( not ( = ?auto_664437 ?auto_664444 ) ) ( not ( = ?auto_664437 ?auto_664445 ) ) ( not ( = ?auto_664437 ?auto_664446 ) ) ( not ( = ?auto_664437 ?auto_664447 ) ) ( not ( = ?auto_664437 ?auto_664448 ) ) ( not ( = ?auto_664437 ?auto_664449 ) ) ( not ( = ?auto_664437 ?auto_664450 ) ) ( not ( = ?auto_664437 ?auto_664451 ) ) ( not ( = ?auto_664437 ?auto_664452 ) ) ( not ( = ?auto_664438 ?auto_664439 ) ) ( not ( = ?auto_664438 ?auto_664440 ) ) ( not ( = ?auto_664438 ?auto_664441 ) ) ( not ( = ?auto_664438 ?auto_664442 ) ) ( not ( = ?auto_664438 ?auto_664443 ) ) ( not ( = ?auto_664438 ?auto_664444 ) ) ( not ( = ?auto_664438 ?auto_664445 ) ) ( not ( = ?auto_664438 ?auto_664446 ) ) ( not ( = ?auto_664438 ?auto_664447 ) ) ( not ( = ?auto_664438 ?auto_664448 ) ) ( not ( = ?auto_664438 ?auto_664449 ) ) ( not ( = ?auto_664438 ?auto_664450 ) ) ( not ( = ?auto_664438 ?auto_664451 ) ) ( not ( = ?auto_664438 ?auto_664452 ) ) ( not ( = ?auto_664439 ?auto_664440 ) ) ( not ( = ?auto_664439 ?auto_664441 ) ) ( not ( = ?auto_664439 ?auto_664442 ) ) ( not ( = ?auto_664439 ?auto_664443 ) ) ( not ( = ?auto_664439 ?auto_664444 ) ) ( not ( = ?auto_664439 ?auto_664445 ) ) ( not ( = ?auto_664439 ?auto_664446 ) ) ( not ( = ?auto_664439 ?auto_664447 ) ) ( not ( = ?auto_664439 ?auto_664448 ) ) ( not ( = ?auto_664439 ?auto_664449 ) ) ( not ( = ?auto_664439 ?auto_664450 ) ) ( not ( = ?auto_664439 ?auto_664451 ) ) ( not ( = ?auto_664439 ?auto_664452 ) ) ( not ( = ?auto_664440 ?auto_664441 ) ) ( not ( = ?auto_664440 ?auto_664442 ) ) ( not ( = ?auto_664440 ?auto_664443 ) ) ( not ( = ?auto_664440 ?auto_664444 ) ) ( not ( = ?auto_664440 ?auto_664445 ) ) ( not ( = ?auto_664440 ?auto_664446 ) ) ( not ( = ?auto_664440 ?auto_664447 ) ) ( not ( = ?auto_664440 ?auto_664448 ) ) ( not ( = ?auto_664440 ?auto_664449 ) ) ( not ( = ?auto_664440 ?auto_664450 ) ) ( not ( = ?auto_664440 ?auto_664451 ) ) ( not ( = ?auto_664440 ?auto_664452 ) ) ( not ( = ?auto_664441 ?auto_664442 ) ) ( not ( = ?auto_664441 ?auto_664443 ) ) ( not ( = ?auto_664441 ?auto_664444 ) ) ( not ( = ?auto_664441 ?auto_664445 ) ) ( not ( = ?auto_664441 ?auto_664446 ) ) ( not ( = ?auto_664441 ?auto_664447 ) ) ( not ( = ?auto_664441 ?auto_664448 ) ) ( not ( = ?auto_664441 ?auto_664449 ) ) ( not ( = ?auto_664441 ?auto_664450 ) ) ( not ( = ?auto_664441 ?auto_664451 ) ) ( not ( = ?auto_664441 ?auto_664452 ) ) ( not ( = ?auto_664442 ?auto_664443 ) ) ( not ( = ?auto_664442 ?auto_664444 ) ) ( not ( = ?auto_664442 ?auto_664445 ) ) ( not ( = ?auto_664442 ?auto_664446 ) ) ( not ( = ?auto_664442 ?auto_664447 ) ) ( not ( = ?auto_664442 ?auto_664448 ) ) ( not ( = ?auto_664442 ?auto_664449 ) ) ( not ( = ?auto_664442 ?auto_664450 ) ) ( not ( = ?auto_664442 ?auto_664451 ) ) ( not ( = ?auto_664442 ?auto_664452 ) ) ( not ( = ?auto_664443 ?auto_664444 ) ) ( not ( = ?auto_664443 ?auto_664445 ) ) ( not ( = ?auto_664443 ?auto_664446 ) ) ( not ( = ?auto_664443 ?auto_664447 ) ) ( not ( = ?auto_664443 ?auto_664448 ) ) ( not ( = ?auto_664443 ?auto_664449 ) ) ( not ( = ?auto_664443 ?auto_664450 ) ) ( not ( = ?auto_664443 ?auto_664451 ) ) ( not ( = ?auto_664443 ?auto_664452 ) ) ( not ( = ?auto_664444 ?auto_664445 ) ) ( not ( = ?auto_664444 ?auto_664446 ) ) ( not ( = ?auto_664444 ?auto_664447 ) ) ( not ( = ?auto_664444 ?auto_664448 ) ) ( not ( = ?auto_664444 ?auto_664449 ) ) ( not ( = ?auto_664444 ?auto_664450 ) ) ( not ( = ?auto_664444 ?auto_664451 ) ) ( not ( = ?auto_664444 ?auto_664452 ) ) ( not ( = ?auto_664445 ?auto_664446 ) ) ( not ( = ?auto_664445 ?auto_664447 ) ) ( not ( = ?auto_664445 ?auto_664448 ) ) ( not ( = ?auto_664445 ?auto_664449 ) ) ( not ( = ?auto_664445 ?auto_664450 ) ) ( not ( = ?auto_664445 ?auto_664451 ) ) ( not ( = ?auto_664445 ?auto_664452 ) ) ( not ( = ?auto_664446 ?auto_664447 ) ) ( not ( = ?auto_664446 ?auto_664448 ) ) ( not ( = ?auto_664446 ?auto_664449 ) ) ( not ( = ?auto_664446 ?auto_664450 ) ) ( not ( = ?auto_664446 ?auto_664451 ) ) ( not ( = ?auto_664446 ?auto_664452 ) ) ( not ( = ?auto_664447 ?auto_664448 ) ) ( not ( = ?auto_664447 ?auto_664449 ) ) ( not ( = ?auto_664447 ?auto_664450 ) ) ( not ( = ?auto_664447 ?auto_664451 ) ) ( not ( = ?auto_664447 ?auto_664452 ) ) ( not ( = ?auto_664448 ?auto_664449 ) ) ( not ( = ?auto_664448 ?auto_664450 ) ) ( not ( = ?auto_664448 ?auto_664451 ) ) ( not ( = ?auto_664448 ?auto_664452 ) ) ( not ( = ?auto_664449 ?auto_664450 ) ) ( not ( = ?auto_664449 ?auto_664451 ) ) ( not ( = ?auto_664449 ?auto_664452 ) ) ( not ( = ?auto_664450 ?auto_664451 ) ) ( not ( = ?auto_664450 ?auto_664452 ) ) ( not ( = ?auto_664451 ?auto_664452 ) ) ( ON ?auto_664451 ?auto_664452 ) ( ON ?auto_664450 ?auto_664451 ) ( ON ?auto_664449 ?auto_664450 ) ( ON ?auto_664448 ?auto_664449 ) ( ON ?auto_664447 ?auto_664448 ) ( ON ?auto_664446 ?auto_664447 ) ( ON ?auto_664445 ?auto_664446 ) ( CLEAR ?auto_664443 ) ( ON ?auto_664444 ?auto_664445 ) ( CLEAR ?auto_664444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_664436 ?auto_664437 ?auto_664438 ?auto_664439 ?auto_664440 ?auto_664441 ?auto_664442 ?auto_664443 ?auto_664444 )
      ( MAKE-17PILE ?auto_664436 ?auto_664437 ?auto_664438 ?auto_664439 ?auto_664440 ?auto_664441 ?auto_664442 ?auto_664443 ?auto_664444 ?auto_664445 ?auto_664446 ?auto_664447 ?auto_664448 ?auto_664449 ?auto_664450 ?auto_664451 ?auto_664452 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664470 - BLOCK
      ?auto_664471 - BLOCK
      ?auto_664472 - BLOCK
      ?auto_664473 - BLOCK
      ?auto_664474 - BLOCK
      ?auto_664475 - BLOCK
      ?auto_664476 - BLOCK
      ?auto_664477 - BLOCK
      ?auto_664478 - BLOCK
      ?auto_664479 - BLOCK
      ?auto_664480 - BLOCK
      ?auto_664481 - BLOCK
      ?auto_664482 - BLOCK
      ?auto_664483 - BLOCK
      ?auto_664484 - BLOCK
      ?auto_664485 - BLOCK
      ?auto_664486 - BLOCK
    )
    :vars
    (
      ?auto_664487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664486 ?auto_664487 ) ( ON-TABLE ?auto_664470 ) ( ON ?auto_664471 ?auto_664470 ) ( ON ?auto_664472 ?auto_664471 ) ( ON ?auto_664473 ?auto_664472 ) ( ON ?auto_664474 ?auto_664473 ) ( ON ?auto_664475 ?auto_664474 ) ( ON ?auto_664476 ?auto_664475 ) ( not ( = ?auto_664470 ?auto_664471 ) ) ( not ( = ?auto_664470 ?auto_664472 ) ) ( not ( = ?auto_664470 ?auto_664473 ) ) ( not ( = ?auto_664470 ?auto_664474 ) ) ( not ( = ?auto_664470 ?auto_664475 ) ) ( not ( = ?auto_664470 ?auto_664476 ) ) ( not ( = ?auto_664470 ?auto_664477 ) ) ( not ( = ?auto_664470 ?auto_664478 ) ) ( not ( = ?auto_664470 ?auto_664479 ) ) ( not ( = ?auto_664470 ?auto_664480 ) ) ( not ( = ?auto_664470 ?auto_664481 ) ) ( not ( = ?auto_664470 ?auto_664482 ) ) ( not ( = ?auto_664470 ?auto_664483 ) ) ( not ( = ?auto_664470 ?auto_664484 ) ) ( not ( = ?auto_664470 ?auto_664485 ) ) ( not ( = ?auto_664470 ?auto_664486 ) ) ( not ( = ?auto_664470 ?auto_664487 ) ) ( not ( = ?auto_664471 ?auto_664472 ) ) ( not ( = ?auto_664471 ?auto_664473 ) ) ( not ( = ?auto_664471 ?auto_664474 ) ) ( not ( = ?auto_664471 ?auto_664475 ) ) ( not ( = ?auto_664471 ?auto_664476 ) ) ( not ( = ?auto_664471 ?auto_664477 ) ) ( not ( = ?auto_664471 ?auto_664478 ) ) ( not ( = ?auto_664471 ?auto_664479 ) ) ( not ( = ?auto_664471 ?auto_664480 ) ) ( not ( = ?auto_664471 ?auto_664481 ) ) ( not ( = ?auto_664471 ?auto_664482 ) ) ( not ( = ?auto_664471 ?auto_664483 ) ) ( not ( = ?auto_664471 ?auto_664484 ) ) ( not ( = ?auto_664471 ?auto_664485 ) ) ( not ( = ?auto_664471 ?auto_664486 ) ) ( not ( = ?auto_664471 ?auto_664487 ) ) ( not ( = ?auto_664472 ?auto_664473 ) ) ( not ( = ?auto_664472 ?auto_664474 ) ) ( not ( = ?auto_664472 ?auto_664475 ) ) ( not ( = ?auto_664472 ?auto_664476 ) ) ( not ( = ?auto_664472 ?auto_664477 ) ) ( not ( = ?auto_664472 ?auto_664478 ) ) ( not ( = ?auto_664472 ?auto_664479 ) ) ( not ( = ?auto_664472 ?auto_664480 ) ) ( not ( = ?auto_664472 ?auto_664481 ) ) ( not ( = ?auto_664472 ?auto_664482 ) ) ( not ( = ?auto_664472 ?auto_664483 ) ) ( not ( = ?auto_664472 ?auto_664484 ) ) ( not ( = ?auto_664472 ?auto_664485 ) ) ( not ( = ?auto_664472 ?auto_664486 ) ) ( not ( = ?auto_664472 ?auto_664487 ) ) ( not ( = ?auto_664473 ?auto_664474 ) ) ( not ( = ?auto_664473 ?auto_664475 ) ) ( not ( = ?auto_664473 ?auto_664476 ) ) ( not ( = ?auto_664473 ?auto_664477 ) ) ( not ( = ?auto_664473 ?auto_664478 ) ) ( not ( = ?auto_664473 ?auto_664479 ) ) ( not ( = ?auto_664473 ?auto_664480 ) ) ( not ( = ?auto_664473 ?auto_664481 ) ) ( not ( = ?auto_664473 ?auto_664482 ) ) ( not ( = ?auto_664473 ?auto_664483 ) ) ( not ( = ?auto_664473 ?auto_664484 ) ) ( not ( = ?auto_664473 ?auto_664485 ) ) ( not ( = ?auto_664473 ?auto_664486 ) ) ( not ( = ?auto_664473 ?auto_664487 ) ) ( not ( = ?auto_664474 ?auto_664475 ) ) ( not ( = ?auto_664474 ?auto_664476 ) ) ( not ( = ?auto_664474 ?auto_664477 ) ) ( not ( = ?auto_664474 ?auto_664478 ) ) ( not ( = ?auto_664474 ?auto_664479 ) ) ( not ( = ?auto_664474 ?auto_664480 ) ) ( not ( = ?auto_664474 ?auto_664481 ) ) ( not ( = ?auto_664474 ?auto_664482 ) ) ( not ( = ?auto_664474 ?auto_664483 ) ) ( not ( = ?auto_664474 ?auto_664484 ) ) ( not ( = ?auto_664474 ?auto_664485 ) ) ( not ( = ?auto_664474 ?auto_664486 ) ) ( not ( = ?auto_664474 ?auto_664487 ) ) ( not ( = ?auto_664475 ?auto_664476 ) ) ( not ( = ?auto_664475 ?auto_664477 ) ) ( not ( = ?auto_664475 ?auto_664478 ) ) ( not ( = ?auto_664475 ?auto_664479 ) ) ( not ( = ?auto_664475 ?auto_664480 ) ) ( not ( = ?auto_664475 ?auto_664481 ) ) ( not ( = ?auto_664475 ?auto_664482 ) ) ( not ( = ?auto_664475 ?auto_664483 ) ) ( not ( = ?auto_664475 ?auto_664484 ) ) ( not ( = ?auto_664475 ?auto_664485 ) ) ( not ( = ?auto_664475 ?auto_664486 ) ) ( not ( = ?auto_664475 ?auto_664487 ) ) ( not ( = ?auto_664476 ?auto_664477 ) ) ( not ( = ?auto_664476 ?auto_664478 ) ) ( not ( = ?auto_664476 ?auto_664479 ) ) ( not ( = ?auto_664476 ?auto_664480 ) ) ( not ( = ?auto_664476 ?auto_664481 ) ) ( not ( = ?auto_664476 ?auto_664482 ) ) ( not ( = ?auto_664476 ?auto_664483 ) ) ( not ( = ?auto_664476 ?auto_664484 ) ) ( not ( = ?auto_664476 ?auto_664485 ) ) ( not ( = ?auto_664476 ?auto_664486 ) ) ( not ( = ?auto_664476 ?auto_664487 ) ) ( not ( = ?auto_664477 ?auto_664478 ) ) ( not ( = ?auto_664477 ?auto_664479 ) ) ( not ( = ?auto_664477 ?auto_664480 ) ) ( not ( = ?auto_664477 ?auto_664481 ) ) ( not ( = ?auto_664477 ?auto_664482 ) ) ( not ( = ?auto_664477 ?auto_664483 ) ) ( not ( = ?auto_664477 ?auto_664484 ) ) ( not ( = ?auto_664477 ?auto_664485 ) ) ( not ( = ?auto_664477 ?auto_664486 ) ) ( not ( = ?auto_664477 ?auto_664487 ) ) ( not ( = ?auto_664478 ?auto_664479 ) ) ( not ( = ?auto_664478 ?auto_664480 ) ) ( not ( = ?auto_664478 ?auto_664481 ) ) ( not ( = ?auto_664478 ?auto_664482 ) ) ( not ( = ?auto_664478 ?auto_664483 ) ) ( not ( = ?auto_664478 ?auto_664484 ) ) ( not ( = ?auto_664478 ?auto_664485 ) ) ( not ( = ?auto_664478 ?auto_664486 ) ) ( not ( = ?auto_664478 ?auto_664487 ) ) ( not ( = ?auto_664479 ?auto_664480 ) ) ( not ( = ?auto_664479 ?auto_664481 ) ) ( not ( = ?auto_664479 ?auto_664482 ) ) ( not ( = ?auto_664479 ?auto_664483 ) ) ( not ( = ?auto_664479 ?auto_664484 ) ) ( not ( = ?auto_664479 ?auto_664485 ) ) ( not ( = ?auto_664479 ?auto_664486 ) ) ( not ( = ?auto_664479 ?auto_664487 ) ) ( not ( = ?auto_664480 ?auto_664481 ) ) ( not ( = ?auto_664480 ?auto_664482 ) ) ( not ( = ?auto_664480 ?auto_664483 ) ) ( not ( = ?auto_664480 ?auto_664484 ) ) ( not ( = ?auto_664480 ?auto_664485 ) ) ( not ( = ?auto_664480 ?auto_664486 ) ) ( not ( = ?auto_664480 ?auto_664487 ) ) ( not ( = ?auto_664481 ?auto_664482 ) ) ( not ( = ?auto_664481 ?auto_664483 ) ) ( not ( = ?auto_664481 ?auto_664484 ) ) ( not ( = ?auto_664481 ?auto_664485 ) ) ( not ( = ?auto_664481 ?auto_664486 ) ) ( not ( = ?auto_664481 ?auto_664487 ) ) ( not ( = ?auto_664482 ?auto_664483 ) ) ( not ( = ?auto_664482 ?auto_664484 ) ) ( not ( = ?auto_664482 ?auto_664485 ) ) ( not ( = ?auto_664482 ?auto_664486 ) ) ( not ( = ?auto_664482 ?auto_664487 ) ) ( not ( = ?auto_664483 ?auto_664484 ) ) ( not ( = ?auto_664483 ?auto_664485 ) ) ( not ( = ?auto_664483 ?auto_664486 ) ) ( not ( = ?auto_664483 ?auto_664487 ) ) ( not ( = ?auto_664484 ?auto_664485 ) ) ( not ( = ?auto_664484 ?auto_664486 ) ) ( not ( = ?auto_664484 ?auto_664487 ) ) ( not ( = ?auto_664485 ?auto_664486 ) ) ( not ( = ?auto_664485 ?auto_664487 ) ) ( not ( = ?auto_664486 ?auto_664487 ) ) ( ON ?auto_664485 ?auto_664486 ) ( ON ?auto_664484 ?auto_664485 ) ( ON ?auto_664483 ?auto_664484 ) ( ON ?auto_664482 ?auto_664483 ) ( ON ?auto_664481 ?auto_664482 ) ( ON ?auto_664480 ?auto_664481 ) ( ON ?auto_664479 ?auto_664480 ) ( ON ?auto_664478 ?auto_664479 ) ( CLEAR ?auto_664476 ) ( ON ?auto_664477 ?auto_664478 ) ( CLEAR ?auto_664477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_664470 ?auto_664471 ?auto_664472 ?auto_664473 ?auto_664474 ?auto_664475 ?auto_664476 ?auto_664477 )
      ( MAKE-17PILE ?auto_664470 ?auto_664471 ?auto_664472 ?auto_664473 ?auto_664474 ?auto_664475 ?auto_664476 ?auto_664477 ?auto_664478 ?auto_664479 ?auto_664480 ?auto_664481 ?auto_664482 ?auto_664483 ?auto_664484 ?auto_664485 ?auto_664486 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664505 - BLOCK
      ?auto_664506 - BLOCK
      ?auto_664507 - BLOCK
      ?auto_664508 - BLOCK
      ?auto_664509 - BLOCK
      ?auto_664510 - BLOCK
      ?auto_664511 - BLOCK
      ?auto_664512 - BLOCK
      ?auto_664513 - BLOCK
      ?auto_664514 - BLOCK
      ?auto_664515 - BLOCK
      ?auto_664516 - BLOCK
      ?auto_664517 - BLOCK
      ?auto_664518 - BLOCK
      ?auto_664519 - BLOCK
      ?auto_664520 - BLOCK
      ?auto_664521 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_664521 ) ( ON-TABLE ?auto_664505 ) ( ON ?auto_664506 ?auto_664505 ) ( ON ?auto_664507 ?auto_664506 ) ( ON ?auto_664508 ?auto_664507 ) ( ON ?auto_664509 ?auto_664508 ) ( ON ?auto_664510 ?auto_664509 ) ( ON ?auto_664511 ?auto_664510 ) ( not ( = ?auto_664505 ?auto_664506 ) ) ( not ( = ?auto_664505 ?auto_664507 ) ) ( not ( = ?auto_664505 ?auto_664508 ) ) ( not ( = ?auto_664505 ?auto_664509 ) ) ( not ( = ?auto_664505 ?auto_664510 ) ) ( not ( = ?auto_664505 ?auto_664511 ) ) ( not ( = ?auto_664505 ?auto_664512 ) ) ( not ( = ?auto_664505 ?auto_664513 ) ) ( not ( = ?auto_664505 ?auto_664514 ) ) ( not ( = ?auto_664505 ?auto_664515 ) ) ( not ( = ?auto_664505 ?auto_664516 ) ) ( not ( = ?auto_664505 ?auto_664517 ) ) ( not ( = ?auto_664505 ?auto_664518 ) ) ( not ( = ?auto_664505 ?auto_664519 ) ) ( not ( = ?auto_664505 ?auto_664520 ) ) ( not ( = ?auto_664505 ?auto_664521 ) ) ( not ( = ?auto_664506 ?auto_664507 ) ) ( not ( = ?auto_664506 ?auto_664508 ) ) ( not ( = ?auto_664506 ?auto_664509 ) ) ( not ( = ?auto_664506 ?auto_664510 ) ) ( not ( = ?auto_664506 ?auto_664511 ) ) ( not ( = ?auto_664506 ?auto_664512 ) ) ( not ( = ?auto_664506 ?auto_664513 ) ) ( not ( = ?auto_664506 ?auto_664514 ) ) ( not ( = ?auto_664506 ?auto_664515 ) ) ( not ( = ?auto_664506 ?auto_664516 ) ) ( not ( = ?auto_664506 ?auto_664517 ) ) ( not ( = ?auto_664506 ?auto_664518 ) ) ( not ( = ?auto_664506 ?auto_664519 ) ) ( not ( = ?auto_664506 ?auto_664520 ) ) ( not ( = ?auto_664506 ?auto_664521 ) ) ( not ( = ?auto_664507 ?auto_664508 ) ) ( not ( = ?auto_664507 ?auto_664509 ) ) ( not ( = ?auto_664507 ?auto_664510 ) ) ( not ( = ?auto_664507 ?auto_664511 ) ) ( not ( = ?auto_664507 ?auto_664512 ) ) ( not ( = ?auto_664507 ?auto_664513 ) ) ( not ( = ?auto_664507 ?auto_664514 ) ) ( not ( = ?auto_664507 ?auto_664515 ) ) ( not ( = ?auto_664507 ?auto_664516 ) ) ( not ( = ?auto_664507 ?auto_664517 ) ) ( not ( = ?auto_664507 ?auto_664518 ) ) ( not ( = ?auto_664507 ?auto_664519 ) ) ( not ( = ?auto_664507 ?auto_664520 ) ) ( not ( = ?auto_664507 ?auto_664521 ) ) ( not ( = ?auto_664508 ?auto_664509 ) ) ( not ( = ?auto_664508 ?auto_664510 ) ) ( not ( = ?auto_664508 ?auto_664511 ) ) ( not ( = ?auto_664508 ?auto_664512 ) ) ( not ( = ?auto_664508 ?auto_664513 ) ) ( not ( = ?auto_664508 ?auto_664514 ) ) ( not ( = ?auto_664508 ?auto_664515 ) ) ( not ( = ?auto_664508 ?auto_664516 ) ) ( not ( = ?auto_664508 ?auto_664517 ) ) ( not ( = ?auto_664508 ?auto_664518 ) ) ( not ( = ?auto_664508 ?auto_664519 ) ) ( not ( = ?auto_664508 ?auto_664520 ) ) ( not ( = ?auto_664508 ?auto_664521 ) ) ( not ( = ?auto_664509 ?auto_664510 ) ) ( not ( = ?auto_664509 ?auto_664511 ) ) ( not ( = ?auto_664509 ?auto_664512 ) ) ( not ( = ?auto_664509 ?auto_664513 ) ) ( not ( = ?auto_664509 ?auto_664514 ) ) ( not ( = ?auto_664509 ?auto_664515 ) ) ( not ( = ?auto_664509 ?auto_664516 ) ) ( not ( = ?auto_664509 ?auto_664517 ) ) ( not ( = ?auto_664509 ?auto_664518 ) ) ( not ( = ?auto_664509 ?auto_664519 ) ) ( not ( = ?auto_664509 ?auto_664520 ) ) ( not ( = ?auto_664509 ?auto_664521 ) ) ( not ( = ?auto_664510 ?auto_664511 ) ) ( not ( = ?auto_664510 ?auto_664512 ) ) ( not ( = ?auto_664510 ?auto_664513 ) ) ( not ( = ?auto_664510 ?auto_664514 ) ) ( not ( = ?auto_664510 ?auto_664515 ) ) ( not ( = ?auto_664510 ?auto_664516 ) ) ( not ( = ?auto_664510 ?auto_664517 ) ) ( not ( = ?auto_664510 ?auto_664518 ) ) ( not ( = ?auto_664510 ?auto_664519 ) ) ( not ( = ?auto_664510 ?auto_664520 ) ) ( not ( = ?auto_664510 ?auto_664521 ) ) ( not ( = ?auto_664511 ?auto_664512 ) ) ( not ( = ?auto_664511 ?auto_664513 ) ) ( not ( = ?auto_664511 ?auto_664514 ) ) ( not ( = ?auto_664511 ?auto_664515 ) ) ( not ( = ?auto_664511 ?auto_664516 ) ) ( not ( = ?auto_664511 ?auto_664517 ) ) ( not ( = ?auto_664511 ?auto_664518 ) ) ( not ( = ?auto_664511 ?auto_664519 ) ) ( not ( = ?auto_664511 ?auto_664520 ) ) ( not ( = ?auto_664511 ?auto_664521 ) ) ( not ( = ?auto_664512 ?auto_664513 ) ) ( not ( = ?auto_664512 ?auto_664514 ) ) ( not ( = ?auto_664512 ?auto_664515 ) ) ( not ( = ?auto_664512 ?auto_664516 ) ) ( not ( = ?auto_664512 ?auto_664517 ) ) ( not ( = ?auto_664512 ?auto_664518 ) ) ( not ( = ?auto_664512 ?auto_664519 ) ) ( not ( = ?auto_664512 ?auto_664520 ) ) ( not ( = ?auto_664512 ?auto_664521 ) ) ( not ( = ?auto_664513 ?auto_664514 ) ) ( not ( = ?auto_664513 ?auto_664515 ) ) ( not ( = ?auto_664513 ?auto_664516 ) ) ( not ( = ?auto_664513 ?auto_664517 ) ) ( not ( = ?auto_664513 ?auto_664518 ) ) ( not ( = ?auto_664513 ?auto_664519 ) ) ( not ( = ?auto_664513 ?auto_664520 ) ) ( not ( = ?auto_664513 ?auto_664521 ) ) ( not ( = ?auto_664514 ?auto_664515 ) ) ( not ( = ?auto_664514 ?auto_664516 ) ) ( not ( = ?auto_664514 ?auto_664517 ) ) ( not ( = ?auto_664514 ?auto_664518 ) ) ( not ( = ?auto_664514 ?auto_664519 ) ) ( not ( = ?auto_664514 ?auto_664520 ) ) ( not ( = ?auto_664514 ?auto_664521 ) ) ( not ( = ?auto_664515 ?auto_664516 ) ) ( not ( = ?auto_664515 ?auto_664517 ) ) ( not ( = ?auto_664515 ?auto_664518 ) ) ( not ( = ?auto_664515 ?auto_664519 ) ) ( not ( = ?auto_664515 ?auto_664520 ) ) ( not ( = ?auto_664515 ?auto_664521 ) ) ( not ( = ?auto_664516 ?auto_664517 ) ) ( not ( = ?auto_664516 ?auto_664518 ) ) ( not ( = ?auto_664516 ?auto_664519 ) ) ( not ( = ?auto_664516 ?auto_664520 ) ) ( not ( = ?auto_664516 ?auto_664521 ) ) ( not ( = ?auto_664517 ?auto_664518 ) ) ( not ( = ?auto_664517 ?auto_664519 ) ) ( not ( = ?auto_664517 ?auto_664520 ) ) ( not ( = ?auto_664517 ?auto_664521 ) ) ( not ( = ?auto_664518 ?auto_664519 ) ) ( not ( = ?auto_664518 ?auto_664520 ) ) ( not ( = ?auto_664518 ?auto_664521 ) ) ( not ( = ?auto_664519 ?auto_664520 ) ) ( not ( = ?auto_664519 ?auto_664521 ) ) ( not ( = ?auto_664520 ?auto_664521 ) ) ( ON ?auto_664520 ?auto_664521 ) ( ON ?auto_664519 ?auto_664520 ) ( ON ?auto_664518 ?auto_664519 ) ( ON ?auto_664517 ?auto_664518 ) ( ON ?auto_664516 ?auto_664517 ) ( ON ?auto_664515 ?auto_664516 ) ( ON ?auto_664514 ?auto_664515 ) ( ON ?auto_664513 ?auto_664514 ) ( CLEAR ?auto_664511 ) ( ON ?auto_664512 ?auto_664513 ) ( CLEAR ?auto_664512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_664505 ?auto_664506 ?auto_664507 ?auto_664508 ?auto_664509 ?auto_664510 ?auto_664511 ?auto_664512 )
      ( MAKE-17PILE ?auto_664505 ?auto_664506 ?auto_664507 ?auto_664508 ?auto_664509 ?auto_664510 ?auto_664511 ?auto_664512 ?auto_664513 ?auto_664514 ?auto_664515 ?auto_664516 ?auto_664517 ?auto_664518 ?auto_664519 ?auto_664520 ?auto_664521 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664539 - BLOCK
      ?auto_664540 - BLOCK
      ?auto_664541 - BLOCK
      ?auto_664542 - BLOCK
      ?auto_664543 - BLOCK
      ?auto_664544 - BLOCK
      ?auto_664545 - BLOCK
      ?auto_664546 - BLOCK
      ?auto_664547 - BLOCK
      ?auto_664548 - BLOCK
      ?auto_664549 - BLOCK
      ?auto_664550 - BLOCK
      ?auto_664551 - BLOCK
      ?auto_664552 - BLOCK
      ?auto_664553 - BLOCK
      ?auto_664554 - BLOCK
      ?auto_664555 - BLOCK
    )
    :vars
    (
      ?auto_664556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664555 ?auto_664556 ) ( ON-TABLE ?auto_664539 ) ( ON ?auto_664540 ?auto_664539 ) ( ON ?auto_664541 ?auto_664540 ) ( ON ?auto_664542 ?auto_664541 ) ( ON ?auto_664543 ?auto_664542 ) ( ON ?auto_664544 ?auto_664543 ) ( not ( = ?auto_664539 ?auto_664540 ) ) ( not ( = ?auto_664539 ?auto_664541 ) ) ( not ( = ?auto_664539 ?auto_664542 ) ) ( not ( = ?auto_664539 ?auto_664543 ) ) ( not ( = ?auto_664539 ?auto_664544 ) ) ( not ( = ?auto_664539 ?auto_664545 ) ) ( not ( = ?auto_664539 ?auto_664546 ) ) ( not ( = ?auto_664539 ?auto_664547 ) ) ( not ( = ?auto_664539 ?auto_664548 ) ) ( not ( = ?auto_664539 ?auto_664549 ) ) ( not ( = ?auto_664539 ?auto_664550 ) ) ( not ( = ?auto_664539 ?auto_664551 ) ) ( not ( = ?auto_664539 ?auto_664552 ) ) ( not ( = ?auto_664539 ?auto_664553 ) ) ( not ( = ?auto_664539 ?auto_664554 ) ) ( not ( = ?auto_664539 ?auto_664555 ) ) ( not ( = ?auto_664539 ?auto_664556 ) ) ( not ( = ?auto_664540 ?auto_664541 ) ) ( not ( = ?auto_664540 ?auto_664542 ) ) ( not ( = ?auto_664540 ?auto_664543 ) ) ( not ( = ?auto_664540 ?auto_664544 ) ) ( not ( = ?auto_664540 ?auto_664545 ) ) ( not ( = ?auto_664540 ?auto_664546 ) ) ( not ( = ?auto_664540 ?auto_664547 ) ) ( not ( = ?auto_664540 ?auto_664548 ) ) ( not ( = ?auto_664540 ?auto_664549 ) ) ( not ( = ?auto_664540 ?auto_664550 ) ) ( not ( = ?auto_664540 ?auto_664551 ) ) ( not ( = ?auto_664540 ?auto_664552 ) ) ( not ( = ?auto_664540 ?auto_664553 ) ) ( not ( = ?auto_664540 ?auto_664554 ) ) ( not ( = ?auto_664540 ?auto_664555 ) ) ( not ( = ?auto_664540 ?auto_664556 ) ) ( not ( = ?auto_664541 ?auto_664542 ) ) ( not ( = ?auto_664541 ?auto_664543 ) ) ( not ( = ?auto_664541 ?auto_664544 ) ) ( not ( = ?auto_664541 ?auto_664545 ) ) ( not ( = ?auto_664541 ?auto_664546 ) ) ( not ( = ?auto_664541 ?auto_664547 ) ) ( not ( = ?auto_664541 ?auto_664548 ) ) ( not ( = ?auto_664541 ?auto_664549 ) ) ( not ( = ?auto_664541 ?auto_664550 ) ) ( not ( = ?auto_664541 ?auto_664551 ) ) ( not ( = ?auto_664541 ?auto_664552 ) ) ( not ( = ?auto_664541 ?auto_664553 ) ) ( not ( = ?auto_664541 ?auto_664554 ) ) ( not ( = ?auto_664541 ?auto_664555 ) ) ( not ( = ?auto_664541 ?auto_664556 ) ) ( not ( = ?auto_664542 ?auto_664543 ) ) ( not ( = ?auto_664542 ?auto_664544 ) ) ( not ( = ?auto_664542 ?auto_664545 ) ) ( not ( = ?auto_664542 ?auto_664546 ) ) ( not ( = ?auto_664542 ?auto_664547 ) ) ( not ( = ?auto_664542 ?auto_664548 ) ) ( not ( = ?auto_664542 ?auto_664549 ) ) ( not ( = ?auto_664542 ?auto_664550 ) ) ( not ( = ?auto_664542 ?auto_664551 ) ) ( not ( = ?auto_664542 ?auto_664552 ) ) ( not ( = ?auto_664542 ?auto_664553 ) ) ( not ( = ?auto_664542 ?auto_664554 ) ) ( not ( = ?auto_664542 ?auto_664555 ) ) ( not ( = ?auto_664542 ?auto_664556 ) ) ( not ( = ?auto_664543 ?auto_664544 ) ) ( not ( = ?auto_664543 ?auto_664545 ) ) ( not ( = ?auto_664543 ?auto_664546 ) ) ( not ( = ?auto_664543 ?auto_664547 ) ) ( not ( = ?auto_664543 ?auto_664548 ) ) ( not ( = ?auto_664543 ?auto_664549 ) ) ( not ( = ?auto_664543 ?auto_664550 ) ) ( not ( = ?auto_664543 ?auto_664551 ) ) ( not ( = ?auto_664543 ?auto_664552 ) ) ( not ( = ?auto_664543 ?auto_664553 ) ) ( not ( = ?auto_664543 ?auto_664554 ) ) ( not ( = ?auto_664543 ?auto_664555 ) ) ( not ( = ?auto_664543 ?auto_664556 ) ) ( not ( = ?auto_664544 ?auto_664545 ) ) ( not ( = ?auto_664544 ?auto_664546 ) ) ( not ( = ?auto_664544 ?auto_664547 ) ) ( not ( = ?auto_664544 ?auto_664548 ) ) ( not ( = ?auto_664544 ?auto_664549 ) ) ( not ( = ?auto_664544 ?auto_664550 ) ) ( not ( = ?auto_664544 ?auto_664551 ) ) ( not ( = ?auto_664544 ?auto_664552 ) ) ( not ( = ?auto_664544 ?auto_664553 ) ) ( not ( = ?auto_664544 ?auto_664554 ) ) ( not ( = ?auto_664544 ?auto_664555 ) ) ( not ( = ?auto_664544 ?auto_664556 ) ) ( not ( = ?auto_664545 ?auto_664546 ) ) ( not ( = ?auto_664545 ?auto_664547 ) ) ( not ( = ?auto_664545 ?auto_664548 ) ) ( not ( = ?auto_664545 ?auto_664549 ) ) ( not ( = ?auto_664545 ?auto_664550 ) ) ( not ( = ?auto_664545 ?auto_664551 ) ) ( not ( = ?auto_664545 ?auto_664552 ) ) ( not ( = ?auto_664545 ?auto_664553 ) ) ( not ( = ?auto_664545 ?auto_664554 ) ) ( not ( = ?auto_664545 ?auto_664555 ) ) ( not ( = ?auto_664545 ?auto_664556 ) ) ( not ( = ?auto_664546 ?auto_664547 ) ) ( not ( = ?auto_664546 ?auto_664548 ) ) ( not ( = ?auto_664546 ?auto_664549 ) ) ( not ( = ?auto_664546 ?auto_664550 ) ) ( not ( = ?auto_664546 ?auto_664551 ) ) ( not ( = ?auto_664546 ?auto_664552 ) ) ( not ( = ?auto_664546 ?auto_664553 ) ) ( not ( = ?auto_664546 ?auto_664554 ) ) ( not ( = ?auto_664546 ?auto_664555 ) ) ( not ( = ?auto_664546 ?auto_664556 ) ) ( not ( = ?auto_664547 ?auto_664548 ) ) ( not ( = ?auto_664547 ?auto_664549 ) ) ( not ( = ?auto_664547 ?auto_664550 ) ) ( not ( = ?auto_664547 ?auto_664551 ) ) ( not ( = ?auto_664547 ?auto_664552 ) ) ( not ( = ?auto_664547 ?auto_664553 ) ) ( not ( = ?auto_664547 ?auto_664554 ) ) ( not ( = ?auto_664547 ?auto_664555 ) ) ( not ( = ?auto_664547 ?auto_664556 ) ) ( not ( = ?auto_664548 ?auto_664549 ) ) ( not ( = ?auto_664548 ?auto_664550 ) ) ( not ( = ?auto_664548 ?auto_664551 ) ) ( not ( = ?auto_664548 ?auto_664552 ) ) ( not ( = ?auto_664548 ?auto_664553 ) ) ( not ( = ?auto_664548 ?auto_664554 ) ) ( not ( = ?auto_664548 ?auto_664555 ) ) ( not ( = ?auto_664548 ?auto_664556 ) ) ( not ( = ?auto_664549 ?auto_664550 ) ) ( not ( = ?auto_664549 ?auto_664551 ) ) ( not ( = ?auto_664549 ?auto_664552 ) ) ( not ( = ?auto_664549 ?auto_664553 ) ) ( not ( = ?auto_664549 ?auto_664554 ) ) ( not ( = ?auto_664549 ?auto_664555 ) ) ( not ( = ?auto_664549 ?auto_664556 ) ) ( not ( = ?auto_664550 ?auto_664551 ) ) ( not ( = ?auto_664550 ?auto_664552 ) ) ( not ( = ?auto_664550 ?auto_664553 ) ) ( not ( = ?auto_664550 ?auto_664554 ) ) ( not ( = ?auto_664550 ?auto_664555 ) ) ( not ( = ?auto_664550 ?auto_664556 ) ) ( not ( = ?auto_664551 ?auto_664552 ) ) ( not ( = ?auto_664551 ?auto_664553 ) ) ( not ( = ?auto_664551 ?auto_664554 ) ) ( not ( = ?auto_664551 ?auto_664555 ) ) ( not ( = ?auto_664551 ?auto_664556 ) ) ( not ( = ?auto_664552 ?auto_664553 ) ) ( not ( = ?auto_664552 ?auto_664554 ) ) ( not ( = ?auto_664552 ?auto_664555 ) ) ( not ( = ?auto_664552 ?auto_664556 ) ) ( not ( = ?auto_664553 ?auto_664554 ) ) ( not ( = ?auto_664553 ?auto_664555 ) ) ( not ( = ?auto_664553 ?auto_664556 ) ) ( not ( = ?auto_664554 ?auto_664555 ) ) ( not ( = ?auto_664554 ?auto_664556 ) ) ( not ( = ?auto_664555 ?auto_664556 ) ) ( ON ?auto_664554 ?auto_664555 ) ( ON ?auto_664553 ?auto_664554 ) ( ON ?auto_664552 ?auto_664553 ) ( ON ?auto_664551 ?auto_664552 ) ( ON ?auto_664550 ?auto_664551 ) ( ON ?auto_664549 ?auto_664550 ) ( ON ?auto_664548 ?auto_664549 ) ( ON ?auto_664547 ?auto_664548 ) ( ON ?auto_664546 ?auto_664547 ) ( CLEAR ?auto_664544 ) ( ON ?auto_664545 ?auto_664546 ) ( CLEAR ?auto_664545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_664539 ?auto_664540 ?auto_664541 ?auto_664542 ?auto_664543 ?auto_664544 ?auto_664545 )
      ( MAKE-17PILE ?auto_664539 ?auto_664540 ?auto_664541 ?auto_664542 ?auto_664543 ?auto_664544 ?auto_664545 ?auto_664546 ?auto_664547 ?auto_664548 ?auto_664549 ?auto_664550 ?auto_664551 ?auto_664552 ?auto_664553 ?auto_664554 ?auto_664555 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664574 - BLOCK
      ?auto_664575 - BLOCK
      ?auto_664576 - BLOCK
      ?auto_664577 - BLOCK
      ?auto_664578 - BLOCK
      ?auto_664579 - BLOCK
      ?auto_664580 - BLOCK
      ?auto_664581 - BLOCK
      ?auto_664582 - BLOCK
      ?auto_664583 - BLOCK
      ?auto_664584 - BLOCK
      ?auto_664585 - BLOCK
      ?auto_664586 - BLOCK
      ?auto_664587 - BLOCK
      ?auto_664588 - BLOCK
      ?auto_664589 - BLOCK
      ?auto_664590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_664590 ) ( ON-TABLE ?auto_664574 ) ( ON ?auto_664575 ?auto_664574 ) ( ON ?auto_664576 ?auto_664575 ) ( ON ?auto_664577 ?auto_664576 ) ( ON ?auto_664578 ?auto_664577 ) ( ON ?auto_664579 ?auto_664578 ) ( not ( = ?auto_664574 ?auto_664575 ) ) ( not ( = ?auto_664574 ?auto_664576 ) ) ( not ( = ?auto_664574 ?auto_664577 ) ) ( not ( = ?auto_664574 ?auto_664578 ) ) ( not ( = ?auto_664574 ?auto_664579 ) ) ( not ( = ?auto_664574 ?auto_664580 ) ) ( not ( = ?auto_664574 ?auto_664581 ) ) ( not ( = ?auto_664574 ?auto_664582 ) ) ( not ( = ?auto_664574 ?auto_664583 ) ) ( not ( = ?auto_664574 ?auto_664584 ) ) ( not ( = ?auto_664574 ?auto_664585 ) ) ( not ( = ?auto_664574 ?auto_664586 ) ) ( not ( = ?auto_664574 ?auto_664587 ) ) ( not ( = ?auto_664574 ?auto_664588 ) ) ( not ( = ?auto_664574 ?auto_664589 ) ) ( not ( = ?auto_664574 ?auto_664590 ) ) ( not ( = ?auto_664575 ?auto_664576 ) ) ( not ( = ?auto_664575 ?auto_664577 ) ) ( not ( = ?auto_664575 ?auto_664578 ) ) ( not ( = ?auto_664575 ?auto_664579 ) ) ( not ( = ?auto_664575 ?auto_664580 ) ) ( not ( = ?auto_664575 ?auto_664581 ) ) ( not ( = ?auto_664575 ?auto_664582 ) ) ( not ( = ?auto_664575 ?auto_664583 ) ) ( not ( = ?auto_664575 ?auto_664584 ) ) ( not ( = ?auto_664575 ?auto_664585 ) ) ( not ( = ?auto_664575 ?auto_664586 ) ) ( not ( = ?auto_664575 ?auto_664587 ) ) ( not ( = ?auto_664575 ?auto_664588 ) ) ( not ( = ?auto_664575 ?auto_664589 ) ) ( not ( = ?auto_664575 ?auto_664590 ) ) ( not ( = ?auto_664576 ?auto_664577 ) ) ( not ( = ?auto_664576 ?auto_664578 ) ) ( not ( = ?auto_664576 ?auto_664579 ) ) ( not ( = ?auto_664576 ?auto_664580 ) ) ( not ( = ?auto_664576 ?auto_664581 ) ) ( not ( = ?auto_664576 ?auto_664582 ) ) ( not ( = ?auto_664576 ?auto_664583 ) ) ( not ( = ?auto_664576 ?auto_664584 ) ) ( not ( = ?auto_664576 ?auto_664585 ) ) ( not ( = ?auto_664576 ?auto_664586 ) ) ( not ( = ?auto_664576 ?auto_664587 ) ) ( not ( = ?auto_664576 ?auto_664588 ) ) ( not ( = ?auto_664576 ?auto_664589 ) ) ( not ( = ?auto_664576 ?auto_664590 ) ) ( not ( = ?auto_664577 ?auto_664578 ) ) ( not ( = ?auto_664577 ?auto_664579 ) ) ( not ( = ?auto_664577 ?auto_664580 ) ) ( not ( = ?auto_664577 ?auto_664581 ) ) ( not ( = ?auto_664577 ?auto_664582 ) ) ( not ( = ?auto_664577 ?auto_664583 ) ) ( not ( = ?auto_664577 ?auto_664584 ) ) ( not ( = ?auto_664577 ?auto_664585 ) ) ( not ( = ?auto_664577 ?auto_664586 ) ) ( not ( = ?auto_664577 ?auto_664587 ) ) ( not ( = ?auto_664577 ?auto_664588 ) ) ( not ( = ?auto_664577 ?auto_664589 ) ) ( not ( = ?auto_664577 ?auto_664590 ) ) ( not ( = ?auto_664578 ?auto_664579 ) ) ( not ( = ?auto_664578 ?auto_664580 ) ) ( not ( = ?auto_664578 ?auto_664581 ) ) ( not ( = ?auto_664578 ?auto_664582 ) ) ( not ( = ?auto_664578 ?auto_664583 ) ) ( not ( = ?auto_664578 ?auto_664584 ) ) ( not ( = ?auto_664578 ?auto_664585 ) ) ( not ( = ?auto_664578 ?auto_664586 ) ) ( not ( = ?auto_664578 ?auto_664587 ) ) ( not ( = ?auto_664578 ?auto_664588 ) ) ( not ( = ?auto_664578 ?auto_664589 ) ) ( not ( = ?auto_664578 ?auto_664590 ) ) ( not ( = ?auto_664579 ?auto_664580 ) ) ( not ( = ?auto_664579 ?auto_664581 ) ) ( not ( = ?auto_664579 ?auto_664582 ) ) ( not ( = ?auto_664579 ?auto_664583 ) ) ( not ( = ?auto_664579 ?auto_664584 ) ) ( not ( = ?auto_664579 ?auto_664585 ) ) ( not ( = ?auto_664579 ?auto_664586 ) ) ( not ( = ?auto_664579 ?auto_664587 ) ) ( not ( = ?auto_664579 ?auto_664588 ) ) ( not ( = ?auto_664579 ?auto_664589 ) ) ( not ( = ?auto_664579 ?auto_664590 ) ) ( not ( = ?auto_664580 ?auto_664581 ) ) ( not ( = ?auto_664580 ?auto_664582 ) ) ( not ( = ?auto_664580 ?auto_664583 ) ) ( not ( = ?auto_664580 ?auto_664584 ) ) ( not ( = ?auto_664580 ?auto_664585 ) ) ( not ( = ?auto_664580 ?auto_664586 ) ) ( not ( = ?auto_664580 ?auto_664587 ) ) ( not ( = ?auto_664580 ?auto_664588 ) ) ( not ( = ?auto_664580 ?auto_664589 ) ) ( not ( = ?auto_664580 ?auto_664590 ) ) ( not ( = ?auto_664581 ?auto_664582 ) ) ( not ( = ?auto_664581 ?auto_664583 ) ) ( not ( = ?auto_664581 ?auto_664584 ) ) ( not ( = ?auto_664581 ?auto_664585 ) ) ( not ( = ?auto_664581 ?auto_664586 ) ) ( not ( = ?auto_664581 ?auto_664587 ) ) ( not ( = ?auto_664581 ?auto_664588 ) ) ( not ( = ?auto_664581 ?auto_664589 ) ) ( not ( = ?auto_664581 ?auto_664590 ) ) ( not ( = ?auto_664582 ?auto_664583 ) ) ( not ( = ?auto_664582 ?auto_664584 ) ) ( not ( = ?auto_664582 ?auto_664585 ) ) ( not ( = ?auto_664582 ?auto_664586 ) ) ( not ( = ?auto_664582 ?auto_664587 ) ) ( not ( = ?auto_664582 ?auto_664588 ) ) ( not ( = ?auto_664582 ?auto_664589 ) ) ( not ( = ?auto_664582 ?auto_664590 ) ) ( not ( = ?auto_664583 ?auto_664584 ) ) ( not ( = ?auto_664583 ?auto_664585 ) ) ( not ( = ?auto_664583 ?auto_664586 ) ) ( not ( = ?auto_664583 ?auto_664587 ) ) ( not ( = ?auto_664583 ?auto_664588 ) ) ( not ( = ?auto_664583 ?auto_664589 ) ) ( not ( = ?auto_664583 ?auto_664590 ) ) ( not ( = ?auto_664584 ?auto_664585 ) ) ( not ( = ?auto_664584 ?auto_664586 ) ) ( not ( = ?auto_664584 ?auto_664587 ) ) ( not ( = ?auto_664584 ?auto_664588 ) ) ( not ( = ?auto_664584 ?auto_664589 ) ) ( not ( = ?auto_664584 ?auto_664590 ) ) ( not ( = ?auto_664585 ?auto_664586 ) ) ( not ( = ?auto_664585 ?auto_664587 ) ) ( not ( = ?auto_664585 ?auto_664588 ) ) ( not ( = ?auto_664585 ?auto_664589 ) ) ( not ( = ?auto_664585 ?auto_664590 ) ) ( not ( = ?auto_664586 ?auto_664587 ) ) ( not ( = ?auto_664586 ?auto_664588 ) ) ( not ( = ?auto_664586 ?auto_664589 ) ) ( not ( = ?auto_664586 ?auto_664590 ) ) ( not ( = ?auto_664587 ?auto_664588 ) ) ( not ( = ?auto_664587 ?auto_664589 ) ) ( not ( = ?auto_664587 ?auto_664590 ) ) ( not ( = ?auto_664588 ?auto_664589 ) ) ( not ( = ?auto_664588 ?auto_664590 ) ) ( not ( = ?auto_664589 ?auto_664590 ) ) ( ON ?auto_664589 ?auto_664590 ) ( ON ?auto_664588 ?auto_664589 ) ( ON ?auto_664587 ?auto_664588 ) ( ON ?auto_664586 ?auto_664587 ) ( ON ?auto_664585 ?auto_664586 ) ( ON ?auto_664584 ?auto_664585 ) ( ON ?auto_664583 ?auto_664584 ) ( ON ?auto_664582 ?auto_664583 ) ( ON ?auto_664581 ?auto_664582 ) ( CLEAR ?auto_664579 ) ( ON ?auto_664580 ?auto_664581 ) ( CLEAR ?auto_664580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_664574 ?auto_664575 ?auto_664576 ?auto_664577 ?auto_664578 ?auto_664579 ?auto_664580 )
      ( MAKE-17PILE ?auto_664574 ?auto_664575 ?auto_664576 ?auto_664577 ?auto_664578 ?auto_664579 ?auto_664580 ?auto_664581 ?auto_664582 ?auto_664583 ?auto_664584 ?auto_664585 ?auto_664586 ?auto_664587 ?auto_664588 ?auto_664589 ?auto_664590 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664608 - BLOCK
      ?auto_664609 - BLOCK
      ?auto_664610 - BLOCK
      ?auto_664611 - BLOCK
      ?auto_664612 - BLOCK
      ?auto_664613 - BLOCK
      ?auto_664614 - BLOCK
      ?auto_664615 - BLOCK
      ?auto_664616 - BLOCK
      ?auto_664617 - BLOCK
      ?auto_664618 - BLOCK
      ?auto_664619 - BLOCK
      ?auto_664620 - BLOCK
      ?auto_664621 - BLOCK
      ?auto_664622 - BLOCK
      ?auto_664623 - BLOCK
      ?auto_664624 - BLOCK
    )
    :vars
    (
      ?auto_664625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664624 ?auto_664625 ) ( ON-TABLE ?auto_664608 ) ( ON ?auto_664609 ?auto_664608 ) ( ON ?auto_664610 ?auto_664609 ) ( ON ?auto_664611 ?auto_664610 ) ( ON ?auto_664612 ?auto_664611 ) ( not ( = ?auto_664608 ?auto_664609 ) ) ( not ( = ?auto_664608 ?auto_664610 ) ) ( not ( = ?auto_664608 ?auto_664611 ) ) ( not ( = ?auto_664608 ?auto_664612 ) ) ( not ( = ?auto_664608 ?auto_664613 ) ) ( not ( = ?auto_664608 ?auto_664614 ) ) ( not ( = ?auto_664608 ?auto_664615 ) ) ( not ( = ?auto_664608 ?auto_664616 ) ) ( not ( = ?auto_664608 ?auto_664617 ) ) ( not ( = ?auto_664608 ?auto_664618 ) ) ( not ( = ?auto_664608 ?auto_664619 ) ) ( not ( = ?auto_664608 ?auto_664620 ) ) ( not ( = ?auto_664608 ?auto_664621 ) ) ( not ( = ?auto_664608 ?auto_664622 ) ) ( not ( = ?auto_664608 ?auto_664623 ) ) ( not ( = ?auto_664608 ?auto_664624 ) ) ( not ( = ?auto_664608 ?auto_664625 ) ) ( not ( = ?auto_664609 ?auto_664610 ) ) ( not ( = ?auto_664609 ?auto_664611 ) ) ( not ( = ?auto_664609 ?auto_664612 ) ) ( not ( = ?auto_664609 ?auto_664613 ) ) ( not ( = ?auto_664609 ?auto_664614 ) ) ( not ( = ?auto_664609 ?auto_664615 ) ) ( not ( = ?auto_664609 ?auto_664616 ) ) ( not ( = ?auto_664609 ?auto_664617 ) ) ( not ( = ?auto_664609 ?auto_664618 ) ) ( not ( = ?auto_664609 ?auto_664619 ) ) ( not ( = ?auto_664609 ?auto_664620 ) ) ( not ( = ?auto_664609 ?auto_664621 ) ) ( not ( = ?auto_664609 ?auto_664622 ) ) ( not ( = ?auto_664609 ?auto_664623 ) ) ( not ( = ?auto_664609 ?auto_664624 ) ) ( not ( = ?auto_664609 ?auto_664625 ) ) ( not ( = ?auto_664610 ?auto_664611 ) ) ( not ( = ?auto_664610 ?auto_664612 ) ) ( not ( = ?auto_664610 ?auto_664613 ) ) ( not ( = ?auto_664610 ?auto_664614 ) ) ( not ( = ?auto_664610 ?auto_664615 ) ) ( not ( = ?auto_664610 ?auto_664616 ) ) ( not ( = ?auto_664610 ?auto_664617 ) ) ( not ( = ?auto_664610 ?auto_664618 ) ) ( not ( = ?auto_664610 ?auto_664619 ) ) ( not ( = ?auto_664610 ?auto_664620 ) ) ( not ( = ?auto_664610 ?auto_664621 ) ) ( not ( = ?auto_664610 ?auto_664622 ) ) ( not ( = ?auto_664610 ?auto_664623 ) ) ( not ( = ?auto_664610 ?auto_664624 ) ) ( not ( = ?auto_664610 ?auto_664625 ) ) ( not ( = ?auto_664611 ?auto_664612 ) ) ( not ( = ?auto_664611 ?auto_664613 ) ) ( not ( = ?auto_664611 ?auto_664614 ) ) ( not ( = ?auto_664611 ?auto_664615 ) ) ( not ( = ?auto_664611 ?auto_664616 ) ) ( not ( = ?auto_664611 ?auto_664617 ) ) ( not ( = ?auto_664611 ?auto_664618 ) ) ( not ( = ?auto_664611 ?auto_664619 ) ) ( not ( = ?auto_664611 ?auto_664620 ) ) ( not ( = ?auto_664611 ?auto_664621 ) ) ( not ( = ?auto_664611 ?auto_664622 ) ) ( not ( = ?auto_664611 ?auto_664623 ) ) ( not ( = ?auto_664611 ?auto_664624 ) ) ( not ( = ?auto_664611 ?auto_664625 ) ) ( not ( = ?auto_664612 ?auto_664613 ) ) ( not ( = ?auto_664612 ?auto_664614 ) ) ( not ( = ?auto_664612 ?auto_664615 ) ) ( not ( = ?auto_664612 ?auto_664616 ) ) ( not ( = ?auto_664612 ?auto_664617 ) ) ( not ( = ?auto_664612 ?auto_664618 ) ) ( not ( = ?auto_664612 ?auto_664619 ) ) ( not ( = ?auto_664612 ?auto_664620 ) ) ( not ( = ?auto_664612 ?auto_664621 ) ) ( not ( = ?auto_664612 ?auto_664622 ) ) ( not ( = ?auto_664612 ?auto_664623 ) ) ( not ( = ?auto_664612 ?auto_664624 ) ) ( not ( = ?auto_664612 ?auto_664625 ) ) ( not ( = ?auto_664613 ?auto_664614 ) ) ( not ( = ?auto_664613 ?auto_664615 ) ) ( not ( = ?auto_664613 ?auto_664616 ) ) ( not ( = ?auto_664613 ?auto_664617 ) ) ( not ( = ?auto_664613 ?auto_664618 ) ) ( not ( = ?auto_664613 ?auto_664619 ) ) ( not ( = ?auto_664613 ?auto_664620 ) ) ( not ( = ?auto_664613 ?auto_664621 ) ) ( not ( = ?auto_664613 ?auto_664622 ) ) ( not ( = ?auto_664613 ?auto_664623 ) ) ( not ( = ?auto_664613 ?auto_664624 ) ) ( not ( = ?auto_664613 ?auto_664625 ) ) ( not ( = ?auto_664614 ?auto_664615 ) ) ( not ( = ?auto_664614 ?auto_664616 ) ) ( not ( = ?auto_664614 ?auto_664617 ) ) ( not ( = ?auto_664614 ?auto_664618 ) ) ( not ( = ?auto_664614 ?auto_664619 ) ) ( not ( = ?auto_664614 ?auto_664620 ) ) ( not ( = ?auto_664614 ?auto_664621 ) ) ( not ( = ?auto_664614 ?auto_664622 ) ) ( not ( = ?auto_664614 ?auto_664623 ) ) ( not ( = ?auto_664614 ?auto_664624 ) ) ( not ( = ?auto_664614 ?auto_664625 ) ) ( not ( = ?auto_664615 ?auto_664616 ) ) ( not ( = ?auto_664615 ?auto_664617 ) ) ( not ( = ?auto_664615 ?auto_664618 ) ) ( not ( = ?auto_664615 ?auto_664619 ) ) ( not ( = ?auto_664615 ?auto_664620 ) ) ( not ( = ?auto_664615 ?auto_664621 ) ) ( not ( = ?auto_664615 ?auto_664622 ) ) ( not ( = ?auto_664615 ?auto_664623 ) ) ( not ( = ?auto_664615 ?auto_664624 ) ) ( not ( = ?auto_664615 ?auto_664625 ) ) ( not ( = ?auto_664616 ?auto_664617 ) ) ( not ( = ?auto_664616 ?auto_664618 ) ) ( not ( = ?auto_664616 ?auto_664619 ) ) ( not ( = ?auto_664616 ?auto_664620 ) ) ( not ( = ?auto_664616 ?auto_664621 ) ) ( not ( = ?auto_664616 ?auto_664622 ) ) ( not ( = ?auto_664616 ?auto_664623 ) ) ( not ( = ?auto_664616 ?auto_664624 ) ) ( not ( = ?auto_664616 ?auto_664625 ) ) ( not ( = ?auto_664617 ?auto_664618 ) ) ( not ( = ?auto_664617 ?auto_664619 ) ) ( not ( = ?auto_664617 ?auto_664620 ) ) ( not ( = ?auto_664617 ?auto_664621 ) ) ( not ( = ?auto_664617 ?auto_664622 ) ) ( not ( = ?auto_664617 ?auto_664623 ) ) ( not ( = ?auto_664617 ?auto_664624 ) ) ( not ( = ?auto_664617 ?auto_664625 ) ) ( not ( = ?auto_664618 ?auto_664619 ) ) ( not ( = ?auto_664618 ?auto_664620 ) ) ( not ( = ?auto_664618 ?auto_664621 ) ) ( not ( = ?auto_664618 ?auto_664622 ) ) ( not ( = ?auto_664618 ?auto_664623 ) ) ( not ( = ?auto_664618 ?auto_664624 ) ) ( not ( = ?auto_664618 ?auto_664625 ) ) ( not ( = ?auto_664619 ?auto_664620 ) ) ( not ( = ?auto_664619 ?auto_664621 ) ) ( not ( = ?auto_664619 ?auto_664622 ) ) ( not ( = ?auto_664619 ?auto_664623 ) ) ( not ( = ?auto_664619 ?auto_664624 ) ) ( not ( = ?auto_664619 ?auto_664625 ) ) ( not ( = ?auto_664620 ?auto_664621 ) ) ( not ( = ?auto_664620 ?auto_664622 ) ) ( not ( = ?auto_664620 ?auto_664623 ) ) ( not ( = ?auto_664620 ?auto_664624 ) ) ( not ( = ?auto_664620 ?auto_664625 ) ) ( not ( = ?auto_664621 ?auto_664622 ) ) ( not ( = ?auto_664621 ?auto_664623 ) ) ( not ( = ?auto_664621 ?auto_664624 ) ) ( not ( = ?auto_664621 ?auto_664625 ) ) ( not ( = ?auto_664622 ?auto_664623 ) ) ( not ( = ?auto_664622 ?auto_664624 ) ) ( not ( = ?auto_664622 ?auto_664625 ) ) ( not ( = ?auto_664623 ?auto_664624 ) ) ( not ( = ?auto_664623 ?auto_664625 ) ) ( not ( = ?auto_664624 ?auto_664625 ) ) ( ON ?auto_664623 ?auto_664624 ) ( ON ?auto_664622 ?auto_664623 ) ( ON ?auto_664621 ?auto_664622 ) ( ON ?auto_664620 ?auto_664621 ) ( ON ?auto_664619 ?auto_664620 ) ( ON ?auto_664618 ?auto_664619 ) ( ON ?auto_664617 ?auto_664618 ) ( ON ?auto_664616 ?auto_664617 ) ( ON ?auto_664615 ?auto_664616 ) ( ON ?auto_664614 ?auto_664615 ) ( CLEAR ?auto_664612 ) ( ON ?auto_664613 ?auto_664614 ) ( CLEAR ?auto_664613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_664608 ?auto_664609 ?auto_664610 ?auto_664611 ?auto_664612 ?auto_664613 )
      ( MAKE-17PILE ?auto_664608 ?auto_664609 ?auto_664610 ?auto_664611 ?auto_664612 ?auto_664613 ?auto_664614 ?auto_664615 ?auto_664616 ?auto_664617 ?auto_664618 ?auto_664619 ?auto_664620 ?auto_664621 ?auto_664622 ?auto_664623 ?auto_664624 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664643 - BLOCK
      ?auto_664644 - BLOCK
      ?auto_664645 - BLOCK
      ?auto_664646 - BLOCK
      ?auto_664647 - BLOCK
      ?auto_664648 - BLOCK
      ?auto_664649 - BLOCK
      ?auto_664650 - BLOCK
      ?auto_664651 - BLOCK
      ?auto_664652 - BLOCK
      ?auto_664653 - BLOCK
      ?auto_664654 - BLOCK
      ?auto_664655 - BLOCK
      ?auto_664656 - BLOCK
      ?auto_664657 - BLOCK
      ?auto_664658 - BLOCK
      ?auto_664659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_664659 ) ( ON-TABLE ?auto_664643 ) ( ON ?auto_664644 ?auto_664643 ) ( ON ?auto_664645 ?auto_664644 ) ( ON ?auto_664646 ?auto_664645 ) ( ON ?auto_664647 ?auto_664646 ) ( not ( = ?auto_664643 ?auto_664644 ) ) ( not ( = ?auto_664643 ?auto_664645 ) ) ( not ( = ?auto_664643 ?auto_664646 ) ) ( not ( = ?auto_664643 ?auto_664647 ) ) ( not ( = ?auto_664643 ?auto_664648 ) ) ( not ( = ?auto_664643 ?auto_664649 ) ) ( not ( = ?auto_664643 ?auto_664650 ) ) ( not ( = ?auto_664643 ?auto_664651 ) ) ( not ( = ?auto_664643 ?auto_664652 ) ) ( not ( = ?auto_664643 ?auto_664653 ) ) ( not ( = ?auto_664643 ?auto_664654 ) ) ( not ( = ?auto_664643 ?auto_664655 ) ) ( not ( = ?auto_664643 ?auto_664656 ) ) ( not ( = ?auto_664643 ?auto_664657 ) ) ( not ( = ?auto_664643 ?auto_664658 ) ) ( not ( = ?auto_664643 ?auto_664659 ) ) ( not ( = ?auto_664644 ?auto_664645 ) ) ( not ( = ?auto_664644 ?auto_664646 ) ) ( not ( = ?auto_664644 ?auto_664647 ) ) ( not ( = ?auto_664644 ?auto_664648 ) ) ( not ( = ?auto_664644 ?auto_664649 ) ) ( not ( = ?auto_664644 ?auto_664650 ) ) ( not ( = ?auto_664644 ?auto_664651 ) ) ( not ( = ?auto_664644 ?auto_664652 ) ) ( not ( = ?auto_664644 ?auto_664653 ) ) ( not ( = ?auto_664644 ?auto_664654 ) ) ( not ( = ?auto_664644 ?auto_664655 ) ) ( not ( = ?auto_664644 ?auto_664656 ) ) ( not ( = ?auto_664644 ?auto_664657 ) ) ( not ( = ?auto_664644 ?auto_664658 ) ) ( not ( = ?auto_664644 ?auto_664659 ) ) ( not ( = ?auto_664645 ?auto_664646 ) ) ( not ( = ?auto_664645 ?auto_664647 ) ) ( not ( = ?auto_664645 ?auto_664648 ) ) ( not ( = ?auto_664645 ?auto_664649 ) ) ( not ( = ?auto_664645 ?auto_664650 ) ) ( not ( = ?auto_664645 ?auto_664651 ) ) ( not ( = ?auto_664645 ?auto_664652 ) ) ( not ( = ?auto_664645 ?auto_664653 ) ) ( not ( = ?auto_664645 ?auto_664654 ) ) ( not ( = ?auto_664645 ?auto_664655 ) ) ( not ( = ?auto_664645 ?auto_664656 ) ) ( not ( = ?auto_664645 ?auto_664657 ) ) ( not ( = ?auto_664645 ?auto_664658 ) ) ( not ( = ?auto_664645 ?auto_664659 ) ) ( not ( = ?auto_664646 ?auto_664647 ) ) ( not ( = ?auto_664646 ?auto_664648 ) ) ( not ( = ?auto_664646 ?auto_664649 ) ) ( not ( = ?auto_664646 ?auto_664650 ) ) ( not ( = ?auto_664646 ?auto_664651 ) ) ( not ( = ?auto_664646 ?auto_664652 ) ) ( not ( = ?auto_664646 ?auto_664653 ) ) ( not ( = ?auto_664646 ?auto_664654 ) ) ( not ( = ?auto_664646 ?auto_664655 ) ) ( not ( = ?auto_664646 ?auto_664656 ) ) ( not ( = ?auto_664646 ?auto_664657 ) ) ( not ( = ?auto_664646 ?auto_664658 ) ) ( not ( = ?auto_664646 ?auto_664659 ) ) ( not ( = ?auto_664647 ?auto_664648 ) ) ( not ( = ?auto_664647 ?auto_664649 ) ) ( not ( = ?auto_664647 ?auto_664650 ) ) ( not ( = ?auto_664647 ?auto_664651 ) ) ( not ( = ?auto_664647 ?auto_664652 ) ) ( not ( = ?auto_664647 ?auto_664653 ) ) ( not ( = ?auto_664647 ?auto_664654 ) ) ( not ( = ?auto_664647 ?auto_664655 ) ) ( not ( = ?auto_664647 ?auto_664656 ) ) ( not ( = ?auto_664647 ?auto_664657 ) ) ( not ( = ?auto_664647 ?auto_664658 ) ) ( not ( = ?auto_664647 ?auto_664659 ) ) ( not ( = ?auto_664648 ?auto_664649 ) ) ( not ( = ?auto_664648 ?auto_664650 ) ) ( not ( = ?auto_664648 ?auto_664651 ) ) ( not ( = ?auto_664648 ?auto_664652 ) ) ( not ( = ?auto_664648 ?auto_664653 ) ) ( not ( = ?auto_664648 ?auto_664654 ) ) ( not ( = ?auto_664648 ?auto_664655 ) ) ( not ( = ?auto_664648 ?auto_664656 ) ) ( not ( = ?auto_664648 ?auto_664657 ) ) ( not ( = ?auto_664648 ?auto_664658 ) ) ( not ( = ?auto_664648 ?auto_664659 ) ) ( not ( = ?auto_664649 ?auto_664650 ) ) ( not ( = ?auto_664649 ?auto_664651 ) ) ( not ( = ?auto_664649 ?auto_664652 ) ) ( not ( = ?auto_664649 ?auto_664653 ) ) ( not ( = ?auto_664649 ?auto_664654 ) ) ( not ( = ?auto_664649 ?auto_664655 ) ) ( not ( = ?auto_664649 ?auto_664656 ) ) ( not ( = ?auto_664649 ?auto_664657 ) ) ( not ( = ?auto_664649 ?auto_664658 ) ) ( not ( = ?auto_664649 ?auto_664659 ) ) ( not ( = ?auto_664650 ?auto_664651 ) ) ( not ( = ?auto_664650 ?auto_664652 ) ) ( not ( = ?auto_664650 ?auto_664653 ) ) ( not ( = ?auto_664650 ?auto_664654 ) ) ( not ( = ?auto_664650 ?auto_664655 ) ) ( not ( = ?auto_664650 ?auto_664656 ) ) ( not ( = ?auto_664650 ?auto_664657 ) ) ( not ( = ?auto_664650 ?auto_664658 ) ) ( not ( = ?auto_664650 ?auto_664659 ) ) ( not ( = ?auto_664651 ?auto_664652 ) ) ( not ( = ?auto_664651 ?auto_664653 ) ) ( not ( = ?auto_664651 ?auto_664654 ) ) ( not ( = ?auto_664651 ?auto_664655 ) ) ( not ( = ?auto_664651 ?auto_664656 ) ) ( not ( = ?auto_664651 ?auto_664657 ) ) ( not ( = ?auto_664651 ?auto_664658 ) ) ( not ( = ?auto_664651 ?auto_664659 ) ) ( not ( = ?auto_664652 ?auto_664653 ) ) ( not ( = ?auto_664652 ?auto_664654 ) ) ( not ( = ?auto_664652 ?auto_664655 ) ) ( not ( = ?auto_664652 ?auto_664656 ) ) ( not ( = ?auto_664652 ?auto_664657 ) ) ( not ( = ?auto_664652 ?auto_664658 ) ) ( not ( = ?auto_664652 ?auto_664659 ) ) ( not ( = ?auto_664653 ?auto_664654 ) ) ( not ( = ?auto_664653 ?auto_664655 ) ) ( not ( = ?auto_664653 ?auto_664656 ) ) ( not ( = ?auto_664653 ?auto_664657 ) ) ( not ( = ?auto_664653 ?auto_664658 ) ) ( not ( = ?auto_664653 ?auto_664659 ) ) ( not ( = ?auto_664654 ?auto_664655 ) ) ( not ( = ?auto_664654 ?auto_664656 ) ) ( not ( = ?auto_664654 ?auto_664657 ) ) ( not ( = ?auto_664654 ?auto_664658 ) ) ( not ( = ?auto_664654 ?auto_664659 ) ) ( not ( = ?auto_664655 ?auto_664656 ) ) ( not ( = ?auto_664655 ?auto_664657 ) ) ( not ( = ?auto_664655 ?auto_664658 ) ) ( not ( = ?auto_664655 ?auto_664659 ) ) ( not ( = ?auto_664656 ?auto_664657 ) ) ( not ( = ?auto_664656 ?auto_664658 ) ) ( not ( = ?auto_664656 ?auto_664659 ) ) ( not ( = ?auto_664657 ?auto_664658 ) ) ( not ( = ?auto_664657 ?auto_664659 ) ) ( not ( = ?auto_664658 ?auto_664659 ) ) ( ON ?auto_664658 ?auto_664659 ) ( ON ?auto_664657 ?auto_664658 ) ( ON ?auto_664656 ?auto_664657 ) ( ON ?auto_664655 ?auto_664656 ) ( ON ?auto_664654 ?auto_664655 ) ( ON ?auto_664653 ?auto_664654 ) ( ON ?auto_664652 ?auto_664653 ) ( ON ?auto_664651 ?auto_664652 ) ( ON ?auto_664650 ?auto_664651 ) ( ON ?auto_664649 ?auto_664650 ) ( CLEAR ?auto_664647 ) ( ON ?auto_664648 ?auto_664649 ) ( CLEAR ?auto_664648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_664643 ?auto_664644 ?auto_664645 ?auto_664646 ?auto_664647 ?auto_664648 )
      ( MAKE-17PILE ?auto_664643 ?auto_664644 ?auto_664645 ?auto_664646 ?auto_664647 ?auto_664648 ?auto_664649 ?auto_664650 ?auto_664651 ?auto_664652 ?auto_664653 ?auto_664654 ?auto_664655 ?auto_664656 ?auto_664657 ?auto_664658 ?auto_664659 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664677 - BLOCK
      ?auto_664678 - BLOCK
      ?auto_664679 - BLOCK
      ?auto_664680 - BLOCK
      ?auto_664681 - BLOCK
      ?auto_664682 - BLOCK
      ?auto_664683 - BLOCK
      ?auto_664684 - BLOCK
      ?auto_664685 - BLOCK
      ?auto_664686 - BLOCK
      ?auto_664687 - BLOCK
      ?auto_664688 - BLOCK
      ?auto_664689 - BLOCK
      ?auto_664690 - BLOCK
      ?auto_664691 - BLOCK
      ?auto_664692 - BLOCK
      ?auto_664693 - BLOCK
    )
    :vars
    (
      ?auto_664694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664693 ?auto_664694 ) ( ON-TABLE ?auto_664677 ) ( ON ?auto_664678 ?auto_664677 ) ( ON ?auto_664679 ?auto_664678 ) ( ON ?auto_664680 ?auto_664679 ) ( not ( = ?auto_664677 ?auto_664678 ) ) ( not ( = ?auto_664677 ?auto_664679 ) ) ( not ( = ?auto_664677 ?auto_664680 ) ) ( not ( = ?auto_664677 ?auto_664681 ) ) ( not ( = ?auto_664677 ?auto_664682 ) ) ( not ( = ?auto_664677 ?auto_664683 ) ) ( not ( = ?auto_664677 ?auto_664684 ) ) ( not ( = ?auto_664677 ?auto_664685 ) ) ( not ( = ?auto_664677 ?auto_664686 ) ) ( not ( = ?auto_664677 ?auto_664687 ) ) ( not ( = ?auto_664677 ?auto_664688 ) ) ( not ( = ?auto_664677 ?auto_664689 ) ) ( not ( = ?auto_664677 ?auto_664690 ) ) ( not ( = ?auto_664677 ?auto_664691 ) ) ( not ( = ?auto_664677 ?auto_664692 ) ) ( not ( = ?auto_664677 ?auto_664693 ) ) ( not ( = ?auto_664677 ?auto_664694 ) ) ( not ( = ?auto_664678 ?auto_664679 ) ) ( not ( = ?auto_664678 ?auto_664680 ) ) ( not ( = ?auto_664678 ?auto_664681 ) ) ( not ( = ?auto_664678 ?auto_664682 ) ) ( not ( = ?auto_664678 ?auto_664683 ) ) ( not ( = ?auto_664678 ?auto_664684 ) ) ( not ( = ?auto_664678 ?auto_664685 ) ) ( not ( = ?auto_664678 ?auto_664686 ) ) ( not ( = ?auto_664678 ?auto_664687 ) ) ( not ( = ?auto_664678 ?auto_664688 ) ) ( not ( = ?auto_664678 ?auto_664689 ) ) ( not ( = ?auto_664678 ?auto_664690 ) ) ( not ( = ?auto_664678 ?auto_664691 ) ) ( not ( = ?auto_664678 ?auto_664692 ) ) ( not ( = ?auto_664678 ?auto_664693 ) ) ( not ( = ?auto_664678 ?auto_664694 ) ) ( not ( = ?auto_664679 ?auto_664680 ) ) ( not ( = ?auto_664679 ?auto_664681 ) ) ( not ( = ?auto_664679 ?auto_664682 ) ) ( not ( = ?auto_664679 ?auto_664683 ) ) ( not ( = ?auto_664679 ?auto_664684 ) ) ( not ( = ?auto_664679 ?auto_664685 ) ) ( not ( = ?auto_664679 ?auto_664686 ) ) ( not ( = ?auto_664679 ?auto_664687 ) ) ( not ( = ?auto_664679 ?auto_664688 ) ) ( not ( = ?auto_664679 ?auto_664689 ) ) ( not ( = ?auto_664679 ?auto_664690 ) ) ( not ( = ?auto_664679 ?auto_664691 ) ) ( not ( = ?auto_664679 ?auto_664692 ) ) ( not ( = ?auto_664679 ?auto_664693 ) ) ( not ( = ?auto_664679 ?auto_664694 ) ) ( not ( = ?auto_664680 ?auto_664681 ) ) ( not ( = ?auto_664680 ?auto_664682 ) ) ( not ( = ?auto_664680 ?auto_664683 ) ) ( not ( = ?auto_664680 ?auto_664684 ) ) ( not ( = ?auto_664680 ?auto_664685 ) ) ( not ( = ?auto_664680 ?auto_664686 ) ) ( not ( = ?auto_664680 ?auto_664687 ) ) ( not ( = ?auto_664680 ?auto_664688 ) ) ( not ( = ?auto_664680 ?auto_664689 ) ) ( not ( = ?auto_664680 ?auto_664690 ) ) ( not ( = ?auto_664680 ?auto_664691 ) ) ( not ( = ?auto_664680 ?auto_664692 ) ) ( not ( = ?auto_664680 ?auto_664693 ) ) ( not ( = ?auto_664680 ?auto_664694 ) ) ( not ( = ?auto_664681 ?auto_664682 ) ) ( not ( = ?auto_664681 ?auto_664683 ) ) ( not ( = ?auto_664681 ?auto_664684 ) ) ( not ( = ?auto_664681 ?auto_664685 ) ) ( not ( = ?auto_664681 ?auto_664686 ) ) ( not ( = ?auto_664681 ?auto_664687 ) ) ( not ( = ?auto_664681 ?auto_664688 ) ) ( not ( = ?auto_664681 ?auto_664689 ) ) ( not ( = ?auto_664681 ?auto_664690 ) ) ( not ( = ?auto_664681 ?auto_664691 ) ) ( not ( = ?auto_664681 ?auto_664692 ) ) ( not ( = ?auto_664681 ?auto_664693 ) ) ( not ( = ?auto_664681 ?auto_664694 ) ) ( not ( = ?auto_664682 ?auto_664683 ) ) ( not ( = ?auto_664682 ?auto_664684 ) ) ( not ( = ?auto_664682 ?auto_664685 ) ) ( not ( = ?auto_664682 ?auto_664686 ) ) ( not ( = ?auto_664682 ?auto_664687 ) ) ( not ( = ?auto_664682 ?auto_664688 ) ) ( not ( = ?auto_664682 ?auto_664689 ) ) ( not ( = ?auto_664682 ?auto_664690 ) ) ( not ( = ?auto_664682 ?auto_664691 ) ) ( not ( = ?auto_664682 ?auto_664692 ) ) ( not ( = ?auto_664682 ?auto_664693 ) ) ( not ( = ?auto_664682 ?auto_664694 ) ) ( not ( = ?auto_664683 ?auto_664684 ) ) ( not ( = ?auto_664683 ?auto_664685 ) ) ( not ( = ?auto_664683 ?auto_664686 ) ) ( not ( = ?auto_664683 ?auto_664687 ) ) ( not ( = ?auto_664683 ?auto_664688 ) ) ( not ( = ?auto_664683 ?auto_664689 ) ) ( not ( = ?auto_664683 ?auto_664690 ) ) ( not ( = ?auto_664683 ?auto_664691 ) ) ( not ( = ?auto_664683 ?auto_664692 ) ) ( not ( = ?auto_664683 ?auto_664693 ) ) ( not ( = ?auto_664683 ?auto_664694 ) ) ( not ( = ?auto_664684 ?auto_664685 ) ) ( not ( = ?auto_664684 ?auto_664686 ) ) ( not ( = ?auto_664684 ?auto_664687 ) ) ( not ( = ?auto_664684 ?auto_664688 ) ) ( not ( = ?auto_664684 ?auto_664689 ) ) ( not ( = ?auto_664684 ?auto_664690 ) ) ( not ( = ?auto_664684 ?auto_664691 ) ) ( not ( = ?auto_664684 ?auto_664692 ) ) ( not ( = ?auto_664684 ?auto_664693 ) ) ( not ( = ?auto_664684 ?auto_664694 ) ) ( not ( = ?auto_664685 ?auto_664686 ) ) ( not ( = ?auto_664685 ?auto_664687 ) ) ( not ( = ?auto_664685 ?auto_664688 ) ) ( not ( = ?auto_664685 ?auto_664689 ) ) ( not ( = ?auto_664685 ?auto_664690 ) ) ( not ( = ?auto_664685 ?auto_664691 ) ) ( not ( = ?auto_664685 ?auto_664692 ) ) ( not ( = ?auto_664685 ?auto_664693 ) ) ( not ( = ?auto_664685 ?auto_664694 ) ) ( not ( = ?auto_664686 ?auto_664687 ) ) ( not ( = ?auto_664686 ?auto_664688 ) ) ( not ( = ?auto_664686 ?auto_664689 ) ) ( not ( = ?auto_664686 ?auto_664690 ) ) ( not ( = ?auto_664686 ?auto_664691 ) ) ( not ( = ?auto_664686 ?auto_664692 ) ) ( not ( = ?auto_664686 ?auto_664693 ) ) ( not ( = ?auto_664686 ?auto_664694 ) ) ( not ( = ?auto_664687 ?auto_664688 ) ) ( not ( = ?auto_664687 ?auto_664689 ) ) ( not ( = ?auto_664687 ?auto_664690 ) ) ( not ( = ?auto_664687 ?auto_664691 ) ) ( not ( = ?auto_664687 ?auto_664692 ) ) ( not ( = ?auto_664687 ?auto_664693 ) ) ( not ( = ?auto_664687 ?auto_664694 ) ) ( not ( = ?auto_664688 ?auto_664689 ) ) ( not ( = ?auto_664688 ?auto_664690 ) ) ( not ( = ?auto_664688 ?auto_664691 ) ) ( not ( = ?auto_664688 ?auto_664692 ) ) ( not ( = ?auto_664688 ?auto_664693 ) ) ( not ( = ?auto_664688 ?auto_664694 ) ) ( not ( = ?auto_664689 ?auto_664690 ) ) ( not ( = ?auto_664689 ?auto_664691 ) ) ( not ( = ?auto_664689 ?auto_664692 ) ) ( not ( = ?auto_664689 ?auto_664693 ) ) ( not ( = ?auto_664689 ?auto_664694 ) ) ( not ( = ?auto_664690 ?auto_664691 ) ) ( not ( = ?auto_664690 ?auto_664692 ) ) ( not ( = ?auto_664690 ?auto_664693 ) ) ( not ( = ?auto_664690 ?auto_664694 ) ) ( not ( = ?auto_664691 ?auto_664692 ) ) ( not ( = ?auto_664691 ?auto_664693 ) ) ( not ( = ?auto_664691 ?auto_664694 ) ) ( not ( = ?auto_664692 ?auto_664693 ) ) ( not ( = ?auto_664692 ?auto_664694 ) ) ( not ( = ?auto_664693 ?auto_664694 ) ) ( ON ?auto_664692 ?auto_664693 ) ( ON ?auto_664691 ?auto_664692 ) ( ON ?auto_664690 ?auto_664691 ) ( ON ?auto_664689 ?auto_664690 ) ( ON ?auto_664688 ?auto_664689 ) ( ON ?auto_664687 ?auto_664688 ) ( ON ?auto_664686 ?auto_664687 ) ( ON ?auto_664685 ?auto_664686 ) ( ON ?auto_664684 ?auto_664685 ) ( ON ?auto_664683 ?auto_664684 ) ( ON ?auto_664682 ?auto_664683 ) ( CLEAR ?auto_664680 ) ( ON ?auto_664681 ?auto_664682 ) ( CLEAR ?auto_664681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_664677 ?auto_664678 ?auto_664679 ?auto_664680 ?auto_664681 )
      ( MAKE-17PILE ?auto_664677 ?auto_664678 ?auto_664679 ?auto_664680 ?auto_664681 ?auto_664682 ?auto_664683 ?auto_664684 ?auto_664685 ?auto_664686 ?auto_664687 ?auto_664688 ?auto_664689 ?auto_664690 ?auto_664691 ?auto_664692 ?auto_664693 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664712 - BLOCK
      ?auto_664713 - BLOCK
      ?auto_664714 - BLOCK
      ?auto_664715 - BLOCK
      ?auto_664716 - BLOCK
      ?auto_664717 - BLOCK
      ?auto_664718 - BLOCK
      ?auto_664719 - BLOCK
      ?auto_664720 - BLOCK
      ?auto_664721 - BLOCK
      ?auto_664722 - BLOCK
      ?auto_664723 - BLOCK
      ?auto_664724 - BLOCK
      ?auto_664725 - BLOCK
      ?auto_664726 - BLOCK
      ?auto_664727 - BLOCK
      ?auto_664728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_664728 ) ( ON-TABLE ?auto_664712 ) ( ON ?auto_664713 ?auto_664712 ) ( ON ?auto_664714 ?auto_664713 ) ( ON ?auto_664715 ?auto_664714 ) ( not ( = ?auto_664712 ?auto_664713 ) ) ( not ( = ?auto_664712 ?auto_664714 ) ) ( not ( = ?auto_664712 ?auto_664715 ) ) ( not ( = ?auto_664712 ?auto_664716 ) ) ( not ( = ?auto_664712 ?auto_664717 ) ) ( not ( = ?auto_664712 ?auto_664718 ) ) ( not ( = ?auto_664712 ?auto_664719 ) ) ( not ( = ?auto_664712 ?auto_664720 ) ) ( not ( = ?auto_664712 ?auto_664721 ) ) ( not ( = ?auto_664712 ?auto_664722 ) ) ( not ( = ?auto_664712 ?auto_664723 ) ) ( not ( = ?auto_664712 ?auto_664724 ) ) ( not ( = ?auto_664712 ?auto_664725 ) ) ( not ( = ?auto_664712 ?auto_664726 ) ) ( not ( = ?auto_664712 ?auto_664727 ) ) ( not ( = ?auto_664712 ?auto_664728 ) ) ( not ( = ?auto_664713 ?auto_664714 ) ) ( not ( = ?auto_664713 ?auto_664715 ) ) ( not ( = ?auto_664713 ?auto_664716 ) ) ( not ( = ?auto_664713 ?auto_664717 ) ) ( not ( = ?auto_664713 ?auto_664718 ) ) ( not ( = ?auto_664713 ?auto_664719 ) ) ( not ( = ?auto_664713 ?auto_664720 ) ) ( not ( = ?auto_664713 ?auto_664721 ) ) ( not ( = ?auto_664713 ?auto_664722 ) ) ( not ( = ?auto_664713 ?auto_664723 ) ) ( not ( = ?auto_664713 ?auto_664724 ) ) ( not ( = ?auto_664713 ?auto_664725 ) ) ( not ( = ?auto_664713 ?auto_664726 ) ) ( not ( = ?auto_664713 ?auto_664727 ) ) ( not ( = ?auto_664713 ?auto_664728 ) ) ( not ( = ?auto_664714 ?auto_664715 ) ) ( not ( = ?auto_664714 ?auto_664716 ) ) ( not ( = ?auto_664714 ?auto_664717 ) ) ( not ( = ?auto_664714 ?auto_664718 ) ) ( not ( = ?auto_664714 ?auto_664719 ) ) ( not ( = ?auto_664714 ?auto_664720 ) ) ( not ( = ?auto_664714 ?auto_664721 ) ) ( not ( = ?auto_664714 ?auto_664722 ) ) ( not ( = ?auto_664714 ?auto_664723 ) ) ( not ( = ?auto_664714 ?auto_664724 ) ) ( not ( = ?auto_664714 ?auto_664725 ) ) ( not ( = ?auto_664714 ?auto_664726 ) ) ( not ( = ?auto_664714 ?auto_664727 ) ) ( not ( = ?auto_664714 ?auto_664728 ) ) ( not ( = ?auto_664715 ?auto_664716 ) ) ( not ( = ?auto_664715 ?auto_664717 ) ) ( not ( = ?auto_664715 ?auto_664718 ) ) ( not ( = ?auto_664715 ?auto_664719 ) ) ( not ( = ?auto_664715 ?auto_664720 ) ) ( not ( = ?auto_664715 ?auto_664721 ) ) ( not ( = ?auto_664715 ?auto_664722 ) ) ( not ( = ?auto_664715 ?auto_664723 ) ) ( not ( = ?auto_664715 ?auto_664724 ) ) ( not ( = ?auto_664715 ?auto_664725 ) ) ( not ( = ?auto_664715 ?auto_664726 ) ) ( not ( = ?auto_664715 ?auto_664727 ) ) ( not ( = ?auto_664715 ?auto_664728 ) ) ( not ( = ?auto_664716 ?auto_664717 ) ) ( not ( = ?auto_664716 ?auto_664718 ) ) ( not ( = ?auto_664716 ?auto_664719 ) ) ( not ( = ?auto_664716 ?auto_664720 ) ) ( not ( = ?auto_664716 ?auto_664721 ) ) ( not ( = ?auto_664716 ?auto_664722 ) ) ( not ( = ?auto_664716 ?auto_664723 ) ) ( not ( = ?auto_664716 ?auto_664724 ) ) ( not ( = ?auto_664716 ?auto_664725 ) ) ( not ( = ?auto_664716 ?auto_664726 ) ) ( not ( = ?auto_664716 ?auto_664727 ) ) ( not ( = ?auto_664716 ?auto_664728 ) ) ( not ( = ?auto_664717 ?auto_664718 ) ) ( not ( = ?auto_664717 ?auto_664719 ) ) ( not ( = ?auto_664717 ?auto_664720 ) ) ( not ( = ?auto_664717 ?auto_664721 ) ) ( not ( = ?auto_664717 ?auto_664722 ) ) ( not ( = ?auto_664717 ?auto_664723 ) ) ( not ( = ?auto_664717 ?auto_664724 ) ) ( not ( = ?auto_664717 ?auto_664725 ) ) ( not ( = ?auto_664717 ?auto_664726 ) ) ( not ( = ?auto_664717 ?auto_664727 ) ) ( not ( = ?auto_664717 ?auto_664728 ) ) ( not ( = ?auto_664718 ?auto_664719 ) ) ( not ( = ?auto_664718 ?auto_664720 ) ) ( not ( = ?auto_664718 ?auto_664721 ) ) ( not ( = ?auto_664718 ?auto_664722 ) ) ( not ( = ?auto_664718 ?auto_664723 ) ) ( not ( = ?auto_664718 ?auto_664724 ) ) ( not ( = ?auto_664718 ?auto_664725 ) ) ( not ( = ?auto_664718 ?auto_664726 ) ) ( not ( = ?auto_664718 ?auto_664727 ) ) ( not ( = ?auto_664718 ?auto_664728 ) ) ( not ( = ?auto_664719 ?auto_664720 ) ) ( not ( = ?auto_664719 ?auto_664721 ) ) ( not ( = ?auto_664719 ?auto_664722 ) ) ( not ( = ?auto_664719 ?auto_664723 ) ) ( not ( = ?auto_664719 ?auto_664724 ) ) ( not ( = ?auto_664719 ?auto_664725 ) ) ( not ( = ?auto_664719 ?auto_664726 ) ) ( not ( = ?auto_664719 ?auto_664727 ) ) ( not ( = ?auto_664719 ?auto_664728 ) ) ( not ( = ?auto_664720 ?auto_664721 ) ) ( not ( = ?auto_664720 ?auto_664722 ) ) ( not ( = ?auto_664720 ?auto_664723 ) ) ( not ( = ?auto_664720 ?auto_664724 ) ) ( not ( = ?auto_664720 ?auto_664725 ) ) ( not ( = ?auto_664720 ?auto_664726 ) ) ( not ( = ?auto_664720 ?auto_664727 ) ) ( not ( = ?auto_664720 ?auto_664728 ) ) ( not ( = ?auto_664721 ?auto_664722 ) ) ( not ( = ?auto_664721 ?auto_664723 ) ) ( not ( = ?auto_664721 ?auto_664724 ) ) ( not ( = ?auto_664721 ?auto_664725 ) ) ( not ( = ?auto_664721 ?auto_664726 ) ) ( not ( = ?auto_664721 ?auto_664727 ) ) ( not ( = ?auto_664721 ?auto_664728 ) ) ( not ( = ?auto_664722 ?auto_664723 ) ) ( not ( = ?auto_664722 ?auto_664724 ) ) ( not ( = ?auto_664722 ?auto_664725 ) ) ( not ( = ?auto_664722 ?auto_664726 ) ) ( not ( = ?auto_664722 ?auto_664727 ) ) ( not ( = ?auto_664722 ?auto_664728 ) ) ( not ( = ?auto_664723 ?auto_664724 ) ) ( not ( = ?auto_664723 ?auto_664725 ) ) ( not ( = ?auto_664723 ?auto_664726 ) ) ( not ( = ?auto_664723 ?auto_664727 ) ) ( not ( = ?auto_664723 ?auto_664728 ) ) ( not ( = ?auto_664724 ?auto_664725 ) ) ( not ( = ?auto_664724 ?auto_664726 ) ) ( not ( = ?auto_664724 ?auto_664727 ) ) ( not ( = ?auto_664724 ?auto_664728 ) ) ( not ( = ?auto_664725 ?auto_664726 ) ) ( not ( = ?auto_664725 ?auto_664727 ) ) ( not ( = ?auto_664725 ?auto_664728 ) ) ( not ( = ?auto_664726 ?auto_664727 ) ) ( not ( = ?auto_664726 ?auto_664728 ) ) ( not ( = ?auto_664727 ?auto_664728 ) ) ( ON ?auto_664727 ?auto_664728 ) ( ON ?auto_664726 ?auto_664727 ) ( ON ?auto_664725 ?auto_664726 ) ( ON ?auto_664724 ?auto_664725 ) ( ON ?auto_664723 ?auto_664724 ) ( ON ?auto_664722 ?auto_664723 ) ( ON ?auto_664721 ?auto_664722 ) ( ON ?auto_664720 ?auto_664721 ) ( ON ?auto_664719 ?auto_664720 ) ( ON ?auto_664718 ?auto_664719 ) ( ON ?auto_664717 ?auto_664718 ) ( CLEAR ?auto_664715 ) ( ON ?auto_664716 ?auto_664717 ) ( CLEAR ?auto_664716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_664712 ?auto_664713 ?auto_664714 ?auto_664715 ?auto_664716 )
      ( MAKE-17PILE ?auto_664712 ?auto_664713 ?auto_664714 ?auto_664715 ?auto_664716 ?auto_664717 ?auto_664718 ?auto_664719 ?auto_664720 ?auto_664721 ?auto_664722 ?auto_664723 ?auto_664724 ?auto_664725 ?auto_664726 ?auto_664727 ?auto_664728 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664746 - BLOCK
      ?auto_664747 - BLOCK
      ?auto_664748 - BLOCK
      ?auto_664749 - BLOCK
      ?auto_664750 - BLOCK
      ?auto_664751 - BLOCK
      ?auto_664752 - BLOCK
      ?auto_664753 - BLOCK
      ?auto_664754 - BLOCK
      ?auto_664755 - BLOCK
      ?auto_664756 - BLOCK
      ?auto_664757 - BLOCK
      ?auto_664758 - BLOCK
      ?auto_664759 - BLOCK
      ?auto_664760 - BLOCK
      ?auto_664761 - BLOCK
      ?auto_664762 - BLOCK
    )
    :vars
    (
      ?auto_664763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664762 ?auto_664763 ) ( ON-TABLE ?auto_664746 ) ( ON ?auto_664747 ?auto_664746 ) ( ON ?auto_664748 ?auto_664747 ) ( not ( = ?auto_664746 ?auto_664747 ) ) ( not ( = ?auto_664746 ?auto_664748 ) ) ( not ( = ?auto_664746 ?auto_664749 ) ) ( not ( = ?auto_664746 ?auto_664750 ) ) ( not ( = ?auto_664746 ?auto_664751 ) ) ( not ( = ?auto_664746 ?auto_664752 ) ) ( not ( = ?auto_664746 ?auto_664753 ) ) ( not ( = ?auto_664746 ?auto_664754 ) ) ( not ( = ?auto_664746 ?auto_664755 ) ) ( not ( = ?auto_664746 ?auto_664756 ) ) ( not ( = ?auto_664746 ?auto_664757 ) ) ( not ( = ?auto_664746 ?auto_664758 ) ) ( not ( = ?auto_664746 ?auto_664759 ) ) ( not ( = ?auto_664746 ?auto_664760 ) ) ( not ( = ?auto_664746 ?auto_664761 ) ) ( not ( = ?auto_664746 ?auto_664762 ) ) ( not ( = ?auto_664746 ?auto_664763 ) ) ( not ( = ?auto_664747 ?auto_664748 ) ) ( not ( = ?auto_664747 ?auto_664749 ) ) ( not ( = ?auto_664747 ?auto_664750 ) ) ( not ( = ?auto_664747 ?auto_664751 ) ) ( not ( = ?auto_664747 ?auto_664752 ) ) ( not ( = ?auto_664747 ?auto_664753 ) ) ( not ( = ?auto_664747 ?auto_664754 ) ) ( not ( = ?auto_664747 ?auto_664755 ) ) ( not ( = ?auto_664747 ?auto_664756 ) ) ( not ( = ?auto_664747 ?auto_664757 ) ) ( not ( = ?auto_664747 ?auto_664758 ) ) ( not ( = ?auto_664747 ?auto_664759 ) ) ( not ( = ?auto_664747 ?auto_664760 ) ) ( not ( = ?auto_664747 ?auto_664761 ) ) ( not ( = ?auto_664747 ?auto_664762 ) ) ( not ( = ?auto_664747 ?auto_664763 ) ) ( not ( = ?auto_664748 ?auto_664749 ) ) ( not ( = ?auto_664748 ?auto_664750 ) ) ( not ( = ?auto_664748 ?auto_664751 ) ) ( not ( = ?auto_664748 ?auto_664752 ) ) ( not ( = ?auto_664748 ?auto_664753 ) ) ( not ( = ?auto_664748 ?auto_664754 ) ) ( not ( = ?auto_664748 ?auto_664755 ) ) ( not ( = ?auto_664748 ?auto_664756 ) ) ( not ( = ?auto_664748 ?auto_664757 ) ) ( not ( = ?auto_664748 ?auto_664758 ) ) ( not ( = ?auto_664748 ?auto_664759 ) ) ( not ( = ?auto_664748 ?auto_664760 ) ) ( not ( = ?auto_664748 ?auto_664761 ) ) ( not ( = ?auto_664748 ?auto_664762 ) ) ( not ( = ?auto_664748 ?auto_664763 ) ) ( not ( = ?auto_664749 ?auto_664750 ) ) ( not ( = ?auto_664749 ?auto_664751 ) ) ( not ( = ?auto_664749 ?auto_664752 ) ) ( not ( = ?auto_664749 ?auto_664753 ) ) ( not ( = ?auto_664749 ?auto_664754 ) ) ( not ( = ?auto_664749 ?auto_664755 ) ) ( not ( = ?auto_664749 ?auto_664756 ) ) ( not ( = ?auto_664749 ?auto_664757 ) ) ( not ( = ?auto_664749 ?auto_664758 ) ) ( not ( = ?auto_664749 ?auto_664759 ) ) ( not ( = ?auto_664749 ?auto_664760 ) ) ( not ( = ?auto_664749 ?auto_664761 ) ) ( not ( = ?auto_664749 ?auto_664762 ) ) ( not ( = ?auto_664749 ?auto_664763 ) ) ( not ( = ?auto_664750 ?auto_664751 ) ) ( not ( = ?auto_664750 ?auto_664752 ) ) ( not ( = ?auto_664750 ?auto_664753 ) ) ( not ( = ?auto_664750 ?auto_664754 ) ) ( not ( = ?auto_664750 ?auto_664755 ) ) ( not ( = ?auto_664750 ?auto_664756 ) ) ( not ( = ?auto_664750 ?auto_664757 ) ) ( not ( = ?auto_664750 ?auto_664758 ) ) ( not ( = ?auto_664750 ?auto_664759 ) ) ( not ( = ?auto_664750 ?auto_664760 ) ) ( not ( = ?auto_664750 ?auto_664761 ) ) ( not ( = ?auto_664750 ?auto_664762 ) ) ( not ( = ?auto_664750 ?auto_664763 ) ) ( not ( = ?auto_664751 ?auto_664752 ) ) ( not ( = ?auto_664751 ?auto_664753 ) ) ( not ( = ?auto_664751 ?auto_664754 ) ) ( not ( = ?auto_664751 ?auto_664755 ) ) ( not ( = ?auto_664751 ?auto_664756 ) ) ( not ( = ?auto_664751 ?auto_664757 ) ) ( not ( = ?auto_664751 ?auto_664758 ) ) ( not ( = ?auto_664751 ?auto_664759 ) ) ( not ( = ?auto_664751 ?auto_664760 ) ) ( not ( = ?auto_664751 ?auto_664761 ) ) ( not ( = ?auto_664751 ?auto_664762 ) ) ( not ( = ?auto_664751 ?auto_664763 ) ) ( not ( = ?auto_664752 ?auto_664753 ) ) ( not ( = ?auto_664752 ?auto_664754 ) ) ( not ( = ?auto_664752 ?auto_664755 ) ) ( not ( = ?auto_664752 ?auto_664756 ) ) ( not ( = ?auto_664752 ?auto_664757 ) ) ( not ( = ?auto_664752 ?auto_664758 ) ) ( not ( = ?auto_664752 ?auto_664759 ) ) ( not ( = ?auto_664752 ?auto_664760 ) ) ( not ( = ?auto_664752 ?auto_664761 ) ) ( not ( = ?auto_664752 ?auto_664762 ) ) ( not ( = ?auto_664752 ?auto_664763 ) ) ( not ( = ?auto_664753 ?auto_664754 ) ) ( not ( = ?auto_664753 ?auto_664755 ) ) ( not ( = ?auto_664753 ?auto_664756 ) ) ( not ( = ?auto_664753 ?auto_664757 ) ) ( not ( = ?auto_664753 ?auto_664758 ) ) ( not ( = ?auto_664753 ?auto_664759 ) ) ( not ( = ?auto_664753 ?auto_664760 ) ) ( not ( = ?auto_664753 ?auto_664761 ) ) ( not ( = ?auto_664753 ?auto_664762 ) ) ( not ( = ?auto_664753 ?auto_664763 ) ) ( not ( = ?auto_664754 ?auto_664755 ) ) ( not ( = ?auto_664754 ?auto_664756 ) ) ( not ( = ?auto_664754 ?auto_664757 ) ) ( not ( = ?auto_664754 ?auto_664758 ) ) ( not ( = ?auto_664754 ?auto_664759 ) ) ( not ( = ?auto_664754 ?auto_664760 ) ) ( not ( = ?auto_664754 ?auto_664761 ) ) ( not ( = ?auto_664754 ?auto_664762 ) ) ( not ( = ?auto_664754 ?auto_664763 ) ) ( not ( = ?auto_664755 ?auto_664756 ) ) ( not ( = ?auto_664755 ?auto_664757 ) ) ( not ( = ?auto_664755 ?auto_664758 ) ) ( not ( = ?auto_664755 ?auto_664759 ) ) ( not ( = ?auto_664755 ?auto_664760 ) ) ( not ( = ?auto_664755 ?auto_664761 ) ) ( not ( = ?auto_664755 ?auto_664762 ) ) ( not ( = ?auto_664755 ?auto_664763 ) ) ( not ( = ?auto_664756 ?auto_664757 ) ) ( not ( = ?auto_664756 ?auto_664758 ) ) ( not ( = ?auto_664756 ?auto_664759 ) ) ( not ( = ?auto_664756 ?auto_664760 ) ) ( not ( = ?auto_664756 ?auto_664761 ) ) ( not ( = ?auto_664756 ?auto_664762 ) ) ( not ( = ?auto_664756 ?auto_664763 ) ) ( not ( = ?auto_664757 ?auto_664758 ) ) ( not ( = ?auto_664757 ?auto_664759 ) ) ( not ( = ?auto_664757 ?auto_664760 ) ) ( not ( = ?auto_664757 ?auto_664761 ) ) ( not ( = ?auto_664757 ?auto_664762 ) ) ( not ( = ?auto_664757 ?auto_664763 ) ) ( not ( = ?auto_664758 ?auto_664759 ) ) ( not ( = ?auto_664758 ?auto_664760 ) ) ( not ( = ?auto_664758 ?auto_664761 ) ) ( not ( = ?auto_664758 ?auto_664762 ) ) ( not ( = ?auto_664758 ?auto_664763 ) ) ( not ( = ?auto_664759 ?auto_664760 ) ) ( not ( = ?auto_664759 ?auto_664761 ) ) ( not ( = ?auto_664759 ?auto_664762 ) ) ( not ( = ?auto_664759 ?auto_664763 ) ) ( not ( = ?auto_664760 ?auto_664761 ) ) ( not ( = ?auto_664760 ?auto_664762 ) ) ( not ( = ?auto_664760 ?auto_664763 ) ) ( not ( = ?auto_664761 ?auto_664762 ) ) ( not ( = ?auto_664761 ?auto_664763 ) ) ( not ( = ?auto_664762 ?auto_664763 ) ) ( ON ?auto_664761 ?auto_664762 ) ( ON ?auto_664760 ?auto_664761 ) ( ON ?auto_664759 ?auto_664760 ) ( ON ?auto_664758 ?auto_664759 ) ( ON ?auto_664757 ?auto_664758 ) ( ON ?auto_664756 ?auto_664757 ) ( ON ?auto_664755 ?auto_664756 ) ( ON ?auto_664754 ?auto_664755 ) ( ON ?auto_664753 ?auto_664754 ) ( ON ?auto_664752 ?auto_664753 ) ( ON ?auto_664751 ?auto_664752 ) ( ON ?auto_664750 ?auto_664751 ) ( CLEAR ?auto_664748 ) ( ON ?auto_664749 ?auto_664750 ) ( CLEAR ?auto_664749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_664746 ?auto_664747 ?auto_664748 ?auto_664749 )
      ( MAKE-17PILE ?auto_664746 ?auto_664747 ?auto_664748 ?auto_664749 ?auto_664750 ?auto_664751 ?auto_664752 ?auto_664753 ?auto_664754 ?auto_664755 ?auto_664756 ?auto_664757 ?auto_664758 ?auto_664759 ?auto_664760 ?auto_664761 ?auto_664762 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664781 - BLOCK
      ?auto_664782 - BLOCK
      ?auto_664783 - BLOCK
      ?auto_664784 - BLOCK
      ?auto_664785 - BLOCK
      ?auto_664786 - BLOCK
      ?auto_664787 - BLOCK
      ?auto_664788 - BLOCK
      ?auto_664789 - BLOCK
      ?auto_664790 - BLOCK
      ?auto_664791 - BLOCK
      ?auto_664792 - BLOCK
      ?auto_664793 - BLOCK
      ?auto_664794 - BLOCK
      ?auto_664795 - BLOCK
      ?auto_664796 - BLOCK
      ?auto_664797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_664797 ) ( ON-TABLE ?auto_664781 ) ( ON ?auto_664782 ?auto_664781 ) ( ON ?auto_664783 ?auto_664782 ) ( not ( = ?auto_664781 ?auto_664782 ) ) ( not ( = ?auto_664781 ?auto_664783 ) ) ( not ( = ?auto_664781 ?auto_664784 ) ) ( not ( = ?auto_664781 ?auto_664785 ) ) ( not ( = ?auto_664781 ?auto_664786 ) ) ( not ( = ?auto_664781 ?auto_664787 ) ) ( not ( = ?auto_664781 ?auto_664788 ) ) ( not ( = ?auto_664781 ?auto_664789 ) ) ( not ( = ?auto_664781 ?auto_664790 ) ) ( not ( = ?auto_664781 ?auto_664791 ) ) ( not ( = ?auto_664781 ?auto_664792 ) ) ( not ( = ?auto_664781 ?auto_664793 ) ) ( not ( = ?auto_664781 ?auto_664794 ) ) ( not ( = ?auto_664781 ?auto_664795 ) ) ( not ( = ?auto_664781 ?auto_664796 ) ) ( not ( = ?auto_664781 ?auto_664797 ) ) ( not ( = ?auto_664782 ?auto_664783 ) ) ( not ( = ?auto_664782 ?auto_664784 ) ) ( not ( = ?auto_664782 ?auto_664785 ) ) ( not ( = ?auto_664782 ?auto_664786 ) ) ( not ( = ?auto_664782 ?auto_664787 ) ) ( not ( = ?auto_664782 ?auto_664788 ) ) ( not ( = ?auto_664782 ?auto_664789 ) ) ( not ( = ?auto_664782 ?auto_664790 ) ) ( not ( = ?auto_664782 ?auto_664791 ) ) ( not ( = ?auto_664782 ?auto_664792 ) ) ( not ( = ?auto_664782 ?auto_664793 ) ) ( not ( = ?auto_664782 ?auto_664794 ) ) ( not ( = ?auto_664782 ?auto_664795 ) ) ( not ( = ?auto_664782 ?auto_664796 ) ) ( not ( = ?auto_664782 ?auto_664797 ) ) ( not ( = ?auto_664783 ?auto_664784 ) ) ( not ( = ?auto_664783 ?auto_664785 ) ) ( not ( = ?auto_664783 ?auto_664786 ) ) ( not ( = ?auto_664783 ?auto_664787 ) ) ( not ( = ?auto_664783 ?auto_664788 ) ) ( not ( = ?auto_664783 ?auto_664789 ) ) ( not ( = ?auto_664783 ?auto_664790 ) ) ( not ( = ?auto_664783 ?auto_664791 ) ) ( not ( = ?auto_664783 ?auto_664792 ) ) ( not ( = ?auto_664783 ?auto_664793 ) ) ( not ( = ?auto_664783 ?auto_664794 ) ) ( not ( = ?auto_664783 ?auto_664795 ) ) ( not ( = ?auto_664783 ?auto_664796 ) ) ( not ( = ?auto_664783 ?auto_664797 ) ) ( not ( = ?auto_664784 ?auto_664785 ) ) ( not ( = ?auto_664784 ?auto_664786 ) ) ( not ( = ?auto_664784 ?auto_664787 ) ) ( not ( = ?auto_664784 ?auto_664788 ) ) ( not ( = ?auto_664784 ?auto_664789 ) ) ( not ( = ?auto_664784 ?auto_664790 ) ) ( not ( = ?auto_664784 ?auto_664791 ) ) ( not ( = ?auto_664784 ?auto_664792 ) ) ( not ( = ?auto_664784 ?auto_664793 ) ) ( not ( = ?auto_664784 ?auto_664794 ) ) ( not ( = ?auto_664784 ?auto_664795 ) ) ( not ( = ?auto_664784 ?auto_664796 ) ) ( not ( = ?auto_664784 ?auto_664797 ) ) ( not ( = ?auto_664785 ?auto_664786 ) ) ( not ( = ?auto_664785 ?auto_664787 ) ) ( not ( = ?auto_664785 ?auto_664788 ) ) ( not ( = ?auto_664785 ?auto_664789 ) ) ( not ( = ?auto_664785 ?auto_664790 ) ) ( not ( = ?auto_664785 ?auto_664791 ) ) ( not ( = ?auto_664785 ?auto_664792 ) ) ( not ( = ?auto_664785 ?auto_664793 ) ) ( not ( = ?auto_664785 ?auto_664794 ) ) ( not ( = ?auto_664785 ?auto_664795 ) ) ( not ( = ?auto_664785 ?auto_664796 ) ) ( not ( = ?auto_664785 ?auto_664797 ) ) ( not ( = ?auto_664786 ?auto_664787 ) ) ( not ( = ?auto_664786 ?auto_664788 ) ) ( not ( = ?auto_664786 ?auto_664789 ) ) ( not ( = ?auto_664786 ?auto_664790 ) ) ( not ( = ?auto_664786 ?auto_664791 ) ) ( not ( = ?auto_664786 ?auto_664792 ) ) ( not ( = ?auto_664786 ?auto_664793 ) ) ( not ( = ?auto_664786 ?auto_664794 ) ) ( not ( = ?auto_664786 ?auto_664795 ) ) ( not ( = ?auto_664786 ?auto_664796 ) ) ( not ( = ?auto_664786 ?auto_664797 ) ) ( not ( = ?auto_664787 ?auto_664788 ) ) ( not ( = ?auto_664787 ?auto_664789 ) ) ( not ( = ?auto_664787 ?auto_664790 ) ) ( not ( = ?auto_664787 ?auto_664791 ) ) ( not ( = ?auto_664787 ?auto_664792 ) ) ( not ( = ?auto_664787 ?auto_664793 ) ) ( not ( = ?auto_664787 ?auto_664794 ) ) ( not ( = ?auto_664787 ?auto_664795 ) ) ( not ( = ?auto_664787 ?auto_664796 ) ) ( not ( = ?auto_664787 ?auto_664797 ) ) ( not ( = ?auto_664788 ?auto_664789 ) ) ( not ( = ?auto_664788 ?auto_664790 ) ) ( not ( = ?auto_664788 ?auto_664791 ) ) ( not ( = ?auto_664788 ?auto_664792 ) ) ( not ( = ?auto_664788 ?auto_664793 ) ) ( not ( = ?auto_664788 ?auto_664794 ) ) ( not ( = ?auto_664788 ?auto_664795 ) ) ( not ( = ?auto_664788 ?auto_664796 ) ) ( not ( = ?auto_664788 ?auto_664797 ) ) ( not ( = ?auto_664789 ?auto_664790 ) ) ( not ( = ?auto_664789 ?auto_664791 ) ) ( not ( = ?auto_664789 ?auto_664792 ) ) ( not ( = ?auto_664789 ?auto_664793 ) ) ( not ( = ?auto_664789 ?auto_664794 ) ) ( not ( = ?auto_664789 ?auto_664795 ) ) ( not ( = ?auto_664789 ?auto_664796 ) ) ( not ( = ?auto_664789 ?auto_664797 ) ) ( not ( = ?auto_664790 ?auto_664791 ) ) ( not ( = ?auto_664790 ?auto_664792 ) ) ( not ( = ?auto_664790 ?auto_664793 ) ) ( not ( = ?auto_664790 ?auto_664794 ) ) ( not ( = ?auto_664790 ?auto_664795 ) ) ( not ( = ?auto_664790 ?auto_664796 ) ) ( not ( = ?auto_664790 ?auto_664797 ) ) ( not ( = ?auto_664791 ?auto_664792 ) ) ( not ( = ?auto_664791 ?auto_664793 ) ) ( not ( = ?auto_664791 ?auto_664794 ) ) ( not ( = ?auto_664791 ?auto_664795 ) ) ( not ( = ?auto_664791 ?auto_664796 ) ) ( not ( = ?auto_664791 ?auto_664797 ) ) ( not ( = ?auto_664792 ?auto_664793 ) ) ( not ( = ?auto_664792 ?auto_664794 ) ) ( not ( = ?auto_664792 ?auto_664795 ) ) ( not ( = ?auto_664792 ?auto_664796 ) ) ( not ( = ?auto_664792 ?auto_664797 ) ) ( not ( = ?auto_664793 ?auto_664794 ) ) ( not ( = ?auto_664793 ?auto_664795 ) ) ( not ( = ?auto_664793 ?auto_664796 ) ) ( not ( = ?auto_664793 ?auto_664797 ) ) ( not ( = ?auto_664794 ?auto_664795 ) ) ( not ( = ?auto_664794 ?auto_664796 ) ) ( not ( = ?auto_664794 ?auto_664797 ) ) ( not ( = ?auto_664795 ?auto_664796 ) ) ( not ( = ?auto_664795 ?auto_664797 ) ) ( not ( = ?auto_664796 ?auto_664797 ) ) ( ON ?auto_664796 ?auto_664797 ) ( ON ?auto_664795 ?auto_664796 ) ( ON ?auto_664794 ?auto_664795 ) ( ON ?auto_664793 ?auto_664794 ) ( ON ?auto_664792 ?auto_664793 ) ( ON ?auto_664791 ?auto_664792 ) ( ON ?auto_664790 ?auto_664791 ) ( ON ?auto_664789 ?auto_664790 ) ( ON ?auto_664788 ?auto_664789 ) ( ON ?auto_664787 ?auto_664788 ) ( ON ?auto_664786 ?auto_664787 ) ( ON ?auto_664785 ?auto_664786 ) ( CLEAR ?auto_664783 ) ( ON ?auto_664784 ?auto_664785 ) ( CLEAR ?auto_664784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_664781 ?auto_664782 ?auto_664783 ?auto_664784 )
      ( MAKE-17PILE ?auto_664781 ?auto_664782 ?auto_664783 ?auto_664784 ?auto_664785 ?auto_664786 ?auto_664787 ?auto_664788 ?auto_664789 ?auto_664790 ?auto_664791 ?auto_664792 ?auto_664793 ?auto_664794 ?auto_664795 ?auto_664796 ?auto_664797 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664815 - BLOCK
      ?auto_664816 - BLOCK
      ?auto_664817 - BLOCK
      ?auto_664818 - BLOCK
      ?auto_664819 - BLOCK
      ?auto_664820 - BLOCK
      ?auto_664821 - BLOCK
      ?auto_664822 - BLOCK
      ?auto_664823 - BLOCK
      ?auto_664824 - BLOCK
      ?auto_664825 - BLOCK
      ?auto_664826 - BLOCK
      ?auto_664827 - BLOCK
      ?auto_664828 - BLOCK
      ?auto_664829 - BLOCK
      ?auto_664830 - BLOCK
      ?auto_664831 - BLOCK
    )
    :vars
    (
      ?auto_664832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664831 ?auto_664832 ) ( ON-TABLE ?auto_664815 ) ( ON ?auto_664816 ?auto_664815 ) ( not ( = ?auto_664815 ?auto_664816 ) ) ( not ( = ?auto_664815 ?auto_664817 ) ) ( not ( = ?auto_664815 ?auto_664818 ) ) ( not ( = ?auto_664815 ?auto_664819 ) ) ( not ( = ?auto_664815 ?auto_664820 ) ) ( not ( = ?auto_664815 ?auto_664821 ) ) ( not ( = ?auto_664815 ?auto_664822 ) ) ( not ( = ?auto_664815 ?auto_664823 ) ) ( not ( = ?auto_664815 ?auto_664824 ) ) ( not ( = ?auto_664815 ?auto_664825 ) ) ( not ( = ?auto_664815 ?auto_664826 ) ) ( not ( = ?auto_664815 ?auto_664827 ) ) ( not ( = ?auto_664815 ?auto_664828 ) ) ( not ( = ?auto_664815 ?auto_664829 ) ) ( not ( = ?auto_664815 ?auto_664830 ) ) ( not ( = ?auto_664815 ?auto_664831 ) ) ( not ( = ?auto_664815 ?auto_664832 ) ) ( not ( = ?auto_664816 ?auto_664817 ) ) ( not ( = ?auto_664816 ?auto_664818 ) ) ( not ( = ?auto_664816 ?auto_664819 ) ) ( not ( = ?auto_664816 ?auto_664820 ) ) ( not ( = ?auto_664816 ?auto_664821 ) ) ( not ( = ?auto_664816 ?auto_664822 ) ) ( not ( = ?auto_664816 ?auto_664823 ) ) ( not ( = ?auto_664816 ?auto_664824 ) ) ( not ( = ?auto_664816 ?auto_664825 ) ) ( not ( = ?auto_664816 ?auto_664826 ) ) ( not ( = ?auto_664816 ?auto_664827 ) ) ( not ( = ?auto_664816 ?auto_664828 ) ) ( not ( = ?auto_664816 ?auto_664829 ) ) ( not ( = ?auto_664816 ?auto_664830 ) ) ( not ( = ?auto_664816 ?auto_664831 ) ) ( not ( = ?auto_664816 ?auto_664832 ) ) ( not ( = ?auto_664817 ?auto_664818 ) ) ( not ( = ?auto_664817 ?auto_664819 ) ) ( not ( = ?auto_664817 ?auto_664820 ) ) ( not ( = ?auto_664817 ?auto_664821 ) ) ( not ( = ?auto_664817 ?auto_664822 ) ) ( not ( = ?auto_664817 ?auto_664823 ) ) ( not ( = ?auto_664817 ?auto_664824 ) ) ( not ( = ?auto_664817 ?auto_664825 ) ) ( not ( = ?auto_664817 ?auto_664826 ) ) ( not ( = ?auto_664817 ?auto_664827 ) ) ( not ( = ?auto_664817 ?auto_664828 ) ) ( not ( = ?auto_664817 ?auto_664829 ) ) ( not ( = ?auto_664817 ?auto_664830 ) ) ( not ( = ?auto_664817 ?auto_664831 ) ) ( not ( = ?auto_664817 ?auto_664832 ) ) ( not ( = ?auto_664818 ?auto_664819 ) ) ( not ( = ?auto_664818 ?auto_664820 ) ) ( not ( = ?auto_664818 ?auto_664821 ) ) ( not ( = ?auto_664818 ?auto_664822 ) ) ( not ( = ?auto_664818 ?auto_664823 ) ) ( not ( = ?auto_664818 ?auto_664824 ) ) ( not ( = ?auto_664818 ?auto_664825 ) ) ( not ( = ?auto_664818 ?auto_664826 ) ) ( not ( = ?auto_664818 ?auto_664827 ) ) ( not ( = ?auto_664818 ?auto_664828 ) ) ( not ( = ?auto_664818 ?auto_664829 ) ) ( not ( = ?auto_664818 ?auto_664830 ) ) ( not ( = ?auto_664818 ?auto_664831 ) ) ( not ( = ?auto_664818 ?auto_664832 ) ) ( not ( = ?auto_664819 ?auto_664820 ) ) ( not ( = ?auto_664819 ?auto_664821 ) ) ( not ( = ?auto_664819 ?auto_664822 ) ) ( not ( = ?auto_664819 ?auto_664823 ) ) ( not ( = ?auto_664819 ?auto_664824 ) ) ( not ( = ?auto_664819 ?auto_664825 ) ) ( not ( = ?auto_664819 ?auto_664826 ) ) ( not ( = ?auto_664819 ?auto_664827 ) ) ( not ( = ?auto_664819 ?auto_664828 ) ) ( not ( = ?auto_664819 ?auto_664829 ) ) ( not ( = ?auto_664819 ?auto_664830 ) ) ( not ( = ?auto_664819 ?auto_664831 ) ) ( not ( = ?auto_664819 ?auto_664832 ) ) ( not ( = ?auto_664820 ?auto_664821 ) ) ( not ( = ?auto_664820 ?auto_664822 ) ) ( not ( = ?auto_664820 ?auto_664823 ) ) ( not ( = ?auto_664820 ?auto_664824 ) ) ( not ( = ?auto_664820 ?auto_664825 ) ) ( not ( = ?auto_664820 ?auto_664826 ) ) ( not ( = ?auto_664820 ?auto_664827 ) ) ( not ( = ?auto_664820 ?auto_664828 ) ) ( not ( = ?auto_664820 ?auto_664829 ) ) ( not ( = ?auto_664820 ?auto_664830 ) ) ( not ( = ?auto_664820 ?auto_664831 ) ) ( not ( = ?auto_664820 ?auto_664832 ) ) ( not ( = ?auto_664821 ?auto_664822 ) ) ( not ( = ?auto_664821 ?auto_664823 ) ) ( not ( = ?auto_664821 ?auto_664824 ) ) ( not ( = ?auto_664821 ?auto_664825 ) ) ( not ( = ?auto_664821 ?auto_664826 ) ) ( not ( = ?auto_664821 ?auto_664827 ) ) ( not ( = ?auto_664821 ?auto_664828 ) ) ( not ( = ?auto_664821 ?auto_664829 ) ) ( not ( = ?auto_664821 ?auto_664830 ) ) ( not ( = ?auto_664821 ?auto_664831 ) ) ( not ( = ?auto_664821 ?auto_664832 ) ) ( not ( = ?auto_664822 ?auto_664823 ) ) ( not ( = ?auto_664822 ?auto_664824 ) ) ( not ( = ?auto_664822 ?auto_664825 ) ) ( not ( = ?auto_664822 ?auto_664826 ) ) ( not ( = ?auto_664822 ?auto_664827 ) ) ( not ( = ?auto_664822 ?auto_664828 ) ) ( not ( = ?auto_664822 ?auto_664829 ) ) ( not ( = ?auto_664822 ?auto_664830 ) ) ( not ( = ?auto_664822 ?auto_664831 ) ) ( not ( = ?auto_664822 ?auto_664832 ) ) ( not ( = ?auto_664823 ?auto_664824 ) ) ( not ( = ?auto_664823 ?auto_664825 ) ) ( not ( = ?auto_664823 ?auto_664826 ) ) ( not ( = ?auto_664823 ?auto_664827 ) ) ( not ( = ?auto_664823 ?auto_664828 ) ) ( not ( = ?auto_664823 ?auto_664829 ) ) ( not ( = ?auto_664823 ?auto_664830 ) ) ( not ( = ?auto_664823 ?auto_664831 ) ) ( not ( = ?auto_664823 ?auto_664832 ) ) ( not ( = ?auto_664824 ?auto_664825 ) ) ( not ( = ?auto_664824 ?auto_664826 ) ) ( not ( = ?auto_664824 ?auto_664827 ) ) ( not ( = ?auto_664824 ?auto_664828 ) ) ( not ( = ?auto_664824 ?auto_664829 ) ) ( not ( = ?auto_664824 ?auto_664830 ) ) ( not ( = ?auto_664824 ?auto_664831 ) ) ( not ( = ?auto_664824 ?auto_664832 ) ) ( not ( = ?auto_664825 ?auto_664826 ) ) ( not ( = ?auto_664825 ?auto_664827 ) ) ( not ( = ?auto_664825 ?auto_664828 ) ) ( not ( = ?auto_664825 ?auto_664829 ) ) ( not ( = ?auto_664825 ?auto_664830 ) ) ( not ( = ?auto_664825 ?auto_664831 ) ) ( not ( = ?auto_664825 ?auto_664832 ) ) ( not ( = ?auto_664826 ?auto_664827 ) ) ( not ( = ?auto_664826 ?auto_664828 ) ) ( not ( = ?auto_664826 ?auto_664829 ) ) ( not ( = ?auto_664826 ?auto_664830 ) ) ( not ( = ?auto_664826 ?auto_664831 ) ) ( not ( = ?auto_664826 ?auto_664832 ) ) ( not ( = ?auto_664827 ?auto_664828 ) ) ( not ( = ?auto_664827 ?auto_664829 ) ) ( not ( = ?auto_664827 ?auto_664830 ) ) ( not ( = ?auto_664827 ?auto_664831 ) ) ( not ( = ?auto_664827 ?auto_664832 ) ) ( not ( = ?auto_664828 ?auto_664829 ) ) ( not ( = ?auto_664828 ?auto_664830 ) ) ( not ( = ?auto_664828 ?auto_664831 ) ) ( not ( = ?auto_664828 ?auto_664832 ) ) ( not ( = ?auto_664829 ?auto_664830 ) ) ( not ( = ?auto_664829 ?auto_664831 ) ) ( not ( = ?auto_664829 ?auto_664832 ) ) ( not ( = ?auto_664830 ?auto_664831 ) ) ( not ( = ?auto_664830 ?auto_664832 ) ) ( not ( = ?auto_664831 ?auto_664832 ) ) ( ON ?auto_664830 ?auto_664831 ) ( ON ?auto_664829 ?auto_664830 ) ( ON ?auto_664828 ?auto_664829 ) ( ON ?auto_664827 ?auto_664828 ) ( ON ?auto_664826 ?auto_664827 ) ( ON ?auto_664825 ?auto_664826 ) ( ON ?auto_664824 ?auto_664825 ) ( ON ?auto_664823 ?auto_664824 ) ( ON ?auto_664822 ?auto_664823 ) ( ON ?auto_664821 ?auto_664822 ) ( ON ?auto_664820 ?auto_664821 ) ( ON ?auto_664819 ?auto_664820 ) ( ON ?auto_664818 ?auto_664819 ) ( CLEAR ?auto_664816 ) ( ON ?auto_664817 ?auto_664818 ) ( CLEAR ?auto_664817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_664815 ?auto_664816 ?auto_664817 )
      ( MAKE-17PILE ?auto_664815 ?auto_664816 ?auto_664817 ?auto_664818 ?auto_664819 ?auto_664820 ?auto_664821 ?auto_664822 ?auto_664823 ?auto_664824 ?auto_664825 ?auto_664826 ?auto_664827 ?auto_664828 ?auto_664829 ?auto_664830 ?auto_664831 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664850 - BLOCK
      ?auto_664851 - BLOCK
      ?auto_664852 - BLOCK
      ?auto_664853 - BLOCK
      ?auto_664854 - BLOCK
      ?auto_664855 - BLOCK
      ?auto_664856 - BLOCK
      ?auto_664857 - BLOCK
      ?auto_664858 - BLOCK
      ?auto_664859 - BLOCK
      ?auto_664860 - BLOCK
      ?auto_664861 - BLOCK
      ?auto_664862 - BLOCK
      ?auto_664863 - BLOCK
      ?auto_664864 - BLOCK
      ?auto_664865 - BLOCK
      ?auto_664866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_664866 ) ( ON-TABLE ?auto_664850 ) ( ON ?auto_664851 ?auto_664850 ) ( not ( = ?auto_664850 ?auto_664851 ) ) ( not ( = ?auto_664850 ?auto_664852 ) ) ( not ( = ?auto_664850 ?auto_664853 ) ) ( not ( = ?auto_664850 ?auto_664854 ) ) ( not ( = ?auto_664850 ?auto_664855 ) ) ( not ( = ?auto_664850 ?auto_664856 ) ) ( not ( = ?auto_664850 ?auto_664857 ) ) ( not ( = ?auto_664850 ?auto_664858 ) ) ( not ( = ?auto_664850 ?auto_664859 ) ) ( not ( = ?auto_664850 ?auto_664860 ) ) ( not ( = ?auto_664850 ?auto_664861 ) ) ( not ( = ?auto_664850 ?auto_664862 ) ) ( not ( = ?auto_664850 ?auto_664863 ) ) ( not ( = ?auto_664850 ?auto_664864 ) ) ( not ( = ?auto_664850 ?auto_664865 ) ) ( not ( = ?auto_664850 ?auto_664866 ) ) ( not ( = ?auto_664851 ?auto_664852 ) ) ( not ( = ?auto_664851 ?auto_664853 ) ) ( not ( = ?auto_664851 ?auto_664854 ) ) ( not ( = ?auto_664851 ?auto_664855 ) ) ( not ( = ?auto_664851 ?auto_664856 ) ) ( not ( = ?auto_664851 ?auto_664857 ) ) ( not ( = ?auto_664851 ?auto_664858 ) ) ( not ( = ?auto_664851 ?auto_664859 ) ) ( not ( = ?auto_664851 ?auto_664860 ) ) ( not ( = ?auto_664851 ?auto_664861 ) ) ( not ( = ?auto_664851 ?auto_664862 ) ) ( not ( = ?auto_664851 ?auto_664863 ) ) ( not ( = ?auto_664851 ?auto_664864 ) ) ( not ( = ?auto_664851 ?auto_664865 ) ) ( not ( = ?auto_664851 ?auto_664866 ) ) ( not ( = ?auto_664852 ?auto_664853 ) ) ( not ( = ?auto_664852 ?auto_664854 ) ) ( not ( = ?auto_664852 ?auto_664855 ) ) ( not ( = ?auto_664852 ?auto_664856 ) ) ( not ( = ?auto_664852 ?auto_664857 ) ) ( not ( = ?auto_664852 ?auto_664858 ) ) ( not ( = ?auto_664852 ?auto_664859 ) ) ( not ( = ?auto_664852 ?auto_664860 ) ) ( not ( = ?auto_664852 ?auto_664861 ) ) ( not ( = ?auto_664852 ?auto_664862 ) ) ( not ( = ?auto_664852 ?auto_664863 ) ) ( not ( = ?auto_664852 ?auto_664864 ) ) ( not ( = ?auto_664852 ?auto_664865 ) ) ( not ( = ?auto_664852 ?auto_664866 ) ) ( not ( = ?auto_664853 ?auto_664854 ) ) ( not ( = ?auto_664853 ?auto_664855 ) ) ( not ( = ?auto_664853 ?auto_664856 ) ) ( not ( = ?auto_664853 ?auto_664857 ) ) ( not ( = ?auto_664853 ?auto_664858 ) ) ( not ( = ?auto_664853 ?auto_664859 ) ) ( not ( = ?auto_664853 ?auto_664860 ) ) ( not ( = ?auto_664853 ?auto_664861 ) ) ( not ( = ?auto_664853 ?auto_664862 ) ) ( not ( = ?auto_664853 ?auto_664863 ) ) ( not ( = ?auto_664853 ?auto_664864 ) ) ( not ( = ?auto_664853 ?auto_664865 ) ) ( not ( = ?auto_664853 ?auto_664866 ) ) ( not ( = ?auto_664854 ?auto_664855 ) ) ( not ( = ?auto_664854 ?auto_664856 ) ) ( not ( = ?auto_664854 ?auto_664857 ) ) ( not ( = ?auto_664854 ?auto_664858 ) ) ( not ( = ?auto_664854 ?auto_664859 ) ) ( not ( = ?auto_664854 ?auto_664860 ) ) ( not ( = ?auto_664854 ?auto_664861 ) ) ( not ( = ?auto_664854 ?auto_664862 ) ) ( not ( = ?auto_664854 ?auto_664863 ) ) ( not ( = ?auto_664854 ?auto_664864 ) ) ( not ( = ?auto_664854 ?auto_664865 ) ) ( not ( = ?auto_664854 ?auto_664866 ) ) ( not ( = ?auto_664855 ?auto_664856 ) ) ( not ( = ?auto_664855 ?auto_664857 ) ) ( not ( = ?auto_664855 ?auto_664858 ) ) ( not ( = ?auto_664855 ?auto_664859 ) ) ( not ( = ?auto_664855 ?auto_664860 ) ) ( not ( = ?auto_664855 ?auto_664861 ) ) ( not ( = ?auto_664855 ?auto_664862 ) ) ( not ( = ?auto_664855 ?auto_664863 ) ) ( not ( = ?auto_664855 ?auto_664864 ) ) ( not ( = ?auto_664855 ?auto_664865 ) ) ( not ( = ?auto_664855 ?auto_664866 ) ) ( not ( = ?auto_664856 ?auto_664857 ) ) ( not ( = ?auto_664856 ?auto_664858 ) ) ( not ( = ?auto_664856 ?auto_664859 ) ) ( not ( = ?auto_664856 ?auto_664860 ) ) ( not ( = ?auto_664856 ?auto_664861 ) ) ( not ( = ?auto_664856 ?auto_664862 ) ) ( not ( = ?auto_664856 ?auto_664863 ) ) ( not ( = ?auto_664856 ?auto_664864 ) ) ( not ( = ?auto_664856 ?auto_664865 ) ) ( not ( = ?auto_664856 ?auto_664866 ) ) ( not ( = ?auto_664857 ?auto_664858 ) ) ( not ( = ?auto_664857 ?auto_664859 ) ) ( not ( = ?auto_664857 ?auto_664860 ) ) ( not ( = ?auto_664857 ?auto_664861 ) ) ( not ( = ?auto_664857 ?auto_664862 ) ) ( not ( = ?auto_664857 ?auto_664863 ) ) ( not ( = ?auto_664857 ?auto_664864 ) ) ( not ( = ?auto_664857 ?auto_664865 ) ) ( not ( = ?auto_664857 ?auto_664866 ) ) ( not ( = ?auto_664858 ?auto_664859 ) ) ( not ( = ?auto_664858 ?auto_664860 ) ) ( not ( = ?auto_664858 ?auto_664861 ) ) ( not ( = ?auto_664858 ?auto_664862 ) ) ( not ( = ?auto_664858 ?auto_664863 ) ) ( not ( = ?auto_664858 ?auto_664864 ) ) ( not ( = ?auto_664858 ?auto_664865 ) ) ( not ( = ?auto_664858 ?auto_664866 ) ) ( not ( = ?auto_664859 ?auto_664860 ) ) ( not ( = ?auto_664859 ?auto_664861 ) ) ( not ( = ?auto_664859 ?auto_664862 ) ) ( not ( = ?auto_664859 ?auto_664863 ) ) ( not ( = ?auto_664859 ?auto_664864 ) ) ( not ( = ?auto_664859 ?auto_664865 ) ) ( not ( = ?auto_664859 ?auto_664866 ) ) ( not ( = ?auto_664860 ?auto_664861 ) ) ( not ( = ?auto_664860 ?auto_664862 ) ) ( not ( = ?auto_664860 ?auto_664863 ) ) ( not ( = ?auto_664860 ?auto_664864 ) ) ( not ( = ?auto_664860 ?auto_664865 ) ) ( not ( = ?auto_664860 ?auto_664866 ) ) ( not ( = ?auto_664861 ?auto_664862 ) ) ( not ( = ?auto_664861 ?auto_664863 ) ) ( not ( = ?auto_664861 ?auto_664864 ) ) ( not ( = ?auto_664861 ?auto_664865 ) ) ( not ( = ?auto_664861 ?auto_664866 ) ) ( not ( = ?auto_664862 ?auto_664863 ) ) ( not ( = ?auto_664862 ?auto_664864 ) ) ( not ( = ?auto_664862 ?auto_664865 ) ) ( not ( = ?auto_664862 ?auto_664866 ) ) ( not ( = ?auto_664863 ?auto_664864 ) ) ( not ( = ?auto_664863 ?auto_664865 ) ) ( not ( = ?auto_664863 ?auto_664866 ) ) ( not ( = ?auto_664864 ?auto_664865 ) ) ( not ( = ?auto_664864 ?auto_664866 ) ) ( not ( = ?auto_664865 ?auto_664866 ) ) ( ON ?auto_664865 ?auto_664866 ) ( ON ?auto_664864 ?auto_664865 ) ( ON ?auto_664863 ?auto_664864 ) ( ON ?auto_664862 ?auto_664863 ) ( ON ?auto_664861 ?auto_664862 ) ( ON ?auto_664860 ?auto_664861 ) ( ON ?auto_664859 ?auto_664860 ) ( ON ?auto_664858 ?auto_664859 ) ( ON ?auto_664857 ?auto_664858 ) ( ON ?auto_664856 ?auto_664857 ) ( ON ?auto_664855 ?auto_664856 ) ( ON ?auto_664854 ?auto_664855 ) ( ON ?auto_664853 ?auto_664854 ) ( CLEAR ?auto_664851 ) ( ON ?auto_664852 ?auto_664853 ) ( CLEAR ?auto_664852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_664850 ?auto_664851 ?auto_664852 )
      ( MAKE-17PILE ?auto_664850 ?auto_664851 ?auto_664852 ?auto_664853 ?auto_664854 ?auto_664855 ?auto_664856 ?auto_664857 ?auto_664858 ?auto_664859 ?auto_664860 ?auto_664861 ?auto_664862 ?auto_664863 ?auto_664864 ?auto_664865 ?auto_664866 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664884 - BLOCK
      ?auto_664885 - BLOCK
      ?auto_664886 - BLOCK
      ?auto_664887 - BLOCK
      ?auto_664888 - BLOCK
      ?auto_664889 - BLOCK
      ?auto_664890 - BLOCK
      ?auto_664891 - BLOCK
      ?auto_664892 - BLOCK
      ?auto_664893 - BLOCK
      ?auto_664894 - BLOCK
      ?auto_664895 - BLOCK
      ?auto_664896 - BLOCK
      ?auto_664897 - BLOCK
      ?auto_664898 - BLOCK
      ?auto_664899 - BLOCK
      ?auto_664900 - BLOCK
    )
    :vars
    (
      ?auto_664901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664900 ?auto_664901 ) ( ON-TABLE ?auto_664884 ) ( not ( = ?auto_664884 ?auto_664885 ) ) ( not ( = ?auto_664884 ?auto_664886 ) ) ( not ( = ?auto_664884 ?auto_664887 ) ) ( not ( = ?auto_664884 ?auto_664888 ) ) ( not ( = ?auto_664884 ?auto_664889 ) ) ( not ( = ?auto_664884 ?auto_664890 ) ) ( not ( = ?auto_664884 ?auto_664891 ) ) ( not ( = ?auto_664884 ?auto_664892 ) ) ( not ( = ?auto_664884 ?auto_664893 ) ) ( not ( = ?auto_664884 ?auto_664894 ) ) ( not ( = ?auto_664884 ?auto_664895 ) ) ( not ( = ?auto_664884 ?auto_664896 ) ) ( not ( = ?auto_664884 ?auto_664897 ) ) ( not ( = ?auto_664884 ?auto_664898 ) ) ( not ( = ?auto_664884 ?auto_664899 ) ) ( not ( = ?auto_664884 ?auto_664900 ) ) ( not ( = ?auto_664884 ?auto_664901 ) ) ( not ( = ?auto_664885 ?auto_664886 ) ) ( not ( = ?auto_664885 ?auto_664887 ) ) ( not ( = ?auto_664885 ?auto_664888 ) ) ( not ( = ?auto_664885 ?auto_664889 ) ) ( not ( = ?auto_664885 ?auto_664890 ) ) ( not ( = ?auto_664885 ?auto_664891 ) ) ( not ( = ?auto_664885 ?auto_664892 ) ) ( not ( = ?auto_664885 ?auto_664893 ) ) ( not ( = ?auto_664885 ?auto_664894 ) ) ( not ( = ?auto_664885 ?auto_664895 ) ) ( not ( = ?auto_664885 ?auto_664896 ) ) ( not ( = ?auto_664885 ?auto_664897 ) ) ( not ( = ?auto_664885 ?auto_664898 ) ) ( not ( = ?auto_664885 ?auto_664899 ) ) ( not ( = ?auto_664885 ?auto_664900 ) ) ( not ( = ?auto_664885 ?auto_664901 ) ) ( not ( = ?auto_664886 ?auto_664887 ) ) ( not ( = ?auto_664886 ?auto_664888 ) ) ( not ( = ?auto_664886 ?auto_664889 ) ) ( not ( = ?auto_664886 ?auto_664890 ) ) ( not ( = ?auto_664886 ?auto_664891 ) ) ( not ( = ?auto_664886 ?auto_664892 ) ) ( not ( = ?auto_664886 ?auto_664893 ) ) ( not ( = ?auto_664886 ?auto_664894 ) ) ( not ( = ?auto_664886 ?auto_664895 ) ) ( not ( = ?auto_664886 ?auto_664896 ) ) ( not ( = ?auto_664886 ?auto_664897 ) ) ( not ( = ?auto_664886 ?auto_664898 ) ) ( not ( = ?auto_664886 ?auto_664899 ) ) ( not ( = ?auto_664886 ?auto_664900 ) ) ( not ( = ?auto_664886 ?auto_664901 ) ) ( not ( = ?auto_664887 ?auto_664888 ) ) ( not ( = ?auto_664887 ?auto_664889 ) ) ( not ( = ?auto_664887 ?auto_664890 ) ) ( not ( = ?auto_664887 ?auto_664891 ) ) ( not ( = ?auto_664887 ?auto_664892 ) ) ( not ( = ?auto_664887 ?auto_664893 ) ) ( not ( = ?auto_664887 ?auto_664894 ) ) ( not ( = ?auto_664887 ?auto_664895 ) ) ( not ( = ?auto_664887 ?auto_664896 ) ) ( not ( = ?auto_664887 ?auto_664897 ) ) ( not ( = ?auto_664887 ?auto_664898 ) ) ( not ( = ?auto_664887 ?auto_664899 ) ) ( not ( = ?auto_664887 ?auto_664900 ) ) ( not ( = ?auto_664887 ?auto_664901 ) ) ( not ( = ?auto_664888 ?auto_664889 ) ) ( not ( = ?auto_664888 ?auto_664890 ) ) ( not ( = ?auto_664888 ?auto_664891 ) ) ( not ( = ?auto_664888 ?auto_664892 ) ) ( not ( = ?auto_664888 ?auto_664893 ) ) ( not ( = ?auto_664888 ?auto_664894 ) ) ( not ( = ?auto_664888 ?auto_664895 ) ) ( not ( = ?auto_664888 ?auto_664896 ) ) ( not ( = ?auto_664888 ?auto_664897 ) ) ( not ( = ?auto_664888 ?auto_664898 ) ) ( not ( = ?auto_664888 ?auto_664899 ) ) ( not ( = ?auto_664888 ?auto_664900 ) ) ( not ( = ?auto_664888 ?auto_664901 ) ) ( not ( = ?auto_664889 ?auto_664890 ) ) ( not ( = ?auto_664889 ?auto_664891 ) ) ( not ( = ?auto_664889 ?auto_664892 ) ) ( not ( = ?auto_664889 ?auto_664893 ) ) ( not ( = ?auto_664889 ?auto_664894 ) ) ( not ( = ?auto_664889 ?auto_664895 ) ) ( not ( = ?auto_664889 ?auto_664896 ) ) ( not ( = ?auto_664889 ?auto_664897 ) ) ( not ( = ?auto_664889 ?auto_664898 ) ) ( not ( = ?auto_664889 ?auto_664899 ) ) ( not ( = ?auto_664889 ?auto_664900 ) ) ( not ( = ?auto_664889 ?auto_664901 ) ) ( not ( = ?auto_664890 ?auto_664891 ) ) ( not ( = ?auto_664890 ?auto_664892 ) ) ( not ( = ?auto_664890 ?auto_664893 ) ) ( not ( = ?auto_664890 ?auto_664894 ) ) ( not ( = ?auto_664890 ?auto_664895 ) ) ( not ( = ?auto_664890 ?auto_664896 ) ) ( not ( = ?auto_664890 ?auto_664897 ) ) ( not ( = ?auto_664890 ?auto_664898 ) ) ( not ( = ?auto_664890 ?auto_664899 ) ) ( not ( = ?auto_664890 ?auto_664900 ) ) ( not ( = ?auto_664890 ?auto_664901 ) ) ( not ( = ?auto_664891 ?auto_664892 ) ) ( not ( = ?auto_664891 ?auto_664893 ) ) ( not ( = ?auto_664891 ?auto_664894 ) ) ( not ( = ?auto_664891 ?auto_664895 ) ) ( not ( = ?auto_664891 ?auto_664896 ) ) ( not ( = ?auto_664891 ?auto_664897 ) ) ( not ( = ?auto_664891 ?auto_664898 ) ) ( not ( = ?auto_664891 ?auto_664899 ) ) ( not ( = ?auto_664891 ?auto_664900 ) ) ( not ( = ?auto_664891 ?auto_664901 ) ) ( not ( = ?auto_664892 ?auto_664893 ) ) ( not ( = ?auto_664892 ?auto_664894 ) ) ( not ( = ?auto_664892 ?auto_664895 ) ) ( not ( = ?auto_664892 ?auto_664896 ) ) ( not ( = ?auto_664892 ?auto_664897 ) ) ( not ( = ?auto_664892 ?auto_664898 ) ) ( not ( = ?auto_664892 ?auto_664899 ) ) ( not ( = ?auto_664892 ?auto_664900 ) ) ( not ( = ?auto_664892 ?auto_664901 ) ) ( not ( = ?auto_664893 ?auto_664894 ) ) ( not ( = ?auto_664893 ?auto_664895 ) ) ( not ( = ?auto_664893 ?auto_664896 ) ) ( not ( = ?auto_664893 ?auto_664897 ) ) ( not ( = ?auto_664893 ?auto_664898 ) ) ( not ( = ?auto_664893 ?auto_664899 ) ) ( not ( = ?auto_664893 ?auto_664900 ) ) ( not ( = ?auto_664893 ?auto_664901 ) ) ( not ( = ?auto_664894 ?auto_664895 ) ) ( not ( = ?auto_664894 ?auto_664896 ) ) ( not ( = ?auto_664894 ?auto_664897 ) ) ( not ( = ?auto_664894 ?auto_664898 ) ) ( not ( = ?auto_664894 ?auto_664899 ) ) ( not ( = ?auto_664894 ?auto_664900 ) ) ( not ( = ?auto_664894 ?auto_664901 ) ) ( not ( = ?auto_664895 ?auto_664896 ) ) ( not ( = ?auto_664895 ?auto_664897 ) ) ( not ( = ?auto_664895 ?auto_664898 ) ) ( not ( = ?auto_664895 ?auto_664899 ) ) ( not ( = ?auto_664895 ?auto_664900 ) ) ( not ( = ?auto_664895 ?auto_664901 ) ) ( not ( = ?auto_664896 ?auto_664897 ) ) ( not ( = ?auto_664896 ?auto_664898 ) ) ( not ( = ?auto_664896 ?auto_664899 ) ) ( not ( = ?auto_664896 ?auto_664900 ) ) ( not ( = ?auto_664896 ?auto_664901 ) ) ( not ( = ?auto_664897 ?auto_664898 ) ) ( not ( = ?auto_664897 ?auto_664899 ) ) ( not ( = ?auto_664897 ?auto_664900 ) ) ( not ( = ?auto_664897 ?auto_664901 ) ) ( not ( = ?auto_664898 ?auto_664899 ) ) ( not ( = ?auto_664898 ?auto_664900 ) ) ( not ( = ?auto_664898 ?auto_664901 ) ) ( not ( = ?auto_664899 ?auto_664900 ) ) ( not ( = ?auto_664899 ?auto_664901 ) ) ( not ( = ?auto_664900 ?auto_664901 ) ) ( ON ?auto_664899 ?auto_664900 ) ( ON ?auto_664898 ?auto_664899 ) ( ON ?auto_664897 ?auto_664898 ) ( ON ?auto_664896 ?auto_664897 ) ( ON ?auto_664895 ?auto_664896 ) ( ON ?auto_664894 ?auto_664895 ) ( ON ?auto_664893 ?auto_664894 ) ( ON ?auto_664892 ?auto_664893 ) ( ON ?auto_664891 ?auto_664892 ) ( ON ?auto_664890 ?auto_664891 ) ( ON ?auto_664889 ?auto_664890 ) ( ON ?auto_664888 ?auto_664889 ) ( ON ?auto_664887 ?auto_664888 ) ( ON ?auto_664886 ?auto_664887 ) ( CLEAR ?auto_664884 ) ( ON ?auto_664885 ?auto_664886 ) ( CLEAR ?auto_664885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_664884 ?auto_664885 )
      ( MAKE-17PILE ?auto_664884 ?auto_664885 ?auto_664886 ?auto_664887 ?auto_664888 ?auto_664889 ?auto_664890 ?auto_664891 ?auto_664892 ?auto_664893 ?auto_664894 ?auto_664895 ?auto_664896 ?auto_664897 ?auto_664898 ?auto_664899 ?auto_664900 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664919 - BLOCK
      ?auto_664920 - BLOCK
      ?auto_664921 - BLOCK
      ?auto_664922 - BLOCK
      ?auto_664923 - BLOCK
      ?auto_664924 - BLOCK
      ?auto_664925 - BLOCK
      ?auto_664926 - BLOCK
      ?auto_664927 - BLOCK
      ?auto_664928 - BLOCK
      ?auto_664929 - BLOCK
      ?auto_664930 - BLOCK
      ?auto_664931 - BLOCK
      ?auto_664932 - BLOCK
      ?auto_664933 - BLOCK
      ?auto_664934 - BLOCK
      ?auto_664935 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_664935 ) ( ON-TABLE ?auto_664919 ) ( not ( = ?auto_664919 ?auto_664920 ) ) ( not ( = ?auto_664919 ?auto_664921 ) ) ( not ( = ?auto_664919 ?auto_664922 ) ) ( not ( = ?auto_664919 ?auto_664923 ) ) ( not ( = ?auto_664919 ?auto_664924 ) ) ( not ( = ?auto_664919 ?auto_664925 ) ) ( not ( = ?auto_664919 ?auto_664926 ) ) ( not ( = ?auto_664919 ?auto_664927 ) ) ( not ( = ?auto_664919 ?auto_664928 ) ) ( not ( = ?auto_664919 ?auto_664929 ) ) ( not ( = ?auto_664919 ?auto_664930 ) ) ( not ( = ?auto_664919 ?auto_664931 ) ) ( not ( = ?auto_664919 ?auto_664932 ) ) ( not ( = ?auto_664919 ?auto_664933 ) ) ( not ( = ?auto_664919 ?auto_664934 ) ) ( not ( = ?auto_664919 ?auto_664935 ) ) ( not ( = ?auto_664920 ?auto_664921 ) ) ( not ( = ?auto_664920 ?auto_664922 ) ) ( not ( = ?auto_664920 ?auto_664923 ) ) ( not ( = ?auto_664920 ?auto_664924 ) ) ( not ( = ?auto_664920 ?auto_664925 ) ) ( not ( = ?auto_664920 ?auto_664926 ) ) ( not ( = ?auto_664920 ?auto_664927 ) ) ( not ( = ?auto_664920 ?auto_664928 ) ) ( not ( = ?auto_664920 ?auto_664929 ) ) ( not ( = ?auto_664920 ?auto_664930 ) ) ( not ( = ?auto_664920 ?auto_664931 ) ) ( not ( = ?auto_664920 ?auto_664932 ) ) ( not ( = ?auto_664920 ?auto_664933 ) ) ( not ( = ?auto_664920 ?auto_664934 ) ) ( not ( = ?auto_664920 ?auto_664935 ) ) ( not ( = ?auto_664921 ?auto_664922 ) ) ( not ( = ?auto_664921 ?auto_664923 ) ) ( not ( = ?auto_664921 ?auto_664924 ) ) ( not ( = ?auto_664921 ?auto_664925 ) ) ( not ( = ?auto_664921 ?auto_664926 ) ) ( not ( = ?auto_664921 ?auto_664927 ) ) ( not ( = ?auto_664921 ?auto_664928 ) ) ( not ( = ?auto_664921 ?auto_664929 ) ) ( not ( = ?auto_664921 ?auto_664930 ) ) ( not ( = ?auto_664921 ?auto_664931 ) ) ( not ( = ?auto_664921 ?auto_664932 ) ) ( not ( = ?auto_664921 ?auto_664933 ) ) ( not ( = ?auto_664921 ?auto_664934 ) ) ( not ( = ?auto_664921 ?auto_664935 ) ) ( not ( = ?auto_664922 ?auto_664923 ) ) ( not ( = ?auto_664922 ?auto_664924 ) ) ( not ( = ?auto_664922 ?auto_664925 ) ) ( not ( = ?auto_664922 ?auto_664926 ) ) ( not ( = ?auto_664922 ?auto_664927 ) ) ( not ( = ?auto_664922 ?auto_664928 ) ) ( not ( = ?auto_664922 ?auto_664929 ) ) ( not ( = ?auto_664922 ?auto_664930 ) ) ( not ( = ?auto_664922 ?auto_664931 ) ) ( not ( = ?auto_664922 ?auto_664932 ) ) ( not ( = ?auto_664922 ?auto_664933 ) ) ( not ( = ?auto_664922 ?auto_664934 ) ) ( not ( = ?auto_664922 ?auto_664935 ) ) ( not ( = ?auto_664923 ?auto_664924 ) ) ( not ( = ?auto_664923 ?auto_664925 ) ) ( not ( = ?auto_664923 ?auto_664926 ) ) ( not ( = ?auto_664923 ?auto_664927 ) ) ( not ( = ?auto_664923 ?auto_664928 ) ) ( not ( = ?auto_664923 ?auto_664929 ) ) ( not ( = ?auto_664923 ?auto_664930 ) ) ( not ( = ?auto_664923 ?auto_664931 ) ) ( not ( = ?auto_664923 ?auto_664932 ) ) ( not ( = ?auto_664923 ?auto_664933 ) ) ( not ( = ?auto_664923 ?auto_664934 ) ) ( not ( = ?auto_664923 ?auto_664935 ) ) ( not ( = ?auto_664924 ?auto_664925 ) ) ( not ( = ?auto_664924 ?auto_664926 ) ) ( not ( = ?auto_664924 ?auto_664927 ) ) ( not ( = ?auto_664924 ?auto_664928 ) ) ( not ( = ?auto_664924 ?auto_664929 ) ) ( not ( = ?auto_664924 ?auto_664930 ) ) ( not ( = ?auto_664924 ?auto_664931 ) ) ( not ( = ?auto_664924 ?auto_664932 ) ) ( not ( = ?auto_664924 ?auto_664933 ) ) ( not ( = ?auto_664924 ?auto_664934 ) ) ( not ( = ?auto_664924 ?auto_664935 ) ) ( not ( = ?auto_664925 ?auto_664926 ) ) ( not ( = ?auto_664925 ?auto_664927 ) ) ( not ( = ?auto_664925 ?auto_664928 ) ) ( not ( = ?auto_664925 ?auto_664929 ) ) ( not ( = ?auto_664925 ?auto_664930 ) ) ( not ( = ?auto_664925 ?auto_664931 ) ) ( not ( = ?auto_664925 ?auto_664932 ) ) ( not ( = ?auto_664925 ?auto_664933 ) ) ( not ( = ?auto_664925 ?auto_664934 ) ) ( not ( = ?auto_664925 ?auto_664935 ) ) ( not ( = ?auto_664926 ?auto_664927 ) ) ( not ( = ?auto_664926 ?auto_664928 ) ) ( not ( = ?auto_664926 ?auto_664929 ) ) ( not ( = ?auto_664926 ?auto_664930 ) ) ( not ( = ?auto_664926 ?auto_664931 ) ) ( not ( = ?auto_664926 ?auto_664932 ) ) ( not ( = ?auto_664926 ?auto_664933 ) ) ( not ( = ?auto_664926 ?auto_664934 ) ) ( not ( = ?auto_664926 ?auto_664935 ) ) ( not ( = ?auto_664927 ?auto_664928 ) ) ( not ( = ?auto_664927 ?auto_664929 ) ) ( not ( = ?auto_664927 ?auto_664930 ) ) ( not ( = ?auto_664927 ?auto_664931 ) ) ( not ( = ?auto_664927 ?auto_664932 ) ) ( not ( = ?auto_664927 ?auto_664933 ) ) ( not ( = ?auto_664927 ?auto_664934 ) ) ( not ( = ?auto_664927 ?auto_664935 ) ) ( not ( = ?auto_664928 ?auto_664929 ) ) ( not ( = ?auto_664928 ?auto_664930 ) ) ( not ( = ?auto_664928 ?auto_664931 ) ) ( not ( = ?auto_664928 ?auto_664932 ) ) ( not ( = ?auto_664928 ?auto_664933 ) ) ( not ( = ?auto_664928 ?auto_664934 ) ) ( not ( = ?auto_664928 ?auto_664935 ) ) ( not ( = ?auto_664929 ?auto_664930 ) ) ( not ( = ?auto_664929 ?auto_664931 ) ) ( not ( = ?auto_664929 ?auto_664932 ) ) ( not ( = ?auto_664929 ?auto_664933 ) ) ( not ( = ?auto_664929 ?auto_664934 ) ) ( not ( = ?auto_664929 ?auto_664935 ) ) ( not ( = ?auto_664930 ?auto_664931 ) ) ( not ( = ?auto_664930 ?auto_664932 ) ) ( not ( = ?auto_664930 ?auto_664933 ) ) ( not ( = ?auto_664930 ?auto_664934 ) ) ( not ( = ?auto_664930 ?auto_664935 ) ) ( not ( = ?auto_664931 ?auto_664932 ) ) ( not ( = ?auto_664931 ?auto_664933 ) ) ( not ( = ?auto_664931 ?auto_664934 ) ) ( not ( = ?auto_664931 ?auto_664935 ) ) ( not ( = ?auto_664932 ?auto_664933 ) ) ( not ( = ?auto_664932 ?auto_664934 ) ) ( not ( = ?auto_664932 ?auto_664935 ) ) ( not ( = ?auto_664933 ?auto_664934 ) ) ( not ( = ?auto_664933 ?auto_664935 ) ) ( not ( = ?auto_664934 ?auto_664935 ) ) ( ON ?auto_664934 ?auto_664935 ) ( ON ?auto_664933 ?auto_664934 ) ( ON ?auto_664932 ?auto_664933 ) ( ON ?auto_664931 ?auto_664932 ) ( ON ?auto_664930 ?auto_664931 ) ( ON ?auto_664929 ?auto_664930 ) ( ON ?auto_664928 ?auto_664929 ) ( ON ?auto_664927 ?auto_664928 ) ( ON ?auto_664926 ?auto_664927 ) ( ON ?auto_664925 ?auto_664926 ) ( ON ?auto_664924 ?auto_664925 ) ( ON ?auto_664923 ?auto_664924 ) ( ON ?auto_664922 ?auto_664923 ) ( ON ?auto_664921 ?auto_664922 ) ( CLEAR ?auto_664919 ) ( ON ?auto_664920 ?auto_664921 ) ( CLEAR ?auto_664920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_664919 ?auto_664920 )
      ( MAKE-17PILE ?auto_664919 ?auto_664920 ?auto_664921 ?auto_664922 ?auto_664923 ?auto_664924 ?auto_664925 ?auto_664926 ?auto_664927 ?auto_664928 ?auto_664929 ?auto_664930 ?auto_664931 ?auto_664932 ?auto_664933 ?auto_664934 ?auto_664935 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664953 - BLOCK
      ?auto_664954 - BLOCK
      ?auto_664955 - BLOCK
      ?auto_664956 - BLOCK
      ?auto_664957 - BLOCK
      ?auto_664958 - BLOCK
      ?auto_664959 - BLOCK
      ?auto_664960 - BLOCK
      ?auto_664961 - BLOCK
      ?auto_664962 - BLOCK
      ?auto_664963 - BLOCK
      ?auto_664964 - BLOCK
      ?auto_664965 - BLOCK
      ?auto_664966 - BLOCK
      ?auto_664967 - BLOCK
      ?auto_664968 - BLOCK
      ?auto_664969 - BLOCK
    )
    :vars
    (
      ?auto_664970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664969 ?auto_664970 ) ( not ( = ?auto_664953 ?auto_664954 ) ) ( not ( = ?auto_664953 ?auto_664955 ) ) ( not ( = ?auto_664953 ?auto_664956 ) ) ( not ( = ?auto_664953 ?auto_664957 ) ) ( not ( = ?auto_664953 ?auto_664958 ) ) ( not ( = ?auto_664953 ?auto_664959 ) ) ( not ( = ?auto_664953 ?auto_664960 ) ) ( not ( = ?auto_664953 ?auto_664961 ) ) ( not ( = ?auto_664953 ?auto_664962 ) ) ( not ( = ?auto_664953 ?auto_664963 ) ) ( not ( = ?auto_664953 ?auto_664964 ) ) ( not ( = ?auto_664953 ?auto_664965 ) ) ( not ( = ?auto_664953 ?auto_664966 ) ) ( not ( = ?auto_664953 ?auto_664967 ) ) ( not ( = ?auto_664953 ?auto_664968 ) ) ( not ( = ?auto_664953 ?auto_664969 ) ) ( not ( = ?auto_664953 ?auto_664970 ) ) ( not ( = ?auto_664954 ?auto_664955 ) ) ( not ( = ?auto_664954 ?auto_664956 ) ) ( not ( = ?auto_664954 ?auto_664957 ) ) ( not ( = ?auto_664954 ?auto_664958 ) ) ( not ( = ?auto_664954 ?auto_664959 ) ) ( not ( = ?auto_664954 ?auto_664960 ) ) ( not ( = ?auto_664954 ?auto_664961 ) ) ( not ( = ?auto_664954 ?auto_664962 ) ) ( not ( = ?auto_664954 ?auto_664963 ) ) ( not ( = ?auto_664954 ?auto_664964 ) ) ( not ( = ?auto_664954 ?auto_664965 ) ) ( not ( = ?auto_664954 ?auto_664966 ) ) ( not ( = ?auto_664954 ?auto_664967 ) ) ( not ( = ?auto_664954 ?auto_664968 ) ) ( not ( = ?auto_664954 ?auto_664969 ) ) ( not ( = ?auto_664954 ?auto_664970 ) ) ( not ( = ?auto_664955 ?auto_664956 ) ) ( not ( = ?auto_664955 ?auto_664957 ) ) ( not ( = ?auto_664955 ?auto_664958 ) ) ( not ( = ?auto_664955 ?auto_664959 ) ) ( not ( = ?auto_664955 ?auto_664960 ) ) ( not ( = ?auto_664955 ?auto_664961 ) ) ( not ( = ?auto_664955 ?auto_664962 ) ) ( not ( = ?auto_664955 ?auto_664963 ) ) ( not ( = ?auto_664955 ?auto_664964 ) ) ( not ( = ?auto_664955 ?auto_664965 ) ) ( not ( = ?auto_664955 ?auto_664966 ) ) ( not ( = ?auto_664955 ?auto_664967 ) ) ( not ( = ?auto_664955 ?auto_664968 ) ) ( not ( = ?auto_664955 ?auto_664969 ) ) ( not ( = ?auto_664955 ?auto_664970 ) ) ( not ( = ?auto_664956 ?auto_664957 ) ) ( not ( = ?auto_664956 ?auto_664958 ) ) ( not ( = ?auto_664956 ?auto_664959 ) ) ( not ( = ?auto_664956 ?auto_664960 ) ) ( not ( = ?auto_664956 ?auto_664961 ) ) ( not ( = ?auto_664956 ?auto_664962 ) ) ( not ( = ?auto_664956 ?auto_664963 ) ) ( not ( = ?auto_664956 ?auto_664964 ) ) ( not ( = ?auto_664956 ?auto_664965 ) ) ( not ( = ?auto_664956 ?auto_664966 ) ) ( not ( = ?auto_664956 ?auto_664967 ) ) ( not ( = ?auto_664956 ?auto_664968 ) ) ( not ( = ?auto_664956 ?auto_664969 ) ) ( not ( = ?auto_664956 ?auto_664970 ) ) ( not ( = ?auto_664957 ?auto_664958 ) ) ( not ( = ?auto_664957 ?auto_664959 ) ) ( not ( = ?auto_664957 ?auto_664960 ) ) ( not ( = ?auto_664957 ?auto_664961 ) ) ( not ( = ?auto_664957 ?auto_664962 ) ) ( not ( = ?auto_664957 ?auto_664963 ) ) ( not ( = ?auto_664957 ?auto_664964 ) ) ( not ( = ?auto_664957 ?auto_664965 ) ) ( not ( = ?auto_664957 ?auto_664966 ) ) ( not ( = ?auto_664957 ?auto_664967 ) ) ( not ( = ?auto_664957 ?auto_664968 ) ) ( not ( = ?auto_664957 ?auto_664969 ) ) ( not ( = ?auto_664957 ?auto_664970 ) ) ( not ( = ?auto_664958 ?auto_664959 ) ) ( not ( = ?auto_664958 ?auto_664960 ) ) ( not ( = ?auto_664958 ?auto_664961 ) ) ( not ( = ?auto_664958 ?auto_664962 ) ) ( not ( = ?auto_664958 ?auto_664963 ) ) ( not ( = ?auto_664958 ?auto_664964 ) ) ( not ( = ?auto_664958 ?auto_664965 ) ) ( not ( = ?auto_664958 ?auto_664966 ) ) ( not ( = ?auto_664958 ?auto_664967 ) ) ( not ( = ?auto_664958 ?auto_664968 ) ) ( not ( = ?auto_664958 ?auto_664969 ) ) ( not ( = ?auto_664958 ?auto_664970 ) ) ( not ( = ?auto_664959 ?auto_664960 ) ) ( not ( = ?auto_664959 ?auto_664961 ) ) ( not ( = ?auto_664959 ?auto_664962 ) ) ( not ( = ?auto_664959 ?auto_664963 ) ) ( not ( = ?auto_664959 ?auto_664964 ) ) ( not ( = ?auto_664959 ?auto_664965 ) ) ( not ( = ?auto_664959 ?auto_664966 ) ) ( not ( = ?auto_664959 ?auto_664967 ) ) ( not ( = ?auto_664959 ?auto_664968 ) ) ( not ( = ?auto_664959 ?auto_664969 ) ) ( not ( = ?auto_664959 ?auto_664970 ) ) ( not ( = ?auto_664960 ?auto_664961 ) ) ( not ( = ?auto_664960 ?auto_664962 ) ) ( not ( = ?auto_664960 ?auto_664963 ) ) ( not ( = ?auto_664960 ?auto_664964 ) ) ( not ( = ?auto_664960 ?auto_664965 ) ) ( not ( = ?auto_664960 ?auto_664966 ) ) ( not ( = ?auto_664960 ?auto_664967 ) ) ( not ( = ?auto_664960 ?auto_664968 ) ) ( not ( = ?auto_664960 ?auto_664969 ) ) ( not ( = ?auto_664960 ?auto_664970 ) ) ( not ( = ?auto_664961 ?auto_664962 ) ) ( not ( = ?auto_664961 ?auto_664963 ) ) ( not ( = ?auto_664961 ?auto_664964 ) ) ( not ( = ?auto_664961 ?auto_664965 ) ) ( not ( = ?auto_664961 ?auto_664966 ) ) ( not ( = ?auto_664961 ?auto_664967 ) ) ( not ( = ?auto_664961 ?auto_664968 ) ) ( not ( = ?auto_664961 ?auto_664969 ) ) ( not ( = ?auto_664961 ?auto_664970 ) ) ( not ( = ?auto_664962 ?auto_664963 ) ) ( not ( = ?auto_664962 ?auto_664964 ) ) ( not ( = ?auto_664962 ?auto_664965 ) ) ( not ( = ?auto_664962 ?auto_664966 ) ) ( not ( = ?auto_664962 ?auto_664967 ) ) ( not ( = ?auto_664962 ?auto_664968 ) ) ( not ( = ?auto_664962 ?auto_664969 ) ) ( not ( = ?auto_664962 ?auto_664970 ) ) ( not ( = ?auto_664963 ?auto_664964 ) ) ( not ( = ?auto_664963 ?auto_664965 ) ) ( not ( = ?auto_664963 ?auto_664966 ) ) ( not ( = ?auto_664963 ?auto_664967 ) ) ( not ( = ?auto_664963 ?auto_664968 ) ) ( not ( = ?auto_664963 ?auto_664969 ) ) ( not ( = ?auto_664963 ?auto_664970 ) ) ( not ( = ?auto_664964 ?auto_664965 ) ) ( not ( = ?auto_664964 ?auto_664966 ) ) ( not ( = ?auto_664964 ?auto_664967 ) ) ( not ( = ?auto_664964 ?auto_664968 ) ) ( not ( = ?auto_664964 ?auto_664969 ) ) ( not ( = ?auto_664964 ?auto_664970 ) ) ( not ( = ?auto_664965 ?auto_664966 ) ) ( not ( = ?auto_664965 ?auto_664967 ) ) ( not ( = ?auto_664965 ?auto_664968 ) ) ( not ( = ?auto_664965 ?auto_664969 ) ) ( not ( = ?auto_664965 ?auto_664970 ) ) ( not ( = ?auto_664966 ?auto_664967 ) ) ( not ( = ?auto_664966 ?auto_664968 ) ) ( not ( = ?auto_664966 ?auto_664969 ) ) ( not ( = ?auto_664966 ?auto_664970 ) ) ( not ( = ?auto_664967 ?auto_664968 ) ) ( not ( = ?auto_664967 ?auto_664969 ) ) ( not ( = ?auto_664967 ?auto_664970 ) ) ( not ( = ?auto_664968 ?auto_664969 ) ) ( not ( = ?auto_664968 ?auto_664970 ) ) ( not ( = ?auto_664969 ?auto_664970 ) ) ( ON ?auto_664968 ?auto_664969 ) ( ON ?auto_664967 ?auto_664968 ) ( ON ?auto_664966 ?auto_664967 ) ( ON ?auto_664965 ?auto_664966 ) ( ON ?auto_664964 ?auto_664965 ) ( ON ?auto_664963 ?auto_664964 ) ( ON ?auto_664962 ?auto_664963 ) ( ON ?auto_664961 ?auto_664962 ) ( ON ?auto_664960 ?auto_664961 ) ( ON ?auto_664959 ?auto_664960 ) ( ON ?auto_664958 ?auto_664959 ) ( ON ?auto_664957 ?auto_664958 ) ( ON ?auto_664956 ?auto_664957 ) ( ON ?auto_664955 ?auto_664956 ) ( ON ?auto_664954 ?auto_664955 ) ( ON ?auto_664953 ?auto_664954 ) ( CLEAR ?auto_664953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_664953 )
      ( MAKE-17PILE ?auto_664953 ?auto_664954 ?auto_664955 ?auto_664956 ?auto_664957 ?auto_664958 ?auto_664959 ?auto_664960 ?auto_664961 ?auto_664962 ?auto_664963 ?auto_664964 ?auto_664965 ?auto_664966 ?auto_664967 ?auto_664968 ?auto_664969 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_664988 - BLOCK
      ?auto_664989 - BLOCK
      ?auto_664990 - BLOCK
      ?auto_664991 - BLOCK
      ?auto_664992 - BLOCK
      ?auto_664993 - BLOCK
      ?auto_664994 - BLOCK
      ?auto_664995 - BLOCK
      ?auto_664996 - BLOCK
      ?auto_664997 - BLOCK
      ?auto_664998 - BLOCK
      ?auto_664999 - BLOCK
      ?auto_665000 - BLOCK
      ?auto_665001 - BLOCK
      ?auto_665002 - BLOCK
      ?auto_665003 - BLOCK
      ?auto_665004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_665004 ) ( not ( = ?auto_664988 ?auto_664989 ) ) ( not ( = ?auto_664988 ?auto_664990 ) ) ( not ( = ?auto_664988 ?auto_664991 ) ) ( not ( = ?auto_664988 ?auto_664992 ) ) ( not ( = ?auto_664988 ?auto_664993 ) ) ( not ( = ?auto_664988 ?auto_664994 ) ) ( not ( = ?auto_664988 ?auto_664995 ) ) ( not ( = ?auto_664988 ?auto_664996 ) ) ( not ( = ?auto_664988 ?auto_664997 ) ) ( not ( = ?auto_664988 ?auto_664998 ) ) ( not ( = ?auto_664988 ?auto_664999 ) ) ( not ( = ?auto_664988 ?auto_665000 ) ) ( not ( = ?auto_664988 ?auto_665001 ) ) ( not ( = ?auto_664988 ?auto_665002 ) ) ( not ( = ?auto_664988 ?auto_665003 ) ) ( not ( = ?auto_664988 ?auto_665004 ) ) ( not ( = ?auto_664989 ?auto_664990 ) ) ( not ( = ?auto_664989 ?auto_664991 ) ) ( not ( = ?auto_664989 ?auto_664992 ) ) ( not ( = ?auto_664989 ?auto_664993 ) ) ( not ( = ?auto_664989 ?auto_664994 ) ) ( not ( = ?auto_664989 ?auto_664995 ) ) ( not ( = ?auto_664989 ?auto_664996 ) ) ( not ( = ?auto_664989 ?auto_664997 ) ) ( not ( = ?auto_664989 ?auto_664998 ) ) ( not ( = ?auto_664989 ?auto_664999 ) ) ( not ( = ?auto_664989 ?auto_665000 ) ) ( not ( = ?auto_664989 ?auto_665001 ) ) ( not ( = ?auto_664989 ?auto_665002 ) ) ( not ( = ?auto_664989 ?auto_665003 ) ) ( not ( = ?auto_664989 ?auto_665004 ) ) ( not ( = ?auto_664990 ?auto_664991 ) ) ( not ( = ?auto_664990 ?auto_664992 ) ) ( not ( = ?auto_664990 ?auto_664993 ) ) ( not ( = ?auto_664990 ?auto_664994 ) ) ( not ( = ?auto_664990 ?auto_664995 ) ) ( not ( = ?auto_664990 ?auto_664996 ) ) ( not ( = ?auto_664990 ?auto_664997 ) ) ( not ( = ?auto_664990 ?auto_664998 ) ) ( not ( = ?auto_664990 ?auto_664999 ) ) ( not ( = ?auto_664990 ?auto_665000 ) ) ( not ( = ?auto_664990 ?auto_665001 ) ) ( not ( = ?auto_664990 ?auto_665002 ) ) ( not ( = ?auto_664990 ?auto_665003 ) ) ( not ( = ?auto_664990 ?auto_665004 ) ) ( not ( = ?auto_664991 ?auto_664992 ) ) ( not ( = ?auto_664991 ?auto_664993 ) ) ( not ( = ?auto_664991 ?auto_664994 ) ) ( not ( = ?auto_664991 ?auto_664995 ) ) ( not ( = ?auto_664991 ?auto_664996 ) ) ( not ( = ?auto_664991 ?auto_664997 ) ) ( not ( = ?auto_664991 ?auto_664998 ) ) ( not ( = ?auto_664991 ?auto_664999 ) ) ( not ( = ?auto_664991 ?auto_665000 ) ) ( not ( = ?auto_664991 ?auto_665001 ) ) ( not ( = ?auto_664991 ?auto_665002 ) ) ( not ( = ?auto_664991 ?auto_665003 ) ) ( not ( = ?auto_664991 ?auto_665004 ) ) ( not ( = ?auto_664992 ?auto_664993 ) ) ( not ( = ?auto_664992 ?auto_664994 ) ) ( not ( = ?auto_664992 ?auto_664995 ) ) ( not ( = ?auto_664992 ?auto_664996 ) ) ( not ( = ?auto_664992 ?auto_664997 ) ) ( not ( = ?auto_664992 ?auto_664998 ) ) ( not ( = ?auto_664992 ?auto_664999 ) ) ( not ( = ?auto_664992 ?auto_665000 ) ) ( not ( = ?auto_664992 ?auto_665001 ) ) ( not ( = ?auto_664992 ?auto_665002 ) ) ( not ( = ?auto_664992 ?auto_665003 ) ) ( not ( = ?auto_664992 ?auto_665004 ) ) ( not ( = ?auto_664993 ?auto_664994 ) ) ( not ( = ?auto_664993 ?auto_664995 ) ) ( not ( = ?auto_664993 ?auto_664996 ) ) ( not ( = ?auto_664993 ?auto_664997 ) ) ( not ( = ?auto_664993 ?auto_664998 ) ) ( not ( = ?auto_664993 ?auto_664999 ) ) ( not ( = ?auto_664993 ?auto_665000 ) ) ( not ( = ?auto_664993 ?auto_665001 ) ) ( not ( = ?auto_664993 ?auto_665002 ) ) ( not ( = ?auto_664993 ?auto_665003 ) ) ( not ( = ?auto_664993 ?auto_665004 ) ) ( not ( = ?auto_664994 ?auto_664995 ) ) ( not ( = ?auto_664994 ?auto_664996 ) ) ( not ( = ?auto_664994 ?auto_664997 ) ) ( not ( = ?auto_664994 ?auto_664998 ) ) ( not ( = ?auto_664994 ?auto_664999 ) ) ( not ( = ?auto_664994 ?auto_665000 ) ) ( not ( = ?auto_664994 ?auto_665001 ) ) ( not ( = ?auto_664994 ?auto_665002 ) ) ( not ( = ?auto_664994 ?auto_665003 ) ) ( not ( = ?auto_664994 ?auto_665004 ) ) ( not ( = ?auto_664995 ?auto_664996 ) ) ( not ( = ?auto_664995 ?auto_664997 ) ) ( not ( = ?auto_664995 ?auto_664998 ) ) ( not ( = ?auto_664995 ?auto_664999 ) ) ( not ( = ?auto_664995 ?auto_665000 ) ) ( not ( = ?auto_664995 ?auto_665001 ) ) ( not ( = ?auto_664995 ?auto_665002 ) ) ( not ( = ?auto_664995 ?auto_665003 ) ) ( not ( = ?auto_664995 ?auto_665004 ) ) ( not ( = ?auto_664996 ?auto_664997 ) ) ( not ( = ?auto_664996 ?auto_664998 ) ) ( not ( = ?auto_664996 ?auto_664999 ) ) ( not ( = ?auto_664996 ?auto_665000 ) ) ( not ( = ?auto_664996 ?auto_665001 ) ) ( not ( = ?auto_664996 ?auto_665002 ) ) ( not ( = ?auto_664996 ?auto_665003 ) ) ( not ( = ?auto_664996 ?auto_665004 ) ) ( not ( = ?auto_664997 ?auto_664998 ) ) ( not ( = ?auto_664997 ?auto_664999 ) ) ( not ( = ?auto_664997 ?auto_665000 ) ) ( not ( = ?auto_664997 ?auto_665001 ) ) ( not ( = ?auto_664997 ?auto_665002 ) ) ( not ( = ?auto_664997 ?auto_665003 ) ) ( not ( = ?auto_664997 ?auto_665004 ) ) ( not ( = ?auto_664998 ?auto_664999 ) ) ( not ( = ?auto_664998 ?auto_665000 ) ) ( not ( = ?auto_664998 ?auto_665001 ) ) ( not ( = ?auto_664998 ?auto_665002 ) ) ( not ( = ?auto_664998 ?auto_665003 ) ) ( not ( = ?auto_664998 ?auto_665004 ) ) ( not ( = ?auto_664999 ?auto_665000 ) ) ( not ( = ?auto_664999 ?auto_665001 ) ) ( not ( = ?auto_664999 ?auto_665002 ) ) ( not ( = ?auto_664999 ?auto_665003 ) ) ( not ( = ?auto_664999 ?auto_665004 ) ) ( not ( = ?auto_665000 ?auto_665001 ) ) ( not ( = ?auto_665000 ?auto_665002 ) ) ( not ( = ?auto_665000 ?auto_665003 ) ) ( not ( = ?auto_665000 ?auto_665004 ) ) ( not ( = ?auto_665001 ?auto_665002 ) ) ( not ( = ?auto_665001 ?auto_665003 ) ) ( not ( = ?auto_665001 ?auto_665004 ) ) ( not ( = ?auto_665002 ?auto_665003 ) ) ( not ( = ?auto_665002 ?auto_665004 ) ) ( not ( = ?auto_665003 ?auto_665004 ) ) ( ON ?auto_665003 ?auto_665004 ) ( ON ?auto_665002 ?auto_665003 ) ( ON ?auto_665001 ?auto_665002 ) ( ON ?auto_665000 ?auto_665001 ) ( ON ?auto_664999 ?auto_665000 ) ( ON ?auto_664998 ?auto_664999 ) ( ON ?auto_664997 ?auto_664998 ) ( ON ?auto_664996 ?auto_664997 ) ( ON ?auto_664995 ?auto_664996 ) ( ON ?auto_664994 ?auto_664995 ) ( ON ?auto_664993 ?auto_664994 ) ( ON ?auto_664992 ?auto_664993 ) ( ON ?auto_664991 ?auto_664992 ) ( ON ?auto_664990 ?auto_664991 ) ( ON ?auto_664989 ?auto_664990 ) ( ON ?auto_664988 ?auto_664989 ) ( CLEAR ?auto_664988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_664988 )
      ( MAKE-17PILE ?auto_664988 ?auto_664989 ?auto_664990 ?auto_664991 ?auto_664992 ?auto_664993 ?auto_664994 ?auto_664995 ?auto_664996 ?auto_664997 ?auto_664998 ?auto_664999 ?auto_665000 ?auto_665001 ?auto_665002 ?auto_665003 ?auto_665004 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_665022 - BLOCK
      ?auto_665023 - BLOCK
      ?auto_665024 - BLOCK
      ?auto_665025 - BLOCK
      ?auto_665026 - BLOCK
      ?auto_665027 - BLOCK
      ?auto_665028 - BLOCK
      ?auto_665029 - BLOCK
      ?auto_665030 - BLOCK
      ?auto_665031 - BLOCK
      ?auto_665032 - BLOCK
      ?auto_665033 - BLOCK
      ?auto_665034 - BLOCK
      ?auto_665035 - BLOCK
      ?auto_665036 - BLOCK
      ?auto_665037 - BLOCK
      ?auto_665038 - BLOCK
    )
    :vars
    (
      ?auto_665039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_665022 ?auto_665023 ) ) ( not ( = ?auto_665022 ?auto_665024 ) ) ( not ( = ?auto_665022 ?auto_665025 ) ) ( not ( = ?auto_665022 ?auto_665026 ) ) ( not ( = ?auto_665022 ?auto_665027 ) ) ( not ( = ?auto_665022 ?auto_665028 ) ) ( not ( = ?auto_665022 ?auto_665029 ) ) ( not ( = ?auto_665022 ?auto_665030 ) ) ( not ( = ?auto_665022 ?auto_665031 ) ) ( not ( = ?auto_665022 ?auto_665032 ) ) ( not ( = ?auto_665022 ?auto_665033 ) ) ( not ( = ?auto_665022 ?auto_665034 ) ) ( not ( = ?auto_665022 ?auto_665035 ) ) ( not ( = ?auto_665022 ?auto_665036 ) ) ( not ( = ?auto_665022 ?auto_665037 ) ) ( not ( = ?auto_665022 ?auto_665038 ) ) ( not ( = ?auto_665023 ?auto_665024 ) ) ( not ( = ?auto_665023 ?auto_665025 ) ) ( not ( = ?auto_665023 ?auto_665026 ) ) ( not ( = ?auto_665023 ?auto_665027 ) ) ( not ( = ?auto_665023 ?auto_665028 ) ) ( not ( = ?auto_665023 ?auto_665029 ) ) ( not ( = ?auto_665023 ?auto_665030 ) ) ( not ( = ?auto_665023 ?auto_665031 ) ) ( not ( = ?auto_665023 ?auto_665032 ) ) ( not ( = ?auto_665023 ?auto_665033 ) ) ( not ( = ?auto_665023 ?auto_665034 ) ) ( not ( = ?auto_665023 ?auto_665035 ) ) ( not ( = ?auto_665023 ?auto_665036 ) ) ( not ( = ?auto_665023 ?auto_665037 ) ) ( not ( = ?auto_665023 ?auto_665038 ) ) ( not ( = ?auto_665024 ?auto_665025 ) ) ( not ( = ?auto_665024 ?auto_665026 ) ) ( not ( = ?auto_665024 ?auto_665027 ) ) ( not ( = ?auto_665024 ?auto_665028 ) ) ( not ( = ?auto_665024 ?auto_665029 ) ) ( not ( = ?auto_665024 ?auto_665030 ) ) ( not ( = ?auto_665024 ?auto_665031 ) ) ( not ( = ?auto_665024 ?auto_665032 ) ) ( not ( = ?auto_665024 ?auto_665033 ) ) ( not ( = ?auto_665024 ?auto_665034 ) ) ( not ( = ?auto_665024 ?auto_665035 ) ) ( not ( = ?auto_665024 ?auto_665036 ) ) ( not ( = ?auto_665024 ?auto_665037 ) ) ( not ( = ?auto_665024 ?auto_665038 ) ) ( not ( = ?auto_665025 ?auto_665026 ) ) ( not ( = ?auto_665025 ?auto_665027 ) ) ( not ( = ?auto_665025 ?auto_665028 ) ) ( not ( = ?auto_665025 ?auto_665029 ) ) ( not ( = ?auto_665025 ?auto_665030 ) ) ( not ( = ?auto_665025 ?auto_665031 ) ) ( not ( = ?auto_665025 ?auto_665032 ) ) ( not ( = ?auto_665025 ?auto_665033 ) ) ( not ( = ?auto_665025 ?auto_665034 ) ) ( not ( = ?auto_665025 ?auto_665035 ) ) ( not ( = ?auto_665025 ?auto_665036 ) ) ( not ( = ?auto_665025 ?auto_665037 ) ) ( not ( = ?auto_665025 ?auto_665038 ) ) ( not ( = ?auto_665026 ?auto_665027 ) ) ( not ( = ?auto_665026 ?auto_665028 ) ) ( not ( = ?auto_665026 ?auto_665029 ) ) ( not ( = ?auto_665026 ?auto_665030 ) ) ( not ( = ?auto_665026 ?auto_665031 ) ) ( not ( = ?auto_665026 ?auto_665032 ) ) ( not ( = ?auto_665026 ?auto_665033 ) ) ( not ( = ?auto_665026 ?auto_665034 ) ) ( not ( = ?auto_665026 ?auto_665035 ) ) ( not ( = ?auto_665026 ?auto_665036 ) ) ( not ( = ?auto_665026 ?auto_665037 ) ) ( not ( = ?auto_665026 ?auto_665038 ) ) ( not ( = ?auto_665027 ?auto_665028 ) ) ( not ( = ?auto_665027 ?auto_665029 ) ) ( not ( = ?auto_665027 ?auto_665030 ) ) ( not ( = ?auto_665027 ?auto_665031 ) ) ( not ( = ?auto_665027 ?auto_665032 ) ) ( not ( = ?auto_665027 ?auto_665033 ) ) ( not ( = ?auto_665027 ?auto_665034 ) ) ( not ( = ?auto_665027 ?auto_665035 ) ) ( not ( = ?auto_665027 ?auto_665036 ) ) ( not ( = ?auto_665027 ?auto_665037 ) ) ( not ( = ?auto_665027 ?auto_665038 ) ) ( not ( = ?auto_665028 ?auto_665029 ) ) ( not ( = ?auto_665028 ?auto_665030 ) ) ( not ( = ?auto_665028 ?auto_665031 ) ) ( not ( = ?auto_665028 ?auto_665032 ) ) ( not ( = ?auto_665028 ?auto_665033 ) ) ( not ( = ?auto_665028 ?auto_665034 ) ) ( not ( = ?auto_665028 ?auto_665035 ) ) ( not ( = ?auto_665028 ?auto_665036 ) ) ( not ( = ?auto_665028 ?auto_665037 ) ) ( not ( = ?auto_665028 ?auto_665038 ) ) ( not ( = ?auto_665029 ?auto_665030 ) ) ( not ( = ?auto_665029 ?auto_665031 ) ) ( not ( = ?auto_665029 ?auto_665032 ) ) ( not ( = ?auto_665029 ?auto_665033 ) ) ( not ( = ?auto_665029 ?auto_665034 ) ) ( not ( = ?auto_665029 ?auto_665035 ) ) ( not ( = ?auto_665029 ?auto_665036 ) ) ( not ( = ?auto_665029 ?auto_665037 ) ) ( not ( = ?auto_665029 ?auto_665038 ) ) ( not ( = ?auto_665030 ?auto_665031 ) ) ( not ( = ?auto_665030 ?auto_665032 ) ) ( not ( = ?auto_665030 ?auto_665033 ) ) ( not ( = ?auto_665030 ?auto_665034 ) ) ( not ( = ?auto_665030 ?auto_665035 ) ) ( not ( = ?auto_665030 ?auto_665036 ) ) ( not ( = ?auto_665030 ?auto_665037 ) ) ( not ( = ?auto_665030 ?auto_665038 ) ) ( not ( = ?auto_665031 ?auto_665032 ) ) ( not ( = ?auto_665031 ?auto_665033 ) ) ( not ( = ?auto_665031 ?auto_665034 ) ) ( not ( = ?auto_665031 ?auto_665035 ) ) ( not ( = ?auto_665031 ?auto_665036 ) ) ( not ( = ?auto_665031 ?auto_665037 ) ) ( not ( = ?auto_665031 ?auto_665038 ) ) ( not ( = ?auto_665032 ?auto_665033 ) ) ( not ( = ?auto_665032 ?auto_665034 ) ) ( not ( = ?auto_665032 ?auto_665035 ) ) ( not ( = ?auto_665032 ?auto_665036 ) ) ( not ( = ?auto_665032 ?auto_665037 ) ) ( not ( = ?auto_665032 ?auto_665038 ) ) ( not ( = ?auto_665033 ?auto_665034 ) ) ( not ( = ?auto_665033 ?auto_665035 ) ) ( not ( = ?auto_665033 ?auto_665036 ) ) ( not ( = ?auto_665033 ?auto_665037 ) ) ( not ( = ?auto_665033 ?auto_665038 ) ) ( not ( = ?auto_665034 ?auto_665035 ) ) ( not ( = ?auto_665034 ?auto_665036 ) ) ( not ( = ?auto_665034 ?auto_665037 ) ) ( not ( = ?auto_665034 ?auto_665038 ) ) ( not ( = ?auto_665035 ?auto_665036 ) ) ( not ( = ?auto_665035 ?auto_665037 ) ) ( not ( = ?auto_665035 ?auto_665038 ) ) ( not ( = ?auto_665036 ?auto_665037 ) ) ( not ( = ?auto_665036 ?auto_665038 ) ) ( not ( = ?auto_665037 ?auto_665038 ) ) ( ON ?auto_665022 ?auto_665039 ) ( not ( = ?auto_665038 ?auto_665039 ) ) ( not ( = ?auto_665037 ?auto_665039 ) ) ( not ( = ?auto_665036 ?auto_665039 ) ) ( not ( = ?auto_665035 ?auto_665039 ) ) ( not ( = ?auto_665034 ?auto_665039 ) ) ( not ( = ?auto_665033 ?auto_665039 ) ) ( not ( = ?auto_665032 ?auto_665039 ) ) ( not ( = ?auto_665031 ?auto_665039 ) ) ( not ( = ?auto_665030 ?auto_665039 ) ) ( not ( = ?auto_665029 ?auto_665039 ) ) ( not ( = ?auto_665028 ?auto_665039 ) ) ( not ( = ?auto_665027 ?auto_665039 ) ) ( not ( = ?auto_665026 ?auto_665039 ) ) ( not ( = ?auto_665025 ?auto_665039 ) ) ( not ( = ?auto_665024 ?auto_665039 ) ) ( not ( = ?auto_665023 ?auto_665039 ) ) ( not ( = ?auto_665022 ?auto_665039 ) ) ( ON ?auto_665023 ?auto_665022 ) ( ON ?auto_665024 ?auto_665023 ) ( ON ?auto_665025 ?auto_665024 ) ( ON ?auto_665026 ?auto_665025 ) ( ON ?auto_665027 ?auto_665026 ) ( ON ?auto_665028 ?auto_665027 ) ( ON ?auto_665029 ?auto_665028 ) ( ON ?auto_665030 ?auto_665029 ) ( ON ?auto_665031 ?auto_665030 ) ( ON ?auto_665032 ?auto_665031 ) ( ON ?auto_665033 ?auto_665032 ) ( ON ?auto_665034 ?auto_665033 ) ( ON ?auto_665035 ?auto_665034 ) ( ON ?auto_665036 ?auto_665035 ) ( ON ?auto_665037 ?auto_665036 ) ( ON ?auto_665038 ?auto_665037 ) ( CLEAR ?auto_665038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_665038 ?auto_665037 ?auto_665036 ?auto_665035 ?auto_665034 ?auto_665033 ?auto_665032 ?auto_665031 ?auto_665030 ?auto_665029 ?auto_665028 ?auto_665027 ?auto_665026 ?auto_665025 ?auto_665024 ?auto_665023 ?auto_665022 )
      ( MAKE-17PILE ?auto_665022 ?auto_665023 ?auto_665024 ?auto_665025 ?auto_665026 ?auto_665027 ?auto_665028 ?auto_665029 ?auto_665030 ?auto_665031 ?auto_665032 ?auto_665033 ?auto_665034 ?auto_665035 ?auto_665036 ?auto_665037 ?auto_665038 ) )
  )

)

