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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45685 - BLOCK
      ?auto_45686 - BLOCK
      ?auto_45687 - BLOCK
      ?auto_45688 - BLOCK
      ?auto_45689 - BLOCK
      ?auto_45690 - BLOCK
    )
    :vars
    (
      ?auto_45691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45691 ?auto_45690 ) ( CLEAR ?auto_45691 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45685 ) ( ON ?auto_45686 ?auto_45685 ) ( ON ?auto_45687 ?auto_45686 ) ( ON ?auto_45688 ?auto_45687 ) ( ON ?auto_45689 ?auto_45688 ) ( ON ?auto_45690 ?auto_45689 ) ( not ( = ?auto_45685 ?auto_45686 ) ) ( not ( = ?auto_45685 ?auto_45687 ) ) ( not ( = ?auto_45685 ?auto_45688 ) ) ( not ( = ?auto_45685 ?auto_45689 ) ) ( not ( = ?auto_45685 ?auto_45690 ) ) ( not ( = ?auto_45685 ?auto_45691 ) ) ( not ( = ?auto_45686 ?auto_45687 ) ) ( not ( = ?auto_45686 ?auto_45688 ) ) ( not ( = ?auto_45686 ?auto_45689 ) ) ( not ( = ?auto_45686 ?auto_45690 ) ) ( not ( = ?auto_45686 ?auto_45691 ) ) ( not ( = ?auto_45687 ?auto_45688 ) ) ( not ( = ?auto_45687 ?auto_45689 ) ) ( not ( = ?auto_45687 ?auto_45690 ) ) ( not ( = ?auto_45687 ?auto_45691 ) ) ( not ( = ?auto_45688 ?auto_45689 ) ) ( not ( = ?auto_45688 ?auto_45690 ) ) ( not ( = ?auto_45688 ?auto_45691 ) ) ( not ( = ?auto_45689 ?auto_45690 ) ) ( not ( = ?auto_45689 ?auto_45691 ) ) ( not ( = ?auto_45690 ?auto_45691 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45691 ?auto_45690 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45693 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_45693 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_45693 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45694 - BLOCK
    )
    :vars
    (
      ?auto_45695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45694 ?auto_45695 ) ( CLEAR ?auto_45694 ) ( HAND-EMPTY ) ( not ( = ?auto_45694 ?auto_45695 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45694 ?auto_45695 )
      ( MAKE-1PILE ?auto_45694 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45701 - BLOCK
      ?auto_45702 - BLOCK
      ?auto_45703 - BLOCK
      ?auto_45704 - BLOCK
      ?auto_45705 - BLOCK
    )
    :vars
    (
      ?auto_45706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45706 ?auto_45705 ) ( CLEAR ?auto_45706 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45701 ) ( ON ?auto_45702 ?auto_45701 ) ( ON ?auto_45703 ?auto_45702 ) ( ON ?auto_45704 ?auto_45703 ) ( ON ?auto_45705 ?auto_45704 ) ( not ( = ?auto_45701 ?auto_45702 ) ) ( not ( = ?auto_45701 ?auto_45703 ) ) ( not ( = ?auto_45701 ?auto_45704 ) ) ( not ( = ?auto_45701 ?auto_45705 ) ) ( not ( = ?auto_45701 ?auto_45706 ) ) ( not ( = ?auto_45702 ?auto_45703 ) ) ( not ( = ?auto_45702 ?auto_45704 ) ) ( not ( = ?auto_45702 ?auto_45705 ) ) ( not ( = ?auto_45702 ?auto_45706 ) ) ( not ( = ?auto_45703 ?auto_45704 ) ) ( not ( = ?auto_45703 ?auto_45705 ) ) ( not ( = ?auto_45703 ?auto_45706 ) ) ( not ( = ?auto_45704 ?auto_45705 ) ) ( not ( = ?auto_45704 ?auto_45706 ) ) ( not ( = ?auto_45705 ?auto_45706 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45706 ?auto_45705 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45707 - BLOCK
      ?auto_45708 - BLOCK
      ?auto_45709 - BLOCK
      ?auto_45710 - BLOCK
      ?auto_45711 - BLOCK
    )
    :vars
    (
      ?auto_45712 - BLOCK
      ?auto_45713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45712 ?auto_45711 ) ( CLEAR ?auto_45712 ) ( ON-TABLE ?auto_45707 ) ( ON ?auto_45708 ?auto_45707 ) ( ON ?auto_45709 ?auto_45708 ) ( ON ?auto_45710 ?auto_45709 ) ( ON ?auto_45711 ?auto_45710 ) ( not ( = ?auto_45707 ?auto_45708 ) ) ( not ( = ?auto_45707 ?auto_45709 ) ) ( not ( = ?auto_45707 ?auto_45710 ) ) ( not ( = ?auto_45707 ?auto_45711 ) ) ( not ( = ?auto_45707 ?auto_45712 ) ) ( not ( = ?auto_45708 ?auto_45709 ) ) ( not ( = ?auto_45708 ?auto_45710 ) ) ( not ( = ?auto_45708 ?auto_45711 ) ) ( not ( = ?auto_45708 ?auto_45712 ) ) ( not ( = ?auto_45709 ?auto_45710 ) ) ( not ( = ?auto_45709 ?auto_45711 ) ) ( not ( = ?auto_45709 ?auto_45712 ) ) ( not ( = ?auto_45710 ?auto_45711 ) ) ( not ( = ?auto_45710 ?auto_45712 ) ) ( not ( = ?auto_45711 ?auto_45712 ) ) ( HOLDING ?auto_45713 ) ( not ( = ?auto_45707 ?auto_45713 ) ) ( not ( = ?auto_45708 ?auto_45713 ) ) ( not ( = ?auto_45709 ?auto_45713 ) ) ( not ( = ?auto_45710 ?auto_45713 ) ) ( not ( = ?auto_45711 ?auto_45713 ) ) ( not ( = ?auto_45712 ?auto_45713 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_45713 )
      ( MAKE-5PILE ?auto_45707 ?auto_45708 ?auto_45709 ?auto_45710 ?auto_45711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45714 - BLOCK
      ?auto_45715 - BLOCK
      ?auto_45716 - BLOCK
      ?auto_45717 - BLOCK
      ?auto_45718 - BLOCK
    )
    :vars
    (
      ?auto_45720 - BLOCK
      ?auto_45719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45720 ?auto_45718 ) ( ON-TABLE ?auto_45714 ) ( ON ?auto_45715 ?auto_45714 ) ( ON ?auto_45716 ?auto_45715 ) ( ON ?auto_45717 ?auto_45716 ) ( ON ?auto_45718 ?auto_45717 ) ( not ( = ?auto_45714 ?auto_45715 ) ) ( not ( = ?auto_45714 ?auto_45716 ) ) ( not ( = ?auto_45714 ?auto_45717 ) ) ( not ( = ?auto_45714 ?auto_45718 ) ) ( not ( = ?auto_45714 ?auto_45720 ) ) ( not ( = ?auto_45715 ?auto_45716 ) ) ( not ( = ?auto_45715 ?auto_45717 ) ) ( not ( = ?auto_45715 ?auto_45718 ) ) ( not ( = ?auto_45715 ?auto_45720 ) ) ( not ( = ?auto_45716 ?auto_45717 ) ) ( not ( = ?auto_45716 ?auto_45718 ) ) ( not ( = ?auto_45716 ?auto_45720 ) ) ( not ( = ?auto_45717 ?auto_45718 ) ) ( not ( = ?auto_45717 ?auto_45720 ) ) ( not ( = ?auto_45718 ?auto_45720 ) ) ( not ( = ?auto_45714 ?auto_45719 ) ) ( not ( = ?auto_45715 ?auto_45719 ) ) ( not ( = ?auto_45716 ?auto_45719 ) ) ( not ( = ?auto_45717 ?auto_45719 ) ) ( not ( = ?auto_45718 ?auto_45719 ) ) ( not ( = ?auto_45720 ?auto_45719 ) ) ( ON ?auto_45719 ?auto_45720 ) ( CLEAR ?auto_45719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45714 ?auto_45715 ?auto_45716 ?auto_45717 ?auto_45718 ?auto_45720 )
      ( MAKE-5PILE ?auto_45714 ?auto_45715 ?auto_45716 ?auto_45717 ?auto_45718 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45723 - BLOCK
      ?auto_45724 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_45724 ) ( CLEAR ?auto_45723 ) ( ON-TABLE ?auto_45723 ) ( not ( = ?auto_45723 ?auto_45724 ) ) )
    :subtasks
    ( ( !STACK ?auto_45724 ?auto_45723 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45725 - BLOCK
      ?auto_45726 - BLOCK
    )
    :vars
    (
      ?auto_45727 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45725 ) ( ON-TABLE ?auto_45725 ) ( not ( = ?auto_45725 ?auto_45726 ) ) ( ON ?auto_45726 ?auto_45727 ) ( CLEAR ?auto_45726 ) ( HAND-EMPTY ) ( not ( = ?auto_45725 ?auto_45727 ) ) ( not ( = ?auto_45726 ?auto_45727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45726 ?auto_45727 )
      ( MAKE-2PILE ?auto_45725 ?auto_45726 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45728 - BLOCK
      ?auto_45729 - BLOCK
    )
    :vars
    (
      ?auto_45730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45728 ?auto_45729 ) ) ( ON ?auto_45729 ?auto_45730 ) ( CLEAR ?auto_45729 ) ( not ( = ?auto_45728 ?auto_45730 ) ) ( not ( = ?auto_45729 ?auto_45730 ) ) ( HOLDING ?auto_45728 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45728 )
      ( MAKE-2PILE ?auto_45728 ?auto_45729 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45731 - BLOCK
      ?auto_45732 - BLOCK
    )
    :vars
    (
      ?auto_45733 - BLOCK
      ?auto_45737 - BLOCK
      ?auto_45736 - BLOCK
      ?auto_45735 - BLOCK
      ?auto_45734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45731 ?auto_45732 ) ) ( ON ?auto_45732 ?auto_45733 ) ( not ( = ?auto_45731 ?auto_45733 ) ) ( not ( = ?auto_45732 ?auto_45733 ) ) ( ON ?auto_45731 ?auto_45732 ) ( CLEAR ?auto_45731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45737 ) ( ON ?auto_45736 ?auto_45737 ) ( ON ?auto_45735 ?auto_45736 ) ( ON ?auto_45734 ?auto_45735 ) ( ON ?auto_45733 ?auto_45734 ) ( not ( = ?auto_45737 ?auto_45736 ) ) ( not ( = ?auto_45737 ?auto_45735 ) ) ( not ( = ?auto_45737 ?auto_45734 ) ) ( not ( = ?auto_45737 ?auto_45733 ) ) ( not ( = ?auto_45737 ?auto_45732 ) ) ( not ( = ?auto_45737 ?auto_45731 ) ) ( not ( = ?auto_45736 ?auto_45735 ) ) ( not ( = ?auto_45736 ?auto_45734 ) ) ( not ( = ?auto_45736 ?auto_45733 ) ) ( not ( = ?auto_45736 ?auto_45732 ) ) ( not ( = ?auto_45736 ?auto_45731 ) ) ( not ( = ?auto_45735 ?auto_45734 ) ) ( not ( = ?auto_45735 ?auto_45733 ) ) ( not ( = ?auto_45735 ?auto_45732 ) ) ( not ( = ?auto_45735 ?auto_45731 ) ) ( not ( = ?auto_45734 ?auto_45733 ) ) ( not ( = ?auto_45734 ?auto_45732 ) ) ( not ( = ?auto_45734 ?auto_45731 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45737 ?auto_45736 ?auto_45735 ?auto_45734 ?auto_45733 ?auto_45732 )
      ( MAKE-2PILE ?auto_45731 ?auto_45732 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45742 - BLOCK
      ?auto_45743 - BLOCK
      ?auto_45744 - BLOCK
      ?auto_45745 - BLOCK
    )
    :vars
    (
      ?auto_45746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45746 ?auto_45745 ) ( CLEAR ?auto_45746 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45742 ) ( ON ?auto_45743 ?auto_45742 ) ( ON ?auto_45744 ?auto_45743 ) ( ON ?auto_45745 ?auto_45744 ) ( not ( = ?auto_45742 ?auto_45743 ) ) ( not ( = ?auto_45742 ?auto_45744 ) ) ( not ( = ?auto_45742 ?auto_45745 ) ) ( not ( = ?auto_45742 ?auto_45746 ) ) ( not ( = ?auto_45743 ?auto_45744 ) ) ( not ( = ?auto_45743 ?auto_45745 ) ) ( not ( = ?auto_45743 ?auto_45746 ) ) ( not ( = ?auto_45744 ?auto_45745 ) ) ( not ( = ?auto_45744 ?auto_45746 ) ) ( not ( = ?auto_45745 ?auto_45746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45746 ?auto_45745 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45747 - BLOCK
      ?auto_45748 - BLOCK
      ?auto_45749 - BLOCK
      ?auto_45750 - BLOCK
    )
    :vars
    (
      ?auto_45751 - BLOCK
      ?auto_45752 - BLOCK
      ?auto_45753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45751 ?auto_45750 ) ( CLEAR ?auto_45751 ) ( ON-TABLE ?auto_45747 ) ( ON ?auto_45748 ?auto_45747 ) ( ON ?auto_45749 ?auto_45748 ) ( ON ?auto_45750 ?auto_45749 ) ( not ( = ?auto_45747 ?auto_45748 ) ) ( not ( = ?auto_45747 ?auto_45749 ) ) ( not ( = ?auto_45747 ?auto_45750 ) ) ( not ( = ?auto_45747 ?auto_45751 ) ) ( not ( = ?auto_45748 ?auto_45749 ) ) ( not ( = ?auto_45748 ?auto_45750 ) ) ( not ( = ?auto_45748 ?auto_45751 ) ) ( not ( = ?auto_45749 ?auto_45750 ) ) ( not ( = ?auto_45749 ?auto_45751 ) ) ( not ( = ?auto_45750 ?auto_45751 ) ) ( HOLDING ?auto_45752 ) ( CLEAR ?auto_45753 ) ( not ( = ?auto_45747 ?auto_45752 ) ) ( not ( = ?auto_45747 ?auto_45753 ) ) ( not ( = ?auto_45748 ?auto_45752 ) ) ( not ( = ?auto_45748 ?auto_45753 ) ) ( not ( = ?auto_45749 ?auto_45752 ) ) ( not ( = ?auto_45749 ?auto_45753 ) ) ( not ( = ?auto_45750 ?auto_45752 ) ) ( not ( = ?auto_45750 ?auto_45753 ) ) ( not ( = ?auto_45751 ?auto_45752 ) ) ( not ( = ?auto_45751 ?auto_45753 ) ) ( not ( = ?auto_45752 ?auto_45753 ) ) )
    :subtasks
    ( ( !STACK ?auto_45752 ?auto_45753 )
      ( MAKE-4PILE ?auto_45747 ?auto_45748 ?auto_45749 ?auto_45750 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46353 - BLOCK
      ?auto_46354 - BLOCK
      ?auto_46355 - BLOCK
      ?auto_46356 - BLOCK
    )
    :vars
    (
      ?auto_46357 - BLOCK
      ?auto_46358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46357 ?auto_46356 ) ( ON-TABLE ?auto_46353 ) ( ON ?auto_46354 ?auto_46353 ) ( ON ?auto_46355 ?auto_46354 ) ( ON ?auto_46356 ?auto_46355 ) ( not ( = ?auto_46353 ?auto_46354 ) ) ( not ( = ?auto_46353 ?auto_46355 ) ) ( not ( = ?auto_46353 ?auto_46356 ) ) ( not ( = ?auto_46353 ?auto_46357 ) ) ( not ( = ?auto_46354 ?auto_46355 ) ) ( not ( = ?auto_46354 ?auto_46356 ) ) ( not ( = ?auto_46354 ?auto_46357 ) ) ( not ( = ?auto_46355 ?auto_46356 ) ) ( not ( = ?auto_46355 ?auto_46357 ) ) ( not ( = ?auto_46356 ?auto_46357 ) ) ( not ( = ?auto_46353 ?auto_46358 ) ) ( not ( = ?auto_46354 ?auto_46358 ) ) ( not ( = ?auto_46355 ?auto_46358 ) ) ( not ( = ?auto_46356 ?auto_46358 ) ) ( not ( = ?auto_46357 ?auto_46358 ) ) ( ON ?auto_46358 ?auto_46357 ) ( CLEAR ?auto_46358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46353 ?auto_46354 ?auto_46355 ?auto_46356 ?auto_46357 )
      ( MAKE-4PILE ?auto_46353 ?auto_46354 ?auto_46355 ?auto_46356 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45761 - BLOCK
      ?auto_45762 - BLOCK
      ?auto_45763 - BLOCK
      ?auto_45764 - BLOCK
    )
    :vars
    (
      ?auto_45765 - BLOCK
      ?auto_45766 - BLOCK
      ?auto_45767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45765 ?auto_45764 ) ( ON-TABLE ?auto_45761 ) ( ON ?auto_45762 ?auto_45761 ) ( ON ?auto_45763 ?auto_45762 ) ( ON ?auto_45764 ?auto_45763 ) ( not ( = ?auto_45761 ?auto_45762 ) ) ( not ( = ?auto_45761 ?auto_45763 ) ) ( not ( = ?auto_45761 ?auto_45764 ) ) ( not ( = ?auto_45761 ?auto_45765 ) ) ( not ( = ?auto_45762 ?auto_45763 ) ) ( not ( = ?auto_45762 ?auto_45764 ) ) ( not ( = ?auto_45762 ?auto_45765 ) ) ( not ( = ?auto_45763 ?auto_45764 ) ) ( not ( = ?auto_45763 ?auto_45765 ) ) ( not ( = ?auto_45764 ?auto_45765 ) ) ( not ( = ?auto_45761 ?auto_45766 ) ) ( not ( = ?auto_45761 ?auto_45767 ) ) ( not ( = ?auto_45762 ?auto_45766 ) ) ( not ( = ?auto_45762 ?auto_45767 ) ) ( not ( = ?auto_45763 ?auto_45766 ) ) ( not ( = ?auto_45763 ?auto_45767 ) ) ( not ( = ?auto_45764 ?auto_45766 ) ) ( not ( = ?auto_45764 ?auto_45767 ) ) ( not ( = ?auto_45765 ?auto_45766 ) ) ( not ( = ?auto_45765 ?auto_45767 ) ) ( not ( = ?auto_45766 ?auto_45767 ) ) ( ON ?auto_45766 ?auto_45765 ) ( CLEAR ?auto_45766 ) ( HOLDING ?auto_45767 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45767 )
      ( MAKE-4PILE ?auto_45761 ?auto_45762 ?auto_45763 ?auto_45764 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45768 - BLOCK
      ?auto_45769 - BLOCK
      ?auto_45770 - BLOCK
      ?auto_45771 - BLOCK
    )
    :vars
    (
      ?auto_45773 - BLOCK
      ?auto_45772 - BLOCK
      ?auto_45774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45773 ?auto_45771 ) ( ON-TABLE ?auto_45768 ) ( ON ?auto_45769 ?auto_45768 ) ( ON ?auto_45770 ?auto_45769 ) ( ON ?auto_45771 ?auto_45770 ) ( not ( = ?auto_45768 ?auto_45769 ) ) ( not ( = ?auto_45768 ?auto_45770 ) ) ( not ( = ?auto_45768 ?auto_45771 ) ) ( not ( = ?auto_45768 ?auto_45773 ) ) ( not ( = ?auto_45769 ?auto_45770 ) ) ( not ( = ?auto_45769 ?auto_45771 ) ) ( not ( = ?auto_45769 ?auto_45773 ) ) ( not ( = ?auto_45770 ?auto_45771 ) ) ( not ( = ?auto_45770 ?auto_45773 ) ) ( not ( = ?auto_45771 ?auto_45773 ) ) ( not ( = ?auto_45768 ?auto_45772 ) ) ( not ( = ?auto_45768 ?auto_45774 ) ) ( not ( = ?auto_45769 ?auto_45772 ) ) ( not ( = ?auto_45769 ?auto_45774 ) ) ( not ( = ?auto_45770 ?auto_45772 ) ) ( not ( = ?auto_45770 ?auto_45774 ) ) ( not ( = ?auto_45771 ?auto_45772 ) ) ( not ( = ?auto_45771 ?auto_45774 ) ) ( not ( = ?auto_45773 ?auto_45772 ) ) ( not ( = ?auto_45773 ?auto_45774 ) ) ( not ( = ?auto_45772 ?auto_45774 ) ) ( ON ?auto_45772 ?auto_45773 ) ( ON ?auto_45774 ?auto_45772 ) ( CLEAR ?auto_45774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45768 ?auto_45769 ?auto_45770 ?auto_45771 ?auto_45773 ?auto_45772 )
      ( MAKE-4PILE ?auto_45768 ?auto_45769 ?auto_45770 ?auto_45771 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45778 - BLOCK
      ?auto_45779 - BLOCK
      ?auto_45780 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_45780 ) ( CLEAR ?auto_45779 ) ( ON-TABLE ?auto_45778 ) ( ON ?auto_45779 ?auto_45778 ) ( not ( = ?auto_45778 ?auto_45779 ) ) ( not ( = ?auto_45778 ?auto_45780 ) ) ( not ( = ?auto_45779 ?auto_45780 ) ) )
    :subtasks
    ( ( !STACK ?auto_45780 ?auto_45779 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45781 - BLOCK
      ?auto_45782 - BLOCK
      ?auto_45783 - BLOCK
    )
    :vars
    (
      ?auto_45784 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45782 ) ( ON-TABLE ?auto_45781 ) ( ON ?auto_45782 ?auto_45781 ) ( not ( = ?auto_45781 ?auto_45782 ) ) ( not ( = ?auto_45781 ?auto_45783 ) ) ( not ( = ?auto_45782 ?auto_45783 ) ) ( ON ?auto_45783 ?auto_45784 ) ( CLEAR ?auto_45783 ) ( HAND-EMPTY ) ( not ( = ?auto_45781 ?auto_45784 ) ) ( not ( = ?auto_45782 ?auto_45784 ) ) ( not ( = ?auto_45783 ?auto_45784 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45783 ?auto_45784 )
      ( MAKE-3PILE ?auto_45781 ?auto_45782 ?auto_45783 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45785 - BLOCK
      ?auto_45786 - BLOCK
      ?auto_45787 - BLOCK
    )
    :vars
    (
      ?auto_45788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45785 ) ( not ( = ?auto_45785 ?auto_45786 ) ) ( not ( = ?auto_45785 ?auto_45787 ) ) ( not ( = ?auto_45786 ?auto_45787 ) ) ( ON ?auto_45787 ?auto_45788 ) ( CLEAR ?auto_45787 ) ( not ( = ?auto_45785 ?auto_45788 ) ) ( not ( = ?auto_45786 ?auto_45788 ) ) ( not ( = ?auto_45787 ?auto_45788 ) ) ( HOLDING ?auto_45786 ) ( CLEAR ?auto_45785 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45785 ?auto_45786 )
      ( MAKE-3PILE ?auto_45785 ?auto_45786 ?auto_45787 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45789 - BLOCK
      ?auto_45790 - BLOCK
      ?auto_45791 - BLOCK
    )
    :vars
    (
      ?auto_45792 - BLOCK
      ?auto_45795 - BLOCK
      ?auto_45794 - BLOCK
      ?auto_45793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45789 ) ( not ( = ?auto_45789 ?auto_45790 ) ) ( not ( = ?auto_45789 ?auto_45791 ) ) ( not ( = ?auto_45790 ?auto_45791 ) ) ( ON ?auto_45791 ?auto_45792 ) ( not ( = ?auto_45789 ?auto_45792 ) ) ( not ( = ?auto_45790 ?auto_45792 ) ) ( not ( = ?auto_45791 ?auto_45792 ) ) ( CLEAR ?auto_45789 ) ( ON ?auto_45790 ?auto_45791 ) ( CLEAR ?auto_45790 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45795 ) ( ON ?auto_45794 ?auto_45795 ) ( ON ?auto_45793 ?auto_45794 ) ( ON ?auto_45792 ?auto_45793 ) ( not ( = ?auto_45795 ?auto_45794 ) ) ( not ( = ?auto_45795 ?auto_45793 ) ) ( not ( = ?auto_45795 ?auto_45792 ) ) ( not ( = ?auto_45795 ?auto_45791 ) ) ( not ( = ?auto_45795 ?auto_45790 ) ) ( not ( = ?auto_45794 ?auto_45793 ) ) ( not ( = ?auto_45794 ?auto_45792 ) ) ( not ( = ?auto_45794 ?auto_45791 ) ) ( not ( = ?auto_45794 ?auto_45790 ) ) ( not ( = ?auto_45793 ?auto_45792 ) ) ( not ( = ?auto_45793 ?auto_45791 ) ) ( not ( = ?auto_45793 ?auto_45790 ) ) ( not ( = ?auto_45789 ?auto_45795 ) ) ( not ( = ?auto_45789 ?auto_45794 ) ) ( not ( = ?auto_45789 ?auto_45793 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45795 ?auto_45794 ?auto_45793 ?auto_45792 ?auto_45791 )
      ( MAKE-3PILE ?auto_45789 ?auto_45790 ?auto_45791 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45796 - BLOCK
      ?auto_45797 - BLOCK
      ?auto_45798 - BLOCK
    )
    :vars
    (
      ?auto_45799 - BLOCK
      ?auto_45801 - BLOCK
      ?auto_45800 - BLOCK
      ?auto_45802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45796 ?auto_45797 ) ) ( not ( = ?auto_45796 ?auto_45798 ) ) ( not ( = ?auto_45797 ?auto_45798 ) ) ( ON ?auto_45798 ?auto_45799 ) ( not ( = ?auto_45796 ?auto_45799 ) ) ( not ( = ?auto_45797 ?auto_45799 ) ) ( not ( = ?auto_45798 ?auto_45799 ) ) ( ON ?auto_45797 ?auto_45798 ) ( CLEAR ?auto_45797 ) ( ON-TABLE ?auto_45801 ) ( ON ?auto_45800 ?auto_45801 ) ( ON ?auto_45802 ?auto_45800 ) ( ON ?auto_45799 ?auto_45802 ) ( not ( = ?auto_45801 ?auto_45800 ) ) ( not ( = ?auto_45801 ?auto_45802 ) ) ( not ( = ?auto_45801 ?auto_45799 ) ) ( not ( = ?auto_45801 ?auto_45798 ) ) ( not ( = ?auto_45801 ?auto_45797 ) ) ( not ( = ?auto_45800 ?auto_45802 ) ) ( not ( = ?auto_45800 ?auto_45799 ) ) ( not ( = ?auto_45800 ?auto_45798 ) ) ( not ( = ?auto_45800 ?auto_45797 ) ) ( not ( = ?auto_45802 ?auto_45799 ) ) ( not ( = ?auto_45802 ?auto_45798 ) ) ( not ( = ?auto_45802 ?auto_45797 ) ) ( not ( = ?auto_45796 ?auto_45801 ) ) ( not ( = ?auto_45796 ?auto_45800 ) ) ( not ( = ?auto_45796 ?auto_45802 ) ) ( HOLDING ?auto_45796 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45796 )
      ( MAKE-3PILE ?auto_45796 ?auto_45797 ?auto_45798 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45803 - BLOCK
      ?auto_45804 - BLOCK
      ?auto_45805 - BLOCK
    )
    :vars
    (
      ?auto_45809 - BLOCK
      ?auto_45806 - BLOCK
      ?auto_45808 - BLOCK
      ?auto_45807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45803 ?auto_45804 ) ) ( not ( = ?auto_45803 ?auto_45805 ) ) ( not ( = ?auto_45804 ?auto_45805 ) ) ( ON ?auto_45805 ?auto_45809 ) ( not ( = ?auto_45803 ?auto_45809 ) ) ( not ( = ?auto_45804 ?auto_45809 ) ) ( not ( = ?auto_45805 ?auto_45809 ) ) ( ON ?auto_45804 ?auto_45805 ) ( ON-TABLE ?auto_45806 ) ( ON ?auto_45808 ?auto_45806 ) ( ON ?auto_45807 ?auto_45808 ) ( ON ?auto_45809 ?auto_45807 ) ( not ( = ?auto_45806 ?auto_45808 ) ) ( not ( = ?auto_45806 ?auto_45807 ) ) ( not ( = ?auto_45806 ?auto_45809 ) ) ( not ( = ?auto_45806 ?auto_45805 ) ) ( not ( = ?auto_45806 ?auto_45804 ) ) ( not ( = ?auto_45808 ?auto_45807 ) ) ( not ( = ?auto_45808 ?auto_45809 ) ) ( not ( = ?auto_45808 ?auto_45805 ) ) ( not ( = ?auto_45808 ?auto_45804 ) ) ( not ( = ?auto_45807 ?auto_45809 ) ) ( not ( = ?auto_45807 ?auto_45805 ) ) ( not ( = ?auto_45807 ?auto_45804 ) ) ( not ( = ?auto_45803 ?auto_45806 ) ) ( not ( = ?auto_45803 ?auto_45808 ) ) ( not ( = ?auto_45803 ?auto_45807 ) ) ( ON ?auto_45803 ?auto_45804 ) ( CLEAR ?auto_45803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45806 ?auto_45808 ?auto_45807 ?auto_45809 ?auto_45805 ?auto_45804 )
      ( MAKE-3PILE ?auto_45803 ?auto_45804 ?auto_45805 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45813 - BLOCK
      ?auto_45814 - BLOCK
      ?auto_45815 - BLOCK
    )
    :vars
    (
      ?auto_45816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45816 ?auto_45815 ) ( CLEAR ?auto_45816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45813 ) ( ON ?auto_45814 ?auto_45813 ) ( ON ?auto_45815 ?auto_45814 ) ( not ( = ?auto_45813 ?auto_45814 ) ) ( not ( = ?auto_45813 ?auto_45815 ) ) ( not ( = ?auto_45813 ?auto_45816 ) ) ( not ( = ?auto_45814 ?auto_45815 ) ) ( not ( = ?auto_45814 ?auto_45816 ) ) ( not ( = ?auto_45815 ?auto_45816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45816 ?auto_45815 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45817 - BLOCK
      ?auto_45818 - BLOCK
      ?auto_45819 - BLOCK
    )
    :vars
    (
      ?auto_45820 - BLOCK
      ?auto_45821 - BLOCK
      ?auto_45822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45820 ?auto_45819 ) ( CLEAR ?auto_45820 ) ( ON-TABLE ?auto_45817 ) ( ON ?auto_45818 ?auto_45817 ) ( ON ?auto_45819 ?auto_45818 ) ( not ( = ?auto_45817 ?auto_45818 ) ) ( not ( = ?auto_45817 ?auto_45819 ) ) ( not ( = ?auto_45817 ?auto_45820 ) ) ( not ( = ?auto_45818 ?auto_45819 ) ) ( not ( = ?auto_45818 ?auto_45820 ) ) ( not ( = ?auto_45819 ?auto_45820 ) ) ( HOLDING ?auto_45821 ) ( CLEAR ?auto_45822 ) ( not ( = ?auto_45817 ?auto_45821 ) ) ( not ( = ?auto_45817 ?auto_45822 ) ) ( not ( = ?auto_45818 ?auto_45821 ) ) ( not ( = ?auto_45818 ?auto_45822 ) ) ( not ( = ?auto_45819 ?auto_45821 ) ) ( not ( = ?auto_45819 ?auto_45822 ) ) ( not ( = ?auto_45820 ?auto_45821 ) ) ( not ( = ?auto_45820 ?auto_45822 ) ) ( not ( = ?auto_45821 ?auto_45822 ) ) )
    :subtasks
    ( ( !STACK ?auto_45821 ?auto_45822 )
      ( MAKE-3PILE ?auto_45817 ?auto_45818 ?auto_45819 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45823 - BLOCK
      ?auto_45824 - BLOCK
      ?auto_45825 - BLOCK
    )
    :vars
    (
      ?auto_45826 - BLOCK
      ?auto_45827 - BLOCK
      ?auto_45828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45826 ?auto_45825 ) ( ON-TABLE ?auto_45823 ) ( ON ?auto_45824 ?auto_45823 ) ( ON ?auto_45825 ?auto_45824 ) ( not ( = ?auto_45823 ?auto_45824 ) ) ( not ( = ?auto_45823 ?auto_45825 ) ) ( not ( = ?auto_45823 ?auto_45826 ) ) ( not ( = ?auto_45824 ?auto_45825 ) ) ( not ( = ?auto_45824 ?auto_45826 ) ) ( not ( = ?auto_45825 ?auto_45826 ) ) ( CLEAR ?auto_45827 ) ( not ( = ?auto_45823 ?auto_45828 ) ) ( not ( = ?auto_45823 ?auto_45827 ) ) ( not ( = ?auto_45824 ?auto_45828 ) ) ( not ( = ?auto_45824 ?auto_45827 ) ) ( not ( = ?auto_45825 ?auto_45828 ) ) ( not ( = ?auto_45825 ?auto_45827 ) ) ( not ( = ?auto_45826 ?auto_45828 ) ) ( not ( = ?auto_45826 ?auto_45827 ) ) ( not ( = ?auto_45828 ?auto_45827 ) ) ( ON ?auto_45828 ?auto_45826 ) ( CLEAR ?auto_45828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45823 ?auto_45824 ?auto_45825 ?auto_45826 )
      ( MAKE-3PILE ?auto_45823 ?auto_45824 ?auto_45825 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45829 - BLOCK
      ?auto_45830 - BLOCK
      ?auto_45831 - BLOCK
    )
    :vars
    (
      ?auto_45833 - BLOCK
      ?auto_45832 - BLOCK
      ?auto_45834 - BLOCK
      ?auto_45835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45833 ?auto_45831 ) ( ON-TABLE ?auto_45829 ) ( ON ?auto_45830 ?auto_45829 ) ( ON ?auto_45831 ?auto_45830 ) ( not ( = ?auto_45829 ?auto_45830 ) ) ( not ( = ?auto_45829 ?auto_45831 ) ) ( not ( = ?auto_45829 ?auto_45833 ) ) ( not ( = ?auto_45830 ?auto_45831 ) ) ( not ( = ?auto_45830 ?auto_45833 ) ) ( not ( = ?auto_45831 ?auto_45833 ) ) ( not ( = ?auto_45829 ?auto_45832 ) ) ( not ( = ?auto_45829 ?auto_45834 ) ) ( not ( = ?auto_45830 ?auto_45832 ) ) ( not ( = ?auto_45830 ?auto_45834 ) ) ( not ( = ?auto_45831 ?auto_45832 ) ) ( not ( = ?auto_45831 ?auto_45834 ) ) ( not ( = ?auto_45833 ?auto_45832 ) ) ( not ( = ?auto_45833 ?auto_45834 ) ) ( not ( = ?auto_45832 ?auto_45834 ) ) ( ON ?auto_45832 ?auto_45833 ) ( CLEAR ?auto_45832 ) ( HOLDING ?auto_45834 ) ( CLEAR ?auto_45835 ) ( ON-TABLE ?auto_45835 ) ( not ( = ?auto_45835 ?auto_45834 ) ) ( not ( = ?auto_45829 ?auto_45835 ) ) ( not ( = ?auto_45830 ?auto_45835 ) ) ( not ( = ?auto_45831 ?auto_45835 ) ) ( not ( = ?auto_45833 ?auto_45835 ) ) ( not ( = ?auto_45832 ?auto_45835 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45835 ?auto_45834 )
      ( MAKE-3PILE ?auto_45829 ?auto_45830 ?auto_45831 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46527 - BLOCK
      ?auto_46528 - BLOCK
      ?auto_46529 - BLOCK
    )
    :vars
    (
      ?auto_46530 - BLOCK
      ?auto_46532 - BLOCK
      ?auto_46531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46530 ?auto_46529 ) ( ON-TABLE ?auto_46527 ) ( ON ?auto_46528 ?auto_46527 ) ( ON ?auto_46529 ?auto_46528 ) ( not ( = ?auto_46527 ?auto_46528 ) ) ( not ( = ?auto_46527 ?auto_46529 ) ) ( not ( = ?auto_46527 ?auto_46530 ) ) ( not ( = ?auto_46528 ?auto_46529 ) ) ( not ( = ?auto_46528 ?auto_46530 ) ) ( not ( = ?auto_46529 ?auto_46530 ) ) ( not ( = ?auto_46527 ?auto_46532 ) ) ( not ( = ?auto_46527 ?auto_46531 ) ) ( not ( = ?auto_46528 ?auto_46532 ) ) ( not ( = ?auto_46528 ?auto_46531 ) ) ( not ( = ?auto_46529 ?auto_46532 ) ) ( not ( = ?auto_46529 ?auto_46531 ) ) ( not ( = ?auto_46530 ?auto_46532 ) ) ( not ( = ?auto_46530 ?auto_46531 ) ) ( not ( = ?auto_46532 ?auto_46531 ) ) ( ON ?auto_46532 ?auto_46530 ) ( ON ?auto_46531 ?auto_46532 ) ( CLEAR ?auto_46531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46527 ?auto_46528 ?auto_46529 ?auto_46530 ?auto_46532 )
      ( MAKE-3PILE ?auto_46527 ?auto_46528 ?auto_46529 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45843 - BLOCK
      ?auto_45844 - BLOCK
      ?auto_45845 - BLOCK
    )
    :vars
    (
      ?auto_45846 - BLOCK
      ?auto_45848 - BLOCK
      ?auto_45849 - BLOCK
      ?auto_45847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45846 ?auto_45845 ) ( ON-TABLE ?auto_45843 ) ( ON ?auto_45844 ?auto_45843 ) ( ON ?auto_45845 ?auto_45844 ) ( not ( = ?auto_45843 ?auto_45844 ) ) ( not ( = ?auto_45843 ?auto_45845 ) ) ( not ( = ?auto_45843 ?auto_45846 ) ) ( not ( = ?auto_45844 ?auto_45845 ) ) ( not ( = ?auto_45844 ?auto_45846 ) ) ( not ( = ?auto_45845 ?auto_45846 ) ) ( not ( = ?auto_45843 ?auto_45848 ) ) ( not ( = ?auto_45843 ?auto_45849 ) ) ( not ( = ?auto_45844 ?auto_45848 ) ) ( not ( = ?auto_45844 ?auto_45849 ) ) ( not ( = ?auto_45845 ?auto_45848 ) ) ( not ( = ?auto_45845 ?auto_45849 ) ) ( not ( = ?auto_45846 ?auto_45848 ) ) ( not ( = ?auto_45846 ?auto_45849 ) ) ( not ( = ?auto_45848 ?auto_45849 ) ) ( ON ?auto_45848 ?auto_45846 ) ( not ( = ?auto_45847 ?auto_45849 ) ) ( not ( = ?auto_45843 ?auto_45847 ) ) ( not ( = ?auto_45844 ?auto_45847 ) ) ( not ( = ?auto_45845 ?auto_45847 ) ) ( not ( = ?auto_45846 ?auto_45847 ) ) ( not ( = ?auto_45848 ?auto_45847 ) ) ( ON ?auto_45849 ?auto_45848 ) ( CLEAR ?auto_45849 ) ( HOLDING ?auto_45847 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45847 )
      ( MAKE-3PILE ?auto_45843 ?auto_45844 ?auto_45845 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45850 - BLOCK
      ?auto_45851 - BLOCK
      ?auto_45852 - BLOCK
    )
    :vars
    (
      ?auto_45855 - BLOCK
      ?auto_45853 - BLOCK
      ?auto_45854 - BLOCK
      ?auto_45856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45855 ?auto_45852 ) ( ON-TABLE ?auto_45850 ) ( ON ?auto_45851 ?auto_45850 ) ( ON ?auto_45852 ?auto_45851 ) ( not ( = ?auto_45850 ?auto_45851 ) ) ( not ( = ?auto_45850 ?auto_45852 ) ) ( not ( = ?auto_45850 ?auto_45855 ) ) ( not ( = ?auto_45851 ?auto_45852 ) ) ( not ( = ?auto_45851 ?auto_45855 ) ) ( not ( = ?auto_45852 ?auto_45855 ) ) ( not ( = ?auto_45850 ?auto_45853 ) ) ( not ( = ?auto_45850 ?auto_45854 ) ) ( not ( = ?auto_45851 ?auto_45853 ) ) ( not ( = ?auto_45851 ?auto_45854 ) ) ( not ( = ?auto_45852 ?auto_45853 ) ) ( not ( = ?auto_45852 ?auto_45854 ) ) ( not ( = ?auto_45855 ?auto_45853 ) ) ( not ( = ?auto_45855 ?auto_45854 ) ) ( not ( = ?auto_45853 ?auto_45854 ) ) ( ON ?auto_45853 ?auto_45855 ) ( not ( = ?auto_45856 ?auto_45854 ) ) ( not ( = ?auto_45850 ?auto_45856 ) ) ( not ( = ?auto_45851 ?auto_45856 ) ) ( not ( = ?auto_45852 ?auto_45856 ) ) ( not ( = ?auto_45855 ?auto_45856 ) ) ( not ( = ?auto_45853 ?auto_45856 ) ) ( ON ?auto_45854 ?auto_45853 ) ( ON ?auto_45856 ?auto_45854 ) ( CLEAR ?auto_45856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45850 ?auto_45851 ?auto_45852 ?auto_45855 ?auto_45853 ?auto_45854 )
      ( MAKE-3PILE ?auto_45850 ?auto_45851 ?auto_45852 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45861 - BLOCK
      ?auto_45862 - BLOCK
      ?auto_45863 - BLOCK
      ?auto_45864 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_45864 ) ( CLEAR ?auto_45863 ) ( ON-TABLE ?auto_45861 ) ( ON ?auto_45862 ?auto_45861 ) ( ON ?auto_45863 ?auto_45862 ) ( not ( = ?auto_45861 ?auto_45862 ) ) ( not ( = ?auto_45861 ?auto_45863 ) ) ( not ( = ?auto_45861 ?auto_45864 ) ) ( not ( = ?auto_45862 ?auto_45863 ) ) ( not ( = ?auto_45862 ?auto_45864 ) ) ( not ( = ?auto_45863 ?auto_45864 ) ) )
    :subtasks
    ( ( !STACK ?auto_45864 ?auto_45863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45865 - BLOCK
      ?auto_45866 - BLOCK
      ?auto_45867 - BLOCK
      ?auto_45868 - BLOCK
    )
    :vars
    (
      ?auto_45869 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45867 ) ( ON-TABLE ?auto_45865 ) ( ON ?auto_45866 ?auto_45865 ) ( ON ?auto_45867 ?auto_45866 ) ( not ( = ?auto_45865 ?auto_45866 ) ) ( not ( = ?auto_45865 ?auto_45867 ) ) ( not ( = ?auto_45865 ?auto_45868 ) ) ( not ( = ?auto_45866 ?auto_45867 ) ) ( not ( = ?auto_45866 ?auto_45868 ) ) ( not ( = ?auto_45867 ?auto_45868 ) ) ( ON ?auto_45868 ?auto_45869 ) ( CLEAR ?auto_45868 ) ( HAND-EMPTY ) ( not ( = ?auto_45865 ?auto_45869 ) ) ( not ( = ?auto_45866 ?auto_45869 ) ) ( not ( = ?auto_45867 ?auto_45869 ) ) ( not ( = ?auto_45868 ?auto_45869 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45868 ?auto_45869 )
      ( MAKE-4PILE ?auto_45865 ?auto_45866 ?auto_45867 ?auto_45868 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45870 - BLOCK
      ?auto_45871 - BLOCK
      ?auto_45872 - BLOCK
      ?auto_45873 - BLOCK
    )
    :vars
    (
      ?auto_45874 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45870 ) ( ON ?auto_45871 ?auto_45870 ) ( not ( = ?auto_45870 ?auto_45871 ) ) ( not ( = ?auto_45870 ?auto_45872 ) ) ( not ( = ?auto_45870 ?auto_45873 ) ) ( not ( = ?auto_45871 ?auto_45872 ) ) ( not ( = ?auto_45871 ?auto_45873 ) ) ( not ( = ?auto_45872 ?auto_45873 ) ) ( ON ?auto_45873 ?auto_45874 ) ( CLEAR ?auto_45873 ) ( not ( = ?auto_45870 ?auto_45874 ) ) ( not ( = ?auto_45871 ?auto_45874 ) ) ( not ( = ?auto_45872 ?auto_45874 ) ) ( not ( = ?auto_45873 ?auto_45874 ) ) ( HOLDING ?auto_45872 ) ( CLEAR ?auto_45871 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45870 ?auto_45871 ?auto_45872 )
      ( MAKE-4PILE ?auto_45870 ?auto_45871 ?auto_45872 ?auto_45873 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45875 - BLOCK
      ?auto_45876 - BLOCK
      ?auto_45877 - BLOCK
      ?auto_45878 - BLOCK
    )
    :vars
    (
      ?auto_45879 - BLOCK
      ?auto_45880 - BLOCK
      ?auto_45881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45875 ) ( ON ?auto_45876 ?auto_45875 ) ( not ( = ?auto_45875 ?auto_45876 ) ) ( not ( = ?auto_45875 ?auto_45877 ) ) ( not ( = ?auto_45875 ?auto_45878 ) ) ( not ( = ?auto_45876 ?auto_45877 ) ) ( not ( = ?auto_45876 ?auto_45878 ) ) ( not ( = ?auto_45877 ?auto_45878 ) ) ( ON ?auto_45878 ?auto_45879 ) ( not ( = ?auto_45875 ?auto_45879 ) ) ( not ( = ?auto_45876 ?auto_45879 ) ) ( not ( = ?auto_45877 ?auto_45879 ) ) ( not ( = ?auto_45878 ?auto_45879 ) ) ( CLEAR ?auto_45876 ) ( ON ?auto_45877 ?auto_45878 ) ( CLEAR ?auto_45877 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45880 ) ( ON ?auto_45881 ?auto_45880 ) ( ON ?auto_45879 ?auto_45881 ) ( not ( = ?auto_45880 ?auto_45881 ) ) ( not ( = ?auto_45880 ?auto_45879 ) ) ( not ( = ?auto_45880 ?auto_45878 ) ) ( not ( = ?auto_45880 ?auto_45877 ) ) ( not ( = ?auto_45881 ?auto_45879 ) ) ( not ( = ?auto_45881 ?auto_45878 ) ) ( not ( = ?auto_45881 ?auto_45877 ) ) ( not ( = ?auto_45875 ?auto_45880 ) ) ( not ( = ?auto_45875 ?auto_45881 ) ) ( not ( = ?auto_45876 ?auto_45880 ) ) ( not ( = ?auto_45876 ?auto_45881 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45880 ?auto_45881 ?auto_45879 ?auto_45878 )
      ( MAKE-4PILE ?auto_45875 ?auto_45876 ?auto_45877 ?auto_45878 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45882 - BLOCK
      ?auto_45883 - BLOCK
      ?auto_45884 - BLOCK
      ?auto_45885 - BLOCK
    )
    :vars
    (
      ?auto_45887 - BLOCK
      ?auto_45886 - BLOCK
      ?auto_45888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45882 ) ( not ( = ?auto_45882 ?auto_45883 ) ) ( not ( = ?auto_45882 ?auto_45884 ) ) ( not ( = ?auto_45882 ?auto_45885 ) ) ( not ( = ?auto_45883 ?auto_45884 ) ) ( not ( = ?auto_45883 ?auto_45885 ) ) ( not ( = ?auto_45884 ?auto_45885 ) ) ( ON ?auto_45885 ?auto_45887 ) ( not ( = ?auto_45882 ?auto_45887 ) ) ( not ( = ?auto_45883 ?auto_45887 ) ) ( not ( = ?auto_45884 ?auto_45887 ) ) ( not ( = ?auto_45885 ?auto_45887 ) ) ( ON ?auto_45884 ?auto_45885 ) ( CLEAR ?auto_45884 ) ( ON-TABLE ?auto_45886 ) ( ON ?auto_45888 ?auto_45886 ) ( ON ?auto_45887 ?auto_45888 ) ( not ( = ?auto_45886 ?auto_45888 ) ) ( not ( = ?auto_45886 ?auto_45887 ) ) ( not ( = ?auto_45886 ?auto_45885 ) ) ( not ( = ?auto_45886 ?auto_45884 ) ) ( not ( = ?auto_45888 ?auto_45887 ) ) ( not ( = ?auto_45888 ?auto_45885 ) ) ( not ( = ?auto_45888 ?auto_45884 ) ) ( not ( = ?auto_45882 ?auto_45886 ) ) ( not ( = ?auto_45882 ?auto_45888 ) ) ( not ( = ?auto_45883 ?auto_45886 ) ) ( not ( = ?auto_45883 ?auto_45888 ) ) ( HOLDING ?auto_45883 ) ( CLEAR ?auto_45882 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45882 ?auto_45883 )
      ( MAKE-4PILE ?auto_45882 ?auto_45883 ?auto_45884 ?auto_45885 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45889 - BLOCK
      ?auto_45890 - BLOCK
      ?auto_45891 - BLOCK
      ?auto_45892 - BLOCK
    )
    :vars
    (
      ?auto_45894 - BLOCK
      ?auto_45895 - BLOCK
      ?auto_45893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45889 ) ( not ( = ?auto_45889 ?auto_45890 ) ) ( not ( = ?auto_45889 ?auto_45891 ) ) ( not ( = ?auto_45889 ?auto_45892 ) ) ( not ( = ?auto_45890 ?auto_45891 ) ) ( not ( = ?auto_45890 ?auto_45892 ) ) ( not ( = ?auto_45891 ?auto_45892 ) ) ( ON ?auto_45892 ?auto_45894 ) ( not ( = ?auto_45889 ?auto_45894 ) ) ( not ( = ?auto_45890 ?auto_45894 ) ) ( not ( = ?auto_45891 ?auto_45894 ) ) ( not ( = ?auto_45892 ?auto_45894 ) ) ( ON ?auto_45891 ?auto_45892 ) ( ON-TABLE ?auto_45895 ) ( ON ?auto_45893 ?auto_45895 ) ( ON ?auto_45894 ?auto_45893 ) ( not ( = ?auto_45895 ?auto_45893 ) ) ( not ( = ?auto_45895 ?auto_45894 ) ) ( not ( = ?auto_45895 ?auto_45892 ) ) ( not ( = ?auto_45895 ?auto_45891 ) ) ( not ( = ?auto_45893 ?auto_45894 ) ) ( not ( = ?auto_45893 ?auto_45892 ) ) ( not ( = ?auto_45893 ?auto_45891 ) ) ( not ( = ?auto_45889 ?auto_45895 ) ) ( not ( = ?auto_45889 ?auto_45893 ) ) ( not ( = ?auto_45890 ?auto_45895 ) ) ( not ( = ?auto_45890 ?auto_45893 ) ) ( CLEAR ?auto_45889 ) ( ON ?auto_45890 ?auto_45891 ) ( CLEAR ?auto_45890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45895 ?auto_45893 ?auto_45894 ?auto_45892 ?auto_45891 )
      ( MAKE-4PILE ?auto_45889 ?auto_45890 ?auto_45891 ?auto_45892 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45896 - BLOCK
      ?auto_45897 - BLOCK
      ?auto_45898 - BLOCK
      ?auto_45899 - BLOCK
    )
    :vars
    (
      ?auto_45900 - BLOCK
      ?auto_45901 - BLOCK
      ?auto_45902 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45896 ?auto_45897 ) ) ( not ( = ?auto_45896 ?auto_45898 ) ) ( not ( = ?auto_45896 ?auto_45899 ) ) ( not ( = ?auto_45897 ?auto_45898 ) ) ( not ( = ?auto_45897 ?auto_45899 ) ) ( not ( = ?auto_45898 ?auto_45899 ) ) ( ON ?auto_45899 ?auto_45900 ) ( not ( = ?auto_45896 ?auto_45900 ) ) ( not ( = ?auto_45897 ?auto_45900 ) ) ( not ( = ?auto_45898 ?auto_45900 ) ) ( not ( = ?auto_45899 ?auto_45900 ) ) ( ON ?auto_45898 ?auto_45899 ) ( ON-TABLE ?auto_45901 ) ( ON ?auto_45902 ?auto_45901 ) ( ON ?auto_45900 ?auto_45902 ) ( not ( = ?auto_45901 ?auto_45902 ) ) ( not ( = ?auto_45901 ?auto_45900 ) ) ( not ( = ?auto_45901 ?auto_45899 ) ) ( not ( = ?auto_45901 ?auto_45898 ) ) ( not ( = ?auto_45902 ?auto_45900 ) ) ( not ( = ?auto_45902 ?auto_45899 ) ) ( not ( = ?auto_45902 ?auto_45898 ) ) ( not ( = ?auto_45896 ?auto_45901 ) ) ( not ( = ?auto_45896 ?auto_45902 ) ) ( not ( = ?auto_45897 ?auto_45901 ) ) ( not ( = ?auto_45897 ?auto_45902 ) ) ( ON ?auto_45897 ?auto_45898 ) ( CLEAR ?auto_45897 ) ( HOLDING ?auto_45896 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45896 )
      ( MAKE-4PILE ?auto_45896 ?auto_45897 ?auto_45898 ?auto_45899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45903 - BLOCK
      ?auto_45904 - BLOCK
      ?auto_45905 - BLOCK
      ?auto_45906 - BLOCK
    )
    :vars
    (
      ?auto_45907 - BLOCK
      ?auto_45909 - BLOCK
      ?auto_45908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45903 ?auto_45904 ) ) ( not ( = ?auto_45903 ?auto_45905 ) ) ( not ( = ?auto_45903 ?auto_45906 ) ) ( not ( = ?auto_45904 ?auto_45905 ) ) ( not ( = ?auto_45904 ?auto_45906 ) ) ( not ( = ?auto_45905 ?auto_45906 ) ) ( ON ?auto_45906 ?auto_45907 ) ( not ( = ?auto_45903 ?auto_45907 ) ) ( not ( = ?auto_45904 ?auto_45907 ) ) ( not ( = ?auto_45905 ?auto_45907 ) ) ( not ( = ?auto_45906 ?auto_45907 ) ) ( ON ?auto_45905 ?auto_45906 ) ( ON-TABLE ?auto_45909 ) ( ON ?auto_45908 ?auto_45909 ) ( ON ?auto_45907 ?auto_45908 ) ( not ( = ?auto_45909 ?auto_45908 ) ) ( not ( = ?auto_45909 ?auto_45907 ) ) ( not ( = ?auto_45909 ?auto_45906 ) ) ( not ( = ?auto_45909 ?auto_45905 ) ) ( not ( = ?auto_45908 ?auto_45907 ) ) ( not ( = ?auto_45908 ?auto_45906 ) ) ( not ( = ?auto_45908 ?auto_45905 ) ) ( not ( = ?auto_45903 ?auto_45909 ) ) ( not ( = ?auto_45903 ?auto_45908 ) ) ( not ( = ?auto_45904 ?auto_45909 ) ) ( not ( = ?auto_45904 ?auto_45908 ) ) ( ON ?auto_45904 ?auto_45905 ) ( ON ?auto_45903 ?auto_45904 ) ( CLEAR ?auto_45903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45909 ?auto_45908 ?auto_45907 ?auto_45906 ?auto_45905 ?auto_45904 )
      ( MAKE-4PILE ?auto_45903 ?auto_45904 ?auto_45905 ?auto_45906 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45912 - BLOCK
      ?auto_45913 - BLOCK
    )
    :vars
    (
      ?auto_45914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45914 ?auto_45913 ) ( CLEAR ?auto_45914 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45912 ) ( ON ?auto_45913 ?auto_45912 ) ( not ( = ?auto_45912 ?auto_45913 ) ) ( not ( = ?auto_45912 ?auto_45914 ) ) ( not ( = ?auto_45913 ?auto_45914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45914 ?auto_45913 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45915 - BLOCK
      ?auto_45916 - BLOCK
    )
    :vars
    (
      ?auto_45917 - BLOCK
      ?auto_45918 - BLOCK
      ?auto_45919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45917 ?auto_45916 ) ( CLEAR ?auto_45917 ) ( ON-TABLE ?auto_45915 ) ( ON ?auto_45916 ?auto_45915 ) ( not ( = ?auto_45915 ?auto_45916 ) ) ( not ( = ?auto_45915 ?auto_45917 ) ) ( not ( = ?auto_45916 ?auto_45917 ) ) ( HOLDING ?auto_45918 ) ( CLEAR ?auto_45919 ) ( not ( = ?auto_45915 ?auto_45918 ) ) ( not ( = ?auto_45915 ?auto_45919 ) ) ( not ( = ?auto_45916 ?auto_45918 ) ) ( not ( = ?auto_45916 ?auto_45919 ) ) ( not ( = ?auto_45917 ?auto_45918 ) ) ( not ( = ?auto_45917 ?auto_45919 ) ) ( not ( = ?auto_45918 ?auto_45919 ) ) )
    :subtasks
    ( ( !STACK ?auto_45918 ?auto_45919 )
      ( MAKE-2PILE ?auto_45915 ?auto_45916 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45920 - BLOCK
      ?auto_45921 - BLOCK
    )
    :vars
    (
      ?auto_45924 - BLOCK
      ?auto_45923 - BLOCK
      ?auto_45922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45924 ?auto_45921 ) ( ON-TABLE ?auto_45920 ) ( ON ?auto_45921 ?auto_45920 ) ( not ( = ?auto_45920 ?auto_45921 ) ) ( not ( = ?auto_45920 ?auto_45924 ) ) ( not ( = ?auto_45921 ?auto_45924 ) ) ( CLEAR ?auto_45923 ) ( not ( = ?auto_45920 ?auto_45922 ) ) ( not ( = ?auto_45920 ?auto_45923 ) ) ( not ( = ?auto_45921 ?auto_45922 ) ) ( not ( = ?auto_45921 ?auto_45923 ) ) ( not ( = ?auto_45924 ?auto_45922 ) ) ( not ( = ?auto_45924 ?auto_45923 ) ) ( not ( = ?auto_45922 ?auto_45923 ) ) ( ON ?auto_45922 ?auto_45924 ) ( CLEAR ?auto_45922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45920 ?auto_45921 ?auto_45924 )
      ( MAKE-2PILE ?auto_45920 ?auto_45921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45925 - BLOCK
      ?auto_45926 - BLOCK
    )
    :vars
    (
      ?auto_45927 - BLOCK
      ?auto_45929 - BLOCK
      ?auto_45928 - BLOCK
      ?auto_45931 - BLOCK
      ?auto_45930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45927 ?auto_45926 ) ( ON-TABLE ?auto_45925 ) ( ON ?auto_45926 ?auto_45925 ) ( not ( = ?auto_45925 ?auto_45926 ) ) ( not ( = ?auto_45925 ?auto_45927 ) ) ( not ( = ?auto_45926 ?auto_45927 ) ) ( not ( = ?auto_45925 ?auto_45929 ) ) ( not ( = ?auto_45925 ?auto_45928 ) ) ( not ( = ?auto_45926 ?auto_45929 ) ) ( not ( = ?auto_45926 ?auto_45928 ) ) ( not ( = ?auto_45927 ?auto_45929 ) ) ( not ( = ?auto_45927 ?auto_45928 ) ) ( not ( = ?auto_45929 ?auto_45928 ) ) ( ON ?auto_45929 ?auto_45927 ) ( CLEAR ?auto_45929 ) ( HOLDING ?auto_45928 ) ( CLEAR ?auto_45931 ) ( ON-TABLE ?auto_45930 ) ( ON ?auto_45931 ?auto_45930 ) ( not ( = ?auto_45930 ?auto_45931 ) ) ( not ( = ?auto_45930 ?auto_45928 ) ) ( not ( = ?auto_45931 ?auto_45928 ) ) ( not ( = ?auto_45925 ?auto_45931 ) ) ( not ( = ?auto_45925 ?auto_45930 ) ) ( not ( = ?auto_45926 ?auto_45931 ) ) ( not ( = ?auto_45926 ?auto_45930 ) ) ( not ( = ?auto_45927 ?auto_45931 ) ) ( not ( = ?auto_45927 ?auto_45930 ) ) ( not ( = ?auto_45929 ?auto_45931 ) ) ( not ( = ?auto_45929 ?auto_45930 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45930 ?auto_45931 ?auto_45928 )
      ( MAKE-2PILE ?auto_45925 ?auto_45926 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45932 - BLOCK
      ?auto_45933 - BLOCK
    )
    :vars
    (
      ?auto_45934 - BLOCK
      ?auto_45936 - BLOCK
      ?auto_45938 - BLOCK
      ?auto_45937 - BLOCK
      ?auto_45935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45934 ?auto_45933 ) ( ON-TABLE ?auto_45932 ) ( ON ?auto_45933 ?auto_45932 ) ( not ( = ?auto_45932 ?auto_45933 ) ) ( not ( = ?auto_45932 ?auto_45934 ) ) ( not ( = ?auto_45933 ?auto_45934 ) ) ( not ( = ?auto_45932 ?auto_45936 ) ) ( not ( = ?auto_45932 ?auto_45938 ) ) ( not ( = ?auto_45933 ?auto_45936 ) ) ( not ( = ?auto_45933 ?auto_45938 ) ) ( not ( = ?auto_45934 ?auto_45936 ) ) ( not ( = ?auto_45934 ?auto_45938 ) ) ( not ( = ?auto_45936 ?auto_45938 ) ) ( ON ?auto_45936 ?auto_45934 ) ( CLEAR ?auto_45937 ) ( ON-TABLE ?auto_45935 ) ( ON ?auto_45937 ?auto_45935 ) ( not ( = ?auto_45935 ?auto_45937 ) ) ( not ( = ?auto_45935 ?auto_45938 ) ) ( not ( = ?auto_45937 ?auto_45938 ) ) ( not ( = ?auto_45932 ?auto_45937 ) ) ( not ( = ?auto_45932 ?auto_45935 ) ) ( not ( = ?auto_45933 ?auto_45937 ) ) ( not ( = ?auto_45933 ?auto_45935 ) ) ( not ( = ?auto_45934 ?auto_45937 ) ) ( not ( = ?auto_45934 ?auto_45935 ) ) ( not ( = ?auto_45936 ?auto_45937 ) ) ( not ( = ?auto_45936 ?auto_45935 ) ) ( ON ?auto_45938 ?auto_45936 ) ( CLEAR ?auto_45938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45932 ?auto_45933 ?auto_45934 ?auto_45936 )
      ( MAKE-2PILE ?auto_45932 ?auto_45933 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45939 - BLOCK
      ?auto_45940 - BLOCK
    )
    :vars
    (
      ?auto_45945 - BLOCK
      ?auto_45942 - BLOCK
      ?auto_45943 - BLOCK
      ?auto_45941 - BLOCK
      ?auto_45944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45945 ?auto_45940 ) ( ON-TABLE ?auto_45939 ) ( ON ?auto_45940 ?auto_45939 ) ( not ( = ?auto_45939 ?auto_45940 ) ) ( not ( = ?auto_45939 ?auto_45945 ) ) ( not ( = ?auto_45940 ?auto_45945 ) ) ( not ( = ?auto_45939 ?auto_45942 ) ) ( not ( = ?auto_45939 ?auto_45943 ) ) ( not ( = ?auto_45940 ?auto_45942 ) ) ( not ( = ?auto_45940 ?auto_45943 ) ) ( not ( = ?auto_45945 ?auto_45942 ) ) ( not ( = ?auto_45945 ?auto_45943 ) ) ( not ( = ?auto_45942 ?auto_45943 ) ) ( ON ?auto_45942 ?auto_45945 ) ( ON-TABLE ?auto_45941 ) ( not ( = ?auto_45941 ?auto_45944 ) ) ( not ( = ?auto_45941 ?auto_45943 ) ) ( not ( = ?auto_45944 ?auto_45943 ) ) ( not ( = ?auto_45939 ?auto_45944 ) ) ( not ( = ?auto_45939 ?auto_45941 ) ) ( not ( = ?auto_45940 ?auto_45944 ) ) ( not ( = ?auto_45940 ?auto_45941 ) ) ( not ( = ?auto_45945 ?auto_45944 ) ) ( not ( = ?auto_45945 ?auto_45941 ) ) ( not ( = ?auto_45942 ?auto_45944 ) ) ( not ( = ?auto_45942 ?auto_45941 ) ) ( ON ?auto_45943 ?auto_45942 ) ( CLEAR ?auto_45943 ) ( HOLDING ?auto_45944 ) ( CLEAR ?auto_45941 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45941 ?auto_45944 )
      ( MAKE-2PILE ?auto_45939 ?auto_45940 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46717 - BLOCK
      ?auto_46718 - BLOCK
    )
    :vars
    (
      ?auto_46721 - BLOCK
      ?auto_46719 - BLOCK
      ?auto_46722 - BLOCK
      ?auto_46720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46721 ?auto_46718 ) ( ON-TABLE ?auto_46717 ) ( ON ?auto_46718 ?auto_46717 ) ( not ( = ?auto_46717 ?auto_46718 ) ) ( not ( = ?auto_46717 ?auto_46721 ) ) ( not ( = ?auto_46718 ?auto_46721 ) ) ( not ( = ?auto_46717 ?auto_46719 ) ) ( not ( = ?auto_46717 ?auto_46722 ) ) ( not ( = ?auto_46718 ?auto_46719 ) ) ( not ( = ?auto_46718 ?auto_46722 ) ) ( not ( = ?auto_46721 ?auto_46719 ) ) ( not ( = ?auto_46721 ?auto_46722 ) ) ( not ( = ?auto_46719 ?auto_46722 ) ) ( ON ?auto_46719 ?auto_46721 ) ( not ( = ?auto_46720 ?auto_46722 ) ) ( not ( = ?auto_46717 ?auto_46720 ) ) ( not ( = ?auto_46718 ?auto_46720 ) ) ( not ( = ?auto_46721 ?auto_46720 ) ) ( not ( = ?auto_46719 ?auto_46720 ) ) ( ON ?auto_46722 ?auto_46719 ) ( ON ?auto_46720 ?auto_46722 ) ( CLEAR ?auto_46720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46717 ?auto_46718 ?auto_46721 ?auto_46719 ?auto_46722 )
      ( MAKE-2PILE ?auto_46717 ?auto_46718 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45953 - BLOCK
      ?auto_45954 - BLOCK
    )
    :vars
    (
      ?auto_45956 - BLOCK
      ?auto_45957 - BLOCK
      ?auto_45959 - BLOCK
      ?auto_45958 - BLOCK
      ?auto_45955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45956 ?auto_45954 ) ( ON-TABLE ?auto_45953 ) ( ON ?auto_45954 ?auto_45953 ) ( not ( = ?auto_45953 ?auto_45954 ) ) ( not ( = ?auto_45953 ?auto_45956 ) ) ( not ( = ?auto_45954 ?auto_45956 ) ) ( not ( = ?auto_45953 ?auto_45957 ) ) ( not ( = ?auto_45953 ?auto_45959 ) ) ( not ( = ?auto_45954 ?auto_45957 ) ) ( not ( = ?auto_45954 ?auto_45959 ) ) ( not ( = ?auto_45956 ?auto_45957 ) ) ( not ( = ?auto_45956 ?auto_45959 ) ) ( not ( = ?auto_45957 ?auto_45959 ) ) ( ON ?auto_45957 ?auto_45956 ) ( not ( = ?auto_45958 ?auto_45955 ) ) ( not ( = ?auto_45958 ?auto_45959 ) ) ( not ( = ?auto_45955 ?auto_45959 ) ) ( not ( = ?auto_45953 ?auto_45955 ) ) ( not ( = ?auto_45953 ?auto_45958 ) ) ( not ( = ?auto_45954 ?auto_45955 ) ) ( not ( = ?auto_45954 ?auto_45958 ) ) ( not ( = ?auto_45956 ?auto_45955 ) ) ( not ( = ?auto_45956 ?auto_45958 ) ) ( not ( = ?auto_45957 ?auto_45955 ) ) ( not ( = ?auto_45957 ?auto_45958 ) ) ( ON ?auto_45959 ?auto_45957 ) ( ON ?auto_45955 ?auto_45959 ) ( CLEAR ?auto_45955 ) ( HOLDING ?auto_45958 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45958 )
      ( MAKE-2PILE ?auto_45953 ?auto_45954 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45960 - BLOCK
      ?auto_45961 - BLOCK
    )
    :vars
    (
      ?auto_45962 - BLOCK
      ?auto_45964 - BLOCK
      ?auto_45963 - BLOCK
      ?auto_45965 - BLOCK
      ?auto_45966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45962 ?auto_45961 ) ( ON-TABLE ?auto_45960 ) ( ON ?auto_45961 ?auto_45960 ) ( not ( = ?auto_45960 ?auto_45961 ) ) ( not ( = ?auto_45960 ?auto_45962 ) ) ( not ( = ?auto_45961 ?auto_45962 ) ) ( not ( = ?auto_45960 ?auto_45964 ) ) ( not ( = ?auto_45960 ?auto_45963 ) ) ( not ( = ?auto_45961 ?auto_45964 ) ) ( not ( = ?auto_45961 ?auto_45963 ) ) ( not ( = ?auto_45962 ?auto_45964 ) ) ( not ( = ?auto_45962 ?auto_45963 ) ) ( not ( = ?auto_45964 ?auto_45963 ) ) ( ON ?auto_45964 ?auto_45962 ) ( not ( = ?auto_45965 ?auto_45966 ) ) ( not ( = ?auto_45965 ?auto_45963 ) ) ( not ( = ?auto_45966 ?auto_45963 ) ) ( not ( = ?auto_45960 ?auto_45966 ) ) ( not ( = ?auto_45960 ?auto_45965 ) ) ( not ( = ?auto_45961 ?auto_45966 ) ) ( not ( = ?auto_45961 ?auto_45965 ) ) ( not ( = ?auto_45962 ?auto_45966 ) ) ( not ( = ?auto_45962 ?auto_45965 ) ) ( not ( = ?auto_45964 ?auto_45966 ) ) ( not ( = ?auto_45964 ?auto_45965 ) ) ( ON ?auto_45963 ?auto_45964 ) ( ON ?auto_45966 ?auto_45963 ) ( ON ?auto_45965 ?auto_45966 ) ( CLEAR ?auto_45965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45960 ?auto_45961 ?auto_45962 ?auto_45964 ?auto_45963 ?auto_45966 )
      ( MAKE-2PILE ?auto_45960 ?auto_45961 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45972 - BLOCK
      ?auto_45973 - BLOCK
      ?auto_45974 - BLOCK
      ?auto_45975 - BLOCK
      ?auto_45976 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_45976 ) ( CLEAR ?auto_45975 ) ( ON-TABLE ?auto_45972 ) ( ON ?auto_45973 ?auto_45972 ) ( ON ?auto_45974 ?auto_45973 ) ( ON ?auto_45975 ?auto_45974 ) ( not ( = ?auto_45972 ?auto_45973 ) ) ( not ( = ?auto_45972 ?auto_45974 ) ) ( not ( = ?auto_45972 ?auto_45975 ) ) ( not ( = ?auto_45972 ?auto_45976 ) ) ( not ( = ?auto_45973 ?auto_45974 ) ) ( not ( = ?auto_45973 ?auto_45975 ) ) ( not ( = ?auto_45973 ?auto_45976 ) ) ( not ( = ?auto_45974 ?auto_45975 ) ) ( not ( = ?auto_45974 ?auto_45976 ) ) ( not ( = ?auto_45975 ?auto_45976 ) ) )
    :subtasks
    ( ( !STACK ?auto_45976 ?auto_45975 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45977 - BLOCK
      ?auto_45978 - BLOCK
      ?auto_45979 - BLOCK
      ?auto_45980 - BLOCK
      ?auto_45981 - BLOCK
    )
    :vars
    (
      ?auto_45982 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45980 ) ( ON-TABLE ?auto_45977 ) ( ON ?auto_45978 ?auto_45977 ) ( ON ?auto_45979 ?auto_45978 ) ( ON ?auto_45980 ?auto_45979 ) ( not ( = ?auto_45977 ?auto_45978 ) ) ( not ( = ?auto_45977 ?auto_45979 ) ) ( not ( = ?auto_45977 ?auto_45980 ) ) ( not ( = ?auto_45977 ?auto_45981 ) ) ( not ( = ?auto_45978 ?auto_45979 ) ) ( not ( = ?auto_45978 ?auto_45980 ) ) ( not ( = ?auto_45978 ?auto_45981 ) ) ( not ( = ?auto_45979 ?auto_45980 ) ) ( not ( = ?auto_45979 ?auto_45981 ) ) ( not ( = ?auto_45980 ?auto_45981 ) ) ( ON ?auto_45981 ?auto_45982 ) ( CLEAR ?auto_45981 ) ( HAND-EMPTY ) ( not ( = ?auto_45977 ?auto_45982 ) ) ( not ( = ?auto_45978 ?auto_45982 ) ) ( not ( = ?auto_45979 ?auto_45982 ) ) ( not ( = ?auto_45980 ?auto_45982 ) ) ( not ( = ?auto_45981 ?auto_45982 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45981 ?auto_45982 )
      ( MAKE-5PILE ?auto_45977 ?auto_45978 ?auto_45979 ?auto_45980 ?auto_45981 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45983 - BLOCK
      ?auto_45984 - BLOCK
      ?auto_45985 - BLOCK
      ?auto_45986 - BLOCK
      ?auto_45987 - BLOCK
    )
    :vars
    (
      ?auto_45988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45983 ) ( ON ?auto_45984 ?auto_45983 ) ( ON ?auto_45985 ?auto_45984 ) ( not ( = ?auto_45983 ?auto_45984 ) ) ( not ( = ?auto_45983 ?auto_45985 ) ) ( not ( = ?auto_45983 ?auto_45986 ) ) ( not ( = ?auto_45983 ?auto_45987 ) ) ( not ( = ?auto_45984 ?auto_45985 ) ) ( not ( = ?auto_45984 ?auto_45986 ) ) ( not ( = ?auto_45984 ?auto_45987 ) ) ( not ( = ?auto_45985 ?auto_45986 ) ) ( not ( = ?auto_45985 ?auto_45987 ) ) ( not ( = ?auto_45986 ?auto_45987 ) ) ( ON ?auto_45987 ?auto_45988 ) ( CLEAR ?auto_45987 ) ( not ( = ?auto_45983 ?auto_45988 ) ) ( not ( = ?auto_45984 ?auto_45988 ) ) ( not ( = ?auto_45985 ?auto_45988 ) ) ( not ( = ?auto_45986 ?auto_45988 ) ) ( not ( = ?auto_45987 ?auto_45988 ) ) ( HOLDING ?auto_45986 ) ( CLEAR ?auto_45985 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45983 ?auto_45984 ?auto_45985 ?auto_45986 )
      ( MAKE-5PILE ?auto_45983 ?auto_45984 ?auto_45985 ?auto_45986 ?auto_45987 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45989 - BLOCK
      ?auto_45990 - BLOCK
      ?auto_45991 - BLOCK
      ?auto_45992 - BLOCK
      ?auto_45993 - BLOCK
    )
    :vars
    (
      ?auto_45994 - BLOCK
      ?auto_45995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45989 ) ( ON ?auto_45990 ?auto_45989 ) ( ON ?auto_45991 ?auto_45990 ) ( not ( = ?auto_45989 ?auto_45990 ) ) ( not ( = ?auto_45989 ?auto_45991 ) ) ( not ( = ?auto_45989 ?auto_45992 ) ) ( not ( = ?auto_45989 ?auto_45993 ) ) ( not ( = ?auto_45990 ?auto_45991 ) ) ( not ( = ?auto_45990 ?auto_45992 ) ) ( not ( = ?auto_45990 ?auto_45993 ) ) ( not ( = ?auto_45991 ?auto_45992 ) ) ( not ( = ?auto_45991 ?auto_45993 ) ) ( not ( = ?auto_45992 ?auto_45993 ) ) ( ON ?auto_45993 ?auto_45994 ) ( not ( = ?auto_45989 ?auto_45994 ) ) ( not ( = ?auto_45990 ?auto_45994 ) ) ( not ( = ?auto_45991 ?auto_45994 ) ) ( not ( = ?auto_45992 ?auto_45994 ) ) ( not ( = ?auto_45993 ?auto_45994 ) ) ( CLEAR ?auto_45991 ) ( ON ?auto_45992 ?auto_45993 ) ( CLEAR ?auto_45992 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45995 ) ( ON ?auto_45994 ?auto_45995 ) ( not ( = ?auto_45995 ?auto_45994 ) ) ( not ( = ?auto_45995 ?auto_45993 ) ) ( not ( = ?auto_45995 ?auto_45992 ) ) ( not ( = ?auto_45989 ?auto_45995 ) ) ( not ( = ?auto_45990 ?auto_45995 ) ) ( not ( = ?auto_45991 ?auto_45995 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45995 ?auto_45994 ?auto_45993 )
      ( MAKE-5PILE ?auto_45989 ?auto_45990 ?auto_45991 ?auto_45992 ?auto_45993 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45996 - BLOCK
      ?auto_45997 - BLOCK
      ?auto_45998 - BLOCK
      ?auto_45999 - BLOCK
      ?auto_46000 - BLOCK
    )
    :vars
    (
      ?auto_46002 - BLOCK
      ?auto_46001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45996 ) ( ON ?auto_45997 ?auto_45996 ) ( not ( = ?auto_45996 ?auto_45997 ) ) ( not ( = ?auto_45996 ?auto_45998 ) ) ( not ( = ?auto_45996 ?auto_45999 ) ) ( not ( = ?auto_45996 ?auto_46000 ) ) ( not ( = ?auto_45997 ?auto_45998 ) ) ( not ( = ?auto_45997 ?auto_45999 ) ) ( not ( = ?auto_45997 ?auto_46000 ) ) ( not ( = ?auto_45998 ?auto_45999 ) ) ( not ( = ?auto_45998 ?auto_46000 ) ) ( not ( = ?auto_45999 ?auto_46000 ) ) ( ON ?auto_46000 ?auto_46002 ) ( not ( = ?auto_45996 ?auto_46002 ) ) ( not ( = ?auto_45997 ?auto_46002 ) ) ( not ( = ?auto_45998 ?auto_46002 ) ) ( not ( = ?auto_45999 ?auto_46002 ) ) ( not ( = ?auto_46000 ?auto_46002 ) ) ( ON ?auto_45999 ?auto_46000 ) ( CLEAR ?auto_45999 ) ( ON-TABLE ?auto_46001 ) ( ON ?auto_46002 ?auto_46001 ) ( not ( = ?auto_46001 ?auto_46002 ) ) ( not ( = ?auto_46001 ?auto_46000 ) ) ( not ( = ?auto_46001 ?auto_45999 ) ) ( not ( = ?auto_45996 ?auto_46001 ) ) ( not ( = ?auto_45997 ?auto_46001 ) ) ( not ( = ?auto_45998 ?auto_46001 ) ) ( HOLDING ?auto_45998 ) ( CLEAR ?auto_45997 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45996 ?auto_45997 ?auto_45998 )
      ( MAKE-5PILE ?auto_45996 ?auto_45997 ?auto_45998 ?auto_45999 ?auto_46000 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46003 - BLOCK
      ?auto_46004 - BLOCK
      ?auto_46005 - BLOCK
      ?auto_46006 - BLOCK
      ?auto_46007 - BLOCK
    )
    :vars
    (
      ?auto_46008 - BLOCK
      ?auto_46009 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46003 ) ( ON ?auto_46004 ?auto_46003 ) ( not ( = ?auto_46003 ?auto_46004 ) ) ( not ( = ?auto_46003 ?auto_46005 ) ) ( not ( = ?auto_46003 ?auto_46006 ) ) ( not ( = ?auto_46003 ?auto_46007 ) ) ( not ( = ?auto_46004 ?auto_46005 ) ) ( not ( = ?auto_46004 ?auto_46006 ) ) ( not ( = ?auto_46004 ?auto_46007 ) ) ( not ( = ?auto_46005 ?auto_46006 ) ) ( not ( = ?auto_46005 ?auto_46007 ) ) ( not ( = ?auto_46006 ?auto_46007 ) ) ( ON ?auto_46007 ?auto_46008 ) ( not ( = ?auto_46003 ?auto_46008 ) ) ( not ( = ?auto_46004 ?auto_46008 ) ) ( not ( = ?auto_46005 ?auto_46008 ) ) ( not ( = ?auto_46006 ?auto_46008 ) ) ( not ( = ?auto_46007 ?auto_46008 ) ) ( ON ?auto_46006 ?auto_46007 ) ( ON-TABLE ?auto_46009 ) ( ON ?auto_46008 ?auto_46009 ) ( not ( = ?auto_46009 ?auto_46008 ) ) ( not ( = ?auto_46009 ?auto_46007 ) ) ( not ( = ?auto_46009 ?auto_46006 ) ) ( not ( = ?auto_46003 ?auto_46009 ) ) ( not ( = ?auto_46004 ?auto_46009 ) ) ( not ( = ?auto_46005 ?auto_46009 ) ) ( CLEAR ?auto_46004 ) ( ON ?auto_46005 ?auto_46006 ) ( CLEAR ?auto_46005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46009 ?auto_46008 ?auto_46007 ?auto_46006 )
      ( MAKE-5PILE ?auto_46003 ?auto_46004 ?auto_46005 ?auto_46006 ?auto_46007 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46010 - BLOCK
      ?auto_46011 - BLOCK
      ?auto_46012 - BLOCK
      ?auto_46013 - BLOCK
      ?auto_46014 - BLOCK
    )
    :vars
    (
      ?auto_46015 - BLOCK
      ?auto_46016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46010 ) ( not ( = ?auto_46010 ?auto_46011 ) ) ( not ( = ?auto_46010 ?auto_46012 ) ) ( not ( = ?auto_46010 ?auto_46013 ) ) ( not ( = ?auto_46010 ?auto_46014 ) ) ( not ( = ?auto_46011 ?auto_46012 ) ) ( not ( = ?auto_46011 ?auto_46013 ) ) ( not ( = ?auto_46011 ?auto_46014 ) ) ( not ( = ?auto_46012 ?auto_46013 ) ) ( not ( = ?auto_46012 ?auto_46014 ) ) ( not ( = ?auto_46013 ?auto_46014 ) ) ( ON ?auto_46014 ?auto_46015 ) ( not ( = ?auto_46010 ?auto_46015 ) ) ( not ( = ?auto_46011 ?auto_46015 ) ) ( not ( = ?auto_46012 ?auto_46015 ) ) ( not ( = ?auto_46013 ?auto_46015 ) ) ( not ( = ?auto_46014 ?auto_46015 ) ) ( ON ?auto_46013 ?auto_46014 ) ( ON-TABLE ?auto_46016 ) ( ON ?auto_46015 ?auto_46016 ) ( not ( = ?auto_46016 ?auto_46015 ) ) ( not ( = ?auto_46016 ?auto_46014 ) ) ( not ( = ?auto_46016 ?auto_46013 ) ) ( not ( = ?auto_46010 ?auto_46016 ) ) ( not ( = ?auto_46011 ?auto_46016 ) ) ( not ( = ?auto_46012 ?auto_46016 ) ) ( ON ?auto_46012 ?auto_46013 ) ( CLEAR ?auto_46012 ) ( HOLDING ?auto_46011 ) ( CLEAR ?auto_46010 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46010 ?auto_46011 )
      ( MAKE-5PILE ?auto_46010 ?auto_46011 ?auto_46012 ?auto_46013 ?auto_46014 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46017 - BLOCK
      ?auto_46018 - BLOCK
      ?auto_46019 - BLOCK
      ?auto_46020 - BLOCK
      ?auto_46021 - BLOCK
    )
    :vars
    (
      ?auto_46022 - BLOCK
      ?auto_46023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46017 ) ( not ( = ?auto_46017 ?auto_46018 ) ) ( not ( = ?auto_46017 ?auto_46019 ) ) ( not ( = ?auto_46017 ?auto_46020 ) ) ( not ( = ?auto_46017 ?auto_46021 ) ) ( not ( = ?auto_46018 ?auto_46019 ) ) ( not ( = ?auto_46018 ?auto_46020 ) ) ( not ( = ?auto_46018 ?auto_46021 ) ) ( not ( = ?auto_46019 ?auto_46020 ) ) ( not ( = ?auto_46019 ?auto_46021 ) ) ( not ( = ?auto_46020 ?auto_46021 ) ) ( ON ?auto_46021 ?auto_46022 ) ( not ( = ?auto_46017 ?auto_46022 ) ) ( not ( = ?auto_46018 ?auto_46022 ) ) ( not ( = ?auto_46019 ?auto_46022 ) ) ( not ( = ?auto_46020 ?auto_46022 ) ) ( not ( = ?auto_46021 ?auto_46022 ) ) ( ON ?auto_46020 ?auto_46021 ) ( ON-TABLE ?auto_46023 ) ( ON ?auto_46022 ?auto_46023 ) ( not ( = ?auto_46023 ?auto_46022 ) ) ( not ( = ?auto_46023 ?auto_46021 ) ) ( not ( = ?auto_46023 ?auto_46020 ) ) ( not ( = ?auto_46017 ?auto_46023 ) ) ( not ( = ?auto_46018 ?auto_46023 ) ) ( not ( = ?auto_46019 ?auto_46023 ) ) ( ON ?auto_46019 ?auto_46020 ) ( CLEAR ?auto_46017 ) ( ON ?auto_46018 ?auto_46019 ) ( CLEAR ?auto_46018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46023 ?auto_46022 ?auto_46021 ?auto_46020 ?auto_46019 )
      ( MAKE-5PILE ?auto_46017 ?auto_46018 ?auto_46019 ?auto_46020 ?auto_46021 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46024 - BLOCK
      ?auto_46025 - BLOCK
      ?auto_46026 - BLOCK
      ?auto_46027 - BLOCK
      ?auto_46028 - BLOCK
    )
    :vars
    (
      ?auto_46029 - BLOCK
      ?auto_46030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46024 ?auto_46025 ) ) ( not ( = ?auto_46024 ?auto_46026 ) ) ( not ( = ?auto_46024 ?auto_46027 ) ) ( not ( = ?auto_46024 ?auto_46028 ) ) ( not ( = ?auto_46025 ?auto_46026 ) ) ( not ( = ?auto_46025 ?auto_46027 ) ) ( not ( = ?auto_46025 ?auto_46028 ) ) ( not ( = ?auto_46026 ?auto_46027 ) ) ( not ( = ?auto_46026 ?auto_46028 ) ) ( not ( = ?auto_46027 ?auto_46028 ) ) ( ON ?auto_46028 ?auto_46029 ) ( not ( = ?auto_46024 ?auto_46029 ) ) ( not ( = ?auto_46025 ?auto_46029 ) ) ( not ( = ?auto_46026 ?auto_46029 ) ) ( not ( = ?auto_46027 ?auto_46029 ) ) ( not ( = ?auto_46028 ?auto_46029 ) ) ( ON ?auto_46027 ?auto_46028 ) ( ON-TABLE ?auto_46030 ) ( ON ?auto_46029 ?auto_46030 ) ( not ( = ?auto_46030 ?auto_46029 ) ) ( not ( = ?auto_46030 ?auto_46028 ) ) ( not ( = ?auto_46030 ?auto_46027 ) ) ( not ( = ?auto_46024 ?auto_46030 ) ) ( not ( = ?auto_46025 ?auto_46030 ) ) ( not ( = ?auto_46026 ?auto_46030 ) ) ( ON ?auto_46026 ?auto_46027 ) ( ON ?auto_46025 ?auto_46026 ) ( CLEAR ?auto_46025 ) ( HOLDING ?auto_46024 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46024 )
      ( MAKE-5PILE ?auto_46024 ?auto_46025 ?auto_46026 ?auto_46027 ?auto_46028 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46031 - BLOCK
      ?auto_46032 - BLOCK
      ?auto_46033 - BLOCK
      ?auto_46034 - BLOCK
      ?auto_46035 - BLOCK
    )
    :vars
    (
      ?auto_46037 - BLOCK
      ?auto_46036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46031 ?auto_46032 ) ) ( not ( = ?auto_46031 ?auto_46033 ) ) ( not ( = ?auto_46031 ?auto_46034 ) ) ( not ( = ?auto_46031 ?auto_46035 ) ) ( not ( = ?auto_46032 ?auto_46033 ) ) ( not ( = ?auto_46032 ?auto_46034 ) ) ( not ( = ?auto_46032 ?auto_46035 ) ) ( not ( = ?auto_46033 ?auto_46034 ) ) ( not ( = ?auto_46033 ?auto_46035 ) ) ( not ( = ?auto_46034 ?auto_46035 ) ) ( ON ?auto_46035 ?auto_46037 ) ( not ( = ?auto_46031 ?auto_46037 ) ) ( not ( = ?auto_46032 ?auto_46037 ) ) ( not ( = ?auto_46033 ?auto_46037 ) ) ( not ( = ?auto_46034 ?auto_46037 ) ) ( not ( = ?auto_46035 ?auto_46037 ) ) ( ON ?auto_46034 ?auto_46035 ) ( ON-TABLE ?auto_46036 ) ( ON ?auto_46037 ?auto_46036 ) ( not ( = ?auto_46036 ?auto_46037 ) ) ( not ( = ?auto_46036 ?auto_46035 ) ) ( not ( = ?auto_46036 ?auto_46034 ) ) ( not ( = ?auto_46031 ?auto_46036 ) ) ( not ( = ?auto_46032 ?auto_46036 ) ) ( not ( = ?auto_46033 ?auto_46036 ) ) ( ON ?auto_46033 ?auto_46034 ) ( ON ?auto_46032 ?auto_46033 ) ( ON ?auto_46031 ?auto_46032 ) ( CLEAR ?auto_46031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46036 ?auto_46037 ?auto_46035 ?auto_46034 ?auto_46033 ?auto_46032 )
      ( MAKE-5PILE ?auto_46031 ?auto_46032 ?auto_46033 ?auto_46034 ?auto_46035 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46039 - BLOCK
    )
    :vars
    (
      ?auto_46040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46040 ?auto_46039 ) ( CLEAR ?auto_46040 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46039 ) ( not ( = ?auto_46039 ?auto_46040 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46040 ?auto_46039 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46041 - BLOCK
    )
    :vars
    (
      ?auto_46042 - BLOCK
      ?auto_46043 - BLOCK
      ?auto_46044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46042 ?auto_46041 ) ( CLEAR ?auto_46042 ) ( ON-TABLE ?auto_46041 ) ( not ( = ?auto_46041 ?auto_46042 ) ) ( HOLDING ?auto_46043 ) ( CLEAR ?auto_46044 ) ( not ( = ?auto_46041 ?auto_46043 ) ) ( not ( = ?auto_46041 ?auto_46044 ) ) ( not ( = ?auto_46042 ?auto_46043 ) ) ( not ( = ?auto_46042 ?auto_46044 ) ) ( not ( = ?auto_46043 ?auto_46044 ) ) )
    :subtasks
    ( ( !STACK ?auto_46043 ?auto_46044 )
      ( MAKE-1PILE ?auto_46041 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46045 - BLOCK
    )
    :vars
    (
      ?auto_46046 - BLOCK
      ?auto_46047 - BLOCK
      ?auto_46048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46046 ?auto_46045 ) ( ON-TABLE ?auto_46045 ) ( not ( = ?auto_46045 ?auto_46046 ) ) ( CLEAR ?auto_46047 ) ( not ( = ?auto_46045 ?auto_46048 ) ) ( not ( = ?auto_46045 ?auto_46047 ) ) ( not ( = ?auto_46046 ?auto_46048 ) ) ( not ( = ?auto_46046 ?auto_46047 ) ) ( not ( = ?auto_46048 ?auto_46047 ) ) ( ON ?auto_46048 ?auto_46046 ) ( CLEAR ?auto_46048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46045 ?auto_46046 )
      ( MAKE-1PILE ?auto_46045 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46049 - BLOCK
    )
    :vars
    (
      ?auto_46052 - BLOCK
      ?auto_46050 - BLOCK
      ?auto_46051 - BLOCK
      ?auto_46053 - BLOCK
      ?auto_46055 - BLOCK
      ?auto_46054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46052 ?auto_46049 ) ( ON-TABLE ?auto_46049 ) ( not ( = ?auto_46049 ?auto_46052 ) ) ( not ( = ?auto_46049 ?auto_46050 ) ) ( not ( = ?auto_46049 ?auto_46051 ) ) ( not ( = ?auto_46052 ?auto_46050 ) ) ( not ( = ?auto_46052 ?auto_46051 ) ) ( not ( = ?auto_46050 ?auto_46051 ) ) ( ON ?auto_46050 ?auto_46052 ) ( CLEAR ?auto_46050 ) ( HOLDING ?auto_46051 ) ( CLEAR ?auto_46053 ) ( ON-TABLE ?auto_46055 ) ( ON ?auto_46054 ?auto_46055 ) ( ON ?auto_46053 ?auto_46054 ) ( not ( = ?auto_46055 ?auto_46054 ) ) ( not ( = ?auto_46055 ?auto_46053 ) ) ( not ( = ?auto_46055 ?auto_46051 ) ) ( not ( = ?auto_46054 ?auto_46053 ) ) ( not ( = ?auto_46054 ?auto_46051 ) ) ( not ( = ?auto_46053 ?auto_46051 ) ) ( not ( = ?auto_46049 ?auto_46053 ) ) ( not ( = ?auto_46049 ?auto_46055 ) ) ( not ( = ?auto_46049 ?auto_46054 ) ) ( not ( = ?auto_46052 ?auto_46053 ) ) ( not ( = ?auto_46052 ?auto_46055 ) ) ( not ( = ?auto_46052 ?auto_46054 ) ) ( not ( = ?auto_46050 ?auto_46053 ) ) ( not ( = ?auto_46050 ?auto_46055 ) ) ( not ( = ?auto_46050 ?auto_46054 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46055 ?auto_46054 ?auto_46053 ?auto_46051 )
      ( MAKE-1PILE ?auto_46049 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46056 - BLOCK
    )
    :vars
    (
      ?auto_46058 - BLOCK
      ?auto_46060 - BLOCK
      ?auto_46062 - BLOCK
      ?auto_46059 - BLOCK
      ?auto_46057 - BLOCK
      ?auto_46061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46058 ?auto_46056 ) ( ON-TABLE ?auto_46056 ) ( not ( = ?auto_46056 ?auto_46058 ) ) ( not ( = ?auto_46056 ?auto_46060 ) ) ( not ( = ?auto_46056 ?auto_46062 ) ) ( not ( = ?auto_46058 ?auto_46060 ) ) ( not ( = ?auto_46058 ?auto_46062 ) ) ( not ( = ?auto_46060 ?auto_46062 ) ) ( ON ?auto_46060 ?auto_46058 ) ( CLEAR ?auto_46059 ) ( ON-TABLE ?auto_46057 ) ( ON ?auto_46061 ?auto_46057 ) ( ON ?auto_46059 ?auto_46061 ) ( not ( = ?auto_46057 ?auto_46061 ) ) ( not ( = ?auto_46057 ?auto_46059 ) ) ( not ( = ?auto_46057 ?auto_46062 ) ) ( not ( = ?auto_46061 ?auto_46059 ) ) ( not ( = ?auto_46061 ?auto_46062 ) ) ( not ( = ?auto_46059 ?auto_46062 ) ) ( not ( = ?auto_46056 ?auto_46059 ) ) ( not ( = ?auto_46056 ?auto_46057 ) ) ( not ( = ?auto_46056 ?auto_46061 ) ) ( not ( = ?auto_46058 ?auto_46059 ) ) ( not ( = ?auto_46058 ?auto_46057 ) ) ( not ( = ?auto_46058 ?auto_46061 ) ) ( not ( = ?auto_46060 ?auto_46059 ) ) ( not ( = ?auto_46060 ?auto_46057 ) ) ( not ( = ?auto_46060 ?auto_46061 ) ) ( ON ?auto_46062 ?auto_46060 ) ( CLEAR ?auto_46062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46056 ?auto_46058 ?auto_46060 )
      ( MAKE-1PILE ?auto_46056 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46063 - BLOCK
    )
    :vars
    (
      ?auto_46068 - BLOCK
      ?auto_46064 - BLOCK
      ?auto_46066 - BLOCK
      ?auto_46069 - BLOCK
      ?auto_46067 - BLOCK
      ?auto_46065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46068 ?auto_46063 ) ( ON-TABLE ?auto_46063 ) ( not ( = ?auto_46063 ?auto_46068 ) ) ( not ( = ?auto_46063 ?auto_46064 ) ) ( not ( = ?auto_46063 ?auto_46066 ) ) ( not ( = ?auto_46068 ?auto_46064 ) ) ( not ( = ?auto_46068 ?auto_46066 ) ) ( not ( = ?auto_46064 ?auto_46066 ) ) ( ON ?auto_46064 ?auto_46068 ) ( ON-TABLE ?auto_46069 ) ( ON ?auto_46067 ?auto_46069 ) ( not ( = ?auto_46069 ?auto_46067 ) ) ( not ( = ?auto_46069 ?auto_46065 ) ) ( not ( = ?auto_46069 ?auto_46066 ) ) ( not ( = ?auto_46067 ?auto_46065 ) ) ( not ( = ?auto_46067 ?auto_46066 ) ) ( not ( = ?auto_46065 ?auto_46066 ) ) ( not ( = ?auto_46063 ?auto_46065 ) ) ( not ( = ?auto_46063 ?auto_46069 ) ) ( not ( = ?auto_46063 ?auto_46067 ) ) ( not ( = ?auto_46068 ?auto_46065 ) ) ( not ( = ?auto_46068 ?auto_46069 ) ) ( not ( = ?auto_46068 ?auto_46067 ) ) ( not ( = ?auto_46064 ?auto_46065 ) ) ( not ( = ?auto_46064 ?auto_46069 ) ) ( not ( = ?auto_46064 ?auto_46067 ) ) ( ON ?auto_46066 ?auto_46064 ) ( CLEAR ?auto_46066 ) ( HOLDING ?auto_46065 ) ( CLEAR ?auto_46067 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46069 ?auto_46067 ?auto_46065 )
      ( MAKE-1PILE ?auto_46063 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46070 - BLOCK
    )
    :vars
    (
      ?auto_46074 - BLOCK
      ?auto_46075 - BLOCK
      ?auto_46071 - BLOCK
      ?auto_46073 - BLOCK
      ?auto_46076 - BLOCK
      ?auto_46072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46074 ?auto_46070 ) ( ON-TABLE ?auto_46070 ) ( not ( = ?auto_46070 ?auto_46074 ) ) ( not ( = ?auto_46070 ?auto_46075 ) ) ( not ( = ?auto_46070 ?auto_46071 ) ) ( not ( = ?auto_46074 ?auto_46075 ) ) ( not ( = ?auto_46074 ?auto_46071 ) ) ( not ( = ?auto_46075 ?auto_46071 ) ) ( ON ?auto_46075 ?auto_46074 ) ( ON-TABLE ?auto_46073 ) ( ON ?auto_46076 ?auto_46073 ) ( not ( = ?auto_46073 ?auto_46076 ) ) ( not ( = ?auto_46073 ?auto_46072 ) ) ( not ( = ?auto_46073 ?auto_46071 ) ) ( not ( = ?auto_46076 ?auto_46072 ) ) ( not ( = ?auto_46076 ?auto_46071 ) ) ( not ( = ?auto_46072 ?auto_46071 ) ) ( not ( = ?auto_46070 ?auto_46072 ) ) ( not ( = ?auto_46070 ?auto_46073 ) ) ( not ( = ?auto_46070 ?auto_46076 ) ) ( not ( = ?auto_46074 ?auto_46072 ) ) ( not ( = ?auto_46074 ?auto_46073 ) ) ( not ( = ?auto_46074 ?auto_46076 ) ) ( not ( = ?auto_46075 ?auto_46072 ) ) ( not ( = ?auto_46075 ?auto_46073 ) ) ( not ( = ?auto_46075 ?auto_46076 ) ) ( ON ?auto_46071 ?auto_46075 ) ( CLEAR ?auto_46076 ) ( ON ?auto_46072 ?auto_46071 ) ( CLEAR ?auto_46072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46070 ?auto_46074 ?auto_46075 ?auto_46071 )
      ( MAKE-1PILE ?auto_46070 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46077 - BLOCK
    )
    :vars
    (
      ?auto_46083 - BLOCK
      ?auto_46082 - BLOCK
      ?auto_46078 - BLOCK
      ?auto_46081 - BLOCK
      ?auto_46080 - BLOCK
      ?auto_46079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46083 ?auto_46077 ) ( ON-TABLE ?auto_46077 ) ( not ( = ?auto_46077 ?auto_46083 ) ) ( not ( = ?auto_46077 ?auto_46082 ) ) ( not ( = ?auto_46077 ?auto_46078 ) ) ( not ( = ?auto_46083 ?auto_46082 ) ) ( not ( = ?auto_46083 ?auto_46078 ) ) ( not ( = ?auto_46082 ?auto_46078 ) ) ( ON ?auto_46082 ?auto_46083 ) ( ON-TABLE ?auto_46081 ) ( not ( = ?auto_46081 ?auto_46080 ) ) ( not ( = ?auto_46081 ?auto_46079 ) ) ( not ( = ?auto_46081 ?auto_46078 ) ) ( not ( = ?auto_46080 ?auto_46079 ) ) ( not ( = ?auto_46080 ?auto_46078 ) ) ( not ( = ?auto_46079 ?auto_46078 ) ) ( not ( = ?auto_46077 ?auto_46079 ) ) ( not ( = ?auto_46077 ?auto_46081 ) ) ( not ( = ?auto_46077 ?auto_46080 ) ) ( not ( = ?auto_46083 ?auto_46079 ) ) ( not ( = ?auto_46083 ?auto_46081 ) ) ( not ( = ?auto_46083 ?auto_46080 ) ) ( not ( = ?auto_46082 ?auto_46079 ) ) ( not ( = ?auto_46082 ?auto_46081 ) ) ( not ( = ?auto_46082 ?auto_46080 ) ) ( ON ?auto_46078 ?auto_46082 ) ( ON ?auto_46079 ?auto_46078 ) ( CLEAR ?auto_46079 ) ( HOLDING ?auto_46080 ) ( CLEAR ?auto_46081 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46081 ?auto_46080 )
      ( MAKE-1PILE ?auto_46077 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46930 - BLOCK
    )
    :vars
    (
      ?auto_46935 - BLOCK
      ?auto_46934 - BLOCK
      ?auto_46932 - BLOCK
      ?auto_46931 - BLOCK
      ?auto_46933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46935 ?auto_46930 ) ( ON-TABLE ?auto_46930 ) ( not ( = ?auto_46930 ?auto_46935 ) ) ( not ( = ?auto_46930 ?auto_46934 ) ) ( not ( = ?auto_46930 ?auto_46932 ) ) ( not ( = ?auto_46935 ?auto_46934 ) ) ( not ( = ?auto_46935 ?auto_46932 ) ) ( not ( = ?auto_46934 ?auto_46932 ) ) ( ON ?auto_46934 ?auto_46935 ) ( not ( = ?auto_46931 ?auto_46933 ) ) ( not ( = ?auto_46931 ?auto_46932 ) ) ( not ( = ?auto_46933 ?auto_46932 ) ) ( not ( = ?auto_46930 ?auto_46933 ) ) ( not ( = ?auto_46930 ?auto_46931 ) ) ( not ( = ?auto_46935 ?auto_46933 ) ) ( not ( = ?auto_46935 ?auto_46931 ) ) ( not ( = ?auto_46934 ?auto_46933 ) ) ( not ( = ?auto_46934 ?auto_46931 ) ) ( ON ?auto_46932 ?auto_46934 ) ( ON ?auto_46933 ?auto_46932 ) ( ON ?auto_46931 ?auto_46933 ) ( CLEAR ?auto_46931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46930 ?auto_46935 ?auto_46934 ?auto_46932 ?auto_46933 )
      ( MAKE-1PILE ?auto_46930 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46091 - BLOCK
    )
    :vars
    (
      ?auto_46092 - BLOCK
      ?auto_46095 - BLOCK
      ?auto_46096 - BLOCK
      ?auto_46097 - BLOCK
      ?auto_46094 - BLOCK
      ?auto_46093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46092 ?auto_46091 ) ( ON-TABLE ?auto_46091 ) ( not ( = ?auto_46091 ?auto_46092 ) ) ( not ( = ?auto_46091 ?auto_46095 ) ) ( not ( = ?auto_46091 ?auto_46096 ) ) ( not ( = ?auto_46092 ?auto_46095 ) ) ( not ( = ?auto_46092 ?auto_46096 ) ) ( not ( = ?auto_46095 ?auto_46096 ) ) ( ON ?auto_46095 ?auto_46092 ) ( not ( = ?auto_46097 ?auto_46094 ) ) ( not ( = ?auto_46097 ?auto_46093 ) ) ( not ( = ?auto_46097 ?auto_46096 ) ) ( not ( = ?auto_46094 ?auto_46093 ) ) ( not ( = ?auto_46094 ?auto_46096 ) ) ( not ( = ?auto_46093 ?auto_46096 ) ) ( not ( = ?auto_46091 ?auto_46093 ) ) ( not ( = ?auto_46091 ?auto_46097 ) ) ( not ( = ?auto_46091 ?auto_46094 ) ) ( not ( = ?auto_46092 ?auto_46093 ) ) ( not ( = ?auto_46092 ?auto_46097 ) ) ( not ( = ?auto_46092 ?auto_46094 ) ) ( not ( = ?auto_46095 ?auto_46093 ) ) ( not ( = ?auto_46095 ?auto_46097 ) ) ( not ( = ?auto_46095 ?auto_46094 ) ) ( ON ?auto_46096 ?auto_46095 ) ( ON ?auto_46093 ?auto_46096 ) ( ON ?auto_46094 ?auto_46093 ) ( CLEAR ?auto_46094 ) ( HOLDING ?auto_46097 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46097 )
      ( MAKE-1PILE ?auto_46091 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46098 - BLOCK
    )
    :vars
    (
      ?auto_46101 - BLOCK
      ?auto_46103 - BLOCK
      ?auto_46102 - BLOCK
      ?auto_46104 - BLOCK
      ?auto_46099 - BLOCK
      ?auto_46100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46101 ?auto_46098 ) ( ON-TABLE ?auto_46098 ) ( not ( = ?auto_46098 ?auto_46101 ) ) ( not ( = ?auto_46098 ?auto_46103 ) ) ( not ( = ?auto_46098 ?auto_46102 ) ) ( not ( = ?auto_46101 ?auto_46103 ) ) ( not ( = ?auto_46101 ?auto_46102 ) ) ( not ( = ?auto_46103 ?auto_46102 ) ) ( ON ?auto_46103 ?auto_46101 ) ( not ( = ?auto_46104 ?auto_46099 ) ) ( not ( = ?auto_46104 ?auto_46100 ) ) ( not ( = ?auto_46104 ?auto_46102 ) ) ( not ( = ?auto_46099 ?auto_46100 ) ) ( not ( = ?auto_46099 ?auto_46102 ) ) ( not ( = ?auto_46100 ?auto_46102 ) ) ( not ( = ?auto_46098 ?auto_46100 ) ) ( not ( = ?auto_46098 ?auto_46104 ) ) ( not ( = ?auto_46098 ?auto_46099 ) ) ( not ( = ?auto_46101 ?auto_46100 ) ) ( not ( = ?auto_46101 ?auto_46104 ) ) ( not ( = ?auto_46101 ?auto_46099 ) ) ( not ( = ?auto_46103 ?auto_46100 ) ) ( not ( = ?auto_46103 ?auto_46104 ) ) ( not ( = ?auto_46103 ?auto_46099 ) ) ( ON ?auto_46102 ?auto_46103 ) ( ON ?auto_46100 ?auto_46102 ) ( ON ?auto_46099 ?auto_46100 ) ( ON ?auto_46104 ?auto_46099 ) ( CLEAR ?auto_46104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46098 ?auto_46101 ?auto_46103 ?auto_46102 ?auto_46100 ?auto_46099 )
      ( MAKE-1PILE ?auto_46098 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46111 - BLOCK
      ?auto_46112 - BLOCK
      ?auto_46113 - BLOCK
      ?auto_46114 - BLOCK
      ?auto_46115 - BLOCK
      ?auto_46116 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_46116 ) ( CLEAR ?auto_46115 ) ( ON-TABLE ?auto_46111 ) ( ON ?auto_46112 ?auto_46111 ) ( ON ?auto_46113 ?auto_46112 ) ( ON ?auto_46114 ?auto_46113 ) ( ON ?auto_46115 ?auto_46114 ) ( not ( = ?auto_46111 ?auto_46112 ) ) ( not ( = ?auto_46111 ?auto_46113 ) ) ( not ( = ?auto_46111 ?auto_46114 ) ) ( not ( = ?auto_46111 ?auto_46115 ) ) ( not ( = ?auto_46111 ?auto_46116 ) ) ( not ( = ?auto_46112 ?auto_46113 ) ) ( not ( = ?auto_46112 ?auto_46114 ) ) ( not ( = ?auto_46112 ?auto_46115 ) ) ( not ( = ?auto_46112 ?auto_46116 ) ) ( not ( = ?auto_46113 ?auto_46114 ) ) ( not ( = ?auto_46113 ?auto_46115 ) ) ( not ( = ?auto_46113 ?auto_46116 ) ) ( not ( = ?auto_46114 ?auto_46115 ) ) ( not ( = ?auto_46114 ?auto_46116 ) ) ( not ( = ?auto_46115 ?auto_46116 ) ) )
    :subtasks
    ( ( !STACK ?auto_46116 ?auto_46115 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46117 - BLOCK
      ?auto_46118 - BLOCK
      ?auto_46119 - BLOCK
      ?auto_46120 - BLOCK
      ?auto_46121 - BLOCK
      ?auto_46122 - BLOCK
    )
    :vars
    (
      ?auto_46123 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46121 ) ( ON-TABLE ?auto_46117 ) ( ON ?auto_46118 ?auto_46117 ) ( ON ?auto_46119 ?auto_46118 ) ( ON ?auto_46120 ?auto_46119 ) ( ON ?auto_46121 ?auto_46120 ) ( not ( = ?auto_46117 ?auto_46118 ) ) ( not ( = ?auto_46117 ?auto_46119 ) ) ( not ( = ?auto_46117 ?auto_46120 ) ) ( not ( = ?auto_46117 ?auto_46121 ) ) ( not ( = ?auto_46117 ?auto_46122 ) ) ( not ( = ?auto_46118 ?auto_46119 ) ) ( not ( = ?auto_46118 ?auto_46120 ) ) ( not ( = ?auto_46118 ?auto_46121 ) ) ( not ( = ?auto_46118 ?auto_46122 ) ) ( not ( = ?auto_46119 ?auto_46120 ) ) ( not ( = ?auto_46119 ?auto_46121 ) ) ( not ( = ?auto_46119 ?auto_46122 ) ) ( not ( = ?auto_46120 ?auto_46121 ) ) ( not ( = ?auto_46120 ?auto_46122 ) ) ( not ( = ?auto_46121 ?auto_46122 ) ) ( ON ?auto_46122 ?auto_46123 ) ( CLEAR ?auto_46122 ) ( HAND-EMPTY ) ( not ( = ?auto_46117 ?auto_46123 ) ) ( not ( = ?auto_46118 ?auto_46123 ) ) ( not ( = ?auto_46119 ?auto_46123 ) ) ( not ( = ?auto_46120 ?auto_46123 ) ) ( not ( = ?auto_46121 ?auto_46123 ) ) ( not ( = ?auto_46122 ?auto_46123 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46122 ?auto_46123 )
      ( MAKE-6PILE ?auto_46117 ?auto_46118 ?auto_46119 ?auto_46120 ?auto_46121 ?auto_46122 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46124 - BLOCK
      ?auto_46125 - BLOCK
      ?auto_46126 - BLOCK
      ?auto_46127 - BLOCK
      ?auto_46128 - BLOCK
      ?auto_46129 - BLOCK
    )
    :vars
    (
      ?auto_46130 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46124 ) ( ON ?auto_46125 ?auto_46124 ) ( ON ?auto_46126 ?auto_46125 ) ( ON ?auto_46127 ?auto_46126 ) ( not ( = ?auto_46124 ?auto_46125 ) ) ( not ( = ?auto_46124 ?auto_46126 ) ) ( not ( = ?auto_46124 ?auto_46127 ) ) ( not ( = ?auto_46124 ?auto_46128 ) ) ( not ( = ?auto_46124 ?auto_46129 ) ) ( not ( = ?auto_46125 ?auto_46126 ) ) ( not ( = ?auto_46125 ?auto_46127 ) ) ( not ( = ?auto_46125 ?auto_46128 ) ) ( not ( = ?auto_46125 ?auto_46129 ) ) ( not ( = ?auto_46126 ?auto_46127 ) ) ( not ( = ?auto_46126 ?auto_46128 ) ) ( not ( = ?auto_46126 ?auto_46129 ) ) ( not ( = ?auto_46127 ?auto_46128 ) ) ( not ( = ?auto_46127 ?auto_46129 ) ) ( not ( = ?auto_46128 ?auto_46129 ) ) ( ON ?auto_46129 ?auto_46130 ) ( CLEAR ?auto_46129 ) ( not ( = ?auto_46124 ?auto_46130 ) ) ( not ( = ?auto_46125 ?auto_46130 ) ) ( not ( = ?auto_46126 ?auto_46130 ) ) ( not ( = ?auto_46127 ?auto_46130 ) ) ( not ( = ?auto_46128 ?auto_46130 ) ) ( not ( = ?auto_46129 ?auto_46130 ) ) ( HOLDING ?auto_46128 ) ( CLEAR ?auto_46127 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46124 ?auto_46125 ?auto_46126 ?auto_46127 ?auto_46128 )
      ( MAKE-6PILE ?auto_46124 ?auto_46125 ?auto_46126 ?auto_46127 ?auto_46128 ?auto_46129 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46131 - BLOCK
      ?auto_46132 - BLOCK
      ?auto_46133 - BLOCK
      ?auto_46134 - BLOCK
      ?auto_46135 - BLOCK
      ?auto_46136 - BLOCK
    )
    :vars
    (
      ?auto_46137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46131 ) ( ON ?auto_46132 ?auto_46131 ) ( ON ?auto_46133 ?auto_46132 ) ( ON ?auto_46134 ?auto_46133 ) ( not ( = ?auto_46131 ?auto_46132 ) ) ( not ( = ?auto_46131 ?auto_46133 ) ) ( not ( = ?auto_46131 ?auto_46134 ) ) ( not ( = ?auto_46131 ?auto_46135 ) ) ( not ( = ?auto_46131 ?auto_46136 ) ) ( not ( = ?auto_46132 ?auto_46133 ) ) ( not ( = ?auto_46132 ?auto_46134 ) ) ( not ( = ?auto_46132 ?auto_46135 ) ) ( not ( = ?auto_46132 ?auto_46136 ) ) ( not ( = ?auto_46133 ?auto_46134 ) ) ( not ( = ?auto_46133 ?auto_46135 ) ) ( not ( = ?auto_46133 ?auto_46136 ) ) ( not ( = ?auto_46134 ?auto_46135 ) ) ( not ( = ?auto_46134 ?auto_46136 ) ) ( not ( = ?auto_46135 ?auto_46136 ) ) ( ON ?auto_46136 ?auto_46137 ) ( not ( = ?auto_46131 ?auto_46137 ) ) ( not ( = ?auto_46132 ?auto_46137 ) ) ( not ( = ?auto_46133 ?auto_46137 ) ) ( not ( = ?auto_46134 ?auto_46137 ) ) ( not ( = ?auto_46135 ?auto_46137 ) ) ( not ( = ?auto_46136 ?auto_46137 ) ) ( CLEAR ?auto_46134 ) ( ON ?auto_46135 ?auto_46136 ) ( CLEAR ?auto_46135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46137 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46137 ?auto_46136 )
      ( MAKE-6PILE ?auto_46131 ?auto_46132 ?auto_46133 ?auto_46134 ?auto_46135 ?auto_46136 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46138 - BLOCK
      ?auto_46139 - BLOCK
      ?auto_46140 - BLOCK
      ?auto_46141 - BLOCK
      ?auto_46142 - BLOCK
      ?auto_46143 - BLOCK
    )
    :vars
    (
      ?auto_46144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46138 ) ( ON ?auto_46139 ?auto_46138 ) ( ON ?auto_46140 ?auto_46139 ) ( not ( = ?auto_46138 ?auto_46139 ) ) ( not ( = ?auto_46138 ?auto_46140 ) ) ( not ( = ?auto_46138 ?auto_46141 ) ) ( not ( = ?auto_46138 ?auto_46142 ) ) ( not ( = ?auto_46138 ?auto_46143 ) ) ( not ( = ?auto_46139 ?auto_46140 ) ) ( not ( = ?auto_46139 ?auto_46141 ) ) ( not ( = ?auto_46139 ?auto_46142 ) ) ( not ( = ?auto_46139 ?auto_46143 ) ) ( not ( = ?auto_46140 ?auto_46141 ) ) ( not ( = ?auto_46140 ?auto_46142 ) ) ( not ( = ?auto_46140 ?auto_46143 ) ) ( not ( = ?auto_46141 ?auto_46142 ) ) ( not ( = ?auto_46141 ?auto_46143 ) ) ( not ( = ?auto_46142 ?auto_46143 ) ) ( ON ?auto_46143 ?auto_46144 ) ( not ( = ?auto_46138 ?auto_46144 ) ) ( not ( = ?auto_46139 ?auto_46144 ) ) ( not ( = ?auto_46140 ?auto_46144 ) ) ( not ( = ?auto_46141 ?auto_46144 ) ) ( not ( = ?auto_46142 ?auto_46144 ) ) ( not ( = ?auto_46143 ?auto_46144 ) ) ( ON ?auto_46142 ?auto_46143 ) ( CLEAR ?auto_46142 ) ( ON-TABLE ?auto_46144 ) ( HOLDING ?auto_46141 ) ( CLEAR ?auto_46140 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46138 ?auto_46139 ?auto_46140 ?auto_46141 )
      ( MAKE-6PILE ?auto_46138 ?auto_46139 ?auto_46140 ?auto_46141 ?auto_46142 ?auto_46143 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46145 - BLOCK
      ?auto_46146 - BLOCK
      ?auto_46147 - BLOCK
      ?auto_46148 - BLOCK
      ?auto_46149 - BLOCK
      ?auto_46150 - BLOCK
    )
    :vars
    (
      ?auto_46151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46145 ) ( ON ?auto_46146 ?auto_46145 ) ( ON ?auto_46147 ?auto_46146 ) ( not ( = ?auto_46145 ?auto_46146 ) ) ( not ( = ?auto_46145 ?auto_46147 ) ) ( not ( = ?auto_46145 ?auto_46148 ) ) ( not ( = ?auto_46145 ?auto_46149 ) ) ( not ( = ?auto_46145 ?auto_46150 ) ) ( not ( = ?auto_46146 ?auto_46147 ) ) ( not ( = ?auto_46146 ?auto_46148 ) ) ( not ( = ?auto_46146 ?auto_46149 ) ) ( not ( = ?auto_46146 ?auto_46150 ) ) ( not ( = ?auto_46147 ?auto_46148 ) ) ( not ( = ?auto_46147 ?auto_46149 ) ) ( not ( = ?auto_46147 ?auto_46150 ) ) ( not ( = ?auto_46148 ?auto_46149 ) ) ( not ( = ?auto_46148 ?auto_46150 ) ) ( not ( = ?auto_46149 ?auto_46150 ) ) ( ON ?auto_46150 ?auto_46151 ) ( not ( = ?auto_46145 ?auto_46151 ) ) ( not ( = ?auto_46146 ?auto_46151 ) ) ( not ( = ?auto_46147 ?auto_46151 ) ) ( not ( = ?auto_46148 ?auto_46151 ) ) ( not ( = ?auto_46149 ?auto_46151 ) ) ( not ( = ?auto_46150 ?auto_46151 ) ) ( ON ?auto_46149 ?auto_46150 ) ( ON-TABLE ?auto_46151 ) ( CLEAR ?auto_46147 ) ( ON ?auto_46148 ?auto_46149 ) ( CLEAR ?auto_46148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46151 ?auto_46150 ?auto_46149 )
      ( MAKE-6PILE ?auto_46145 ?auto_46146 ?auto_46147 ?auto_46148 ?auto_46149 ?auto_46150 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46152 - BLOCK
      ?auto_46153 - BLOCK
      ?auto_46154 - BLOCK
      ?auto_46155 - BLOCK
      ?auto_46156 - BLOCK
      ?auto_46157 - BLOCK
    )
    :vars
    (
      ?auto_46158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46152 ) ( ON ?auto_46153 ?auto_46152 ) ( not ( = ?auto_46152 ?auto_46153 ) ) ( not ( = ?auto_46152 ?auto_46154 ) ) ( not ( = ?auto_46152 ?auto_46155 ) ) ( not ( = ?auto_46152 ?auto_46156 ) ) ( not ( = ?auto_46152 ?auto_46157 ) ) ( not ( = ?auto_46153 ?auto_46154 ) ) ( not ( = ?auto_46153 ?auto_46155 ) ) ( not ( = ?auto_46153 ?auto_46156 ) ) ( not ( = ?auto_46153 ?auto_46157 ) ) ( not ( = ?auto_46154 ?auto_46155 ) ) ( not ( = ?auto_46154 ?auto_46156 ) ) ( not ( = ?auto_46154 ?auto_46157 ) ) ( not ( = ?auto_46155 ?auto_46156 ) ) ( not ( = ?auto_46155 ?auto_46157 ) ) ( not ( = ?auto_46156 ?auto_46157 ) ) ( ON ?auto_46157 ?auto_46158 ) ( not ( = ?auto_46152 ?auto_46158 ) ) ( not ( = ?auto_46153 ?auto_46158 ) ) ( not ( = ?auto_46154 ?auto_46158 ) ) ( not ( = ?auto_46155 ?auto_46158 ) ) ( not ( = ?auto_46156 ?auto_46158 ) ) ( not ( = ?auto_46157 ?auto_46158 ) ) ( ON ?auto_46156 ?auto_46157 ) ( ON-TABLE ?auto_46158 ) ( ON ?auto_46155 ?auto_46156 ) ( CLEAR ?auto_46155 ) ( HOLDING ?auto_46154 ) ( CLEAR ?auto_46153 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46152 ?auto_46153 ?auto_46154 )
      ( MAKE-6PILE ?auto_46152 ?auto_46153 ?auto_46154 ?auto_46155 ?auto_46156 ?auto_46157 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46159 - BLOCK
      ?auto_46160 - BLOCK
      ?auto_46161 - BLOCK
      ?auto_46162 - BLOCK
      ?auto_46163 - BLOCK
      ?auto_46164 - BLOCK
    )
    :vars
    (
      ?auto_46165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46159 ) ( ON ?auto_46160 ?auto_46159 ) ( not ( = ?auto_46159 ?auto_46160 ) ) ( not ( = ?auto_46159 ?auto_46161 ) ) ( not ( = ?auto_46159 ?auto_46162 ) ) ( not ( = ?auto_46159 ?auto_46163 ) ) ( not ( = ?auto_46159 ?auto_46164 ) ) ( not ( = ?auto_46160 ?auto_46161 ) ) ( not ( = ?auto_46160 ?auto_46162 ) ) ( not ( = ?auto_46160 ?auto_46163 ) ) ( not ( = ?auto_46160 ?auto_46164 ) ) ( not ( = ?auto_46161 ?auto_46162 ) ) ( not ( = ?auto_46161 ?auto_46163 ) ) ( not ( = ?auto_46161 ?auto_46164 ) ) ( not ( = ?auto_46162 ?auto_46163 ) ) ( not ( = ?auto_46162 ?auto_46164 ) ) ( not ( = ?auto_46163 ?auto_46164 ) ) ( ON ?auto_46164 ?auto_46165 ) ( not ( = ?auto_46159 ?auto_46165 ) ) ( not ( = ?auto_46160 ?auto_46165 ) ) ( not ( = ?auto_46161 ?auto_46165 ) ) ( not ( = ?auto_46162 ?auto_46165 ) ) ( not ( = ?auto_46163 ?auto_46165 ) ) ( not ( = ?auto_46164 ?auto_46165 ) ) ( ON ?auto_46163 ?auto_46164 ) ( ON-TABLE ?auto_46165 ) ( ON ?auto_46162 ?auto_46163 ) ( CLEAR ?auto_46160 ) ( ON ?auto_46161 ?auto_46162 ) ( CLEAR ?auto_46161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46165 ?auto_46164 ?auto_46163 ?auto_46162 )
      ( MAKE-6PILE ?auto_46159 ?auto_46160 ?auto_46161 ?auto_46162 ?auto_46163 ?auto_46164 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46166 - BLOCK
      ?auto_46167 - BLOCK
      ?auto_46168 - BLOCK
      ?auto_46169 - BLOCK
      ?auto_46170 - BLOCK
      ?auto_46171 - BLOCK
    )
    :vars
    (
      ?auto_46172 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46166 ) ( not ( = ?auto_46166 ?auto_46167 ) ) ( not ( = ?auto_46166 ?auto_46168 ) ) ( not ( = ?auto_46166 ?auto_46169 ) ) ( not ( = ?auto_46166 ?auto_46170 ) ) ( not ( = ?auto_46166 ?auto_46171 ) ) ( not ( = ?auto_46167 ?auto_46168 ) ) ( not ( = ?auto_46167 ?auto_46169 ) ) ( not ( = ?auto_46167 ?auto_46170 ) ) ( not ( = ?auto_46167 ?auto_46171 ) ) ( not ( = ?auto_46168 ?auto_46169 ) ) ( not ( = ?auto_46168 ?auto_46170 ) ) ( not ( = ?auto_46168 ?auto_46171 ) ) ( not ( = ?auto_46169 ?auto_46170 ) ) ( not ( = ?auto_46169 ?auto_46171 ) ) ( not ( = ?auto_46170 ?auto_46171 ) ) ( ON ?auto_46171 ?auto_46172 ) ( not ( = ?auto_46166 ?auto_46172 ) ) ( not ( = ?auto_46167 ?auto_46172 ) ) ( not ( = ?auto_46168 ?auto_46172 ) ) ( not ( = ?auto_46169 ?auto_46172 ) ) ( not ( = ?auto_46170 ?auto_46172 ) ) ( not ( = ?auto_46171 ?auto_46172 ) ) ( ON ?auto_46170 ?auto_46171 ) ( ON-TABLE ?auto_46172 ) ( ON ?auto_46169 ?auto_46170 ) ( ON ?auto_46168 ?auto_46169 ) ( CLEAR ?auto_46168 ) ( HOLDING ?auto_46167 ) ( CLEAR ?auto_46166 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46166 ?auto_46167 )
      ( MAKE-6PILE ?auto_46166 ?auto_46167 ?auto_46168 ?auto_46169 ?auto_46170 ?auto_46171 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46173 - BLOCK
      ?auto_46174 - BLOCK
      ?auto_46175 - BLOCK
      ?auto_46176 - BLOCK
      ?auto_46177 - BLOCK
      ?auto_46178 - BLOCK
    )
    :vars
    (
      ?auto_46179 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46173 ) ( not ( = ?auto_46173 ?auto_46174 ) ) ( not ( = ?auto_46173 ?auto_46175 ) ) ( not ( = ?auto_46173 ?auto_46176 ) ) ( not ( = ?auto_46173 ?auto_46177 ) ) ( not ( = ?auto_46173 ?auto_46178 ) ) ( not ( = ?auto_46174 ?auto_46175 ) ) ( not ( = ?auto_46174 ?auto_46176 ) ) ( not ( = ?auto_46174 ?auto_46177 ) ) ( not ( = ?auto_46174 ?auto_46178 ) ) ( not ( = ?auto_46175 ?auto_46176 ) ) ( not ( = ?auto_46175 ?auto_46177 ) ) ( not ( = ?auto_46175 ?auto_46178 ) ) ( not ( = ?auto_46176 ?auto_46177 ) ) ( not ( = ?auto_46176 ?auto_46178 ) ) ( not ( = ?auto_46177 ?auto_46178 ) ) ( ON ?auto_46178 ?auto_46179 ) ( not ( = ?auto_46173 ?auto_46179 ) ) ( not ( = ?auto_46174 ?auto_46179 ) ) ( not ( = ?auto_46175 ?auto_46179 ) ) ( not ( = ?auto_46176 ?auto_46179 ) ) ( not ( = ?auto_46177 ?auto_46179 ) ) ( not ( = ?auto_46178 ?auto_46179 ) ) ( ON ?auto_46177 ?auto_46178 ) ( ON-TABLE ?auto_46179 ) ( ON ?auto_46176 ?auto_46177 ) ( ON ?auto_46175 ?auto_46176 ) ( CLEAR ?auto_46173 ) ( ON ?auto_46174 ?auto_46175 ) ( CLEAR ?auto_46174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46179 ?auto_46178 ?auto_46177 ?auto_46176 ?auto_46175 )
      ( MAKE-6PILE ?auto_46173 ?auto_46174 ?auto_46175 ?auto_46176 ?auto_46177 ?auto_46178 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46180 - BLOCK
      ?auto_46181 - BLOCK
      ?auto_46182 - BLOCK
      ?auto_46183 - BLOCK
      ?auto_46184 - BLOCK
      ?auto_46185 - BLOCK
    )
    :vars
    (
      ?auto_46186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46180 ?auto_46181 ) ) ( not ( = ?auto_46180 ?auto_46182 ) ) ( not ( = ?auto_46180 ?auto_46183 ) ) ( not ( = ?auto_46180 ?auto_46184 ) ) ( not ( = ?auto_46180 ?auto_46185 ) ) ( not ( = ?auto_46181 ?auto_46182 ) ) ( not ( = ?auto_46181 ?auto_46183 ) ) ( not ( = ?auto_46181 ?auto_46184 ) ) ( not ( = ?auto_46181 ?auto_46185 ) ) ( not ( = ?auto_46182 ?auto_46183 ) ) ( not ( = ?auto_46182 ?auto_46184 ) ) ( not ( = ?auto_46182 ?auto_46185 ) ) ( not ( = ?auto_46183 ?auto_46184 ) ) ( not ( = ?auto_46183 ?auto_46185 ) ) ( not ( = ?auto_46184 ?auto_46185 ) ) ( ON ?auto_46185 ?auto_46186 ) ( not ( = ?auto_46180 ?auto_46186 ) ) ( not ( = ?auto_46181 ?auto_46186 ) ) ( not ( = ?auto_46182 ?auto_46186 ) ) ( not ( = ?auto_46183 ?auto_46186 ) ) ( not ( = ?auto_46184 ?auto_46186 ) ) ( not ( = ?auto_46185 ?auto_46186 ) ) ( ON ?auto_46184 ?auto_46185 ) ( ON-TABLE ?auto_46186 ) ( ON ?auto_46183 ?auto_46184 ) ( ON ?auto_46182 ?auto_46183 ) ( ON ?auto_46181 ?auto_46182 ) ( CLEAR ?auto_46181 ) ( HOLDING ?auto_46180 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46180 )
      ( MAKE-6PILE ?auto_46180 ?auto_46181 ?auto_46182 ?auto_46183 ?auto_46184 ?auto_46185 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46187 - BLOCK
      ?auto_46188 - BLOCK
      ?auto_46189 - BLOCK
      ?auto_46190 - BLOCK
      ?auto_46191 - BLOCK
      ?auto_46192 - BLOCK
    )
    :vars
    (
      ?auto_46193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46187 ?auto_46188 ) ) ( not ( = ?auto_46187 ?auto_46189 ) ) ( not ( = ?auto_46187 ?auto_46190 ) ) ( not ( = ?auto_46187 ?auto_46191 ) ) ( not ( = ?auto_46187 ?auto_46192 ) ) ( not ( = ?auto_46188 ?auto_46189 ) ) ( not ( = ?auto_46188 ?auto_46190 ) ) ( not ( = ?auto_46188 ?auto_46191 ) ) ( not ( = ?auto_46188 ?auto_46192 ) ) ( not ( = ?auto_46189 ?auto_46190 ) ) ( not ( = ?auto_46189 ?auto_46191 ) ) ( not ( = ?auto_46189 ?auto_46192 ) ) ( not ( = ?auto_46190 ?auto_46191 ) ) ( not ( = ?auto_46190 ?auto_46192 ) ) ( not ( = ?auto_46191 ?auto_46192 ) ) ( ON ?auto_46192 ?auto_46193 ) ( not ( = ?auto_46187 ?auto_46193 ) ) ( not ( = ?auto_46188 ?auto_46193 ) ) ( not ( = ?auto_46189 ?auto_46193 ) ) ( not ( = ?auto_46190 ?auto_46193 ) ) ( not ( = ?auto_46191 ?auto_46193 ) ) ( not ( = ?auto_46192 ?auto_46193 ) ) ( ON ?auto_46191 ?auto_46192 ) ( ON-TABLE ?auto_46193 ) ( ON ?auto_46190 ?auto_46191 ) ( ON ?auto_46189 ?auto_46190 ) ( ON ?auto_46188 ?auto_46189 ) ( ON ?auto_46187 ?auto_46188 ) ( CLEAR ?auto_46187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46193 ?auto_46192 ?auto_46191 ?auto_46190 ?auto_46189 ?auto_46188 )
      ( MAKE-6PILE ?auto_46187 ?auto_46188 ?auto_46189 ?auto_46190 ?auto_46191 ?auto_46192 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46274 - BLOCK
    )
    :vars
    (
      ?auto_46275 - BLOCK
      ?auto_46276 - BLOCK
      ?auto_46277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46274 ?auto_46275 ) ( CLEAR ?auto_46274 ) ( not ( = ?auto_46274 ?auto_46275 ) ) ( HOLDING ?auto_46276 ) ( CLEAR ?auto_46277 ) ( not ( = ?auto_46274 ?auto_46276 ) ) ( not ( = ?auto_46274 ?auto_46277 ) ) ( not ( = ?auto_46275 ?auto_46276 ) ) ( not ( = ?auto_46275 ?auto_46277 ) ) ( not ( = ?auto_46276 ?auto_46277 ) ) )
    :subtasks
    ( ( !STACK ?auto_46276 ?auto_46277 )
      ( MAKE-1PILE ?auto_46274 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46278 - BLOCK
    )
    :vars
    (
      ?auto_46281 - BLOCK
      ?auto_46280 - BLOCK
      ?auto_46279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46278 ?auto_46281 ) ( not ( = ?auto_46278 ?auto_46281 ) ) ( CLEAR ?auto_46280 ) ( not ( = ?auto_46278 ?auto_46279 ) ) ( not ( = ?auto_46278 ?auto_46280 ) ) ( not ( = ?auto_46281 ?auto_46279 ) ) ( not ( = ?auto_46281 ?auto_46280 ) ) ( not ( = ?auto_46279 ?auto_46280 ) ) ( ON ?auto_46279 ?auto_46278 ) ( CLEAR ?auto_46279 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46281 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46281 ?auto_46278 )
      ( MAKE-1PILE ?auto_46278 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46282 - BLOCK
    )
    :vars
    (
      ?auto_46283 - BLOCK
      ?auto_46284 - BLOCK
      ?auto_46285 - BLOCK
      ?auto_46286 - BLOCK
      ?auto_46288 - BLOCK
      ?auto_46287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46282 ?auto_46283 ) ( not ( = ?auto_46282 ?auto_46283 ) ) ( not ( = ?auto_46282 ?auto_46284 ) ) ( not ( = ?auto_46282 ?auto_46285 ) ) ( not ( = ?auto_46283 ?auto_46284 ) ) ( not ( = ?auto_46283 ?auto_46285 ) ) ( not ( = ?auto_46284 ?auto_46285 ) ) ( ON ?auto_46284 ?auto_46282 ) ( CLEAR ?auto_46284 ) ( ON-TABLE ?auto_46283 ) ( HOLDING ?auto_46285 ) ( CLEAR ?auto_46286 ) ( ON-TABLE ?auto_46288 ) ( ON ?auto_46287 ?auto_46288 ) ( ON ?auto_46286 ?auto_46287 ) ( not ( = ?auto_46288 ?auto_46287 ) ) ( not ( = ?auto_46288 ?auto_46286 ) ) ( not ( = ?auto_46288 ?auto_46285 ) ) ( not ( = ?auto_46287 ?auto_46286 ) ) ( not ( = ?auto_46287 ?auto_46285 ) ) ( not ( = ?auto_46286 ?auto_46285 ) ) ( not ( = ?auto_46282 ?auto_46286 ) ) ( not ( = ?auto_46282 ?auto_46288 ) ) ( not ( = ?auto_46282 ?auto_46287 ) ) ( not ( = ?auto_46283 ?auto_46286 ) ) ( not ( = ?auto_46283 ?auto_46288 ) ) ( not ( = ?auto_46283 ?auto_46287 ) ) ( not ( = ?auto_46284 ?auto_46286 ) ) ( not ( = ?auto_46284 ?auto_46288 ) ) ( not ( = ?auto_46284 ?auto_46287 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46288 ?auto_46287 ?auto_46286 ?auto_46285 )
      ( MAKE-1PILE ?auto_46282 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46289 - BLOCK
    )
    :vars
    (
      ?auto_46292 - BLOCK
      ?auto_46291 - BLOCK
      ?auto_46290 - BLOCK
      ?auto_46295 - BLOCK
      ?auto_46293 - BLOCK
      ?auto_46294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46289 ?auto_46292 ) ( not ( = ?auto_46289 ?auto_46292 ) ) ( not ( = ?auto_46289 ?auto_46291 ) ) ( not ( = ?auto_46289 ?auto_46290 ) ) ( not ( = ?auto_46292 ?auto_46291 ) ) ( not ( = ?auto_46292 ?auto_46290 ) ) ( not ( = ?auto_46291 ?auto_46290 ) ) ( ON ?auto_46291 ?auto_46289 ) ( ON-TABLE ?auto_46292 ) ( CLEAR ?auto_46295 ) ( ON-TABLE ?auto_46293 ) ( ON ?auto_46294 ?auto_46293 ) ( ON ?auto_46295 ?auto_46294 ) ( not ( = ?auto_46293 ?auto_46294 ) ) ( not ( = ?auto_46293 ?auto_46295 ) ) ( not ( = ?auto_46293 ?auto_46290 ) ) ( not ( = ?auto_46294 ?auto_46295 ) ) ( not ( = ?auto_46294 ?auto_46290 ) ) ( not ( = ?auto_46295 ?auto_46290 ) ) ( not ( = ?auto_46289 ?auto_46295 ) ) ( not ( = ?auto_46289 ?auto_46293 ) ) ( not ( = ?auto_46289 ?auto_46294 ) ) ( not ( = ?auto_46292 ?auto_46295 ) ) ( not ( = ?auto_46292 ?auto_46293 ) ) ( not ( = ?auto_46292 ?auto_46294 ) ) ( not ( = ?auto_46291 ?auto_46295 ) ) ( not ( = ?auto_46291 ?auto_46293 ) ) ( not ( = ?auto_46291 ?auto_46294 ) ) ( ON ?auto_46290 ?auto_46291 ) ( CLEAR ?auto_46290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46292 ?auto_46289 ?auto_46291 )
      ( MAKE-1PILE ?auto_46289 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46296 - BLOCK
    )
    :vars
    (
      ?auto_46302 - BLOCK
      ?auto_46298 - BLOCK
      ?auto_46300 - BLOCK
      ?auto_46297 - BLOCK
      ?auto_46301 - BLOCK
      ?auto_46299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46296 ?auto_46302 ) ( not ( = ?auto_46296 ?auto_46302 ) ) ( not ( = ?auto_46296 ?auto_46298 ) ) ( not ( = ?auto_46296 ?auto_46300 ) ) ( not ( = ?auto_46302 ?auto_46298 ) ) ( not ( = ?auto_46302 ?auto_46300 ) ) ( not ( = ?auto_46298 ?auto_46300 ) ) ( ON ?auto_46298 ?auto_46296 ) ( ON-TABLE ?auto_46302 ) ( ON-TABLE ?auto_46297 ) ( ON ?auto_46301 ?auto_46297 ) ( not ( = ?auto_46297 ?auto_46301 ) ) ( not ( = ?auto_46297 ?auto_46299 ) ) ( not ( = ?auto_46297 ?auto_46300 ) ) ( not ( = ?auto_46301 ?auto_46299 ) ) ( not ( = ?auto_46301 ?auto_46300 ) ) ( not ( = ?auto_46299 ?auto_46300 ) ) ( not ( = ?auto_46296 ?auto_46299 ) ) ( not ( = ?auto_46296 ?auto_46297 ) ) ( not ( = ?auto_46296 ?auto_46301 ) ) ( not ( = ?auto_46302 ?auto_46299 ) ) ( not ( = ?auto_46302 ?auto_46297 ) ) ( not ( = ?auto_46302 ?auto_46301 ) ) ( not ( = ?auto_46298 ?auto_46299 ) ) ( not ( = ?auto_46298 ?auto_46297 ) ) ( not ( = ?auto_46298 ?auto_46301 ) ) ( ON ?auto_46300 ?auto_46298 ) ( CLEAR ?auto_46300 ) ( HOLDING ?auto_46299 ) ( CLEAR ?auto_46301 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46297 ?auto_46301 ?auto_46299 )
      ( MAKE-1PILE ?auto_46296 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46303 - BLOCK
    )
    :vars
    (
      ?auto_46309 - BLOCK
      ?auto_46304 - BLOCK
      ?auto_46307 - BLOCK
      ?auto_46308 - BLOCK
      ?auto_46306 - BLOCK
      ?auto_46305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46303 ?auto_46309 ) ( not ( = ?auto_46303 ?auto_46309 ) ) ( not ( = ?auto_46303 ?auto_46304 ) ) ( not ( = ?auto_46303 ?auto_46307 ) ) ( not ( = ?auto_46309 ?auto_46304 ) ) ( not ( = ?auto_46309 ?auto_46307 ) ) ( not ( = ?auto_46304 ?auto_46307 ) ) ( ON ?auto_46304 ?auto_46303 ) ( ON-TABLE ?auto_46309 ) ( ON-TABLE ?auto_46308 ) ( ON ?auto_46306 ?auto_46308 ) ( not ( = ?auto_46308 ?auto_46306 ) ) ( not ( = ?auto_46308 ?auto_46305 ) ) ( not ( = ?auto_46308 ?auto_46307 ) ) ( not ( = ?auto_46306 ?auto_46305 ) ) ( not ( = ?auto_46306 ?auto_46307 ) ) ( not ( = ?auto_46305 ?auto_46307 ) ) ( not ( = ?auto_46303 ?auto_46305 ) ) ( not ( = ?auto_46303 ?auto_46308 ) ) ( not ( = ?auto_46303 ?auto_46306 ) ) ( not ( = ?auto_46309 ?auto_46305 ) ) ( not ( = ?auto_46309 ?auto_46308 ) ) ( not ( = ?auto_46309 ?auto_46306 ) ) ( not ( = ?auto_46304 ?auto_46305 ) ) ( not ( = ?auto_46304 ?auto_46308 ) ) ( not ( = ?auto_46304 ?auto_46306 ) ) ( ON ?auto_46307 ?auto_46304 ) ( CLEAR ?auto_46306 ) ( ON ?auto_46305 ?auto_46307 ) ( CLEAR ?auto_46305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46309 ?auto_46303 ?auto_46304 ?auto_46307 )
      ( MAKE-1PILE ?auto_46303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46310 - BLOCK
    )
    :vars
    (
      ?auto_46314 - BLOCK
      ?auto_46311 - BLOCK
      ?auto_46315 - BLOCK
      ?auto_46313 - BLOCK
      ?auto_46316 - BLOCK
      ?auto_46312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46310 ?auto_46314 ) ( not ( = ?auto_46310 ?auto_46314 ) ) ( not ( = ?auto_46310 ?auto_46311 ) ) ( not ( = ?auto_46310 ?auto_46315 ) ) ( not ( = ?auto_46314 ?auto_46311 ) ) ( not ( = ?auto_46314 ?auto_46315 ) ) ( not ( = ?auto_46311 ?auto_46315 ) ) ( ON ?auto_46311 ?auto_46310 ) ( ON-TABLE ?auto_46314 ) ( ON-TABLE ?auto_46313 ) ( not ( = ?auto_46313 ?auto_46316 ) ) ( not ( = ?auto_46313 ?auto_46312 ) ) ( not ( = ?auto_46313 ?auto_46315 ) ) ( not ( = ?auto_46316 ?auto_46312 ) ) ( not ( = ?auto_46316 ?auto_46315 ) ) ( not ( = ?auto_46312 ?auto_46315 ) ) ( not ( = ?auto_46310 ?auto_46312 ) ) ( not ( = ?auto_46310 ?auto_46313 ) ) ( not ( = ?auto_46310 ?auto_46316 ) ) ( not ( = ?auto_46314 ?auto_46312 ) ) ( not ( = ?auto_46314 ?auto_46313 ) ) ( not ( = ?auto_46314 ?auto_46316 ) ) ( not ( = ?auto_46311 ?auto_46312 ) ) ( not ( = ?auto_46311 ?auto_46313 ) ) ( not ( = ?auto_46311 ?auto_46316 ) ) ( ON ?auto_46315 ?auto_46311 ) ( ON ?auto_46312 ?auto_46315 ) ( CLEAR ?auto_46312 ) ( HOLDING ?auto_46316 ) ( CLEAR ?auto_46313 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46313 ?auto_46316 )
      ( MAKE-1PILE ?auto_46310 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46317 - BLOCK
    )
    :vars
    (
      ?auto_46318 - BLOCK
      ?auto_46321 - BLOCK
      ?auto_46322 - BLOCK
      ?auto_46320 - BLOCK
      ?auto_46323 - BLOCK
      ?auto_46319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46317 ?auto_46318 ) ( not ( = ?auto_46317 ?auto_46318 ) ) ( not ( = ?auto_46317 ?auto_46321 ) ) ( not ( = ?auto_46317 ?auto_46322 ) ) ( not ( = ?auto_46318 ?auto_46321 ) ) ( not ( = ?auto_46318 ?auto_46322 ) ) ( not ( = ?auto_46321 ?auto_46322 ) ) ( ON ?auto_46321 ?auto_46317 ) ( ON-TABLE ?auto_46318 ) ( ON-TABLE ?auto_46320 ) ( not ( = ?auto_46320 ?auto_46323 ) ) ( not ( = ?auto_46320 ?auto_46319 ) ) ( not ( = ?auto_46320 ?auto_46322 ) ) ( not ( = ?auto_46323 ?auto_46319 ) ) ( not ( = ?auto_46323 ?auto_46322 ) ) ( not ( = ?auto_46319 ?auto_46322 ) ) ( not ( = ?auto_46317 ?auto_46319 ) ) ( not ( = ?auto_46317 ?auto_46320 ) ) ( not ( = ?auto_46317 ?auto_46323 ) ) ( not ( = ?auto_46318 ?auto_46319 ) ) ( not ( = ?auto_46318 ?auto_46320 ) ) ( not ( = ?auto_46318 ?auto_46323 ) ) ( not ( = ?auto_46321 ?auto_46319 ) ) ( not ( = ?auto_46321 ?auto_46320 ) ) ( not ( = ?auto_46321 ?auto_46323 ) ) ( ON ?auto_46322 ?auto_46321 ) ( ON ?auto_46319 ?auto_46322 ) ( CLEAR ?auto_46320 ) ( ON ?auto_46323 ?auto_46319 ) ( CLEAR ?auto_46323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46318 ?auto_46317 ?auto_46321 ?auto_46322 ?auto_46319 )
      ( MAKE-1PILE ?auto_46317 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46324 - BLOCK
    )
    :vars
    (
      ?auto_46326 - BLOCK
      ?auto_46325 - BLOCK
      ?auto_46327 - BLOCK
      ?auto_46330 - BLOCK
      ?auto_46328 - BLOCK
      ?auto_46329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46324 ?auto_46326 ) ( not ( = ?auto_46324 ?auto_46326 ) ) ( not ( = ?auto_46324 ?auto_46325 ) ) ( not ( = ?auto_46324 ?auto_46327 ) ) ( not ( = ?auto_46326 ?auto_46325 ) ) ( not ( = ?auto_46326 ?auto_46327 ) ) ( not ( = ?auto_46325 ?auto_46327 ) ) ( ON ?auto_46325 ?auto_46324 ) ( ON-TABLE ?auto_46326 ) ( not ( = ?auto_46330 ?auto_46328 ) ) ( not ( = ?auto_46330 ?auto_46329 ) ) ( not ( = ?auto_46330 ?auto_46327 ) ) ( not ( = ?auto_46328 ?auto_46329 ) ) ( not ( = ?auto_46328 ?auto_46327 ) ) ( not ( = ?auto_46329 ?auto_46327 ) ) ( not ( = ?auto_46324 ?auto_46329 ) ) ( not ( = ?auto_46324 ?auto_46330 ) ) ( not ( = ?auto_46324 ?auto_46328 ) ) ( not ( = ?auto_46326 ?auto_46329 ) ) ( not ( = ?auto_46326 ?auto_46330 ) ) ( not ( = ?auto_46326 ?auto_46328 ) ) ( not ( = ?auto_46325 ?auto_46329 ) ) ( not ( = ?auto_46325 ?auto_46330 ) ) ( not ( = ?auto_46325 ?auto_46328 ) ) ( ON ?auto_46327 ?auto_46325 ) ( ON ?auto_46329 ?auto_46327 ) ( ON ?auto_46328 ?auto_46329 ) ( CLEAR ?auto_46328 ) ( HOLDING ?auto_46330 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46330 )
      ( MAKE-1PILE ?auto_46324 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46331 - BLOCK
    )
    :vars
    (
      ?auto_46333 - BLOCK
      ?auto_46334 - BLOCK
      ?auto_46336 - BLOCK
      ?auto_46335 - BLOCK
      ?auto_46332 - BLOCK
      ?auto_46337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46331 ?auto_46333 ) ( not ( = ?auto_46331 ?auto_46333 ) ) ( not ( = ?auto_46331 ?auto_46334 ) ) ( not ( = ?auto_46331 ?auto_46336 ) ) ( not ( = ?auto_46333 ?auto_46334 ) ) ( not ( = ?auto_46333 ?auto_46336 ) ) ( not ( = ?auto_46334 ?auto_46336 ) ) ( ON ?auto_46334 ?auto_46331 ) ( ON-TABLE ?auto_46333 ) ( not ( = ?auto_46335 ?auto_46332 ) ) ( not ( = ?auto_46335 ?auto_46337 ) ) ( not ( = ?auto_46335 ?auto_46336 ) ) ( not ( = ?auto_46332 ?auto_46337 ) ) ( not ( = ?auto_46332 ?auto_46336 ) ) ( not ( = ?auto_46337 ?auto_46336 ) ) ( not ( = ?auto_46331 ?auto_46337 ) ) ( not ( = ?auto_46331 ?auto_46335 ) ) ( not ( = ?auto_46331 ?auto_46332 ) ) ( not ( = ?auto_46333 ?auto_46337 ) ) ( not ( = ?auto_46333 ?auto_46335 ) ) ( not ( = ?auto_46333 ?auto_46332 ) ) ( not ( = ?auto_46334 ?auto_46337 ) ) ( not ( = ?auto_46334 ?auto_46335 ) ) ( not ( = ?auto_46334 ?auto_46332 ) ) ( ON ?auto_46336 ?auto_46334 ) ( ON ?auto_46337 ?auto_46336 ) ( ON ?auto_46332 ?auto_46337 ) ( ON ?auto_46335 ?auto_46332 ) ( CLEAR ?auto_46335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46333 ?auto_46331 ?auto_46334 ?auto_46336 ?auto_46337 ?auto_46332 )
      ( MAKE-1PILE ?auto_46331 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46347 - BLOCK
      ?auto_46348 - BLOCK
      ?auto_46349 - BLOCK
      ?auto_46350 - BLOCK
    )
    :vars
    (
      ?auto_46351 - BLOCK
      ?auto_46352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46351 ?auto_46350 ) ( CLEAR ?auto_46351 ) ( ON-TABLE ?auto_46347 ) ( ON ?auto_46348 ?auto_46347 ) ( ON ?auto_46349 ?auto_46348 ) ( ON ?auto_46350 ?auto_46349 ) ( not ( = ?auto_46347 ?auto_46348 ) ) ( not ( = ?auto_46347 ?auto_46349 ) ) ( not ( = ?auto_46347 ?auto_46350 ) ) ( not ( = ?auto_46347 ?auto_46351 ) ) ( not ( = ?auto_46348 ?auto_46349 ) ) ( not ( = ?auto_46348 ?auto_46350 ) ) ( not ( = ?auto_46348 ?auto_46351 ) ) ( not ( = ?auto_46349 ?auto_46350 ) ) ( not ( = ?auto_46349 ?auto_46351 ) ) ( not ( = ?auto_46350 ?auto_46351 ) ) ( HOLDING ?auto_46352 ) ( not ( = ?auto_46347 ?auto_46352 ) ) ( not ( = ?auto_46348 ?auto_46352 ) ) ( not ( = ?auto_46349 ?auto_46352 ) ) ( not ( = ?auto_46350 ?auto_46352 ) ) ( not ( = ?auto_46351 ?auto_46352 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_46352 )
      ( MAKE-4PILE ?auto_46347 ?auto_46348 ?auto_46349 ?auto_46350 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46420 - BLOCK
      ?auto_46421 - BLOCK
    )
    :vars
    (
      ?auto_46422 - BLOCK
      ?auto_46423 - BLOCK
      ?auto_46424 - BLOCK
      ?auto_46425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46420 ?auto_46421 ) ) ( ON ?auto_46421 ?auto_46422 ) ( not ( = ?auto_46420 ?auto_46422 ) ) ( not ( = ?auto_46421 ?auto_46422 ) ) ( ON ?auto_46420 ?auto_46421 ) ( CLEAR ?auto_46420 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46423 ) ( ON ?auto_46424 ?auto_46423 ) ( ON ?auto_46425 ?auto_46424 ) ( ON ?auto_46422 ?auto_46425 ) ( not ( = ?auto_46423 ?auto_46424 ) ) ( not ( = ?auto_46423 ?auto_46425 ) ) ( not ( = ?auto_46423 ?auto_46422 ) ) ( not ( = ?auto_46423 ?auto_46421 ) ) ( not ( = ?auto_46423 ?auto_46420 ) ) ( not ( = ?auto_46424 ?auto_46425 ) ) ( not ( = ?auto_46424 ?auto_46422 ) ) ( not ( = ?auto_46424 ?auto_46421 ) ) ( not ( = ?auto_46424 ?auto_46420 ) ) ( not ( = ?auto_46425 ?auto_46422 ) ) ( not ( = ?auto_46425 ?auto_46421 ) ) ( not ( = ?auto_46425 ?auto_46420 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46423 ?auto_46424 ?auto_46425 ?auto_46422 ?auto_46421 )
      ( MAKE-2PILE ?auto_46420 ?auto_46421 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46428 - BLOCK
      ?auto_46429 - BLOCK
    )
    :vars
    (
      ?auto_46430 - BLOCK
      ?auto_46431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46428 ?auto_46429 ) ) ( ON ?auto_46429 ?auto_46430 ) ( CLEAR ?auto_46429 ) ( not ( = ?auto_46428 ?auto_46430 ) ) ( not ( = ?auto_46429 ?auto_46430 ) ) ( ON ?auto_46428 ?auto_46431 ) ( CLEAR ?auto_46428 ) ( HAND-EMPTY ) ( not ( = ?auto_46428 ?auto_46431 ) ) ( not ( = ?auto_46429 ?auto_46431 ) ) ( not ( = ?auto_46430 ?auto_46431 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46428 ?auto_46431 )
      ( MAKE-2PILE ?auto_46428 ?auto_46429 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46432 - BLOCK
      ?auto_46433 - BLOCK
    )
    :vars
    (
      ?auto_46434 - BLOCK
      ?auto_46435 - BLOCK
      ?auto_46437 - BLOCK
      ?auto_46438 - BLOCK
      ?auto_46436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46432 ?auto_46433 ) ) ( not ( = ?auto_46432 ?auto_46434 ) ) ( not ( = ?auto_46433 ?auto_46434 ) ) ( ON ?auto_46432 ?auto_46435 ) ( CLEAR ?auto_46432 ) ( not ( = ?auto_46432 ?auto_46435 ) ) ( not ( = ?auto_46433 ?auto_46435 ) ) ( not ( = ?auto_46434 ?auto_46435 ) ) ( HOLDING ?auto_46433 ) ( CLEAR ?auto_46434 ) ( ON-TABLE ?auto_46437 ) ( ON ?auto_46438 ?auto_46437 ) ( ON ?auto_46436 ?auto_46438 ) ( ON ?auto_46434 ?auto_46436 ) ( not ( = ?auto_46437 ?auto_46438 ) ) ( not ( = ?auto_46437 ?auto_46436 ) ) ( not ( = ?auto_46437 ?auto_46434 ) ) ( not ( = ?auto_46437 ?auto_46433 ) ) ( not ( = ?auto_46438 ?auto_46436 ) ) ( not ( = ?auto_46438 ?auto_46434 ) ) ( not ( = ?auto_46438 ?auto_46433 ) ) ( not ( = ?auto_46436 ?auto_46434 ) ) ( not ( = ?auto_46436 ?auto_46433 ) ) ( not ( = ?auto_46432 ?auto_46437 ) ) ( not ( = ?auto_46432 ?auto_46438 ) ) ( not ( = ?auto_46432 ?auto_46436 ) ) ( not ( = ?auto_46435 ?auto_46437 ) ) ( not ( = ?auto_46435 ?auto_46438 ) ) ( not ( = ?auto_46435 ?auto_46436 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46437 ?auto_46438 ?auto_46436 ?auto_46434 ?auto_46433 )
      ( MAKE-2PILE ?auto_46432 ?auto_46433 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46439 - BLOCK
      ?auto_46440 - BLOCK
    )
    :vars
    (
      ?auto_46445 - BLOCK
      ?auto_46443 - BLOCK
      ?auto_46442 - BLOCK
      ?auto_46444 - BLOCK
      ?auto_46441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46439 ?auto_46440 ) ) ( not ( = ?auto_46439 ?auto_46445 ) ) ( not ( = ?auto_46440 ?auto_46445 ) ) ( ON ?auto_46439 ?auto_46443 ) ( not ( = ?auto_46439 ?auto_46443 ) ) ( not ( = ?auto_46440 ?auto_46443 ) ) ( not ( = ?auto_46445 ?auto_46443 ) ) ( CLEAR ?auto_46445 ) ( ON-TABLE ?auto_46442 ) ( ON ?auto_46444 ?auto_46442 ) ( ON ?auto_46441 ?auto_46444 ) ( ON ?auto_46445 ?auto_46441 ) ( not ( = ?auto_46442 ?auto_46444 ) ) ( not ( = ?auto_46442 ?auto_46441 ) ) ( not ( = ?auto_46442 ?auto_46445 ) ) ( not ( = ?auto_46442 ?auto_46440 ) ) ( not ( = ?auto_46444 ?auto_46441 ) ) ( not ( = ?auto_46444 ?auto_46445 ) ) ( not ( = ?auto_46444 ?auto_46440 ) ) ( not ( = ?auto_46441 ?auto_46445 ) ) ( not ( = ?auto_46441 ?auto_46440 ) ) ( not ( = ?auto_46439 ?auto_46442 ) ) ( not ( = ?auto_46439 ?auto_46444 ) ) ( not ( = ?auto_46439 ?auto_46441 ) ) ( not ( = ?auto_46443 ?auto_46442 ) ) ( not ( = ?auto_46443 ?auto_46444 ) ) ( not ( = ?auto_46443 ?auto_46441 ) ) ( ON ?auto_46440 ?auto_46439 ) ( CLEAR ?auto_46440 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46443 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46443 ?auto_46439 )
      ( MAKE-2PILE ?auto_46439 ?auto_46440 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46446 - BLOCK
      ?auto_46447 - BLOCK
    )
    :vars
    (
      ?auto_46450 - BLOCK
      ?auto_46452 - BLOCK
      ?auto_46451 - BLOCK
      ?auto_46449 - BLOCK
      ?auto_46448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46446 ?auto_46447 ) ) ( not ( = ?auto_46446 ?auto_46450 ) ) ( not ( = ?auto_46447 ?auto_46450 ) ) ( ON ?auto_46446 ?auto_46452 ) ( not ( = ?auto_46446 ?auto_46452 ) ) ( not ( = ?auto_46447 ?auto_46452 ) ) ( not ( = ?auto_46450 ?auto_46452 ) ) ( ON-TABLE ?auto_46451 ) ( ON ?auto_46449 ?auto_46451 ) ( ON ?auto_46448 ?auto_46449 ) ( not ( = ?auto_46451 ?auto_46449 ) ) ( not ( = ?auto_46451 ?auto_46448 ) ) ( not ( = ?auto_46451 ?auto_46450 ) ) ( not ( = ?auto_46451 ?auto_46447 ) ) ( not ( = ?auto_46449 ?auto_46448 ) ) ( not ( = ?auto_46449 ?auto_46450 ) ) ( not ( = ?auto_46449 ?auto_46447 ) ) ( not ( = ?auto_46448 ?auto_46450 ) ) ( not ( = ?auto_46448 ?auto_46447 ) ) ( not ( = ?auto_46446 ?auto_46451 ) ) ( not ( = ?auto_46446 ?auto_46449 ) ) ( not ( = ?auto_46446 ?auto_46448 ) ) ( not ( = ?auto_46452 ?auto_46451 ) ) ( not ( = ?auto_46452 ?auto_46449 ) ) ( not ( = ?auto_46452 ?auto_46448 ) ) ( ON ?auto_46447 ?auto_46446 ) ( CLEAR ?auto_46447 ) ( ON-TABLE ?auto_46452 ) ( HOLDING ?auto_46450 ) ( CLEAR ?auto_46448 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46451 ?auto_46449 ?auto_46448 ?auto_46450 )
      ( MAKE-2PILE ?auto_46446 ?auto_46447 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46453 - BLOCK
      ?auto_46454 - BLOCK
    )
    :vars
    (
      ?auto_46459 - BLOCK
      ?auto_46458 - BLOCK
      ?auto_46457 - BLOCK
      ?auto_46456 - BLOCK
      ?auto_46455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46453 ?auto_46454 ) ) ( not ( = ?auto_46453 ?auto_46459 ) ) ( not ( = ?auto_46454 ?auto_46459 ) ) ( ON ?auto_46453 ?auto_46458 ) ( not ( = ?auto_46453 ?auto_46458 ) ) ( not ( = ?auto_46454 ?auto_46458 ) ) ( not ( = ?auto_46459 ?auto_46458 ) ) ( ON-TABLE ?auto_46457 ) ( ON ?auto_46456 ?auto_46457 ) ( ON ?auto_46455 ?auto_46456 ) ( not ( = ?auto_46457 ?auto_46456 ) ) ( not ( = ?auto_46457 ?auto_46455 ) ) ( not ( = ?auto_46457 ?auto_46459 ) ) ( not ( = ?auto_46457 ?auto_46454 ) ) ( not ( = ?auto_46456 ?auto_46455 ) ) ( not ( = ?auto_46456 ?auto_46459 ) ) ( not ( = ?auto_46456 ?auto_46454 ) ) ( not ( = ?auto_46455 ?auto_46459 ) ) ( not ( = ?auto_46455 ?auto_46454 ) ) ( not ( = ?auto_46453 ?auto_46457 ) ) ( not ( = ?auto_46453 ?auto_46456 ) ) ( not ( = ?auto_46453 ?auto_46455 ) ) ( not ( = ?auto_46458 ?auto_46457 ) ) ( not ( = ?auto_46458 ?auto_46456 ) ) ( not ( = ?auto_46458 ?auto_46455 ) ) ( ON ?auto_46454 ?auto_46453 ) ( ON-TABLE ?auto_46458 ) ( CLEAR ?auto_46455 ) ( ON ?auto_46459 ?auto_46454 ) ( CLEAR ?auto_46459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46458 ?auto_46453 ?auto_46454 )
      ( MAKE-2PILE ?auto_46453 ?auto_46454 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46460 - BLOCK
      ?auto_46461 - BLOCK
    )
    :vars
    (
      ?auto_46465 - BLOCK
      ?auto_46466 - BLOCK
      ?auto_46464 - BLOCK
      ?auto_46463 - BLOCK
      ?auto_46462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46460 ?auto_46461 ) ) ( not ( = ?auto_46460 ?auto_46465 ) ) ( not ( = ?auto_46461 ?auto_46465 ) ) ( ON ?auto_46460 ?auto_46466 ) ( not ( = ?auto_46460 ?auto_46466 ) ) ( not ( = ?auto_46461 ?auto_46466 ) ) ( not ( = ?auto_46465 ?auto_46466 ) ) ( ON-TABLE ?auto_46464 ) ( ON ?auto_46463 ?auto_46464 ) ( not ( = ?auto_46464 ?auto_46463 ) ) ( not ( = ?auto_46464 ?auto_46462 ) ) ( not ( = ?auto_46464 ?auto_46465 ) ) ( not ( = ?auto_46464 ?auto_46461 ) ) ( not ( = ?auto_46463 ?auto_46462 ) ) ( not ( = ?auto_46463 ?auto_46465 ) ) ( not ( = ?auto_46463 ?auto_46461 ) ) ( not ( = ?auto_46462 ?auto_46465 ) ) ( not ( = ?auto_46462 ?auto_46461 ) ) ( not ( = ?auto_46460 ?auto_46464 ) ) ( not ( = ?auto_46460 ?auto_46463 ) ) ( not ( = ?auto_46460 ?auto_46462 ) ) ( not ( = ?auto_46466 ?auto_46464 ) ) ( not ( = ?auto_46466 ?auto_46463 ) ) ( not ( = ?auto_46466 ?auto_46462 ) ) ( ON ?auto_46461 ?auto_46460 ) ( ON-TABLE ?auto_46466 ) ( ON ?auto_46465 ?auto_46461 ) ( CLEAR ?auto_46465 ) ( HOLDING ?auto_46462 ) ( CLEAR ?auto_46463 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46464 ?auto_46463 ?auto_46462 )
      ( MAKE-2PILE ?auto_46460 ?auto_46461 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46467 - BLOCK
      ?auto_46468 - BLOCK
    )
    :vars
    (
      ?auto_46470 - BLOCK
      ?auto_46471 - BLOCK
      ?auto_46473 - BLOCK
      ?auto_46469 - BLOCK
      ?auto_46472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46467 ?auto_46468 ) ) ( not ( = ?auto_46467 ?auto_46470 ) ) ( not ( = ?auto_46468 ?auto_46470 ) ) ( ON ?auto_46467 ?auto_46471 ) ( not ( = ?auto_46467 ?auto_46471 ) ) ( not ( = ?auto_46468 ?auto_46471 ) ) ( not ( = ?auto_46470 ?auto_46471 ) ) ( ON-TABLE ?auto_46473 ) ( ON ?auto_46469 ?auto_46473 ) ( not ( = ?auto_46473 ?auto_46469 ) ) ( not ( = ?auto_46473 ?auto_46472 ) ) ( not ( = ?auto_46473 ?auto_46470 ) ) ( not ( = ?auto_46473 ?auto_46468 ) ) ( not ( = ?auto_46469 ?auto_46472 ) ) ( not ( = ?auto_46469 ?auto_46470 ) ) ( not ( = ?auto_46469 ?auto_46468 ) ) ( not ( = ?auto_46472 ?auto_46470 ) ) ( not ( = ?auto_46472 ?auto_46468 ) ) ( not ( = ?auto_46467 ?auto_46473 ) ) ( not ( = ?auto_46467 ?auto_46469 ) ) ( not ( = ?auto_46467 ?auto_46472 ) ) ( not ( = ?auto_46471 ?auto_46473 ) ) ( not ( = ?auto_46471 ?auto_46469 ) ) ( not ( = ?auto_46471 ?auto_46472 ) ) ( ON ?auto_46468 ?auto_46467 ) ( ON-TABLE ?auto_46471 ) ( ON ?auto_46470 ?auto_46468 ) ( CLEAR ?auto_46469 ) ( ON ?auto_46472 ?auto_46470 ) ( CLEAR ?auto_46472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46471 ?auto_46467 ?auto_46468 ?auto_46470 )
      ( MAKE-2PILE ?auto_46467 ?auto_46468 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46474 - BLOCK
      ?auto_46475 - BLOCK
    )
    :vars
    (
      ?auto_46480 - BLOCK
      ?auto_46477 - BLOCK
      ?auto_46478 - BLOCK
      ?auto_46479 - BLOCK
      ?auto_46476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46474 ?auto_46475 ) ) ( not ( = ?auto_46474 ?auto_46480 ) ) ( not ( = ?auto_46475 ?auto_46480 ) ) ( ON ?auto_46474 ?auto_46477 ) ( not ( = ?auto_46474 ?auto_46477 ) ) ( not ( = ?auto_46475 ?auto_46477 ) ) ( not ( = ?auto_46480 ?auto_46477 ) ) ( ON-TABLE ?auto_46478 ) ( not ( = ?auto_46478 ?auto_46479 ) ) ( not ( = ?auto_46478 ?auto_46476 ) ) ( not ( = ?auto_46478 ?auto_46480 ) ) ( not ( = ?auto_46478 ?auto_46475 ) ) ( not ( = ?auto_46479 ?auto_46476 ) ) ( not ( = ?auto_46479 ?auto_46480 ) ) ( not ( = ?auto_46479 ?auto_46475 ) ) ( not ( = ?auto_46476 ?auto_46480 ) ) ( not ( = ?auto_46476 ?auto_46475 ) ) ( not ( = ?auto_46474 ?auto_46478 ) ) ( not ( = ?auto_46474 ?auto_46479 ) ) ( not ( = ?auto_46474 ?auto_46476 ) ) ( not ( = ?auto_46477 ?auto_46478 ) ) ( not ( = ?auto_46477 ?auto_46479 ) ) ( not ( = ?auto_46477 ?auto_46476 ) ) ( ON ?auto_46475 ?auto_46474 ) ( ON-TABLE ?auto_46477 ) ( ON ?auto_46480 ?auto_46475 ) ( ON ?auto_46476 ?auto_46480 ) ( CLEAR ?auto_46476 ) ( HOLDING ?auto_46479 ) ( CLEAR ?auto_46478 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46478 ?auto_46479 )
      ( MAKE-2PILE ?auto_46474 ?auto_46475 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46481 - BLOCK
      ?auto_46482 - BLOCK
    )
    :vars
    (
      ?auto_46484 - BLOCK
      ?auto_46485 - BLOCK
      ?auto_46483 - BLOCK
      ?auto_46486 - BLOCK
      ?auto_46487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46481 ?auto_46482 ) ) ( not ( = ?auto_46481 ?auto_46484 ) ) ( not ( = ?auto_46482 ?auto_46484 ) ) ( ON ?auto_46481 ?auto_46485 ) ( not ( = ?auto_46481 ?auto_46485 ) ) ( not ( = ?auto_46482 ?auto_46485 ) ) ( not ( = ?auto_46484 ?auto_46485 ) ) ( ON-TABLE ?auto_46483 ) ( not ( = ?auto_46483 ?auto_46486 ) ) ( not ( = ?auto_46483 ?auto_46487 ) ) ( not ( = ?auto_46483 ?auto_46484 ) ) ( not ( = ?auto_46483 ?auto_46482 ) ) ( not ( = ?auto_46486 ?auto_46487 ) ) ( not ( = ?auto_46486 ?auto_46484 ) ) ( not ( = ?auto_46486 ?auto_46482 ) ) ( not ( = ?auto_46487 ?auto_46484 ) ) ( not ( = ?auto_46487 ?auto_46482 ) ) ( not ( = ?auto_46481 ?auto_46483 ) ) ( not ( = ?auto_46481 ?auto_46486 ) ) ( not ( = ?auto_46481 ?auto_46487 ) ) ( not ( = ?auto_46485 ?auto_46483 ) ) ( not ( = ?auto_46485 ?auto_46486 ) ) ( not ( = ?auto_46485 ?auto_46487 ) ) ( ON ?auto_46482 ?auto_46481 ) ( ON-TABLE ?auto_46485 ) ( ON ?auto_46484 ?auto_46482 ) ( ON ?auto_46487 ?auto_46484 ) ( CLEAR ?auto_46483 ) ( ON ?auto_46486 ?auto_46487 ) ( CLEAR ?auto_46486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46485 ?auto_46481 ?auto_46482 ?auto_46484 ?auto_46487 )
      ( MAKE-2PILE ?auto_46481 ?auto_46482 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46488 - BLOCK
      ?auto_46489 - BLOCK
    )
    :vars
    (
      ?auto_46491 - BLOCK
      ?auto_46492 - BLOCK
      ?auto_46490 - BLOCK
      ?auto_46494 - BLOCK
      ?auto_46493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46488 ?auto_46489 ) ) ( not ( = ?auto_46488 ?auto_46491 ) ) ( not ( = ?auto_46489 ?auto_46491 ) ) ( ON ?auto_46488 ?auto_46492 ) ( not ( = ?auto_46488 ?auto_46492 ) ) ( not ( = ?auto_46489 ?auto_46492 ) ) ( not ( = ?auto_46491 ?auto_46492 ) ) ( not ( = ?auto_46490 ?auto_46494 ) ) ( not ( = ?auto_46490 ?auto_46493 ) ) ( not ( = ?auto_46490 ?auto_46491 ) ) ( not ( = ?auto_46490 ?auto_46489 ) ) ( not ( = ?auto_46494 ?auto_46493 ) ) ( not ( = ?auto_46494 ?auto_46491 ) ) ( not ( = ?auto_46494 ?auto_46489 ) ) ( not ( = ?auto_46493 ?auto_46491 ) ) ( not ( = ?auto_46493 ?auto_46489 ) ) ( not ( = ?auto_46488 ?auto_46490 ) ) ( not ( = ?auto_46488 ?auto_46494 ) ) ( not ( = ?auto_46488 ?auto_46493 ) ) ( not ( = ?auto_46492 ?auto_46490 ) ) ( not ( = ?auto_46492 ?auto_46494 ) ) ( not ( = ?auto_46492 ?auto_46493 ) ) ( ON ?auto_46489 ?auto_46488 ) ( ON-TABLE ?auto_46492 ) ( ON ?auto_46491 ?auto_46489 ) ( ON ?auto_46493 ?auto_46491 ) ( ON ?auto_46494 ?auto_46493 ) ( CLEAR ?auto_46494 ) ( HOLDING ?auto_46490 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46490 )
      ( MAKE-2PILE ?auto_46488 ?auto_46489 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46495 - BLOCK
      ?auto_46496 - BLOCK
    )
    :vars
    (
      ?auto_46500 - BLOCK
      ?auto_46498 - BLOCK
      ?auto_46497 - BLOCK
      ?auto_46499 - BLOCK
      ?auto_46501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46495 ?auto_46496 ) ) ( not ( = ?auto_46495 ?auto_46500 ) ) ( not ( = ?auto_46496 ?auto_46500 ) ) ( ON ?auto_46495 ?auto_46498 ) ( not ( = ?auto_46495 ?auto_46498 ) ) ( not ( = ?auto_46496 ?auto_46498 ) ) ( not ( = ?auto_46500 ?auto_46498 ) ) ( not ( = ?auto_46497 ?auto_46499 ) ) ( not ( = ?auto_46497 ?auto_46501 ) ) ( not ( = ?auto_46497 ?auto_46500 ) ) ( not ( = ?auto_46497 ?auto_46496 ) ) ( not ( = ?auto_46499 ?auto_46501 ) ) ( not ( = ?auto_46499 ?auto_46500 ) ) ( not ( = ?auto_46499 ?auto_46496 ) ) ( not ( = ?auto_46501 ?auto_46500 ) ) ( not ( = ?auto_46501 ?auto_46496 ) ) ( not ( = ?auto_46495 ?auto_46497 ) ) ( not ( = ?auto_46495 ?auto_46499 ) ) ( not ( = ?auto_46495 ?auto_46501 ) ) ( not ( = ?auto_46498 ?auto_46497 ) ) ( not ( = ?auto_46498 ?auto_46499 ) ) ( not ( = ?auto_46498 ?auto_46501 ) ) ( ON ?auto_46496 ?auto_46495 ) ( ON-TABLE ?auto_46498 ) ( ON ?auto_46500 ?auto_46496 ) ( ON ?auto_46501 ?auto_46500 ) ( ON ?auto_46499 ?auto_46501 ) ( ON ?auto_46497 ?auto_46499 ) ( CLEAR ?auto_46497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46498 ?auto_46495 ?auto_46496 ?auto_46500 ?auto_46501 ?auto_46499 )
      ( MAKE-2PILE ?auto_46495 ?auto_46496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46521 - BLOCK
      ?auto_46522 - BLOCK
      ?auto_46523 - BLOCK
    )
    :vars
    (
      ?auto_46526 - BLOCK
      ?auto_46524 - BLOCK
      ?auto_46525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46526 ?auto_46523 ) ( ON-TABLE ?auto_46521 ) ( ON ?auto_46522 ?auto_46521 ) ( ON ?auto_46523 ?auto_46522 ) ( not ( = ?auto_46521 ?auto_46522 ) ) ( not ( = ?auto_46521 ?auto_46523 ) ) ( not ( = ?auto_46521 ?auto_46526 ) ) ( not ( = ?auto_46522 ?auto_46523 ) ) ( not ( = ?auto_46522 ?auto_46526 ) ) ( not ( = ?auto_46523 ?auto_46526 ) ) ( not ( = ?auto_46521 ?auto_46524 ) ) ( not ( = ?auto_46521 ?auto_46525 ) ) ( not ( = ?auto_46522 ?auto_46524 ) ) ( not ( = ?auto_46522 ?auto_46525 ) ) ( not ( = ?auto_46523 ?auto_46524 ) ) ( not ( = ?auto_46523 ?auto_46525 ) ) ( not ( = ?auto_46526 ?auto_46524 ) ) ( not ( = ?auto_46526 ?auto_46525 ) ) ( not ( = ?auto_46524 ?auto_46525 ) ) ( ON ?auto_46524 ?auto_46526 ) ( CLEAR ?auto_46524 ) ( HOLDING ?auto_46525 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46525 )
      ( MAKE-3PILE ?auto_46521 ?auto_46522 ?auto_46523 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46586 - BLOCK
      ?auto_46587 - BLOCK
      ?auto_46588 - BLOCK
    )
    :vars
    (
      ?auto_46589 - BLOCK
      ?auto_46590 - BLOCK
      ?auto_46591 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46586 ) ( not ( = ?auto_46586 ?auto_46587 ) ) ( not ( = ?auto_46586 ?auto_46588 ) ) ( not ( = ?auto_46587 ?auto_46588 ) ) ( ON ?auto_46588 ?auto_46589 ) ( not ( = ?auto_46586 ?auto_46589 ) ) ( not ( = ?auto_46587 ?auto_46589 ) ) ( not ( = ?auto_46588 ?auto_46589 ) ) ( CLEAR ?auto_46586 ) ( ON ?auto_46587 ?auto_46588 ) ( CLEAR ?auto_46587 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46590 ) ( ON ?auto_46591 ?auto_46590 ) ( ON ?auto_46589 ?auto_46591 ) ( not ( = ?auto_46590 ?auto_46591 ) ) ( not ( = ?auto_46590 ?auto_46589 ) ) ( not ( = ?auto_46590 ?auto_46588 ) ) ( not ( = ?auto_46590 ?auto_46587 ) ) ( not ( = ?auto_46591 ?auto_46589 ) ) ( not ( = ?auto_46591 ?auto_46588 ) ) ( not ( = ?auto_46591 ?auto_46587 ) ) ( not ( = ?auto_46586 ?auto_46590 ) ) ( not ( = ?auto_46586 ?auto_46591 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46590 ?auto_46591 ?auto_46589 ?auto_46588 )
      ( MAKE-3PILE ?auto_46586 ?auto_46587 ?auto_46588 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46592 - BLOCK
      ?auto_46593 - BLOCK
      ?auto_46594 - BLOCK
    )
    :vars
    (
      ?auto_46597 - BLOCK
      ?auto_46596 - BLOCK
      ?auto_46595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46592 ?auto_46593 ) ) ( not ( = ?auto_46592 ?auto_46594 ) ) ( not ( = ?auto_46593 ?auto_46594 ) ) ( ON ?auto_46594 ?auto_46597 ) ( not ( = ?auto_46592 ?auto_46597 ) ) ( not ( = ?auto_46593 ?auto_46597 ) ) ( not ( = ?auto_46594 ?auto_46597 ) ) ( ON ?auto_46593 ?auto_46594 ) ( CLEAR ?auto_46593 ) ( ON-TABLE ?auto_46596 ) ( ON ?auto_46595 ?auto_46596 ) ( ON ?auto_46597 ?auto_46595 ) ( not ( = ?auto_46596 ?auto_46595 ) ) ( not ( = ?auto_46596 ?auto_46597 ) ) ( not ( = ?auto_46596 ?auto_46594 ) ) ( not ( = ?auto_46596 ?auto_46593 ) ) ( not ( = ?auto_46595 ?auto_46597 ) ) ( not ( = ?auto_46595 ?auto_46594 ) ) ( not ( = ?auto_46595 ?auto_46593 ) ) ( not ( = ?auto_46592 ?auto_46596 ) ) ( not ( = ?auto_46592 ?auto_46595 ) ) ( HOLDING ?auto_46592 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46592 )
      ( MAKE-3PILE ?auto_46592 ?auto_46593 ?auto_46594 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46598 - BLOCK
      ?auto_46599 - BLOCK
      ?auto_46600 - BLOCK
    )
    :vars
    (
      ?auto_46601 - BLOCK
      ?auto_46602 - BLOCK
      ?auto_46603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46598 ?auto_46599 ) ) ( not ( = ?auto_46598 ?auto_46600 ) ) ( not ( = ?auto_46599 ?auto_46600 ) ) ( ON ?auto_46600 ?auto_46601 ) ( not ( = ?auto_46598 ?auto_46601 ) ) ( not ( = ?auto_46599 ?auto_46601 ) ) ( not ( = ?auto_46600 ?auto_46601 ) ) ( ON ?auto_46599 ?auto_46600 ) ( ON-TABLE ?auto_46602 ) ( ON ?auto_46603 ?auto_46602 ) ( ON ?auto_46601 ?auto_46603 ) ( not ( = ?auto_46602 ?auto_46603 ) ) ( not ( = ?auto_46602 ?auto_46601 ) ) ( not ( = ?auto_46602 ?auto_46600 ) ) ( not ( = ?auto_46602 ?auto_46599 ) ) ( not ( = ?auto_46603 ?auto_46601 ) ) ( not ( = ?auto_46603 ?auto_46600 ) ) ( not ( = ?auto_46603 ?auto_46599 ) ) ( not ( = ?auto_46598 ?auto_46602 ) ) ( not ( = ?auto_46598 ?auto_46603 ) ) ( ON ?auto_46598 ?auto_46599 ) ( CLEAR ?auto_46598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46602 ?auto_46603 ?auto_46601 ?auto_46600 ?auto_46599 )
      ( MAKE-3PILE ?auto_46598 ?auto_46599 ?auto_46600 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46607 - BLOCK
      ?auto_46608 - BLOCK
      ?auto_46609 - BLOCK
    )
    :vars
    (
      ?auto_46610 - BLOCK
      ?auto_46612 - BLOCK
      ?auto_46611 - BLOCK
      ?auto_46613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46607 ?auto_46608 ) ) ( not ( = ?auto_46607 ?auto_46609 ) ) ( not ( = ?auto_46608 ?auto_46609 ) ) ( ON ?auto_46609 ?auto_46610 ) ( not ( = ?auto_46607 ?auto_46610 ) ) ( not ( = ?auto_46608 ?auto_46610 ) ) ( not ( = ?auto_46609 ?auto_46610 ) ) ( ON ?auto_46608 ?auto_46609 ) ( CLEAR ?auto_46608 ) ( ON-TABLE ?auto_46612 ) ( ON ?auto_46611 ?auto_46612 ) ( ON ?auto_46610 ?auto_46611 ) ( not ( = ?auto_46612 ?auto_46611 ) ) ( not ( = ?auto_46612 ?auto_46610 ) ) ( not ( = ?auto_46612 ?auto_46609 ) ) ( not ( = ?auto_46612 ?auto_46608 ) ) ( not ( = ?auto_46611 ?auto_46610 ) ) ( not ( = ?auto_46611 ?auto_46609 ) ) ( not ( = ?auto_46611 ?auto_46608 ) ) ( not ( = ?auto_46607 ?auto_46612 ) ) ( not ( = ?auto_46607 ?auto_46611 ) ) ( ON ?auto_46607 ?auto_46613 ) ( CLEAR ?auto_46607 ) ( HAND-EMPTY ) ( not ( = ?auto_46607 ?auto_46613 ) ) ( not ( = ?auto_46608 ?auto_46613 ) ) ( not ( = ?auto_46609 ?auto_46613 ) ) ( not ( = ?auto_46610 ?auto_46613 ) ) ( not ( = ?auto_46612 ?auto_46613 ) ) ( not ( = ?auto_46611 ?auto_46613 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46607 ?auto_46613 )
      ( MAKE-3PILE ?auto_46607 ?auto_46608 ?auto_46609 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46614 - BLOCK
      ?auto_46615 - BLOCK
      ?auto_46616 - BLOCK
    )
    :vars
    (
      ?auto_46619 - BLOCK
      ?auto_46620 - BLOCK
      ?auto_46618 - BLOCK
      ?auto_46617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46614 ?auto_46615 ) ) ( not ( = ?auto_46614 ?auto_46616 ) ) ( not ( = ?auto_46615 ?auto_46616 ) ) ( ON ?auto_46616 ?auto_46619 ) ( not ( = ?auto_46614 ?auto_46619 ) ) ( not ( = ?auto_46615 ?auto_46619 ) ) ( not ( = ?auto_46616 ?auto_46619 ) ) ( ON-TABLE ?auto_46620 ) ( ON ?auto_46618 ?auto_46620 ) ( ON ?auto_46619 ?auto_46618 ) ( not ( = ?auto_46620 ?auto_46618 ) ) ( not ( = ?auto_46620 ?auto_46619 ) ) ( not ( = ?auto_46620 ?auto_46616 ) ) ( not ( = ?auto_46620 ?auto_46615 ) ) ( not ( = ?auto_46618 ?auto_46619 ) ) ( not ( = ?auto_46618 ?auto_46616 ) ) ( not ( = ?auto_46618 ?auto_46615 ) ) ( not ( = ?auto_46614 ?auto_46620 ) ) ( not ( = ?auto_46614 ?auto_46618 ) ) ( ON ?auto_46614 ?auto_46617 ) ( CLEAR ?auto_46614 ) ( not ( = ?auto_46614 ?auto_46617 ) ) ( not ( = ?auto_46615 ?auto_46617 ) ) ( not ( = ?auto_46616 ?auto_46617 ) ) ( not ( = ?auto_46619 ?auto_46617 ) ) ( not ( = ?auto_46620 ?auto_46617 ) ) ( not ( = ?auto_46618 ?auto_46617 ) ) ( HOLDING ?auto_46615 ) ( CLEAR ?auto_46616 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46620 ?auto_46618 ?auto_46619 ?auto_46616 ?auto_46615 )
      ( MAKE-3PILE ?auto_46614 ?auto_46615 ?auto_46616 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46621 - BLOCK
      ?auto_46622 - BLOCK
      ?auto_46623 - BLOCK
    )
    :vars
    (
      ?auto_46627 - BLOCK
      ?auto_46625 - BLOCK
      ?auto_46626 - BLOCK
      ?auto_46624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46621 ?auto_46622 ) ) ( not ( = ?auto_46621 ?auto_46623 ) ) ( not ( = ?auto_46622 ?auto_46623 ) ) ( ON ?auto_46623 ?auto_46627 ) ( not ( = ?auto_46621 ?auto_46627 ) ) ( not ( = ?auto_46622 ?auto_46627 ) ) ( not ( = ?auto_46623 ?auto_46627 ) ) ( ON-TABLE ?auto_46625 ) ( ON ?auto_46626 ?auto_46625 ) ( ON ?auto_46627 ?auto_46626 ) ( not ( = ?auto_46625 ?auto_46626 ) ) ( not ( = ?auto_46625 ?auto_46627 ) ) ( not ( = ?auto_46625 ?auto_46623 ) ) ( not ( = ?auto_46625 ?auto_46622 ) ) ( not ( = ?auto_46626 ?auto_46627 ) ) ( not ( = ?auto_46626 ?auto_46623 ) ) ( not ( = ?auto_46626 ?auto_46622 ) ) ( not ( = ?auto_46621 ?auto_46625 ) ) ( not ( = ?auto_46621 ?auto_46626 ) ) ( ON ?auto_46621 ?auto_46624 ) ( not ( = ?auto_46621 ?auto_46624 ) ) ( not ( = ?auto_46622 ?auto_46624 ) ) ( not ( = ?auto_46623 ?auto_46624 ) ) ( not ( = ?auto_46627 ?auto_46624 ) ) ( not ( = ?auto_46625 ?auto_46624 ) ) ( not ( = ?auto_46626 ?auto_46624 ) ) ( CLEAR ?auto_46623 ) ( ON ?auto_46622 ?auto_46621 ) ( CLEAR ?auto_46622 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46624 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46624 ?auto_46621 )
      ( MAKE-3PILE ?auto_46621 ?auto_46622 ?auto_46623 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46628 - BLOCK
      ?auto_46629 - BLOCK
      ?auto_46630 - BLOCK
    )
    :vars
    (
      ?auto_46632 - BLOCK
      ?auto_46633 - BLOCK
      ?auto_46634 - BLOCK
      ?auto_46631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46628 ?auto_46629 ) ) ( not ( = ?auto_46628 ?auto_46630 ) ) ( not ( = ?auto_46629 ?auto_46630 ) ) ( not ( = ?auto_46628 ?auto_46632 ) ) ( not ( = ?auto_46629 ?auto_46632 ) ) ( not ( = ?auto_46630 ?auto_46632 ) ) ( ON-TABLE ?auto_46633 ) ( ON ?auto_46634 ?auto_46633 ) ( ON ?auto_46632 ?auto_46634 ) ( not ( = ?auto_46633 ?auto_46634 ) ) ( not ( = ?auto_46633 ?auto_46632 ) ) ( not ( = ?auto_46633 ?auto_46630 ) ) ( not ( = ?auto_46633 ?auto_46629 ) ) ( not ( = ?auto_46634 ?auto_46632 ) ) ( not ( = ?auto_46634 ?auto_46630 ) ) ( not ( = ?auto_46634 ?auto_46629 ) ) ( not ( = ?auto_46628 ?auto_46633 ) ) ( not ( = ?auto_46628 ?auto_46634 ) ) ( ON ?auto_46628 ?auto_46631 ) ( not ( = ?auto_46628 ?auto_46631 ) ) ( not ( = ?auto_46629 ?auto_46631 ) ) ( not ( = ?auto_46630 ?auto_46631 ) ) ( not ( = ?auto_46632 ?auto_46631 ) ) ( not ( = ?auto_46633 ?auto_46631 ) ) ( not ( = ?auto_46634 ?auto_46631 ) ) ( ON ?auto_46629 ?auto_46628 ) ( CLEAR ?auto_46629 ) ( ON-TABLE ?auto_46631 ) ( HOLDING ?auto_46630 ) ( CLEAR ?auto_46632 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46633 ?auto_46634 ?auto_46632 ?auto_46630 )
      ( MAKE-3PILE ?auto_46628 ?auto_46629 ?auto_46630 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46635 - BLOCK
      ?auto_46636 - BLOCK
      ?auto_46637 - BLOCK
    )
    :vars
    (
      ?auto_46640 - BLOCK
      ?auto_46641 - BLOCK
      ?auto_46639 - BLOCK
      ?auto_46638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46635 ?auto_46636 ) ) ( not ( = ?auto_46635 ?auto_46637 ) ) ( not ( = ?auto_46636 ?auto_46637 ) ) ( not ( = ?auto_46635 ?auto_46640 ) ) ( not ( = ?auto_46636 ?auto_46640 ) ) ( not ( = ?auto_46637 ?auto_46640 ) ) ( ON-TABLE ?auto_46641 ) ( ON ?auto_46639 ?auto_46641 ) ( ON ?auto_46640 ?auto_46639 ) ( not ( = ?auto_46641 ?auto_46639 ) ) ( not ( = ?auto_46641 ?auto_46640 ) ) ( not ( = ?auto_46641 ?auto_46637 ) ) ( not ( = ?auto_46641 ?auto_46636 ) ) ( not ( = ?auto_46639 ?auto_46640 ) ) ( not ( = ?auto_46639 ?auto_46637 ) ) ( not ( = ?auto_46639 ?auto_46636 ) ) ( not ( = ?auto_46635 ?auto_46641 ) ) ( not ( = ?auto_46635 ?auto_46639 ) ) ( ON ?auto_46635 ?auto_46638 ) ( not ( = ?auto_46635 ?auto_46638 ) ) ( not ( = ?auto_46636 ?auto_46638 ) ) ( not ( = ?auto_46637 ?auto_46638 ) ) ( not ( = ?auto_46640 ?auto_46638 ) ) ( not ( = ?auto_46641 ?auto_46638 ) ) ( not ( = ?auto_46639 ?auto_46638 ) ) ( ON ?auto_46636 ?auto_46635 ) ( ON-TABLE ?auto_46638 ) ( CLEAR ?auto_46640 ) ( ON ?auto_46637 ?auto_46636 ) ( CLEAR ?auto_46637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46638 ?auto_46635 ?auto_46636 )
      ( MAKE-3PILE ?auto_46635 ?auto_46636 ?auto_46637 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46642 - BLOCK
      ?auto_46643 - BLOCK
      ?auto_46644 - BLOCK
    )
    :vars
    (
      ?auto_46648 - BLOCK
      ?auto_46646 - BLOCK
      ?auto_46647 - BLOCK
      ?auto_46645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46642 ?auto_46643 ) ) ( not ( = ?auto_46642 ?auto_46644 ) ) ( not ( = ?auto_46643 ?auto_46644 ) ) ( not ( = ?auto_46642 ?auto_46648 ) ) ( not ( = ?auto_46643 ?auto_46648 ) ) ( not ( = ?auto_46644 ?auto_46648 ) ) ( ON-TABLE ?auto_46646 ) ( ON ?auto_46647 ?auto_46646 ) ( not ( = ?auto_46646 ?auto_46647 ) ) ( not ( = ?auto_46646 ?auto_46648 ) ) ( not ( = ?auto_46646 ?auto_46644 ) ) ( not ( = ?auto_46646 ?auto_46643 ) ) ( not ( = ?auto_46647 ?auto_46648 ) ) ( not ( = ?auto_46647 ?auto_46644 ) ) ( not ( = ?auto_46647 ?auto_46643 ) ) ( not ( = ?auto_46642 ?auto_46646 ) ) ( not ( = ?auto_46642 ?auto_46647 ) ) ( ON ?auto_46642 ?auto_46645 ) ( not ( = ?auto_46642 ?auto_46645 ) ) ( not ( = ?auto_46643 ?auto_46645 ) ) ( not ( = ?auto_46644 ?auto_46645 ) ) ( not ( = ?auto_46648 ?auto_46645 ) ) ( not ( = ?auto_46646 ?auto_46645 ) ) ( not ( = ?auto_46647 ?auto_46645 ) ) ( ON ?auto_46643 ?auto_46642 ) ( ON-TABLE ?auto_46645 ) ( ON ?auto_46644 ?auto_46643 ) ( CLEAR ?auto_46644 ) ( HOLDING ?auto_46648 ) ( CLEAR ?auto_46647 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46646 ?auto_46647 ?auto_46648 )
      ( MAKE-3PILE ?auto_46642 ?auto_46643 ?auto_46644 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46649 - BLOCK
      ?auto_46650 - BLOCK
      ?auto_46651 - BLOCK
    )
    :vars
    (
      ?auto_46655 - BLOCK
      ?auto_46654 - BLOCK
      ?auto_46653 - BLOCK
      ?auto_46652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46649 ?auto_46650 ) ) ( not ( = ?auto_46649 ?auto_46651 ) ) ( not ( = ?auto_46650 ?auto_46651 ) ) ( not ( = ?auto_46649 ?auto_46655 ) ) ( not ( = ?auto_46650 ?auto_46655 ) ) ( not ( = ?auto_46651 ?auto_46655 ) ) ( ON-TABLE ?auto_46654 ) ( ON ?auto_46653 ?auto_46654 ) ( not ( = ?auto_46654 ?auto_46653 ) ) ( not ( = ?auto_46654 ?auto_46655 ) ) ( not ( = ?auto_46654 ?auto_46651 ) ) ( not ( = ?auto_46654 ?auto_46650 ) ) ( not ( = ?auto_46653 ?auto_46655 ) ) ( not ( = ?auto_46653 ?auto_46651 ) ) ( not ( = ?auto_46653 ?auto_46650 ) ) ( not ( = ?auto_46649 ?auto_46654 ) ) ( not ( = ?auto_46649 ?auto_46653 ) ) ( ON ?auto_46649 ?auto_46652 ) ( not ( = ?auto_46649 ?auto_46652 ) ) ( not ( = ?auto_46650 ?auto_46652 ) ) ( not ( = ?auto_46651 ?auto_46652 ) ) ( not ( = ?auto_46655 ?auto_46652 ) ) ( not ( = ?auto_46654 ?auto_46652 ) ) ( not ( = ?auto_46653 ?auto_46652 ) ) ( ON ?auto_46650 ?auto_46649 ) ( ON-TABLE ?auto_46652 ) ( ON ?auto_46651 ?auto_46650 ) ( CLEAR ?auto_46653 ) ( ON ?auto_46655 ?auto_46651 ) ( CLEAR ?auto_46655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46652 ?auto_46649 ?auto_46650 ?auto_46651 )
      ( MAKE-3PILE ?auto_46649 ?auto_46650 ?auto_46651 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46656 - BLOCK
      ?auto_46657 - BLOCK
      ?auto_46658 - BLOCK
    )
    :vars
    (
      ?auto_46662 - BLOCK
      ?auto_46660 - BLOCK
      ?auto_46661 - BLOCK
      ?auto_46659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46656 ?auto_46657 ) ) ( not ( = ?auto_46656 ?auto_46658 ) ) ( not ( = ?auto_46657 ?auto_46658 ) ) ( not ( = ?auto_46656 ?auto_46662 ) ) ( not ( = ?auto_46657 ?auto_46662 ) ) ( not ( = ?auto_46658 ?auto_46662 ) ) ( ON-TABLE ?auto_46660 ) ( not ( = ?auto_46660 ?auto_46661 ) ) ( not ( = ?auto_46660 ?auto_46662 ) ) ( not ( = ?auto_46660 ?auto_46658 ) ) ( not ( = ?auto_46660 ?auto_46657 ) ) ( not ( = ?auto_46661 ?auto_46662 ) ) ( not ( = ?auto_46661 ?auto_46658 ) ) ( not ( = ?auto_46661 ?auto_46657 ) ) ( not ( = ?auto_46656 ?auto_46660 ) ) ( not ( = ?auto_46656 ?auto_46661 ) ) ( ON ?auto_46656 ?auto_46659 ) ( not ( = ?auto_46656 ?auto_46659 ) ) ( not ( = ?auto_46657 ?auto_46659 ) ) ( not ( = ?auto_46658 ?auto_46659 ) ) ( not ( = ?auto_46662 ?auto_46659 ) ) ( not ( = ?auto_46660 ?auto_46659 ) ) ( not ( = ?auto_46661 ?auto_46659 ) ) ( ON ?auto_46657 ?auto_46656 ) ( ON-TABLE ?auto_46659 ) ( ON ?auto_46658 ?auto_46657 ) ( ON ?auto_46662 ?auto_46658 ) ( CLEAR ?auto_46662 ) ( HOLDING ?auto_46661 ) ( CLEAR ?auto_46660 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46660 ?auto_46661 )
      ( MAKE-3PILE ?auto_46656 ?auto_46657 ?auto_46658 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46663 - BLOCK
      ?auto_46664 - BLOCK
      ?auto_46665 - BLOCK
    )
    :vars
    (
      ?auto_46669 - BLOCK
      ?auto_46668 - BLOCK
      ?auto_46667 - BLOCK
      ?auto_46666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46663 ?auto_46664 ) ) ( not ( = ?auto_46663 ?auto_46665 ) ) ( not ( = ?auto_46664 ?auto_46665 ) ) ( not ( = ?auto_46663 ?auto_46669 ) ) ( not ( = ?auto_46664 ?auto_46669 ) ) ( not ( = ?auto_46665 ?auto_46669 ) ) ( ON-TABLE ?auto_46668 ) ( not ( = ?auto_46668 ?auto_46667 ) ) ( not ( = ?auto_46668 ?auto_46669 ) ) ( not ( = ?auto_46668 ?auto_46665 ) ) ( not ( = ?auto_46668 ?auto_46664 ) ) ( not ( = ?auto_46667 ?auto_46669 ) ) ( not ( = ?auto_46667 ?auto_46665 ) ) ( not ( = ?auto_46667 ?auto_46664 ) ) ( not ( = ?auto_46663 ?auto_46668 ) ) ( not ( = ?auto_46663 ?auto_46667 ) ) ( ON ?auto_46663 ?auto_46666 ) ( not ( = ?auto_46663 ?auto_46666 ) ) ( not ( = ?auto_46664 ?auto_46666 ) ) ( not ( = ?auto_46665 ?auto_46666 ) ) ( not ( = ?auto_46669 ?auto_46666 ) ) ( not ( = ?auto_46668 ?auto_46666 ) ) ( not ( = ?auto_46667 ?auto_46666 ) ) ( ON ?auto_46664 ?auto_46663 ) ( ON-TABLE ?auto_46666 ) ( ON ?auto_46665 ?auto_46664 ) ( ON ?auto_46669 ?auto_46665 ) ( CLEAR ?auto_46668 ) ( ON ?auto_46667 ?auto_46669 ) ( CLEAR ?auto_46667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46666 ?auto_46663 ?auto_46664 ?auto_46665 ?auto_46669 )
      ( MAKE-3PILE ?auto_46663 ?auto_46664 ?auto_46665 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46670 - BLOCK
      ?auto_46671 - BLOCK
      ?auto_46672 - BLOCK
    )
    :vars
    (
      ?auto_46675 - BLOCK
      ?auto_46674 - BLOCK
      ?auto_46673 - BLOCK
      ?auto_46676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46670 ?auto_46671 ) ) ( not ( = ?auto_46670 ?auto_46672 ) ) ( not ( = ?auto_46671 ?auto_46672 ) ) ( not ( = ?auto_46670 ?auto_46675 ) ) ( not ( = ?auto_46671 ?auto_46675 ) ) ( not ( = ?auto_46672 ?auto_46675 ) ) ( not ( = ?auto_46674 ?auto_46673 ) ) ( not ( = ?auto_46674 ?auto_46675 ) ) ( not ( = ?auto_46674 ?auto_46672 ) ) ( not ( = ?auto_46674 ?auto_46671 ) ) ( not ( = ?auto_46673 ?auto_46675 ) ) ( not ( = ?auto_46673 ?auto_46672 ) ) ( not ( = ?auto_46673 ?auto_46671 ) ) ( not ( = ?auto_46670 ?auto_46674 ) ) ( not ( = ?auto_46670 ?auto_46673 ) ) ( ON ?auto_46670 ?auto_46676 ) ( not ( = ?auto_46670 ?auto_46676 ) ) ( not ( = ?auto_46671 ?auto_46676 ) ) ( not ( = ?auto_46672 ?auto_46676 ) ) ( not ( = ?auto_46675 ?auto_46676 ) ) ( not ( = ?auto_46674 ?auto_46676 ) ) ( not ( = ?auto_46673 ?auto_46676 ) ) ( ON ?auto_46671 ?auto_46670 ) ( ON-TABLE ?auto_46676 ) ( ON ?auto_46672 ?auto_46671 ) ( ON ?auto_46675 ?auto_46672 ) ( ON ?auto_46673 ?auto_46675 ) ( CLEAR ?auto_46673 ) ( HOLDING ?auto_46674 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46674 )
      ( MAKE-3PILE ?auto_46670 ?auto_46671 ?auto_46672 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46677 - BLOCK
      ?auto_46678 - BLOCK
      ?auto_46679 - BLOCK
    )
    :vars
    (
      ?auto_46680 - BLOCK
      ?auto_46682 - BLOCK
      ?auto_46681 - BLOCK
      ?auto_46683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46677 ?auto_46678 ) ) ( not ( = ?auto_46677 ?auto_46679 ) ) ( not ( = ?auto_46678 ?auto_46679 ) ) ( not ( = ?auto_46677 ?auto_46680 ) ) ( not ( = ?auto_46678 ?auto_46680 ) ) ( not ( = ?auto_46679 ?auto_46680 ) ) ( not ( = ?auto_46682 ?auto_46681 ) ) ( not ( = ?auto_46682 ?auto_46680 ) ) ( not ( = ?auto_46682 ?auto_46679 ) ) ( not ( = ?auto_46682 ?auto_46678 ) ) ( not ( = ?auto_46681 ?auto_46680 ) ) ( not ( = ?auto_46681 ?auto_46679 ) ) ( not ( = ?auto_46681 ?auto_46678 ) ) ( not ( = ?auto_46677 ?auto_46682 ) ) ( not ( = ?auto_46677 ?auto_46681 ) ) ( ON ?auto_46677 ?auto_46683 ) ( not ( = ?auto_46677 ?auto_46683 ) ) ( not ( = ?auto_46678 ?auto_46683 ) ) ( not ( = ?auto_46679 ?auto_46683 ) ) ( not ( = ?auto_46680 ?auto_46683 ) ) ( not ( = ?auto_46682 ?auto_46683 ) ) ( not ( = ?auto_46681 ?auto_46683 ) ) ( ON ?auto_46678 ?auto_46677 ) ( ON-TABLE ?auto_46683 ) ( ON ?auto_46679 ?auto_46678 ) ( ON ?auto_46680 ?auto_46679 ) ( ON ?auto_46681 ?auto_46680 ) ( ON ?auto_46682 ?auto_46681 ) ( CLEAR ?auto_46682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46683 ?auto_46677 ?auto_46678 ?auto_46679 ?auto_46680 ?auto_46681 )
      ( MAKE-3PILE ?auto_46677 ?auto_46678 ?auto_46679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46699 - BLOCK
      ?auto_46700 - BLOCK
    )
    :vars
    (
      ?auto_46703 - BLOCK
      ?auto_46702 - BLOCK
      ?auto_46701 - BLOCK
      ?auto_46704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46703 ?auto_46700 ) ( ON-TABLE ?auto_46699 ) ( ON ?auto_46700 ?auto_46699 ) ( not ( = ?auto_46699 ?auto_46700 ) ) ( not ( = ?auto_46699 ?auto_46703 ) ) ( not ( = ?auto_46700 ?auto_46703 ) ) ( not ( = ?auto_46699 ?auto_46702 ) ) ( not ( = ?auto_46699 ?auto_46701 ) ) ( not ( = ?auto_46700 ?auto_46702 ) ) ( not ( = ?auto_46700 ?auto_46701 ) ) ( not ( = ?auto_46703 ?auto_46702 ) ) ( not ( = ?auto_46703 ?auto_46701 ) ) ( not ( = ?auto_46702 ?auto_46701 ) ) ( ON ?auto_46702 ?auto_46703 ) ( CLEAR ?auto_46702 ) ( HOLDING ?auto_46701 ) ( CLEAR ?auto_46704 ) ( ON-TABLE ?auto_46704 ) ( not ( = ?auto_46704 ?auto_46701 ) ) ( not ( = ?auto_46699 ?auto_46704 ) ) ( not ( = ?auto_46700 ?auto_46704 ) ) ( not ( = ?auto_46703 ?auto_46704 ) ) ( not ( = ?auto_46702 ?auto_46704 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46704 ?auto_46701 )
      ( MAKE-2PILE ?auto_46699 ?auto_46700 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46705 - BLOCK
      ?auto_46706 - BLOCK
    )
    :vars
    (
      ?auto_46708 - BLOCK
      ?auto_46710 - BLOCK
      ?auto_46709 - BLOCK
      ?auto_46707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46708 ?auto_46706 ) ( ON-TABLE ?auto_46705 ) ( ON ?auto_46706 ?auto_46705 ) ( not ( = ?auto_46705 ?auto_46706 ) ) ( not ( = ?auto_46705 ?auto_46708 ) ) ( not ( = ?auto_46706 ?auto_46708 ) ) ( not ( = ?auto_46705 ?auto_46710 ) ) ( not ( = ?auto_46705 ?auto_46709 ) ) ( not ( = ?auto_46706 ?auto_46710 ) ) ( not ( = ?auto_46706 ?auto_46709 ) ) ( not ( = ?auto_46708 ?auto_46710 ) ) ( not ( = ?auto_46708 ?auto_46709 ) ) ( not ( = ?auto_46710 ?auto_46709 ) ) ( ON ?auto_46710 ?auto_46708 ) ( CLEAR ?auto_46707 ) ( ON-TABLE ?auto_46707 ) ( not ( = ?auto_46707 ?auto_46709 ) ) ( not ( = ?auto_46705 ?auto_46707 ) ) ( not ( = ?auto_46706 ?auto_46707 ) ) ( not ( = ?auto_46708 ?auto_46707 ) ) ( not ( = ?auto_46710 ?auto_46707 ) ) ( ON ?auto_46709 ?auto_46710 ) ( CLEAR ?auto_46709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46705 ?auto_46706 ?auto_46708 ?auto_46710 )
      ( MAKE-2PILE ?auto_46705 ?auto_46706 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46711 - BLOCK
      ?auto_46712 - BLOCK
    )
    :vars
    (
      ?auto_46715 - BLOCK
      ?auto_46713 - BLOCK
      ?auto_46716 - BLOCK
      ?auto_46714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46715 ?auto_46712 ) ( ON-TABLE ?auto_46711 ) ( ON ?auto_46712 ?auto_46711 ) ( not ( = ?auto_46711 ?auto_46712 ) ) ( not ( = ?auto_46711 ?auto_46715 ) ) ( not ( = ?auto_46712 ?auto_46715 ) ) ( not ( = ?auto_46711 ?auto_46713 ) ) ( not ( = ?auto_46711 ?auto_46716 ) ) ( not ( = ?auto_46712 ?auto_46713 ) ) ( not ( = ?auto_46712 ?auto_46716 ) ) ( not ( = ?auto_46715 ?auto_46713 ) ) ( not ( = ?auto_46715 ?auto_46716 ) ) ( not ( = ?auto_46713 ?auto_46716 ) ) ( ON ?auto_46713 ?auto_46715 ) ( not ( = ?auto_46714 ?auto_46716 ) ) ( not ( = ?auto_46711 ?auto_46714 ) ) ( not ( = ?auto_46712 ?auto_46714 ) ) ( not ( = ?auto_46715 ?auto_46714 ) ) ( not ( = ?auto_46713 ?auto_46714 ) ) ( ON ?auto_46716 ?auto_46713 ) ( CLEAR ?auto_46716 ) ( HOLDING ?auto_46714 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46714 )
      ( MAKE-2PILE ?auto_46711 ?auto_46712 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46725 - BLOCK
      ?auto_46726 - BLOCK
    )
    :vars
    (
      ?auto_46729 - BLOCK
      ?auto_46728 - BLOCK
      ?auto_46730 - BLOCK
      ?auto_46727 - BLOCK
      ?auto_46731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46729 ?auto_46726 ) ( ON-TABLE ?auto_46725 ) ( ON ?auto_46726 ?auto_46725 ) ( not ( = ?auto_46725 ?auto_46726 ) ) ( not ( = ?auto_46725 ?auto_46729 ) ) ( not ( = ?auto_46726 ?auto_46729 ) ) ( not ( = ?auto_46725 ?auto_46728 ) ) ( not ( = ?auto_46725 ?auto_46730 ) ) ( not ( = ?auto_46726 ?auto_46728 ) ) ( not ( = ?auto_46726 ?auto_46730 ) ) ( not ( = ?auto_46729 ?auto_46728 ) ) ( not ( = ?auto_46729 ?auto_46730 ) ) ( not ( = ?auto_46728 ?auto_46730 ) ) ( ON ?auto_46728 ?auto_46729 ) ( not ( = ?auto_46727 ?auto_46730 ) ) ( not ( = ?auto_46725 ?auto_46727 ) ) ( not ( = ?auto_46726 ?auto_46727 ) ) ( not ( = ?auto_46729 ?auto_46727 ) ) ( not ( = ?auto_46728 ?auto_46727 ) ) ( ON ?auto_46730 ?auto_46728 ) ( CLEAR ?auto_46730 ) ( ON ?auto_46727 ?auto_46731 ) ( CLEAR ?auto_46727 ) ( HAND-EMPTY ) ( not ( = ?auto_46725 ?auto_46731 ) ) ( not ( = ?auto_46726 ?auto_46731 ) ) ( not ( = ?auto_46729 ?auto_46731 ) ) ( not ( = ?auto_46728 ?auto_46731 ) ) ( not ( = ?auto_46730 ?auto_46731 ) ) ( not ( = ?auto_46727 ?auto_46731 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46727 ?auto_46731 )
      ( MAKE-2PILE ?auto_46725 ?auto_46726 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46732 - BLOCK
      ?auto_46733 - BLOCK
    )
    :vars
    (
      ?auto_46737 - BLOCK
      ?auto_46734 - BLOCK
      ?auto_46735 - BLOCK
      ?auto_46736 - BLOCK
      ?auto_46738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46737 ?auto_46733 ) ( ON-TABLE ?auto_46732 ) ( ON ?auto_46733 ?auto_46732 ) ( not ( = ?auto_46732 ?auto_46733 ) ) ( not ( = ?auto_46732 ?auto_46737 ) ) ( not ( = ?auto_46733 ?auto_46737 ) ) ( not ( = ?auto_46732 ?auto_46734 ) ) ( not ( = ?auto_46732 ?auto_46735 ) ) ( not ( = ?auto_46733 ?auto_46734 ) ) ( not ( = ?auto_46733 ?auto_46735 ) ) ( not ( = ?auto_46737 ?auto_46734 ) ) ( not ( = ?auto_46737 ?auto_46735 ) ) ( not ( = ?auto_46734 ?auto_46735 ) ) ( ON ?auto_46734 ?auto_46737 ) ( not ( = ?auto_46736 ?auto_46735 ) ) ( not ( = ?auto_46732 ?auto_46736 ) ) ( not ( = ?auto_46733 ?auto_46736 ) ) ( not ( = ?auto_46737 ?auto_46736 ) ) ( not ( = ?auto_46734 ?auto_46736 ) ) ( ON ?auto_46736 ?auto_46738 ) ( CLEAR ?auto_46736 ) ( not ( = ?auto_46732 ?auto_46738 ) ) ( not ( = ?auto_46733 ?auto_46738 ) ) ( not ( = ?auto_46737 ?auto_46738 ) ) ( not ( = ?auto_46734 ?auto_46738 ) ) ( not ( = ?auto_46735 ?auto_46738 ) ) ( not ( = ?auto_46736 ?auto_46738 ) ) ( HOLDING ?auto_46735 ) ( CLEAR ?auto_46734 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46732 ?auto_46733 ?auto_46737 ?auto_46734 ?auto_46735 )
      ( MAKE-2PILE ?auto_46732 ?auto_46733 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46778 - BLOCK
      ?auto_46779 - BLOCK
      ?auto_46780 - BLOCK
      ?auto_46781 - BLOCK
    )
    :vars
    (
      ?auto_46782 - BLOCK
      ?auto_46783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46778 ) ( ON ?auto_46779 ?auto_46778 ) ( not ( = ?auto_46778 ?auto_46779 ) ) ( not ( = ?auto_46778 ?auto_46780 ) ) ( not ( = ?auto_46778 ?auto_46781 ) ) ( not ( = ?auto_46779 ?auto_46780 ) ) ( not ( = ?auto_46779 ?auto_46781 ) ) ( not ( = ?auto_46780 ?auto_46781 ) ) ( ON ?auto_46781 ?auto_46782 ) ( not ( = ?auto_46778 ?auto_46782 ) ) ( not ( = ?auto_46779 ?auto_46782 ) ) ( not ( = ?auto_46780 ?auto_46782 ) ) ( not ( = ?auto_46781 ?auto_46782 ) ) ( CLEAR ?auto_46779 ) ( ON ?auto_46780 ?auto_46781 ) ( CLEAR ?auto_46780 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46783 ) ( ON ?auto_46782 ?auto_46783 ) ( not ( = ?auto_46783 ?auto_46782 ) ) ( not ( = ?auto_46783 ?auto_46781 ) ) ( not ( = ?auto_46783 ?auto_46780 ) ) ( not ( = ?auto_46778 ?auto_46783 ) ) ( not ( = ?auto_46779 ?auto_46783 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46783 ?auto_46782 ?auto_46781 )
      ( MAKE-4PILE ?auto_46778 ?auto_46779 ?auto_46780 ?auto_46781 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46784 - BLOCK
      ?auto_46785 - BLOCK
      ?auto_46786 - BLOCK
      ?auto_46787 - BLOCK
    )
    :vars
    (
      ?auto_46789 - BLOCK
      ?auto_46788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46784 ) ( not ( = ?auto_46784 ?auto_46785 ) ) ( not ( = ?auto_46784 ?auto_46786 ) ) ( not ( = ?auto_46784 ?auto_46787 ) ) ( not ( = ?auto_46785 ?auto_46786 ) ) ( not ( = ?auto_46785 ?auto_46787 ) ) ( not ( = ?auto_46786 ?auto_46787 ) ) ( ON ?auto_46787 ?auto_46789 ) ( not ( = ?auto_46784 ?auto_46789 ) ) ( not ( = ?auto_46785 ?auto_46789 ) ) ( not ( = ?auto_46786 ?auto_46789 ) ) ( not ( = ?auto_46787 ?auto_46789 ) ) ( ON ?auto_46786 ?auto_46787 ) ( CLEAR ?auto_46786 ) ( ON-TABLE ?auto_46788 ) ( ON ?auto_46789 ?auto_46788 ) ( not ( = ?auto_46788 ?auto_46789 ) ) ( not ( = ?auto_46788 ?auto_46787 ) ) ( not ( = ?auto_46788 ?auto_46786 ) ) ( not ( = ?auto_46784 ?auto_46788 ) ) ( not ( = ?auto_46785 ?auto_46788 ) ) ( HOLDING ?auto_46785 ) ( CLEAR ?auto_46784 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46784 ?auto_46785 )
      ( MAKE-4PILE ?auto_46784 ?auto_46785 ?auto_46786 ?auto_46787 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46790 - BLOCK
      ?auto_46791 - BLOCK
      ?auto_46792 - BLOCK
      ?auto_46793 - BLOCK
    )
    :vars
    (
      ?auto_46795 - BLOCK
      ?auto_46794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46790 ) ( not ( = ?auto_46790 ?auto_46791 ) ) ( not ( = ?auto_46790 ?auto_46792 ) ) ( not ( = ?auto_46790 ?auto_46793 ) ) ( not ( = ?auto_46791 ?auto_46792 ) ) ( not ( = ?auto_46791 ?auto_46793 ) ) ( not ( = ?auto_46792 ?auto_46793 ) ) ( ON ?auto_46793 ?auto_46795 ) ( not ( = ?auto_46790 ?auto_46795 ) ) ( not ( = ?auto_46791 ?auto_46795 ) ) ( not ( = ?auto_46792 ?auto_46795 ) ) ( not ( = ?auto_46793 ?auto_46795 ) ) ( ON ?auto_46792 ?auto_46793 ) ( ON-TABLE ?auto_46794 ) ( ON ?auto_46795 ?auto_46794 ) ( not ( = ?auto_46794 ?auto_46795 ) ) ( not ( = ?auto_46794 ?auto_46793 ) ) ( not ( = ?auto_46794 ?auto_46792 ) ) ( not ( = ?auto_46790 ?auto_46794 ) ) ( not ( = ?auto_46791 ?auto_46794 ) ) ( CLEAR ?auto_46790 ) ( ON ?auto_46791 ?auto_46792 ) ( CLEAR ?auto_46791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46794 ?auto_46795 ?auto_46793 ?auto_46792 )
      ( MAKE-4PILE ?auto_46790 ?auto_46791 ?auto_46792 ?auto_46793 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46796 - BLOCK
      ?auto_46797 - BLOCK
      ?auto_46798 - BLOCK
      ?auto_46799 - BLOCK
    )
    :vars
    (
      ?auto_46800 - BLOCK
      ?auto_46801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46796 ?auto_46797 ) ) ( not ( = ?auto_46796 ?auto_46798 ) ) ( not ( = ?auto_46796 ?auto_46799 ) ) ( not ( = ?auto_46797 ?auto_46798 ) ) ( not ( = ?auto_46797 ?auto_46799 ) ) ( not ( = ?auto_46798 ?auto_46799 ) ) ( ON ?auto_46799 ?auto_46800 ) ( not ( = ?auto_46796 ?auto_46800 ) ) ( not ( = ?auto_46797 ?auto_46800 ) ) ( not ( = ?auto_46798 ?auto_46800 ) ) ( not ( = ?auto_46799 ?auto_46800 ) ) ( ON ?auto_46798 ?auto_46799 ) ( ON-TABLE ?auto_46801 ) ( ON ?auto_46800 ?auto_46801 ) ( not ( = ?auto_46801 ?auto_46800 ) ) ( not ( = ?auto_46801 ?auto_46799 ) ) ( not ( = ?auto_46801 ?auto_46798 ) ) ( not ( = ?auto_46796 ?auto_46801 ) ) ( not ( = ?auto_46797 ?auto_46801 ) ) ( ON ?auto_46797 ?auto_46798 ) ( CLEAR ?auto_46797 ) ( HOLDING ?auto_46796 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46796 )
      ( MAKE-4PILE ?auto_46796 ?auto_46797 ?auto_46798 ?auto_46799 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46802 - BLOCK
      ?auto_46803 - BLOCK
      ?auto_46804 - BLOCK
      ?auto_46805 - BLOCK
    )
    :vars
    (
      ?auto_46807 - BLOCK
      ?auto_46806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46802 ?auto_46803 ) ) ( not ( = ?auto_46802 ?auto_46804 ) ) ( not ( = ?auto_46802 ?auto_46805 ) ) ( not ( = ?auto_46803 ?auto_46804 ) ) ( not ( = ?auto_46803 ?auto_46805 ) ) ( not ( = ?auto_46804 ?auto_46805 ) ) ( ON ?auto_46805 ?auto_46807 ) ( not ( = ?auto_46802 ?auto_46807 ) ) ( not ( = ?auto_46803 ?auto_46807 ) ) ( not ( = ?auto_46804 ?auto_46807 ) ) ( not ( = ?auto_46805 ?auto_46807 ) ) ( ON ?auto_46804 ?auto_46805 ) ( ON-TABLE ?auto_46806 ) ( ON ?auto_46807 ?auto_46806 ) ( not ( = ?auto_46806 ?auto_46807 ) ) ( not ( = ?auto_46806 ?auto_46805 ) ) ( not ( = ?auto_46806 ?auto_46804 ) ) ( not ( = ?auto_46802 ?auto_46806 ) ) ( not ( = ?auto_46803 ?auto_46806 ) ) ( ON ?auto_46803 ?auto_46804 ) ( ON ?auto_46802 ?auto_46803 ) ( CLEAR ?auto_46802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46806 ?auto_46807 ?auto_46805 ?auto_46804 ?auto_46803 )
      ( MAKE-4PILE ?auto_46802 ?auto_46803 ?auto_46804 ?auto_46805 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46812 - BLOCK
      ?auto_46813 - BLOCK
      ?auto_46814 - BLOCK
      ?auto_46815 - BLOCK
    )
    :vars
    (
      ?auto_46817 - BLOCK
      ?auto_46816 - BLOCK
      ?auto_46818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46812 ?auto_46813 ) ) ( not ( = ?auto_46812 ?auto_46814 ) ) ( not ( = ?auto_46812 ?auto_46815 ) ) ( not ( = ?auto_46813 ?auto_46814 ) ) ( not ( = ?auto_46813 ?auto_46815 ) ) ( not ( = ?auto_46814 ?auto_46815 ) ) ( ON ?auto_46815 ?auto_46817 ) ( not ( = ?auto_46812 ?auto_46817 ) ) ( not ( = ?auto_46813 ?auto_46817 ) ) ( not ( = ?auto_46814 ?auto_46817 ) ) ( not ( = ?auto_46815 ?auto_46817 ) ) ( ON ?auto_46814 ?auto_46815 ) ( ON-TABLE ?auto_46816 ) ( ON ?auto_46817 ?auto_46816 ) ( not ( = ?auto_46816 ?auto_46817 ) ) ( not ( = ?auto_46816 ?auto_46815 ) ) ( not ( = ?auto_46816 ?auto_46814 ) ) ( not ( = ?auto_46812 ?auto_46816 ) ) ( not ( = ?auto_46813 ?auto_46816 ) ) ( ON ?auto_46813 ?auto_46814 ) ( CLEAR ?auto_46813 ) ( ON ?auto_46812 ?auto_46818 ) ( CLEAR ?auto_46812 ) ( HAND-EMPTY ) ( not ( = ?auto_46812 ?auto_46818 ) ) ( not ( = ?auto_46813 ?auto_46818 ) ) ( not ( = ?auto_46814 ?auto_46818 ) ) ( not ( = ?auto_46815 ?auto_46818 ) ) ( not ( = ?auto_46817 ?auto_46818 ) ) ( not ( = ?auto_46816 ?auto_46818 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46812 ?auto_46818 )
      ( MAKE-4PILE ?auto_46812 ?auto_46813 ?auto_46814 ?auto_46815 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46819 - BLOCK
      ?auto_46820 - BLOCK
      ?auto_46821 - BLOCK
      ?auto_46822 - BLOCK
    )
    :vars
    (
      ?auto_46823 - BLOCK
      ?auto_46825 - BLOCK
      ?auto_46824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46819 ?auto_46820 ) ) ( not ( = ?auto_46819 ?auto_46821 ) ) ( not ( = ?auto_46819 ?auto_46822 ) ) ( not ( = ?auto_46820 ?auto_46821 ) ) ( not ( = ?auto_46820 ?auto_46822 ) ) ( not ( = ?auto_46821 ?auto_46822 ) ) ( ON ?auto_46822 ?auto_46823 ) ( not ( = ?auto_46819 ?auto_46823 ) ) ( not ( = ?auto_46820 ?auto_46823 ) ) ( not ( = ?auto_46821 ?auto_46823 ) ) ( not ( = ?auto_46822 ?auto_46823 ) ) ( ON ?auto_46821 ?auto_46822 ) ( ON-TABLE ?auto_46825 ) ( ON ?auto_46823 ?auto_46825 ) ( not ( = ?auto_46825 ?auto_46823 ) ) ( not ( = ?auto_46825 ?auto_46822 ) ) ( not ( = ?auto_46825 ?auto_46821 ) ) ( not ( = ?auto_46819 ?auto_46825 ) ) ( not ( = ?auto_46820 ?auto_46825 ) ) ( ON ?auto_46819 ?auto_46824 ) ( CLEAR ?auto_46819 ) ( not ( = ?auto_46819 ?auto_46824 ) ) ( not ( = ?auto_46820 ?auto_46824 ) ) ( not ( = ?auto_46821 ?auto_46824 ) ) ( not ( = ?auto_46822 ?auto_46824 ) ) ( not ( = ?auto_46823 ?auto_46824 ) ) ( not ( = ?auto_46825 ?auto_46824 ) ) ( HOLDING ?auto_46820 ) ( CLEAR ?auto_46821 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46825 ?auto_46823 ?auto_46822 ?auto_46821 ?auto_46820 )
      ( MAKE-4PILE ?auto_46819 ?auto_46820 ?auto_46821 ?auto_46822 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46826 - BLOCK
      ?auto_46827 - BLOCK
      ?auto_46828 - BLOCK
      ?auto_46829 - BLOCK
    )
    :vars
    (
      ?auto_46830 - BLOCK
      ?auto_46831 - BLOCK
      ?auto_46832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46826 ?auto_46827 ) ) ( not ( = ?auto_46826 ?auto_46828 ) ) ( not ( = ?auto_46826 ?auto_46829 ) ) ( not ( = ?auto_46827 ?auto_46828 ) ) ( not ( = ?auto_46827 ?auto_46829 ) ) ( not ( = ?auto_46828 ?auto_46829 ) ) ( ON ?auto_46829 ?auto_46830 ) ( not ( = ?auto_46826 ?auto_46830 ) ) ( not ( = ?auto_46827 ?auto_46830 ) ) ( not ( = ?auto_46828 ?auto_46830 ) ) ( not ( = ?auto_46829 ?auto_46830 ) ) ( ON ?auto_46828 ?auto_46829 ) ( ON-TABLE ?auto_46831 ) ( ON ?auto_46830 ?auto_46831 ) ( not ( = ?auto_46831 ?auto_46830 ) ) ( not ( = ?auto_46831 ?auto_46829 ) ) ( not ( = ?auto_46831 ?auto_46828 ) ) ( not ( = ?auto_46826 ?auto_46831 ) ) ( not ( = ?auto_46827 ?auto_46831 ) ) ( ON ?auto_46826 ?auto_46832 ) ( not ( = ?auto_46826 ?auto_46832 ) ) ( not ( = ?auto_46827 ?auto_46832 ) ) ( not ( = ?auto_46828 ?auto_46832 ) ) ( not ( = ?auto_46829 ?auto_46832 ) ) ( not ( = ?auto_46830 ?auto_46832 ) ) ( not ( = ?auto_46831 ?auto_46832 ) ) ( CLEAR ?auto_46828 ) ( ON ?auto_46827 ?auto_46826 ) ( CLEAR ?auto_46827 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46832 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46832 ?auto_46826 )
      ( MAKE-4PILE ?auto_46826 ?auto_46827 ?auto_46828 ?auto_46829 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46833 - BLOCK
      ?auto_46834 - BLOCK
      ?auto_46835 - BLOCK
      ?auto_46836 - BLOCK
    )
    :vars
    (
      ?auto_46839 - BLOCK
      ?auto_46837 - BLOCK
      ?auto_46838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46833 ?auto_46834 ) ) ( not ( = ?auto_46833 ?auto_46835 ) ) ( not ( = ?auto_46833 ?auto_46836 ) ) ( not ( = ?auto_46834 ?auto_46835 ) ) ( not ( = ?auto_46834 ?auto_46836 ) ) ( not ( = ?auto_46835 ?auto_46836 ) ) ( ON ?auto_46836 ?auto_46839 ) ( not ( = ?auto_46833 ?auto_46839 ) ) ( not ( = ?auto_46834 ?auto_46839 ) ) ( not ( = ?auto_46835 ?auto_46839 ) ) ( not ( = ?auto_46836 ?auto_46839 ) ) ( ON-TABLE ?auto_46837 ) ( ON ?auto_46839 ?auto_46837 ) ( not ( = ?auto_46837 ?auto_46839 ) ) ( not ( = ?auto_46837 ?auto_46836 ) ) ( not ( = ?auto_46837 ?auto_46835 ) ) ( not ( = ?auto_46833 ?auto_46837 ) ) ( not ( = ?auto_46834 ?auto_46837 ) ) ( ON ?auto_46833 ?auto_46838 ) ( not ( = ?auto_46833 ?auto_46838 ) ) ( not ( = ?auto_46834 ?auto_46838 ) ) ( not ( = ?auto_46835 ?auto_46838 ) ) ( not ( = ?auto_46836 ?auto_46838 ) ) ( not ( = ?auto_46839 ?auto_46838 ) ) ( not ( = ?auto_46837 ?auto_46838 ) ) ( ON ?auto_46834 ?auto_46833 ) ( CLEAR ?auto_46834 ) ( ON-TABLE ?auto_46838 ) ( HOLDING ?auto_46835 ) ( CLEAR ?auto_46836 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46837 ?auto_46839 ?auto_46836 ?auto_46835 )
      ( MAKE-4PILE ?auto_46833 ?auto_46834 ?auto_46835 ?auto_46836 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46840 - BLOCK
      ?auto_46841 - BLOCK
      ?auto_46842 - BLOCK
      ?auto_46843 - BLOCK
    )
    :vars
    (
      ?auto_46846 - BLOCK
      ?auto_46845 - BLOCK
      ?auto_46844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46840 ?auto_46841 ) ) ( not ( = ?auto_46840 ?auto_46842 ) ) ( not ( = ?auto_46840 ?auto_46843 ) ) ( not ( = ?auto_46841 ?auto_46842 ) ) ( not ( = ?auto_46841 ?auto_46843 ) ) ( not ( = ?auto_46842 ?auto_46843 ) ) ( ON ?auto_46843 ?auto_46846 ) ( not ( = ?auto_46840 ?auto_46846 ) ) ( not ( = ?auto_46841 ?auto_46846 ) ) ( not ( = ?auto_46842 ?auto_46846 ) ) ( not ( = ?auto_46843 ?auto_46846 ) ) ( ON-TABLE ?auto_46845 ) ( ON ?auto_46846 ?auto_46845 ) ( not ( = ?auto_46845 ?auto_46846 ) ) ( not ( = ?auto_46845 ?auto_46843 ) ) ( not ( = ?auto_46845 ?auto_46842 ) ) ( not ( = ?auto_46840 ?auto_46845 ) ) ( not ( = ?auto_46841 ?auto_46845 ) ) ( ON ?auto_46840 ?auto_46844 ) ( not ( = ?auto_46840 ?auto_46844 ) ) ( not ( = ?auto_46841 ?auto_46844 ) ) ( not ( = ?auto_46842 ?auto_46844 ) ) ( not ( = ?auto_46843 ?auto_46844 ) ) ( not ( = ?auto_46846 ?auto_46844 ) ) ( not ( = ?auto_46845 ?auto_46844 ) ) ( ON ?auto_46841 ?auto_46840 ) ( ON-TABLE ?auto_46844 ) ( CLEAR ?auto_46843 ) ( ON ?auto_46842 ?auto_46841 ) ( CLEAR ?auto_46842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46844 ?auto_46840 ?auto_46841 )
      ( MAKE-4PILE ?auto_46840 ?auto_46841 ?auto_46842 ?auto_46843 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46847 - BLOCK
      ?auto_46848 - BLOCK
      ?auto_46849 - BLOCK
      ?auto_46850 - BLOCK
    )
    :vars
    (
      ?auto_46853 - BLOCK
      ?auto_46852 - BLOCK
      ?auto_46851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46847 ?auto_46848 ) ) ( not ( = ?auto_46847 ?auto_46849 ) ) ( not ( = ?auto_46847 ?auto_46850 ) ) ( not ( = ?auto_46848 ?auto_46849 ) ) ( not ( = ?auto_46848 ?auto_46850 ) ) ( not ( = ?auto_46849 ?auto_46850 ) ) ( not ( = ?auto_46847 ?auto_46853 ) ) ( not ( = ?auto_46848 ?auto_46853 ) ) ( not ( = ?auto_46849 ?auto_46853 ) ) ( not ( = ?auto_46850 ?auto_46853 ) ) ( ON-TABLE ?auto_46852 ) ( ON ?auto_46853 ?auto_46852 ) ( not ( = ?auto_46852 ?auto_46853 ) ) ( not ( = ?auto_46852 ?auto_46850 ) ) ( not ( = ?auto_46852 ?auto_46849 ) ) ( not ( = ?auto_46847 ?auto_46852 ) ) ( not ( = ?auto_46848 ?auto_46852 ) ) ( ON ?auto_46847 ?auto_46851 ) ( not ( = ?auto_46847 ?auto_46851 ) ) ( not ( = ?auto_46848 ?auto_46851 ) ) ( not ( = ?auto_46849 ?auto_46851 ) ) ( not ( = ?auto_46850 ?auto_46851 ) ) ( not ( = ?auto_46853 ?auto_46851 ) ) ( not ( = ?auto_46852 ?auto_46851 ) ) ( ON ?auto_46848 ?auto_46847 ) ( ON-TABLE ?auto_46851 ) ( ON ?auto_46849 ?auto_46848 ) ( CLEAR ?auto_46849 ) ( HOLDING ?auto_46850 ) ( CLEAR ?auto_46853 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46852 ?auto_46853 ?auto_46850 )
      ( MAKE-4PILE ?auto_46847 ?auto_46848 ?auto_46849 ?auto_46850 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46854 - BLOCK
      ?auto_46855 - BLOCK
      ?auto_46856 - BLOCK
      ?auto_46857 - BLOCK
    )
    :vars
    (
      ?auto_46859 - BLOCK
      ?auto_46860 - BLOCK
      ?auto_46858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46854 ?auto_46855 ) ) ( not ( = ?auto_46854 ?auto_46856 ) ) ( not ( = ?auto_46854 ?auto_46857 ) ) ( not ( = ?auto_46855 ?auto_46856 ) ) ( not ( = ?auto_46855 ?auto_46857 ) ) ( not ( = ?auto_46856 ?auto_46857 ) ) ( not ( = ?auto_46854 ?auto_46859 ) ) ( not ( = ?auto_46855 ?auto_46859 ) ) ( not ( = ?auto_46856 ?auto_46859 ) ) ( not ( = ?auto_46857 ?auto_46859 ) ) ( ON-TABLE ?auto_46860 ) ( ON ?auto_46859 ?auto_46860 ) ( not ( = ?auto_46860 ?auto_46859 ) ) ( not ( = ?auto_46860 ?auto_46857 ) ) ( not ( = ?auto_46860 ?auto_46856 ) ) ( not ( = ?auto_46854 ?auto_46860 ) ) ( not ( = ?auto_46855 ?auto_46860 ) ) ( ON ?auto_46854 ?auto_46858 ) ( not ( = ?auto_46854 ?auto_46858 ) ) ( not ( = ?auto_46855 ?auto_46858 ) ) ( not ( = ?auto_46856 ?auto_46858 ) ) ( not ( = ?auto_46857 ?auto_46858 ) ) ( not ( = ?auto_46859 ?auto_46858 ) ) ( not ( = ?auto_46860 ?auto_46858 ) ) ( ON ?auto_46855 ?auto_46854 ) ( ON-TABLE ?auto_46858 ) ( ON ?auto_46856 ?auto_46855 ) ( CLEAR ?auto_46859 ) ( ON ?auto_46857 ?auto_46856 ) ( CLEAR ?auto_46857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46858 ?auto_46854 ?auto_46855 ?auto_46856 )
      ( MAKE-4PILE ?auto_46854 ?auto_46855 ?auto_46856 ?auto_46857 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46861 - BLOCK
      ?auto_46862 - BLOCK
      ?auto_46863 - BLOCK
      ?auto_46864 - BLOCK
    )
    :vars
    (
      ?auto_46866 - BLOCK
      ?auto_46865 - BLOCK
      ?auto_46867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46861 ?auto_46862 ) ) ( not ( = ?auto_46861 ?auto_46863 ) ) ( not ( = ?auto_46861 ?auto_46864 ) ) ( not ( = ?auto_46862 ?auto_46863 ) ) ( not ( = ?auto_46862 ?auto_46864 ) ) ( not ( = ?auto_46863 ?auto_46864 ) ) ( not ( = ?auto_46861 ?auto_46866 ) ) ( not ( = ?auto_46862 ?auto_46866 ) ) ( not ( = ?auto_46863 ?auto_46866 ) ) ( not ( = ?auto_46864 ?auto_46866 ) ) ( ON-TABLE ?auto_46865 ) ( not ( = ?auto_46865 ?auto_46866 ) ) ( not ( = ?auto_46865 ?auto_46864 ) ) ( not ( = ?auto_46865 ?auto_46863 ) ) ( not ( = ?auto_46861 ?auto_46865 ) ) ( not ( = ?auto_46862 ?auto_46865 ) ) ( ON ?auto_46861 ?auto_46867 ) ( not ( = ?auto_46861 ?auto_46867 ) ) ( not ( = ?auto_46862 ?auto_46867 ) ) ( not ( = ?auto_46863 ?auto_46867 ) ) ( not ( = ?auto_46864 ?auto_46867 ) ) ( not ( = ?auto_46866 ?auto_46867 ) ) ( not ( = ?auto_46865 ?auto_46867 ) ) ( ON ?auto_46862 ?auto_46861 ) ( ON-TABLE ?auto_46867 ) ( ON ?auto_46863 ?auto_46862 ) ( ON ?auto_46864 ?auto_46863 ) ( CLEAR ?auto_46864 ) ( HOLDING ?auto_46866 ) ( CLEAR ?auto_46865 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46865 ?auto_46866 )
      ( MAKE-4PILE ?auto_46861 ?auto_46862 ?auto_46863 ?auto_46864 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46868 - BLOCK
      ?auto_46869 - BLOCK
      ?auto_46870 - BLOCK
      ?auto_46871 - BLOCK
    )
    :vars
    (
      ?auto_46874 - BLOCK
      ?auto_46872 - BLOCK
      ?auto_46873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46868 ?auto_46869 ) ) ( not ( = ?auto_46868 ?auto_46870 ) ) ( not ( = ?auto_46868 ?auto_46871 ) ) ( not ( = ?auto_46869 ?auto_46870 ) ) ( not ( = ?auto_46869 ?auto_46871 ) ) ( not ( = ?auto_46870 ?auto_46871 ) ) ( not ( = ?auto_46868 ?auto_46874 ) ) ( not ( = ?auto_46869 ?auto_46874 ) ) ( not ( = ?auto_46870 ?auto_46874 ) ) ( not ( = ?auto_46871 ?auto_46874 ) ) ( ON-TABLE ?auto_46872 ) ( not ( = ?auto_46872 ?auto_46874 ) ) ( not ( = ?auto_46872 ?auto_46871 ) ) ( not ( = ?auto_46872 ?auto_46870 ) ) ( not ( = ?auto_46868 ?auto_46872 ) ) ( not ( = ?auto_46869 ?auto_46872 ) ) ( ON ?auto_46868 ?auto_46873 ) ( not ( = ?auto_46868 ?auto_46873 ) ) ( not ( = ?auto_46869 ?auto_46873 ) ) ( not ( = ?auto_46870 ?auto_46873 ) ) ( not ( = ?auto_46871 ?auto_46873 ) ) ( not ( = ?auto_46874 ?auto_46873 ) ) ( not ( = ?auto_46872 ?auto_46873 ) ) ( ON ?auto_46869 ?auto_46868 ) ( ON-TABLE ?auto_46873 ) ( ON ?auto_46870 ?auto_46869 ) ( ON ?auto_46871 ?auto_46870 ) ( CLEAR ?auto_46872 ) ( ON ?auto_46874 ?auto_46871 ) ( CLEAR ?auto_46874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46873 ?auto_46868 ?auto_46869 ?auto_46870 ?auto_46871 )
      ( MAKE-4PILE ?auto_46868 ?auto_46869 ?auto_46870 ?auto_46871 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46875 - BLOCK
      ?auto_46876 - BLOCK
      ?auto_46877 - BLOCK
      ?auto_46878 - BLOCK
    )
    :vars
    (
      ?auto_46881 - BLOCK
      ?auto_46880 - BLOCK
      ?auto_46879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46875 ?auto_46876 ) ) ( not ( = ?auto_46875 ?auto_46877 ) ) ( not ( = ?auto_46875 ?auto_46878 ) ) ( not ( = ?auto_46876 ?auto_46877 ) ) ( not ( = ?auto_46876 ?auto_46878 ) ) ( not ( = ?auto_46877 ?auto_46878 ) ) ( not ( = ?auto_46875 ?auto_46881 ) ) ( not ( = ?auto_46876 ?auto_46881 ) ) ( not ( = ?auto_46877 ?auto_46881 ) ) ( not ( = ?auto_46878 ?auto_46881 ) ) ( not ( = ?auto_46880 ?auto_46881 ) ) ( not ( = ?auto_46880 ?auto_46878 ) ) ( not ( = ?auto_46880 ?auto_46877 ) ) ( not ( = ?auto_46875 ?auto_46880 ) ) ( not ( = ?auto_46876 ?auto_46880 ) ) ( ON ?auto_46875 ?auto_46879 ) ( not ( = ?auto_46875 ?auto_46879 ) ) ( not ( = ?auto_46876 ?auto_46879 ) ) ( not ( = ?auto_46877 ?auto_46879 ) ) ( not ( = ?auto_46878 ?auto_46879 ) ) ( not ( = ?auto_46881 ?auto_46879 ) ) ( not ( = ?auto_46880 ?auto_46879 ) ) ( ON ?auto_46876 ?auto_46875 ) ( ON-TABLE ?auto_46879 ) ( ON ?auto_46877 ?auto_46876 ) ( ON ?auto_46878 ?auto_46877 ) ( ON ?auto_46881 ?auto_46878 ) ( CLEAR ?auto_46881 ) ( HOLDING ?auto_46880 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46880 )
      ( MAKE-4PILE ?auto_46875 ?auto_46876 ?auto_46877 ?auto_46878 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46882 - BLOCK
      ?auto_46883 - BLOCK
      ?auto_46884 - BLOCK
      ?auto_46885 - BLOCK
    )
    :vars
    (
      ?auto_46888 - BLOCK
      ?auto_46886 - BLOCK
      ?auto_46887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46882 ?auto_46883 ) ) ( not ( = ?auto_46882 ?auto_46884 ) ) ( not ( = ?auto_46882 ?auto_46885 ) ) ( not ( = ?auto_46883 ?auto_46884 ) ) ( not ( = ?auto_46883 ?auto_46885 ) ) ( not ( = ?auto_46884 ?auto_46885 ) ) ( not ( = ?auto_46882 ?auto_46888 ) ) ( not ( = ?auto_46883 ?auto_46888 ) ) ( not ( = ?auto_46884 ?auto_46888 ) ) ( not ( = ?auto_46885 ?auto_46888 ) ) ( not ( = ?auto_46886 ?auto_46888 ) ) ( not ( = ?auto_46886 ?auto_46885 ) ) ( not ( = ?auto_46886 ?auto_46884 ) ) ( not ( = ?auto_46882 ?auto_46886 ) ) ( not ( = ?auto_46883 ?auto_46886 ) ) ( ON ?auto_46882 ?auto_46887 ) ( not ( = ?auto_46882 ?auto_46887 ) ) ( not ( = ?auto_46883 ?auto_46887 ) ) ( not ( = ?auto_46884 ?auto_46887 ) ) ( not ( = ?auto_46885 ?auto_46887 ) ) ( not ( = ?auto_46888 ?auto_46887 ) ) ( not ( = ?auto_46886 ?auto_46887 ) ) ( ON ?auto_46883 ?auto_46882 ) ( ON-TABLE ?auto_46887 ) ( ON ?auto_46884 ?auto_46883 ) ( ON ?auto_46885 ?auto_46884 ) ( ON ?auto_46888 ?auto_46885 ) ( ON ?auto_46886 ?auto_46888 ) ( CLEAR ?auto_46886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46887 ?auto_46882 ?auto_46883 ?auto_46884 ?auto_46885 ?auto_46888 )
      ( MAKE-4PILE ?auto_46882 ?auto_46883 ?auto_46884 ?auto_46885 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46900 - BLOCK
    )
    :vars
    (
      ?auto_46903 - BLOCK
      ?auto_46902 - BLOCK
      ?auto_46901 - BLOCK
      ?auto_46904 - BLOCK
      ?auto_46905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46903 ?auto_46900 ) ( ON-TABLE ?auto_46900 ) ( not ( = ?auto_46900 ?auto_46903 ) ) ( not ( = ?auto_46900 ?auto_46902 ) ) ( not ( = ?auto_46900 ?auto_46901 ) ) ( not ( = ?auto_46903 ?auto_46902 ) ) ( not ( = ?auto_46903 ?auto_46901 ) ) ( not ( = ?auto_46902 ?auto_46901 ) ) ( ON ?auto_46902 ?auto_46903 ) ( CLEAR ?auto_46902 ) ( HOLDING ?auto_46901 ) ( CLEAR ?auto_46904 ) ( ON-TABLE ?auto_46905 ) ( ON ?auto_46904 ?auto_46905 ) ( not ( = ?auto_46905 ?auto_46904 ) ) ( not ( = ?auto_46905 ?auto_46901 ) ) ( not ( = ?auto_46904 ?auto_46901 ) ) ( not ( = ?auto_46900 ?auto_46904 ) ) ( not ( = ?auto_46900 ?auto_46905 ) ) ( not ( = ?auto_46903 ?auto_46904 ) ) ( not ( = ?auto_46903 ?auto_46905 ) ) ( not ( = ?auto_46902 ?auto_46904 ) ) ( not ( = ?auto_46902 ?auto_46905 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46905 ?auto_46904 ?auto_46901 )
      ( MAKE-1PILE ?auto_46900 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46906 - BLOCK
    )
    :vars
    (
      ?auto_46909 - BLOCK
      ?auto_46908 - BLOCK
      ?auto_46907 - BLOCK
      ?auto_46910 - BLOCK
      ?auto_46911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46909 ?auto_46906 ) ( ON-TABLE ?auto_46906 ) ( not ( = ?auto_46906 ?auto_46909 ) ) ( not ( = ?auto_46906 ?auto_46908 ) ) ( not ( = ?auto_46906 ?auto_46907 ) ) ( not ( = ?auto_46909 ?auto_46908 ) ) ( not ( = ?auto_46909 ?auto_46907 ) ) ( not ( = ?auto_46908 ?auto_46907 ) ) ( ON ?auto_46908 ?auto_46909 ) ( CLEAR ?auto_46910 ) ( ON-TABLE ?auto_46911 ) ( ON ?auto_46910 ?auto_46911 ) ( not ( = ?auto_46911 ?auto_46910 ) ) ( not ( = ?auto_46911 ?auto_46907 ) ) ( not ( = ?auto_46910 ?auto_46907 ) ) ( not ( = ?auto_46906 ?auto_46910 ) ) ( not ( = ?auto_46906 ?auto_46911 ) ) ( not ( = ?auto_46909 ?auto_46910 ) ) ( not ( = ?auto_46909 ?auto_46911 ) ) ( not ( = ?auto_46908 ?auto_46910 ) ) ( not ( = ?auto_46908 ?auto_46911 ) ) ( ON ?auto_46907 ?auto_46908 ) ( CLEAR ?auto_46907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46906 ?auto_46909 ?auto_46908 )
      ( MAKE-1PILE ?auto_46906 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46912 - BLOCK
    )
    :vars
    (
      ?auto_46916 - BLOCK
      ?auto_46913 - BLOCK
      ?auto_46914 - BLOCK
      ?auto_46917 - BLOCK
      ?auto_46915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46916 ?auto_46912 ) ( ON-TABLE ?auto_46912 ) ( not ( = ?auto_46912 ?auto_46916 ) ) ( not ( = ?auto_46912 ?auto_46913 ) ) ( not ( = ?auto_46912 ?auto_46914 ) ) ( not ( = ?auto_46916 ?auto_46913 ) ) ( not ( = ?auto_46916 ?auto_46914 ) ) ( not ( = ?auto_46913 ?auto_46914 ) ) ( ON ?auto_46913 ?auto_46916 ) ( ON-TABLE ?auto_46917 ) ( not ( = ?auto_46917 ?auto_46915 ) ) ( not ( = ?auto_46917 ?auto_46914 ) ) ( not ( = ?auto_46915 ?auto_46914 ) ) ( not ( = ?auto_46912 ?auto_46915 ) ) ( not ( = ?auto_46912 ?auto_46917 ) ) ( not ( = ?auto_46916 ?auto_46915 ) ) ( not ( = ?auto_46916 ?auto_46917 ) ) ( not ( = ?auto_46913 ?auto_46915 ) ) ( not ( = ?auto_46913 ?auto_46917 ) ) ( ON ?auto_46914 ?auto_46913 ) ( CLEAR ?auto_46914 ) ( HOLDING ?auto_46915 ) ( CLEAR ?auto_46917 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46917 ?auto_46915 )
      ( MAKE-1PILE ?auto_46912 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46918 - BLOCK
    )
    :vars
    (
      ?auto_46919 - BLOCK
      ?auto_46921 - BLOCK
      ?auto_46923 - BLOCK
      ?auto_46922 - BLOCK
      ?auto_46920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46919 ?auto_46918 ) ( ON-TABLE ?auto_46918 ) ( not ( = ?auto_46918 ?auto_46919 ) ) ( not ( = ?auto_46918 ?auto_46921 ) ) ( not ( = ?auto_46918 ?auto_46923 ) ) ( not ( = ?auto_46919 ?auto_46921 ) ) ( not ( = ?auto_46919 ?auto_46923 ) ) ( not ( = ?auto_46921 ?auto_46923 ) ) ( ON ?auto_46921 ?auto_46919 ) ( ON-TABLE ?auto_46922 ) ( not ( = ?auto_46922 ?auto_46920 ) ) ( not ( = ?auto_46922 ?auto_46923 ) ) ( not ( = ?auto_46920 ?auto_46923 ) ) ( not ( = ?auto_46918 ?auto_46920 ) ) ( not ( = ?auto_46918 ?auto_46922 ) ) ( not ( = ?auto_46919 ?auto_46920 ) ) ( not ( = ?auto_46919 ?auto_46922 ) ) ( not ( = ?auto_46921 ?auto_46920 ) ) ( not ( = ?auto_46921 ?auto_46922 ) ) ( ON ?auto_46923 ?auto_46921 ) ( CLEAR ?auto_46922 ) ( ON ?auto_46920 ?auto_46923 ) ( CLEAR ?auto_46920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46918 ?auto_46919 ?auto_46921 ?auto_46923 )
      ( MAKE-1PILE ?auto_46918 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46924 - BLOCK
    )
    :vars
    (
      ?auto_46928 - BLOCK
      ?auto_46927 - BLOCK
      ?auto_46926 - BLOCK
      ?auto_46929 - BLOCK
      ?auto_46925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46928 ?auto_46924 ) ( ON-TABLE ?auto_46924 ) ( not ( = ?auto_46924 ?auto_46928 ) ) ( not ( = ?auto_46924 ?auto_46927 ) ) ( not ( = ?auto_46924 ?auto_46926 ) ) ( not ( = ?auto_46928 ?auto_46927 ) ) ( not ( = ?auto_46928 ?auto_46926 ) ) ( not ( = ?auto_46927 ?auto_46926 ) ) ( ON ?auto_46927 ?auto_46928 ) ( not ( = ?auto_46929 ?auto_46925 ) ) ( not ( = ?auto_46929 ?auto_46926 ) ) ( not ( = ?auto_46925 ?auto_46926 ) ) ( not ( = ?auto_46924 ?auto_46925 ) ) ( not ( = ?auto_46924 ?auto_46929 ) ) ( not ( = ?auto_46928 ?auto_46925 ) ) ( not ( = ?auto_46928 ?auto_46929 ) ) ( not ( = ?auto_46927 ?auto_46925 ) ) ( not ( = ?auto_46927 ?auto_46929 ) ) ( ON ?auto_46926 ?auto_46927 ) ( ON ?auto_46925 ?auto_46926 ) ( CLEAR ?auto_46925 ) ( HOLDING ?auto_46929 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46929 )
      ( MAKE-1PILE ?auto_46924 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46937 - BLOCK
    )
    :vars
    (
      ?auto_46939 - BLOCK
      ?auto_46941 - BLOCK
      ?auto_46940 - BLOCK
      ?auto_46938 - BLOCK
      ?auto_46942 - BLOCK
      ?auto_46943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46939 ?auto_46937 ) ( ON-TABLE ?auto_46937 ) ( not ( = ?auto_46937 ?auto_46939 ) ) ( not ( = ?auto_46937 ?auto_46941 ) ) ( not ( = ?auto_46937 ?auto_46940 ) ) ( not ( = ?auto_46939 ?auto_46941 ) ) ( not ( = ?auto_46939 ?auto_46940 ) ) ( not ( = ?auto_46941 ?auto_46940 ) ) ( ON ?auto_46941 ?auto_46939 ) ( not ( = ?auto_46938 ?auto_46942 ) ) ( not ( = ?auto_46938 ?auto_46940 ) ) ( not ( = ?auto_46942 ?auto_46940 ) ) ( not ( = ?auto_46937 ?auto_46942 ) ) ( not ( = ?auto_46937 ?auto_46938 ) ) ( not ( = ?auto_46939 ?auto_46942 ) ) ( not ( = ?auto_46939 ?auto_46938 ) ) ( not ( = ?auto_46941 ?auto_46942 ) ) ( not ( = ?auto_46941 ?auto_46938 ) ) ( ON ?auto_46940 ?auto_46941 ) ( ON ?auto_46942 ?auto_46940 ) ( CLEAR ?auto_46942 ) ( ON ?auto_46938 ?auto_46943 ) ( CLEAR ?auto_46938 ) ( HAND-EMPTY ) ( not ( = ?auto_46937 ?auto_46943 ) ) ( not ( = ?auto_46939 ?auto_46943 ) ) ( not ( = ?auto_46941 ?auto_46943 ) ) ( not ( = ?auto_46940 ?auto_46943 ) ) ( not ( = ?auto_46938 ?auto_46943 ) ) ( not ( = ?auto_46942 ?auto_46943 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46938 ?auto_46943 )
      ( MAKE-1PILE ?auto_46937 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46944 - BLOCK
    )
    :vars
    (
      ?auto_46949 - BLOCK
      ?auto_46950 - BLOCK
      ?auto_46947 - BLOCK
      ?auto_46946 - BLOCK
      ?auto_46948 - BLOCK
      ?auto_46945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46949 ?auto_46944 ) ( ON-TABLE ?auto_46944 ) ( not ( = ?auto_46944 ?auto_46949 ) ) ( not ( = ?auto_46944 ?auto_46950 ) ) ( not ( = ?auto_46944 ?auto_46947 ) ) ( not ( = ?auto_46949 ?auto_46950 ) ) ( not ( = ?auto_46949 ?auto_46947 ) ) ( not ( = ?auto_46950 ?auto_46947 ) ) ( ON ?auto_46950 ?auto_46949 ) ( not ( = ?auto_46946 ?auto_46948 ) ) ( not ( = ?auto_46946 ?auto_46947 ) ) ( not ( = ?auto_46948 ?auto_46947 ) ) ( not ( = ?auto_46944 ?auto_46948 ) ) ( not ( = ?auto_46944 ?auto_46946 ) ) ( not ( = ?auto_46949 ?auto_46948 ) ) ( not ( = ?auto_46949 ?auto_46946 ) ) ( not ( = ?auto_46950 ?auto_46948 ) ) ( not ( = ?auto_46950 ?auto_46946 ) ) ( ON ?auto_46947 ?auto_46950 ) ( ON ?auto_46946 ?auto_46945 ) ( CLEAR ?auto_46946 ) ( not ( = ?auto_46944 ?auto_46945 ) ) ( not ( = ?auto_46949 ?auto_46945 ) ) ( not ( = ?auto_46950 ?auto_46945 ) ) ( not ( = ?auto_46947 ?auto_46945 ) ) ( not ( = ?auto_46946 ?auto_46945 ) ) ( not ( = ?auto_46948 ?auto_46945 ) ) ( HOLDING ?auto_46948 ) ( CLEAR ?auto_46947 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46944 ?auto_46949 ?auto_46950 ?auto_46947 ?auto_46948 )
      ( MAKE-1PILE ?auto_46944 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46951 - BLOCK
    )
    :vars
    (
      ?auto_46957 - BLOCK
      ?auto_46953 - BLOCK
      ?auto_46952 - BLOCK
      ?auto_46956 - BLOCK
      ?auto_46954 - BLOCK
      ?auto_46955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46957 ?auto_46951 ) ( ON-TABLE ?auto_46951 ) ( not ( = ?auto_46951 ?auto_46957 ) ) ( not ( = ?auto_46951 ?auto_46953 ) ) ( not ( = ?auto_46951 ?auto_46952 ) ) ( not ( = ?auto_46957 ?auto_46953 ) ) ( not ( = ?auto_46957 ?auto_46952 ) ) ( not ( = ?auto_46953 ?auto_46952 ) ) ( ON ?auto_46953 ?auto_46957 ) ( not ( = ?auto_46956 ?auto_46954 ) ) ( not ( = ?auto_46956 ?auto_46952 ) ) ( not ( = ?auto_46954 ?auto_46952 ) ) ( not ( = ?auto_46951 ?auto_46954 ) ) ( not ( = ?auto_46951 ?auto_46956 ) ) ( not ( = ?auto_46957 ?auto_46954 ) ) ( not ( = ?auto_46957 ?auto_46956 ) ) ( not ( = ?auto_46953 ?auto_46954 ) ) ( not ( = ?auto_46953 ?auto_46956 ) ) ( ON ?auto_46952 ?auto_46953 ) ( ON ?auto_46956 ?auto_46955 ) ( not ( = ?auto_46951 ?auto_46955 ) ) ( not ( = ?auto_46957 ?auto_46955 ) ) ( not ( = ?auto_46953 ?auto_46955 ) ) ( not ( = ?auto_46952 ?auto_46955 ) ) ( not ( = ?auto_46956 ?auto_46955 ) ) ( not ( = ?auto_46954 ?auto_46955 ) ) ( CLEAR ?auto_46952 ) ( ON ?auto_46954 ?auto_46956 ) ( CLEAR ?auto_46954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46955 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46955 ?auto_46956 )
      ( MAKE-1PILE ?auto_46951 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46991 - BLOCK
      ?auto_46992 - BLOCK
      ?auto_46993 - BLOCK
      ?auto_46994 - BLOCK
      ?auto_46995 - BLOCK
    )
    :vars
    (
      ?auto_46996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46991 ) ( ON ?auto_46992 ?auto_46991 ) ( ON ?auto_46993 ?auto_46992 ) ( not ( = ?auto_46991 ?auto_46992 ) ) ( not ( = ?auto_46991 ?auto_46993 ) ) ( not ( = ?auto_46991 ?auto_46994 ) ) ( not ( = ?auto_46991 ?auto_46995 ) ) ( not ( = ?auto_46992 ?auto_46993 ) ) ( not ( = ?auto_46992 ?auto_46994 ) ) ( not ( = ?auto_46992 ?auto_46995 ) ) ( not ( = ?auto_46993 ?auto_46994 ) ) ( not ( = ?auto_46993 ?auto_46995 ) ) ( not ( = ?auto_46994 ?auto_46995 ) ) ( ON ?auto_46995 ?auto_46996 ) ( not ( = ?auto_46991 ?auto_46996 ) ) ( not ( = ?auto_46992 ?auto_46996 ) ) ( not ( = ?auto_46993 ?auto_46996 ) ) ( not ( = ?auto_46994 ?auto_46996 ) ) ( not ( = ?auto_46995 ?auto_46996 ) ) ( CLEAR ?auto_46993 ) ( ON ?auto_46994 ?auto_46995 ) ( CLEAR ?auto_46994 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46996 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46996 ?auto_46995 )
      ( MAKE-5PILE ?auto_46991 ?auto_46992 ?auto_46993 ?auto_46994 ?auto_46995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46997 - BLOCK
      ?auto_46998 - BLOCK
      ?auto_46999 - BLOCK
      ?auto_47000 - BLOCK
      ?auto_47001 - BLOCK
    )
    :vars
    (
      ?auto_47002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46997 ) ( ON ?auto_46998 ?auto_46997 ) ( not ( = ?auto_46997 ?auto_46998 ) ) ( not ( = ?auto_46997 ?auto_46999 ) ) ( not ( = ?auto_46997 ?auto_47000 ) ) ( not ( = ?auto_46997 ?auto_47001 ) ) ( not ( = ?auto_46998 ?auto_46999 ) ) ( not ( = ?auto_46998 ?auto_47000 ) ) ( not ( = ?auto_46998 ?auto_47001 ) ) ( not ( = ?auto_46999 ?auto_47000 ) ) ( not ( = ?auto_46999 ?auto_47001 ) ) ( not ( = ?auto_47000 ?auto_47001 ) ) ( ON ?auto_47001 ?auto_47002 ) ( not ( = ?auto_46997 ?auto_47002 ) ) ( not ( = ?auto_46998 ?auto_47002 ) ) ( not ( = ?auto_46999 ?auto_47002 ) ) ( not ( = ?auto_47000 ?auto_47002 ) ) ( not ( = ?auto_47001 ?auto_47002 ) ) ( ON ?auto_47000 ?auto_47001 ) ( CLEAR ?auto_47000 ) ( ON-TABLE ?auto_47002 ) ( HOLDING ?auto_46999 ) ( CLEAR ?auto_46998 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46997 ?auto_46998 ?auto_46999 )
      ( MAKE-5PILE ?auto_46997 ?auto_46998 ?auto_46999 ?auto_47000 ?auto_47001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47003 - BLOCK
      ?auto_47004 - BLOCK
      ?auto_47005 - BLOCK
      ?auto_47006 - BLOCK
      ?auto_47007 - BLOCK
    )
    :vars
    (
      ?auto_47008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47003 ) ( ON ?auto_47004 ?auto_47003 ) ( not ( = ?auto_47003 ?auto_47004 ) ) ( not ( = ?auto_47003 ?auto_47005 ) ) ( not ( = ?auto_47003 ?auto_47006 ) ) ( not ( = ?auto_47003 ?auto_47007 ) ) ( not ( = ?auto_47004 ?auto_47005 ) ) ( not ( = ?auto_47004 ?auto_47006 ) ) ( not ( = ?auto_47004 ?auto_47007 ) ) ( not ( = ?auto_47005 ?auto_47006 ) ) ( not ( = ?auto_47005 ?auto_47007 ) ) ( not ( = ?auto_47006 ?auto_47007 ) ) ( ON ?auto_47007 ?auto_47008 ) ( not ( = ?auto_47003 ?auto_47008 ) ) ( not ( = ?auto_47004 ?auto_47008 ) ) ( not ( = ?auto_47005 ?auto_47008 ) ) ( not ( = ?auto_47006 ?auto_47008 ) ) ( not ( = ?auto_47007 ?auto_47008 ) ) ( ON ?auto_47006 ?auto_47007 ) ( ON-TABLE ?auto_47008 ) ( CLEAR ?auto_47004 ) ( ON ?auto_47005 ?auto_47006 ) ( CLEAR ?auto_47005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47008 ?auto_47007 ?auto_47006 )
      ( MAKE-5PILE ?auto_47003 ?auto_47004 ?auto_47005 ?auto_47006 ?auto_47007 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47009 - BLOCK
      ?auto_47010 - BLOCK
      ?auto_47011 - BLOCK
      ?auto_47012 - BLOCK
      ?auto_47013 - BLOCK
    )
    :vars
    (
      ?auto_47014 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47009 ) ( not ( = ?auto_47009 ?auto_47010 ) ) ( not ( = ?auto_47009 ?auto_47011 ) ) ( not ( = ?auto_47009 ?auto_47012 ) ) ( not ( = ?auto_47009 ?auto_47013 ) ) ( not ( = ?auto_47010 ?auto_47011 ) ) ( not ( = ?auto_47010 ?auto_47012 ) ) ( not ( = ?auto_47010 ?auto_47013 ) ) ( not ( = ?auto_47011 ?auto_47012 ) ) ( not ( = ?auto_47011 ?auto_47013 ) ) ( not ( = ?auto_47012 ?auto_47013 ) ) ( ON ?auto_47013 ?auto_47014 ) ( not ( = ?auto_47009 ?auto_47014 ) ) ( not ( = ?auto_47010 ?auto_47014 ) ) ( not ( = ?auto_47011 ?auto_47014 ) ) ( not ( = ?auto_47012 ?auto_47014 ) ) ( not ( = ?auto_47013 ?auto_47014 ) ) ( ON ?auto_47012 ?auto_47013 ) ( ON-TABLE ?auto_47014 ) ( ON ?auto_47011 ?auto_47012 ) ( CLEAR ?auto_47011 ) ( HOLDING ?auto_47010 ) ( CLEAR ?auto_47009 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47009 ?auto_47010 )
      ( MAKE-5PILE ?auto_47009 ?auto_47010 ?auto_47011 ?auto_47012 ?auto_47013 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47015 - BLOCK
      ?auto_47016 - BLOCK
      ?auto_47017 - BLOCK
      ?auto_47018 - BLOCK
      ?auto_47019 - BLOCK
    )
    :vars
    (
      ?auto_47020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47015 ) ( not ( = ?auto_47015 ?auto_47016 ) ) ( not ( = ?auto_47015 ?auto_47017 ) ) ( not ( = ?auto_47015 ?auto_47018 ) ) ( not ( = ?auto_47015 ?auto_47019 ) ) ( not ( = ?auto_47016 ?auto_47017 ) ) ( not ( = ?auto_47016 ?auto_47018 ) ) ( not ( = ?auto_47016 ?auto_47019 ) ) ( not ( = ?auto_47017 ?auto_47018 ) ) ( not ( = ?auto_47017 ?auto_47019 ) ) ( not ( = ?auto_47018 ?auto_47019 ) ) ( ON ?auto_47019 ?auto_47020 ) ( not ( = ?auto_47015 ?auto_47020 ) ) ( not ( = ?auto_47016 ?auto_47020 ) ) ( not ( = ?auto_47017 ?auto_47020 ) ) ( not ( = ?auto_47018 ?auto_47020 ) ) ( not ( = ?auto_47019 ?auto_47020 ) ) ( ON ?auto_47018 ?auto_47019 ) ( ON-TABLE ?auto_47020 ) ( ON ?auto_47017 ?auto_47018 ) ( CLEAR ?auto_47015 ) ( ON ?auto_47016 ?auto_47017 ) ( CLEAR ?auto_47016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47020 ?auto_47019 ?auto_47018 ?auto_47017 )
      ( MAKE-5PILE ?auto_47015 ?auto_47016 ?auto_47017 ?auto_47018 ?auto_47019 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47021 - BLOCK
      ?auto_47022 - BLOCK
      ?auto_47023 - BLOCK
      ?auto_47024 - BLOCK
      ?auto_47025 - BLOCK
    )
    :vars
    (
      ?auto_47026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47021 ?auto_47022 ) ) ( not ( = ?auto_47021 ?auto_47023 ) ) ( not ( = ?auto_47021 ?auto_47024 ) ) ( not ( = ?auto_47021 ?auto_47025 ) ) ( not ( = ?auto_47022 ?auto_47023 ) ) ( not ( = ?auto_47022 ?auto_47024 ) ) ( not ( = ?auto_47022 ?auto_47025 ) ) ( not ( = ?auto_47023 ?auto_47024 ) ) ( not ( = ?auto_47023 ?auto_47025 ) ) ( not ( = ?auto_47024 ?auto_47025 ) ) ( ON ?auto_47025 ?auto_47026 ) ( not ( = ?auto_47021 ?auto_47026 ) ) ( not ( = ?auto_47022 ?auto_47026 ) ) ( not ( = ?auto_47023 ?auto_47026 ) ) ( not ( = ?auto_47024 ?auto_47026 ) ) ( not ( = ?auto_47025 ?auto_47026 ) ) ( ON ?auto_47024 ?auto_47025 ) ( ON-TABLE ?auto_47026 ) ( ON ?auto_47023 ?auto_47024 ) ( ON ?auto_47022 ?auto_47023 ) ( CLEAR ?auto_47022 ) ( HOLDING ?auto_47021 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47021 )
      ( MAKE-5PILE ?auto_47021 ?auto_47022 ?auto_47023 ?auto_47024 ?auto_47025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47027 - BLOCK
      ?auto_47028 - BLOCK
      ?auto_47029 - BLOCK
      ?auto_47030 - BLOCK
      ?auto_47031 - BLOCK
    )
    :vars
    (
      ?auto_47032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47027 ?auto_47028 ) ) ( not ( = ?auto_47027 ?auto_47029 ) ) ( not ( = ?auto_47027 ?auto_47030 ) ) ( not ( = ?auto_47027 ?auto_47031 ) ) ( not ( = ?auto_47028 ?auto_47029 ) ) ( not ( = ?auto_47028 ?auto_47030 ) ) ( not ( = ?auto_47028 ?auto_47031 ) ) ( not ( = ?auto_47029 ?auto_47030 ) ) ( not ( = ?auto_47029 ?auto_47031 ) ) ( not ( = ?auto_47030 ?auto_47031 ) ) ( ON ?auto_47031 ?auto_47032 ) ( not ( = ?auto_47027 ?auto_47032 ) ) ( not ( = ?auto_47028 ?auto_47032 ) ) ( not ( = ?auto_47029 ?auto_47032 ) ) ( not ( = ?auto_47030 ?auto_47032 ) ) ( not ( = ?auto_47031 ?auto_47032 ) ) ( ON ?auto_47030 ?auto_47031 ) ( ON-TABLE ?auto_47032 ) ( ON ?auto_47029 ?auto_47030 ) ( ON ?auto_47028 ?auto_47029 ) ( ON ?auto_47027 ?auto_47028 ) ( CLEAR ?auto_47027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47032 ?auto_47031 ?auto_47030 ?auto_47029 ?auto_47028 )
      ( MAKE-5PILE ?auto_47027 ?auto_47028 ?auto_47029 ?auto_47030 ?auto_47031 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47038 - BLOCK
      ?auto_47039 - BLOCK
      ?auto_47040 - BLOCK
      ?auto_47041 - BLOCK
      ?auto_47042 - BLOCK
    )
    :vars
    (
      ?auto_47043 - BLOCK
      ?auto_47044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47038 ?auto_47039 ) ) ( not ( = ?auto_47038 ?auto_47040 ) ) ( not ( = ?auto_47038 ?auto_47041 ) ) ( not ( = ?auto_47038 ?auto_47042 ) ) ( not ( = ?auto_47039 ?auto_47040 ) ) ( not ( = ?auto_47039 ?auto_47041 ) ) ( not ( = ?auto_47039 ?auto_47042 ) ) ( not ( = ?auto_47040 ?auto_47041 ) ) ( not ( = ?auto_47040 ?auto_47042 ) ) ( not ( = ?auto_47041 ?auto_47042 ) ) ( ON ?auto_47042 ?auto_47043 ) ( not ( = ?auto_47038 ?auto_47043 ) ) ( not ( = ?auto_47039 ?auto_47043 ) ) ( not ( = ?auto_47040 ?auto_47043 ) ) ( not ( = ?auto_47041 ?auto_47043 ) ) ( not ( = ?auto_47042 ?auto_47043 ) ) ( ON ?auto_47041 ?auto_47042 ) ( ON-TABLE ?auto_47043 ) ( ON ?auto_47040 ?auto_47041 ) ( ON ?auto_47039 ?auto_47040 ) ( CLEAR ?auto_47039 ) ( ON ?auto_47038 ?auto_47044 ) ( CLEAR ?auto_47038 ) ( HAND-EMPTY ) ( not ( = ?auto_47038 ?auto_47044 ) ) ( not ( = ?auto_47039 ?auto_47044 ) ) ( not ( = ?auto_47040 ?auto_47044 ) ) ( not ( = ?auto_47041 ?auto_47044 ) ) ( not ( = ?auto_47042 ?auto_47044 ) ) ( not ( = ?auto_47043 ?auto_47044 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47038 ?auto_47044 )
      ( MAKE-5PILE ?auto_47038 ?auto_47039 ?auto_47040 ?auto_47041 ?auto_47042 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47045 - BLOCK
      ?auto_47046 - BLOCK
      ?auto_47047 - BLOCK
      ?auto_47048 - BLOCK
      ?auto_47049 - BLOCK
    )
    :vars
    (
      ?auto_47051 - BLOCK
      ?auto_47050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47045 ?auto_47046 ) ) ( not ( = ?auto_47045 ?auto_47047 ) ) ( not ( = ?auto_47045 ?auto_47048 ) ) ( not ( = ?auto_47045 ?auto_47049 ) ) ( not ( = ?auto_47046 ?auto_47047 ) ) ( not ( = ?auto_47046 ?auto_47048 ) ) ( not ( = ?auto_47046 ?auto_47049 ) ) ( not ( = ?auto_47047 ?auto_47048 ) ) ( not ( = ?auto_47047 ?auto_47049 ) ) ( not ( = ?auto_47048 ?auto_47049 ) ) ( ON ?auto_47049 ?auto_47051 ) ( not ( = ?auto_47045 ?auto_47051 ) ) ( not ( = ?auto_47046 ?auto_47051 ) ) ( not ( = ?auto_47047 ?auto_47051 ) ) ( not ( = ?auto_47048 ?auto_47051 ) ) ( not ( = ?auto_47049 ?auto_47051 ) ) ( ON ?auto_47048 ?auto_47049 ) ( ON-TABLE ?auto_47051 ) ( ON ?auto_47047 ?auto_47048 ) ( ON ?auto_47045 ?auto_47050 ) ( CLEAR ?auto_47045 ) ( not ( = ?auto_47045 ?auto_47050 ) ) ( not ( = ?auto_47046 ?auto_47050 ) ) ( not ( = ?auto_47047 ?auto_47050 ) ) ( not ( = ?auto_47048 ?auto_47050 ) ) ( not ( = ?auto_47049 ?auto_47050 ) ) ( not ( = ?auto_47051 ?auto_47050 ) ) ( HOLDING ?auto_47046 ) ( CLEAR ?auto_47047 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47051 ?auto_47049 ?auto_47048 ?auto_47047 ?auto_47046 )
      ( MAKE-5PILE ?auto_47045 ?auto_47046 ?auto_47047 ?auto_47048 ?auto_47049 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47052 - BLOCK
      ?auto_47053 - BLOCK
      ?auto_47054 - BLOCK
      ?auto_47055 - BLOCK
      ?auto_47056 - BLOCK
    )
    :vars
    (
      ?auto_47057 - BLOCK
      ?auto_47058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47052 ?auto_47053 ) ) ( not ( = ?auto_47052 ?auto_47054 ) ) ( not ( = ?auto_47052 ?auto_47055 ) ) ( not ( = ?auto_47052 ?auto_47056 ) ) ( not ( = ?auto_47053 ?auto_47054 ) ) ( not ( = ?auto_47053 ?auto_47055 ) ) ( not ( = ?auto_47053 ?auto_47056 ) ) ( not ( = ?auto_47054 ?auto_47055 ) ) ( not ( = ?auto_47054 ?auto_47056 ) ) ( not ( = ?auto_47055 ?auto_47056 ) ) ( ON ?auto_47056 ?auto_47057 ) ( not ( = ?auto_47052 ?auto_47057 ) ) ( not ( = ?auto_47053 ?auto_47057 ) ) ( not ( = ?auto_47054 ?auto_47057 ) ) ( not ( = ?auto_47055 ?auto_47057 ) ) ( not ( = ?auto_47056 ?auto_47057 ) ) ( ON ?auto_47055 ?auto_47056 ) ( ON-TABLE ?auto_47057 ) ( ON ?auto_47054 ?auto_47055 ) ( ON ?auto_47052 ?auto_47058 ) ( not ( = ?auto_47052 ?auto_47058 ) ) ( not ( = ?auto_47053 ?auto_47058 ) ) ( not ( = ?auto_47054 ?auto_47058 ) ) ( not ( = ?auto_47055 ?auto_47058 ) ) ( not ( = ?auto_47056 ?auto_47058 ) ) ( not ( = ?auto_47057 ?auto_47058 ) ) ( CLEAR ?auto_47054 ) ( ON ?auto_47053 ?auto_47052 ) ( CLEAR ?auto_47053 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47058 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47058 ?auto_47052 )
      ( MAKE-5PILE ?auto_47052 ?auto_47053 ?auto_47054 ?auto_47055 ?auto_47056 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47059 - BLOCK
      ?auto_47060 - BLOCK
      ?auto_47061 - BLOCK
      ?auto_47062 - BLOCK
      ?auto_47063 - BLOCK
    )
    :vars
    (
      ?auto_47064 - BLOCK
      ?auto_47065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47059 ?auto_47060 ) ) ( not ( = ?auto_47059 ?auto_47061 ) ) ( not ( = ?auto_47059 ?auto_47062 ) ) ( not ( = ?auto_47059 ?auto_47063 ) ) ( not ( = ?auto_47060 ?auto_47061 ) ) ( not ( = ?auto_47060 ?auto_47062 ) ) ( not ( = ?auto_47060 ?auto_47063 ) ) ( not ( = ?auto_47061 ?auto_47062 ) ) ( not ( = ?auto_47061 ?auto_47063 ) ) ( not ( = ?auto_47062 ?auto_47063 ) ) ( ON ?auto_47063 ?auto_47064 ) ( not ( = ?auto_47059 ?auto_47064 ) ) ( not ( = ?auto_47060 ?auto_47064 ) ) ( not ( = ?auto_47061 ?auto_47064 ) ) ( not ( = ?auto_47062 ?auto_47064 ) ) ( not ( = ?auto_47063 ?auto_47064 ) ) ( ON ?auto_47062 ?auto_47063 ) ( ON-TABLE ?auto_47064 ) ( ON ?auto_47059 ?auto_47065 ) ( not ( = ?auto_47059 ?auto_47065 ) ) ( not ( = ?auto_47060 ?auto_47065 ) ) ( not ( = ?auto_47061 ?auto_47065 ) ) ( not ( = ?auto_47062 ?auto_47065 ) ) ( not ( = ?auto_47063 ?auto_47065 ) ) ( not ( = ?auto_47064 ?auto_47065 ) ) ( ON ?auto_47060 ?auto_47059 ) ( CLEAR ?auto_47060 ) ( ON-TABLE ?auto_47065 ) ( HOLDING ?auto_47061 ) ( CLEAR ?auto_47062 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47064 ?auto_47063 ?auto_47062 ?auto_47061 )
      ( MAKE-5PILE ?auto_47059 ?auto_47060 ?auto_47061 ?auto_47062 ?auto_47063 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47066 - BLOCK
      ?auto_47067 - BLOCK
      ?auto_47068 - BLOCK
      ?auto_47069 - BLOCK
      ?auto_47070 - BLOCK
    )
    :vars
    (
      ?auto_47072 - BLOCK
      ?auto_47071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47066 ?auto_47067 ) ) ( not ( = ?auto_47066 ?auto_47068 ) ) ( not ( = ?auto_47066 ?auto_47069 ) ) ( not ( = ?auto_47066 ?auto_47070 ) ) ( not ( = ?auto_47067 ?auto_47068 ) ) ( not ( = ?auto_47067 ?auto_47069 ) ) ( not ( = ?auto_47067 ?auto_47070 ) ) ( not ( = ?auto_47068 ?auto_47069 ) ) ( not ( = ?auto_47068 ?auto_47070 ) ) ( not ( = ?auto_47069 ?auto_47070 ) ) ( ON ?auto_47070 ?auto_47072 ) ( not ( = ?auto_47066 ?auto_47072 ) ) ( not ( = ?auto_47067 ?auto_47072 ) ) ( not ( = ?auto_47068 ?auto_47072 ) ) ( not ( = ?auto_47069 ?auto_47072 ) ) ( not ( = ?auto_47070 ?auto_47072 ) ) ( ON ?auto_47069 ?auto_47070 ) ( ON-TABLE ?auto_47072 ) ( ON ?auto_47066 ?auto_47071 ) ( not ( = ?auto_47066 ?auto_47071 ) ) ( not ( = ?auto_47067 ?auto_47071 ) ) ( not ( = ?auto_47068 ?auto_47071 ) ) ( not ( = ?auto_47069 ?auto_47071 ) ) ( not ( = ?auto_47070 ?auto_47071 ) ) ( not ( = ?auto_47072 ?auto_47071 ) ) ( ON ?auto_47067 ?auto_47066 ) ( ON-TABLE ?auto_47071 ) ( CLEAR ?auto_47069 ) ( ON ?auto_47068 ?auto_47067 ) ( CLEAR ?auto_47068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47071 ?auto_47066 ?auto_47067 )
      ( MAKE-5PILE ?auto_47066 ?auto_47067 ?auto_47068 ?auto_47069 ?auto_47070 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47073 - BLOCK
      ?auto_47074 - BLOCK
      ?auto_47075 - BLOCK
      ?auto_47076 - BLOCK
      ?auto_47077 - BLOCK
    )
    :vars
    (
      ?auto_47078 - BLOCK
      ?auto_47079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47073 ?auto_47074 ) ) ( not ( = ?auto_47073 ?auto_47075 ) ) ( not ( = ?auto_47073 ?auto_47076 ) ) ( not ( = ?auto_47073 ?auto_47077 ) ) ( not ( = ?auto_47074 ?auto_47075 ) ) ( not ( = ?auto_47074 ?auto_47076 ) ) ( not ( = ?auto_47074 ?auto_47077 ) ) ( not ( = ?auto_47075 ?auto_47076 ) ) ( not ( = ?auto_47075 ?auto_47077 ) ) ( not ( = ?auto_47076 ?auto_47077 ) ) ( ON ?auto_47077 ?auto_47078 ) ( not ( = ?auto_47073 ?auto_47078 ) ) ( not ( = ?auto_47074 ?auto_47078 ) ) ( not ( = ?auto_47075 ?auto_47078 ) ) ( not ( = ?auto_47076 ?auto_47078 ) ) ( not ( = ?auto_47077 ?auto_47078 ) ) ( ON-TABLE ?auto_47078 ) ( ON ?auto_47073 ?auto_47079 ) ( not ( = ?auto_47073 ?auto_47079 ) ) ( not ( = ?auto_47074 ?auto_47079 ) ) ( not ( = ?auto_47075 ?auto_47079 ) ) ( not ( = ?auto_47076 ?auto_47079 ) ) ( not ( = ?auto_47077 ?auto_47079 ) ) ( not ( = ?auto_47078 ?auto_47079 ) ) ( ON ?auto_47074 ?auto_47073 ) ( ON-TABLE ?auto_47079 ) ( ON ?auto_47075 ?auto_47074 ) ( CLEAR ?auto_47075 ) ( HOLDING ?auto_47076 ) ( CLEAR ?auto_47077 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47078 ?auto_47077 ?auto_47076 )
      ( MAKE-5PILE ?auto_47073 ?auto_47074 ?auto_47075 ?auto_47076 ?auto_47077 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47080 - BLOCK
      ?auto_47081 - BLOCK
      ?auto_47082 - BLOCK
      ?auto_47083 - BLOCK
      ?auto_47084 - BLOCK
    )
    :vars
    (
      ?auto_47085 - BLOCK
      ?auto_47086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47080 ?auto_47081 ) ) ( not ( = ?auto_47080 ?auto_47082 ) ) ( not ( = ?auto_47080 ?auto_47083 ) ) ( not ( = ?auto_47080 ?auto_47084 ) ) ( not ( = ?auto_47081 ?auto_47082 ) ) ( not ( = ?auto_47081 ?auto_47083 ) ) ( not ( = ?auto_47081 ?auto_47084 ) ) ( not ( = ?auto_47082 ?auto_47083 ) ) ( not ( = ?auto_47082 ?auto_47084 ) ) ( not ( = ?auto_47083 ?auto_47084 ) ) ( ON ?auto_47084 ?auto_47085 ) ( not ( = ?auto_47080 ?auto_47085 ) ) ( not ( = ?auto_47081 ?auto_47085 ) ) ( not ( = ?auto_47082 ?auto_47085 ) ) ( not ( = ?auto_47083 ?auto_47085 ) ) ( not ( = ?auto_47084 ?auto_47085 ) ) ( ON-TABLE ?auto_47085 ) ( ON ?auto_47080 ?auto_47086 ) ( not ( = ?auto_47080 ?auto_47086 ) ) ( not ( = ?auto_47081 ?auto_47086 ) ) ( not ( = ?auto_47082 ?auto_47086 ) ) ( not ( = ?auto_47083 ?auto_47086 ) ) ( not ( = ?auto_47084 ?auto_47086 ) ) ( not ( = ?auto_47085 ?auto_47086 ) ) ( ON ?auto_47081 ?auto_47080 ) ( ON-TABLE ?auto_47086 ) ( ON ?auto_47082 ?auto_47081 ) ( CLEAR ?auto_47084 ) ( ON ?auto_47083 ?auto_47082 ) ( CLEAR ?auto_47083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47086 ?auto_47080 ?auto_47081 ?auto_47082 )
      ( MAKE-5PILE ?auto_47080 ?auto_47081 ?auto_47082 ?auto_47083 ?auto_47084 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47087 - BLOCK
      ?auto_47088 - BLOCK
      ?auto_47089 - BLOCK
      ?auto_47090 - BLOCK
      ?auto_47091 - BLOCK
    )
    :vars
    (
      ?auto_47093 - BLOCK
      ?auto_47092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47087 ?auto_47088 ) ) ( not ( = ?auto_47087 ?auto_47089 ) ) ( not ( = ?auto_47087 ?auto_47090 ) ) ( not ( = ?auto_47087 ?auto_47091 ) ) ( not ( = ?auto_47088 ?auto_47089 ) ) ( not ( = ?auto_47088 ?auto_47090 ) ) ( not ( = ?auto_47088 ?auto_47091 ) ) ( not ( = ?auto_47089 ?auto_47090 ) ) ( not ( = ?auto_47089 ?auto_47091 ) ) ( not ( = ?auto_47090 ?auto_47091 ) ) ( not ( = ?auto_47087 ?auto_47093 ) ) ( not ( = ?auto_47088 ?auto_47093 ) ) ( not ( = ?auto_47089 ?auto_47093 ) ) ( not ( = ?auto_47090 ?auto_47093 ) ) ( not ( = ?auto_47091 ?auto_47093 ) ) ( ON-TABLE ?auto_47093 ) ( ON ?auto_47087 ?auto_47092 ) ( not ( = ?auto_47087 ?auto_47092 ) ) ( not ( = ?auto_47088 ?auto_47092 ) ) ( not ( = ?auto_47089 ?auto_47092 ) ) ( not ( = ?auto_47090 ?auto_47092 ) ) ( not ( = ?auto_47091 ?auto_47092 ) ) ( not ( = ?auto_47093 ?auto_47092 ) ) ( ON ?auto_47088 ?auto_47087 ) ( ON-TABLE ?auto_47092 ) ( ON ?auto_47089 ?auto_47088 ) ( ON ?auto_47090 ?auto_47089 ) ( CLEAR ?auto_47090 ) ( HOLDING ?auto_47091 ) ( CLEAR ?auto_47093 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47093 ?auto_47091 )
      ( MAKE-5PILE ?auto_47087 ?auto_47088 ?auto_47089 ?auto_47090 ?auto_47091 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47094 - BLOCK
      ?auto_47095 - BLOCK
      ?auto_47096 - BLOCK
      ?auto_47097 - BLOCK
      ?auto_47098 - BLOCK
    )
    :vars
    (
      ?auto_47099 - BLOCK
      ?auto_47100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47094 ?auto_47095 ) ) ( not ( = ?auto_47094 ?auto_47096 ) ) ( not ( = ?auto_47094 ?auto_47097 ) ) ( not ( = ?auto_47094 ?auto_47098 ) ) ( not ( = ?auto_47095 ?auto_47096 ) ) ( not ( = ?auto_47095 ?auto_47097 ) ) ( not ( = ?auto_47095 ?auto_47098 ) ) ( not ( = ?auto_47096 ?auto_47097 ) ) ( not ( = ?auto_47096 ?auto_47098 ) ) ( not ( = ?auto_47097 ?auto_47098 ) ) ( not ( = ?auto_47094 ?auto_47099 ) ) ( not ( = ?auto_47095 ?auto_47099 ) ) ( not ( = ?auto_47096 ?auto_47099 ) ) ( not ( = ?auto_47097 ?auto_47099 ) ) ( not ( = ?auto_47098 ?auto_47099 ) ) ( ON-TABLE ?auto_47099 ) ( ON ?auto_47094 ?auto_47100 ) ( not ( = ?auto_47094 ?auto_47100 ) ) ( not ( = ?auto_47095 ?auto_47100 ) ) ( not ( = ?auto_47096 ?auto_47100 ) ) ( not ( = ?auto_47097 ?auto_47100 ) ) ( not ( = ?auto_47098 ?auto_47100 ) ) ( not ( = ?auto_47099 ?auto_47100 ) ) ( ON ?auto_47095 ?auto_47094 ) ( ON-TABLE ?auto_47100 ) ( ON ?auto_47096 ?auto_47095 ) ( ON ?auto_47097 ?auto_47096 ) ( CLEAR ?auto_47099 ) ( ON ?auto_47098 ?auto_47097 ) ( CLEAR ?auto_47098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47100 ?auto_47094 ?auto_47095 ?auto_47096 ?auto_47097 )
      ( MAKE-5PILE ?auto_47094 ?auto_47095 ?auto_47096 ?auto_47097 ?auto_47098 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47101 - BLOCK
      ?auto_47102 - BLOCK
      ?auto_47103 - BLOCK
      ?auto_47104 - BLOCK
      ?auto_47105 - BLOCK
    )
    :vars
    (
      ?auto_47106 - BLOCK
      ?auto_47107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47101 ?auto_47102 ) ) ( not ( = ?auto_47101 ?auto_47103 ) ) ( not ( = ?auto_47101 ?auto_47104 ) ) ( not ( = ?auto_47101 ?auto_47105 ) ) ( not ( = ?auto_47102 ?auto_47103 ) ) ( not ( = ?auto_47102 ?auto_47104 ) ) ( not ( = ?auto_47102 ?auto_47105 ) ) ( not ( = ?auto_47103 ?auto_47104 ) ) ( not ( = ?auto_47103 ?auto_47105 ) ) ( not ( = ?auto_47104 ?auto_47105 ) ) ( not ( = ?auto_47101 ?auto_47106 ) ) ( not ( = ?auto_47102 ?auto_47106 ) ) ( not ( = ?auto_47103 ?auto_47106 ) ) ( not ( = ?auto_47104 ?auto_47106 ) ) ( not ( = ?auto_47105 ?auto_47106 ) ) ( ON ?auto_47101 ?auto_47107 ) ( not ( = ?auto_47101 ?auto_47107 ) ) ( not ( = ?auto_47102 ?auto_47107 ) ) ( not ( = ?auto_47103 ?auto_47107 ) ) ( not ( = ?auto_47104 ?auto_47107 ) ) ( not ( = ?auto_47105 ?auto_47107 ) ) ( not ( = ?auto_47106 ?auto_47107 ) ) ( ON ?auto_47102 ?auto_47101 ) ( ON-TABLE ?auto_47107 ) ( ON ?auto_47103 ?auto_47102 ) ( ON ?auto_47104 ?auto_47103 ) ( ON ?auto_47105 ?auto_47104 ) ( CLEAR ?auto_47105 ) ( HOLDING ?auto_47106 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47106 )
      ( MAKE-5PILE ?auto_47101 ?auto_47102 ?auto_47103 ?auto_47104 ?auto_47105 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47108 - BLOCK
      ?auto_47109 - BLOCK
      ?auto_47110 - BLOCK
      ?auto_47111 - BLOCK
      ?auto_47112 - BLOCK
    )
    :vars
    (
      ?auto_47113 - BLOCK
      ?auto_47114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47108 ?auto_47109 ) ) ( not ( = ?auto_47108 ?auto_47110 ) ) ( not ( = ?auto_47108 ?auto_47111 ) ) ( not ( = ?auto_47108 ?auto_47112 ) ) ( not ( = ?auto_47109 ?auto_47110 ) ) ( not ( = ?auto_47109 ?auto_47111 ) ) ( not ( = ?auto_47109 ?auto_47112 ) ) ( not ( = ?auto_47110 ?auto_47111 ) ) ( not ( = ?auto_47110 ?auto_47112 ) ) ( not ( = ?auto_47111 ?auto_47112 ) ) ( not ( = ?auto_47108 ?auto_47113 ) ) ( not ( = ?auto_47109 ?auto_47113 ) ) ( not ( = ?auto_47110 ?auto_47113 ) ) ( not ( = ?auto_47111 ?auto_47113 ) ) ( not ( = ?auto_47112 ?auto_47113 ) ) ( ON ?auto_47108 ?auto_47114 ) ( not ( = ?auto_47108 ?auto_47114 ) ) ( not ( = ?auto_47109 ?auto_47114 ) ) ( not ( = ?auto_47110 ?auto_47114 ) ) ( not ( = ?auto_47111 ?auto_47114 ) ) ( not ( = ?auto_47112 ?auto_47114 ) ) ( not ( = ?auto_47113 ?auto_47114 ) ) ( ON ?auto_47109 ?auto_47108 ) ( ON-TABLE ?auto_47114 ) ( ON ?auto_47110 ?auto_47109 ) ( ON ?auto_47111 ?auto_47110 ) ( ON ?auto_47112 ?auto_47111 ) ( ON ?auto_47113 ?auto_47112 ) ( CLEAR ?auto_47113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47114 ?auto_47108 ?auto_47109 ?auto_47110 ?auto_47111 ?auto_47112 )
      ( MAKE-5PILE ?auto_47108 ?auto_47109 ?auto_47110 ?auto_47111 ?auto_47112 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47127 - BLOCK
      ?auto_47128 - BLOCK
      ?auto_47129 - BLOCK
      ?auto_47130 - BLOCK
      ?auto_47131 - BLOCK
      ?auto_47132 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47131 ) ( ON-TABLE ?auto_47127 ) ( ON ?auto_47128 ?auto_47127 ) ( ON ?auto_47129 ?auto_47128 ) ( ON ?auto_47130 ?auto_47129 ) ( ON ?auto_47131 ?auto_47130 ) ( not ( = ?auto_47127 ?auto_47128 ) ) ( not ( = ?auto_47127 ?auto_47129 ) ) ( not ( = ?auto_47127 ?auto_47130 ) ) ( not ( = ?auto_47127 ?auto_47131 ) ) ( not ( = ?auto_47127 ?auto_47132 ) ) ( not ( = ?auto_47128 ?auto_47129 ) ) ( not ( = ?auto_47128 ?auto_47130 ) ) ( not ( = ?auto_47128 ?auto_47131 ) ) ( not ( = ?auto_47128 ?auto_47132 ) ) ( not ( = ?auto_47129 ?auto_47130 ) ) ( not ( = ?auto_47129 ?auto_47131 ) ) ( not ( = ?auto_47129 ?auto_47132 ) ) ( not ( = ?auto_47130 ?auto_47131 ) ) ( not ( = ?auto_47130 ?auto_47132 ) ) ( not ( = ?auto_47131 ?auto_47132 ) ) ( ON-TABLE ?auto_47132 ) ( CLEAR ?auto_47132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_47132 )
      ( MAKE-6PILE ?auto_47127 ?auto_47128 ?auto_47129 ?auto_47130 ?auto_47131 ?auto_47132 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47133 - BLOCK
      ?auto_47134 - BLOCK
      ?auto_47135 - BLOCK
      ?auto_47136 - BLOCK
      ?auto_47137 - BLOCK
      ?auto_47138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47133 ) ( ON ?auto_47134 ?auto_47133 ) ( ON ?auto_47135 ?auto_47134 ) ( ON ?auto_47136 ?auto_47135 ) ( not ( = ?auto_47133 ?auto_47134 ) ) ( not ( = ?auto_47133 ?auto_47135 ) ) ( not ( = ?auto_47133 ?auto_47136 ) ) ( not ( = ?auto_47133 ?auto_47137 ) ) ( not ( = ?auto_47133 ?auto_47138 ) ) ( not ( = ?auto_47134 ?auto_47135 ) ) ( not ( = ?auto_47134 ?auto_47136 ) ) ( not ( = ?auto_47134 ?auto_47137 ) ) ( not ( = ?auto_47134 ?auto_47138 ) ) ( not ( = ?auto_47135 ?auto_47136 ) ) ( not ( = ?auto_47135 ?auto_47137 ) ) ( not ( = ?auto_47135 ?auto_47138 ) ) ( not ( = ?auto_47136 ?auto_47137 ) ) ( not ( = ?auto_47136 ?auto_47138 ) ) ( not ( = ?auto_47137 ?auto_47138 ) ) ( ON-TABLE ?auto_47138 ) ( CLEAR ?auto_47138 ) ( HOLDING ?auto_47137 ) ( CLEAR ?auto_47136 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47133 ?auto_47134 ?auto_47135 ?auto_47136 ?auto_47137 )
      ( MAKE-6PILE ?auto_47133 ?auto_47134 ?auto_47135 ?auto_47136 ?auto_47137 ?auto_47138 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47139 - BLOCK
      ?auto_47140 - BLOCK
      ?auto_47141 - BLOCK
      ?auto_47142 - BLOCK
      ?auto_47143 - BLOCK
      ?auto_47144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47139 ) ( ON ?auto_47140 ?auto_47139 ) ( ON ?auto_47141 ?auto_47140 ) ( ON ?auto_47142 ?auto_47141 ) ( not ( = ?auto_47139 ?auto_47140 ) ) ( not ( = ?auto_47139 ?auto_47141 ) ) ( not ( = ?auto_47139 ?auto_47142 ) ) ( not ( = ?auto_47139 ?auto_47143 ) ) ( not ( = ?auto_47139 ?auto_47144 ) ) ( not ( = ?auto_47140 ?auto_47141 ) ) ( not ( = ?auto_47140 ?auto_47142 ) ) ( not ( = ?auto_47140 ?auto_47143 ) ) ( not ( = ?auto_47140 ?auto_47144 ) ) ( not ( = ?auto_47141 ?auto_47142 ) ) ( not ( = ?auto_47141 ?auto_47143 ) ) ( not ( = ?auto_47141 ?auto_47144 ) ) ( not ( = ?auto_47142 ?auto_47143 ) ) ( not ( = ?auto_47142 ?auto_47144 ) ) ( not ( = ?auto_47143 ?auto_47144 ) ) ( ON-TABLE ?auto_47144 ) ( CLEAR ?auto_47142 ) ( ON ?auto_47143 ?auto_47144 ) ( CLEAR ?auto_47143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47144 )
      ( MAKE-6PILE ?auto_47139 ?auto_47140 ?auto_47141 ?auto_47142 ?auto_47143 ?auto_47144 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47145 - BLOCK
      ?auto_47146 - BLOCK
      ?auto_47147 - BLOCK
      ?auto_47148 - BLOCK
      ?auto_47149 - BLOCK
      ?auto_47150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47145 ) ( ON ?auto_47146 ?auto_47145 ) ( ON ?auto_47147 ?auto_47146 ) ( not ( = ?auto_47145 ?auto_47146 ) ) ( not ( = ?auto_47145 ?auto_47147 ) ) ( not ( = ?auto_47145 ?auto_47148 ) ) ( not ( = ?auto_47145 ?auto_47149 ) ) ( not ( = ?auto_47145 ?auto_47150 ) ) ( not ( = ?auto_47146 ?auto_47147 ) ) ( not ( = ?auto_47146 ?auto_47148 ) ) ( not ( = ?auto_47146 ?auto_47149 ) ) ( not ( = ?auto_47146 ?auto_47150 ) ) ( not ( = ?auto_47147 ?auto_47148 ) ) ( not ( = ?auto_47147 ?auto_47149 ) ) ( not ( = ?auto_47147 ?auto_47150 ) ) ( not ( = ?auto_47148 ?auto_47149 ) ) ( not ( = ?auto_47148 ?auto_47150 ) ) ( not ( = ?auto_47149 ?auto_47150 ) ) ( ON-TABLE ?auto_47150 ) ( ON ?auto_47149 ?auto_47150 ) ( CLEAR ?auto_47149 ) ( HOLDING ?auto_47148 ) ( CLEAR ?auto_47147 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47145 ?auto_47146 ?auto_47147 ?auto_47148 )
      ( MAKE-6PILE ?auto_47145 ?auto_47146 ?auto_47147 ?auto_47148 ?auto_47149 ?auto_47150 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47151 - BLOCK
      ?auto_47152 - BLOCK
      ?auto_47153 - BLOCK
      ?auto_47154 - BLOCK
      ?auto_47155 - BLOCK
      ?auto_47156 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47151 ) ( ON ?auto_47152 ?auto_47151 ) ( ON ?auto_47153 ?auto_47152 ) ( not ( = ?auto_47151 ?auto_47152 ) ) ( not ( = ?auto_47151 ?auto_47153 ) ) ( not ( = ?auto_47151 ?auto_47154 ) ) ( not ( = ?auto_47151 ?auto_47155 ) ) ( not ( = ?auto_47151 ?auto_47156 ) ) ( not ( = ?auto_47152 ?auto_47153 ) ) ( not ( = ?auto_47152 ?auto_47154 ) ) ( not ( = ?auto_47152 ?auto_47155 ) ) ( not ( = ?auto_47152 ?auto_47156 ) ) ( not ( = ?auto_47153 ?auto_47154 ) ) ( not ( = ?auto_47153 ?auto_47155 ) ) ( not ( = ?auto_47153 ?auto_47156 ) ) ( not ( = ?auto_47154 ?auto_47155 ) ) ( not ( = ?auto_47154 ?auto_47156 ) ) ( not ( = ?auto_47155 ?auto_47156 ) ) ( ON-TABLE ?auto_47156 ) ( ON ?auto_47155 ?auto_47156 ) ( CLEAR ?auto_47153 ) ( ON ?auto_47154 ?auto_47155 ) ( CLEAR ?auto_47154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47156 ?auto_47155 )
      ( MAKE-6PILE ?auto_47151 ?auto_47152 ?auto_47153 ?auto_47154 ?auto_47155 ?auto_47156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47157 - BLOCK
      ?auto_47158 - BLOCK
      ?auto_47159 - BLOCK
      ?auto_47160 - BLOCK
      ?auto_47161 - BLOCK
      ?auto_47162 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47157 ) ( ON ?auto_47158 ?auto_47157 ) ( not ( = ?auto_47157 ?auto_47158 ) ) ( not ( = ?auto_47157 ?auto_47159 ) ) ( not ( = ?auto_47157 ?auto_47160 ) ) ( not ( = ?auto_47157 ?auto_47161 ) ) ( not ( = ?auto_47157 ?auto_47162 ) ) ( not ( = ?auto_47158 ?auto_47159 ) ) ( not ( = ?auto_47158 ?auto_47160 ) ) ( not ( = ?auto_47158 ?auto_47161 ) ) ( not ( = ?auto_47158 ?auto_47162 ) ) ( not ( = ?auto_47159 ?auto_47160 ) ) ( not ( = ?auto_47159 ?auto_47161 ) ) ( not ( = ?auto_47159 ?auto_47162 ) ) ( not ( = ?auto_47160 ?auto_47161 ) ) ( not ( = ?auto_47160 ?auto_47162 ) ) ( not ( = ?auto_47161 ?auto_47162 ) ) ( ON-TABLE ?auto_47162 ) ( ON ?auto_47161 ?auto_47162 ) ( ON ?auto_47160 ?auto_47161 ) ( CLEAR ?auto_47160 ) ( HOLDING ?auto_47159 ) ( CLEAR ?auto_47158 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47157 ?auto_47158 ?auto_47159 )
      ( MAKE-6PILE ?auto_47157 ?auto_47158 ?auto_47159 ?auto_47160 ?auto_47161 ?auto_47162 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47163 - BLOCK
      ?auto_47164 - BLOCK
      ?auto_47165 - BLOCK
      ?auto_47166 - BLOCK
      ?auto_47167 - BLOCK
      ?auto_47168 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47163 ) ( ON ?auto_47164 ?auto_47163 ) ( not ( = ?auto_47163 ?auto_47164 ) ) ( not ( = ?auto_47163 ?auto_47165 ) ) ( not ( = ?auto_47163 ?auto_47166 ) ) ( not ( = ?auto_47163 ?auto_47167 ) ) ( not ( = ?auto_47163 ?auto_47168 ) ) ( not ( = ?auto_47164 ?auto_47165 ) ) ( not ( = ?auto_47164 ?auto_47166 ) ) ( not ( = ?auto_47164 ?auto_47167 ) ) ( not ( = ?auto_47164 ?auto_47168 ) ) ( not ( = ?auto_47165 ?auto_47166 ) ) ( not ( = ?auto_47165 ?auto_47167 ) ) ( not ( = ?auto_47165 ?auto_47168 ) ) ( not ( = ?auto_47166 ?auto_47167 ) ) ( not ( = ?auto_47166 ?auto_47168 ) ) ( not ( = ?auto_47167 ?auto_47168 ) ) ( ON-TABLE ?auto_47168 ) ( ON ?auto_47167 ?auto_47168 ) ( ON ?auto_47166 ?auto_47167 ) ( CLEAR ?auto_47164 ) ( ON ?auto_47165 ?auto_47166 ) ( CLEAR ?auto_47165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47168 ?auto_47167 ?auto_47166 )
      ( MAKE-6PILE ?auto_47163 ?auto_47164 ?auto_47165 ?auto_47166 ?auto_47167 ?auto_47168 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47169 - BLOCK
      ?auto_47170 - BLOCK
      ?auto_47171 - BLOCK
      ?auto_47172 - BLOCK
      ?auto_47173 - BLOCK
      ?auto_47174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47169 ) ( not ( = ?auto_47169 ?auto_47170 ) ) ( not ( = ?auto_47169 ?auto_47171 ) ) ( not ( = ?auto_47169 ?auto_47172 ) ) ( not ( = ?auto_47169 ?auto_47173 ) ) ( not ( = ?auto_47169 ?auto_47174 ) ) ( not ( = ?auto_47170 ?auto_47171 ) ) ( not ( = ?auto_47170 ?auto_47172 ) ) ( not ( = ?auto_47170 ?auto_47173 ) ) ( not ( = ?auto_47170 ?auto_47174 ) ) ( not ( = ?auto_47171 ?auto_47172 ) ) ( not ( = ?auto_47171 ?auto_47173 ) ) ( not ( = ?auto_47171 ?auto_47174 ) ) ( not ( = ?auto_47172 ?auto_47173 ) ) ( not ( = ?auto_47172 ?auto_47174 ) ) ( not ( = ?auto_47173 ?auto_47174 ) ) ( ON-TABLE ?auto_47174 ) ( ON ?auto_47173 ?auto_47174 ) ( ON ?auto_47172 ?auto_47173 ) ( ON ?auto_47171 ?auto_47172 ) ( CLEAR ?auto_47171 ) ( HOLDING ?auto_47170 ) ( CLEAR ?auto_47169 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47169 ?auto_47170 )
      ( MAKE-6PILE ?auto_47169 ?auto_47170 ?auto_47171 ?auto_47172 ?auto_47173 ?auto_47174 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47175 - BLOCK
      ?auto_47176 - BLOCK
      ?auto_47177 - BLOCK
      ?auto_47178 - BLOCK
      ?auto_47179 - BLOCK
      ?auto_47180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47175 ) ( not ( = ?auto_47175 ?auto_47176 ) ) ( not ( = ?auto_47175 ?auto_47177 ) ) ( not ( = ?auto_47175 ?auto_47178 ) ) ( not ( = ?auto_47175 ?auto_47179 ) ) ( not ( = ?auto_47175 ?auto_47180 ) ) ( not ( = ?auto_47176 ?auto_47177 ) ) ( not ( = ?auto_47176 ?auto_47178 ) ) ( not ( = ?auto_47176 ?auto_47179 ) ) ( not ( = ?auto_47176 ?auto_47180 ) ) ( not ( = ?auto_47177 ?auto_47178 ) ) ( not ( = ?auto_47177 ?auto_47179 ) ) ( not ( = ?auto_47177 ?auto_47180 ) ) ( not ( = ?auto_47178 ?auto_47179 ) ) ( not ( = ?auto_47178 ?auto_47180 ) ) ( not ( = ?auto_47179 ?auto_47180 ) ) ( ON-TABLE ?auto_47180 ) ( ON ?auto_47179 ?auto_47180 ) ( ON ?auto_47178 ?auto_47179 ) ( ON ?auto_47177 ?auto_47178 ) ( CLEAR ?auto_47175 ) ( ON ?auto_47176 ?auto_47177 ) ( CLEAR ?auto_47176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47180 ?auto_47179 ?auto_47178 ?auto_47177 )
      ( MAKE-6PILE ?auto_47175 ?auto_47176 ?auto_47177 ?auto_47178 ?auto_47179 ?auto_47180 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47181 - BLOCK
      ?auto_47182 - BLOCK
      ?auto_47183 - BLOCK
      ?auto_47184 - BLOCK
      ?auto_47185 - BLOCK
      ?auto_47186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47181 ?auto_47182 ) ) ( not ( = ?auto_47181 ?auto_47183 ) ) ( not ( = ?auto_47181 ?auto_47184 ) ) ( not ( = ?auto_47181 ?auto_47185 ) ) ( not ( = ?auto_47181 ?auto_47186 ) ) ( not ( = ?auto_47182 ?auto_47183 ) ) ( not ( = ?auto_47182 ?auto_47184 ) ) ( not ( = ?auto_47182 ?auto_47185 ) ) ( not ( = ?auto_47182 ?auto_47186 ) ) ( not ( = ?auto_47183 ?auto_47184 ) ) ( not ( = ?auto_47183 ?auto_47185 ) ) ( not ( = ?auto_47183 ?auto_47186 ) ) ( not ( = ?auto_47184 ?auto_47185 ) ) ( not ( = ?auto_47184 ?auto_47186 ) ) ( not ( = ?auto_47185 ?auto_47186 ) ) ( ON-TABLE ?auto_47186 ) ( ON ?auto_47185 ?auto_47186 ) ( ON ?auto_47184 ?auto_47185 ) ( ON ?auto_47183 ?auto_47184 ) ( ON ?auto_47182 ?auto_47183 ) ( CLEAR ?auto_47182 ) ( HOLDING ?auto_47181 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47181 )
      ( MAKE-6PILE ?auto_47181 ?auto_47182 ?auto_47183 ?auto_47184 ?auto_47185 ?auto_47186 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47187 - BLOCK
      ?auto_47188 - BLOCK
      ?auto_47189 - BLOCK
      ?auto_47190 - BLOCK
      ?auto_47191 - BLOCK
      ?auto_47192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47187 ?auto_47188 ) ) ( not ( = ?auto_47187 ?auto_47189 ) ) ( not ( = ?auto_47187 ?auto_47190 ) ) ( not ( = ?auto_47187 ?auto_47191 ) ) ( not ( = ?auto_47187 ?auto_47192 ) ) ( not ( = ?auto_47188 ?auto_47189 ) ) ( not ( = ?auto_47188 ?auto_47190 ) ) ( not ( = ?auto_47188 ?auto_47191 ) ) ( not ( = ?auto_47188 ?auto_47192 ) ) ( not ( = ?auto_47189 ?auto_47190 ) ) ( not ( = ?auto_47189 ?auto_47191 ) ) ( not ( = ?auto_47189 ?auto_47192 ) ) ( not ( = ?auto_47190 ?auto_47191 ) ) ( not ( = ?auto_47190 ?auto_47192 ) ) ( not ( = ?auto_47191 ?auto_47192 ) ) ( ON-TABLE ?auto_47192 ) ( ON ?auto_47191 ?auto_47192 ) ( ON ?auto_47190 ?auto_47191 ) ( ON ?auto_47189 ?auto_47190 ) ( ON ?auto_47188 ?auto_47189 ) ( ON ?auto_47187 ?auto_47188 ) ( CLEAR ?auto_47187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47192 ?auto_47191 ?auto_47190 ?auto_47189 ?auto_47188 )
      ( MAKE-6PILE ?auto_47187 ?auto_47188 ?auto_47189 ?auto_47190 ?auto_47191 ?auto_47192 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47199 - BLOCK
      ?auto_47200 - BLOCK
      ?auto_47201 - BLOCK
      ?auto_47202 - BLOCK
      ?auto_47203 - BLOCK
      ?auto_47204 - BLOCK
    )
    :vars
    (
      ?auto_47205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47199 ?auto_47200 ) ) ( not ( = ?auto_47199 ?auto_47201 ) ) ( not ( = ?auto_47199 ?auto_47202 ) ) ( not ( = ?auto_47199 ?auto_47203 ) ) ( not ( = ?auto_47199 ?auto_47204 ) ) ( not ( = ?auto_47200 ?auto_47201 ) ) ( not ( = ?auto_47200 ?auto_47202 ) ) ( not ( = ?auto_47200 ?auto_47203 ) ) ( not ( = ?auto_47200 ?auto_47204 ) ) ( not ( = ?auto_47201 ?auto_47202 ) ) ( not ( = ?auto_47201 ?auto_47203 ) ) ( not ( = ?auto_47201 ?auto_47204 ) ) ( not ( = ?auto_47202 ?auto_47203 ) ) ( not ( = ?auto_47202 ?auto_47204 ) ) ( not ( = ?auto_47203 ?auto_47204 ) ) ( ON-TABLE ?auto_47204 ) ( ON ?auto_47203 ?auto_47204 ) ( ON ?auto_47202 ?auto_47203 ) ( ON ?auto_47201 ?auto_47202 ) ( ON ?auto_47200 ?auto_47201 ) ( CLEAR ?auto_47200 ) ( ON ?auto_47199 ?auto_47205 ) ( CLEAR ?auto_47199 ) ( HAND-EMPTY ) ( not ( = ?auto_47199 ?auto_47205 ) ) ( not ( = ?auto_47200 ?auto_47205 ) ) ( not ( = ?auto_47201 ?auto_47205 ) ) ( not ( = ?auto_47202 ?auto_47205 ) ) ( not ( = ?auto_47203 ?auto_47205 ) ) ( not ( = ?auto_47204 ?auto_47205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47199 ?auto_47205 )
      ( MAKE-6PILE ?auto_47199 ?auto_47200 ?auto_47201 ?auto_47202 ?auto_47203 ?auto_47204 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47206 - BLOCK
      ?auto_47207 - BLOCK
      ?auto_47208 - BLOCK
      ?auto_47209 - BLOCK
      ?auto_47210 - BLOCK
      ?auto_47211 - BLOCK
    )
    :vars
    (
      ?auto_47212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47206 ?auto_47207 ) ) ( not ( = ?auto_47206 ?auto_47208 ) ) ( not ( = ?auto_47206 ?auto_47209 ) ) ( not ( = ?auto_47206 ?auto_47210 ) ) ( not ( = ?auto_47206 ?auto_47211 ) ) ( not ( = ?auto_47207 ?auto_47208 ) ) ( not ( = ?auto_47207 ?auto_47209 ) ) ( not ( = ?auto_47207 ?auto_47210 ) ) ( not ( = ?auto_47207 ?auto_47211 ) ) ( not ( = ?auto_47208 ?auto_47209 ) ) ( not ( = ?auto_47208 ?auto_47210 ) ) ( not ( = ?auto_47208 ?auto_47211 ) ) ( not ( = ?auto_47209 ?auto_47210 ) ) ( not ( = ?auto_47209 ?auto_47211 ) ) ( not ( = ?auto_47210 ?auto_47211 ) ) ( ON-TABLE ?auto_47211 ) ( ON ?auto_47210 ?auto_47211 ) ( ON ?auto_47209 ?auto_47210 ) ( ON ?auto_47208 ?auto_47209 ) ( ON ?auto_47206 ?auto_47212 ) ( CLEAR ?auto_47206 ) ( not ( = ?auto_47206 ?auto_47212 ) ) ( not ( = ?auto_47207 ?auto_47212 ) ) ( not ( = ?auto_47208 ?auto_47212 ) ) ( not ( = ?auto_47209 ?auto_47212 ) ) ( not ( = ?auto_47210 ?auto_47212 ) ) ( not ( = ?auto_47211 ?auto_47212 ) ) ( HOLDING ?auto_47207 ) ( CLEAR ?auto_47208 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47211 ?auto_47210 ?auto_47209 ?auto_47208 ?auto_47207 )
      ( MAKE-6PILE ?auto_47206 ?auto_47207 ?auto_47208 ?auto_47209 ?auto_47210 ?auto_47211 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47213 - BLOCK
      ?auto_47214 - BLOCK
      ?auto_47215 - BLOCK
      ?auto_47216 - BLOCK
      ?auto_47217 - BLOCK
      ?auto_47218 - BLOCK
    )
    :vars
    (
      ?auto_47219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47213 ?auto_47214 ) ) ( not ( = ?auto_47213 ?auto_47215 ) ) ( not ( = ?auto_47213 ?auto_47216 ) ) ( not ( = ?auto_47213 ?auto_47217 ) ) ( not ( = ?auto_47213 ?auto_47218 ) ) ( not ( = ?auto_47214 ?auto_47215 ) ) ( not ( = ?auto_47214 ?auto_47216 ) ) ( not ( = ?auto_47214 ?auto_47217 ) ) ( not ( = ?auto_47214 ?auto_47218 ) ) ( not ( = ?auto_47215 ?auto_47216 ) ) ( not ( = ?auto_47215 ?auto_47217 ) ) ( not ( = ?auto_47215 ?auto_47218 ) ) ( not ( = ?auto_47216 ?auto_47217 ) ) ( not ( = ?auto_47216 ?auto_47218 ) ) ( not ( = ?auto_47217 ?auto_47218 ) ) ( ON-TABLE ?auto_47218 ) ( ON ?auto_47217 ?auto_47218 ) ( ON ?auto_47216 ?auto_47217 ) ( ON ?auto_47215 ?auto_47216 ) ( ON ?auto_47213 ?auto_47219 ) ( not ( = ?auto_47213 ?auto_47219 ) ) ( not ( = ?auto_47214 ?auto_47219 ) ) ( not ( = ?auto_47215 ?auto_47219 ) ) ( not ( = ?auto_47216 ?auto_47219 ) ) ( not ( = ?auto_47217 ?auto_47219 ) ) ( not ( = ?auto_47218 ?auto_47219 ) ) ( CLEAR ?auto_47215 ) ( ON ?auto_47214 ?auto_47213 ) ( CLEAR ?auto_47214 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47219 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47219 ?auto_47213 )
      ( MAKE-6PILE ?auto_47213 ?auto_47214 ?auto_47215 ?auto_47216 ?auto_47217 ?auto_47218 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47220 - BLOCK
      ?auto_47221 - BLOCK
      ?auto_47222 - BLOCK
      ?auto_47223 - BLOCK
      ?auto_47224 - BLOCK
      ?auto_47225 - BLOCK
    )
    :vars
    (
      ?auto_47226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47220 ?auto_47221 ) ) ( not ( = ?auto_47220 ?auto_47222 ) ) ( not ( = ?auto_47220 ?auto_47223 ) ) ( not ( = ?auto_47220 ?auto_47224 ) ) ( not ( = ?auto_47220 ?auto_47225 ) ) ( not ( = ?auto_47221 ?auto_47222 ) ) ( not ( = ?auto_47221 ?auto_47223 ) ) ( not ( = ?auto_47221 ?auto_47224 ) ) ( not ( = ?auto_47221 ?auto_47225 ) ) ( not ( = ?auto_47222 ?auto_47223 ) ) ( not ( = ?auto_47222 ?auto_47224 ) ) ( not ( = ?auto_47222 ?auto_47225 ) ) ( not ( = ?auto_47223 ?auto_47224 ) ) ( not ( = ?auto_47223 ?auto_47225 ) ) ( not ( = ?auto_47224 ?auto_47225 ) ) ( ON-TABLE ?auto_47225 ) ( ON ?auto_47224 ?auto_47225 ) ( ON ?auto_47223 ?auto_47224 ) ( ON ?auto_47220 ?auto_47226 ) ( not ( = ?auto_47220 ?auto_47226 ) ) ( not ( = ?auto_47221 ?auto_47226 ) ) ( not ( = ?auto_47222 ?auto_47226 ) ) ( not ( = ?auto_47223 ?auto_47226 ) ) ( not ( = ?auto_47224 ?auto_47226 ) ) ( not ( = ?auto_47225 ?auto_47226 ) ) ( ON ?auto_47221 ?auto_47220 ) ( CLEAR ?auto_47221 ) ( ON-TABLE ?auto_47226 ) ( HOLDING ?auto_47222 ) ( CLEAR ?auto_47223 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47225 ?auto_47224 ?auto_47223 ?auto_47222 )
      ( MAKE-6PILE ?auto_47220 ?auto_47221 ?auto_47222 ?auto_47223 ?auto_47224 ?auto_47225 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47227 - BLOCK
      ?auto_47228 - BLOCK
      ?auto_47229 - BLOCK
      ?auto_47230 - BLOCK
      ?auto_47231 - BLOCK
      ?auto_47232 - BLOCK
    )
    :vars
    (
      ?auto_47233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47227 ?auto_47228 ) ) ( not ( = ?auto_47227 ?auto_47229 ) ) ( not ( = ?auto_47227 ?auto_47230 ) ) ( not ( = ?auto_47227 ?auto_47231 ) ) ( not ( = ?auto_47227 ?auto_47232 ) ) ( not ( = ?auto_47228 ?auto_47229 ) ) ( not ( = ?auto_47228 ?auto_47230 ) ) ( not ( = ?auto_47228 ?auto_47231 ) ) ( not ( = ?auto_47228 ?auto_47232 ) ) ( not ( = ?auto_47229 ?auto_47230 ) ) ( not ( = ?auto_47229 ?auto_47231 ) ) ( not ( = ?auto_47229 ?auto_47232 ) ) ( not ( = ?auto_47230 ?auto_47231 ) ) ( not ( = ?auto_47230 ?auto_47232 ) ) ( not ( = ?auto_47231 ?auto_47232 ) ) ( ON-TABLE ?auto_47232 ) ( ON ?auto_47231 ?auto_47232 ) ( ON ?auto_47230 ?auto_47231 ) ( ON ?auto_47227 ?auto_47233 ) ( not ( = ?auto_47227 ?auto_47233 ) ) ( not ( = ?auto_47228 ?auto_47233 ) ) ( not ( = ?auto_47229 ?auto_47233 ) ) ( not ( = ?auto_47230 ?auto_47233 ) ) ( not ( = ?auto_47231 ?auto_47233 ) ) ( not ( = ?auto_47232 ?auto_47233 ) ) ( ON ?auto_47228 ?auto_47227 ) ( ON-TABLE ?auto_47233 ) ( CLEAR ?auto_47230 ) ( ON ?auto_47229 ?auto_47228 ) ( CLEAR ?auto_47229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47233 ?auto_47227 ?auto_47228 )
      ( MAKE-6PILE ?auto_47227 ?auto_47228 ?auto_47229 ?auto_47230 ?auto_47231 ?auto_47232 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47234 - BLOCK
      ?auto_47235 - BLOCK
      ?auto_47236 - BLOCK
      ?auto_47237 - BLOCK
      ?auto_47238 - BLOCK
      ?auto_47239 - BLOCK
    )
    :vars
    (
      ?auto_47240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47234 ?auto_47235 ) ) ( not ( = ?auto_47234 ?auto_47236 ) ) ( not ( = ?auto_47234 ?auto_47237 ) ) ( not ( = ?auto_47234 ?auto_47238 ) ) ( not ( = ?auto_47234 ?auto_47239 ) ) ( not ( = ?auto_47235 ?auto_47236 ) ) ( not ( = ?auto_47235 ?auto_47237 ) ) ( not ( = ?auto_47235 ?auto_47238 ) ) ( not ( = ?auto_47235 ?auto_47239 ) ) ( not ( = ?auto_47236 ?auto_47237 ) ) ( not ( = ?auto_47236 ?auto_47238 ) ) ( not ( = ?auto_47236 ?auto_47239 ) ) ( not ( = ?auto_47237 ?auto_47238 ) ) ( not ( = ?auto_47237 ?auto_47239 ) ) ( not ( = ?auto_47238 ?auto_47239 ) ) ( ON-TABLE ?auto_47239 ) ( ON ?auto_47238 ?auto_47239 ) ( ON ?auto_47234 ?auto_47240 ) ( not ( = ?auto_47234 ?auto_47240 ) ) ( not ( = ?auto_47235 ?auto_47240 ) ) ( not ( = ?auto_47236 ?auto_47240 ) ) ( not ( = ?auto_47237 ?auto_47240 ) ) ( not ( = ?auto_47238 ?auto_47240 ) ) ( not ( = ?auto_47239 ?auto_47240 ) ) ( ON ?auto_47235 ?auto_47234 ) ( ON-TABLE ?auto_47240 ) ( ON ?auto_47236 ?auto_47235 ) ( CLEAR ?auto_47236 ) ( HOLDING ?auto_47237 ) ( CLEAR ?auto_47238 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47239 ?auto_47238 ?auto_47237 )
      ( MAKE-6PILE ?auto_47234 ?auto_47235 ?auto_47236 ?auto_47237 ?auto_47238 ?auto_47239 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47241 - BLOCK
      ?auto_47242 - BLOCK
      ?auto_47243 - BLOCK
      ?auto_47244 - BLOCK
      ?auto_47245 - BLOCK
      ?auto_47246 - BLOCK
    )
    :vars
    (
      ?auto_47247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47241 ?auto_47242 ) ) ( not ( = ?auto_47241 ?auto_47243 ) ) ( not ( = ?auto_47241 ?auto_47244 ) ) ( not ( = ?auto_47241 ?auto_47245 ) ) ( not ( = ?auto_47241 ?auto_47246 ) ) ( not ( = ?auto_47242 ?auto_47243 ) ) ( not ( = ?auto_47242 ?auto_47244 ) ) ( not ( = ?auto_47242 ?auto_47245 ) ) ( not ( = ?auto_47242 ?auto_47246 ) ) ( not ( = ?auto_47243 ?auto_47244 ) ) ( not ( = ?auto_47243 ?auto_47245 ) ) ( not ( = ?auto_47243 ?auto_47246 ) ) ( not ( = ?auto_47244 ?auto_47245 ) ) ( not ( = ?auto_47244 ?auto_47246 ) ) ( not ( = ?auto_47245 ?auto_47246 ) ) ( ON-TABLE ?auto_47246 ) ( ON ?auto_47245 ?auto_47246 ) ( ON ?auto_47241 ?auto_47247 ) ( not ( = ?auto_47241 ?auto_47247 ) ) ( not ( = ?auto_47242 ?auto_47247 ) ) ( not ( = ?auto_47243 ?auto_47247 ) ) ( not ( = ?auto_47244 ?auto_47247 ) ) ( not ( = ?auto_47245 ?auto_47247 ) ) ( not ( = ?auto_47246 ?auto_47247 ) ) ( ON ?auto_47242 ?auto_47241 ) ( ON-TABLE ?auto_47247 ) ( ON ?auto_47243 ?auto_47242 ) ( CLEAR ?auto_47245 ) ( ON ?auto_47244 ?auto_47243 ) ( CLEAR ?auto_47244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47247 ?auto_47241 ?auto_47242 ?auto_47243 )
      ( MAKE-6PILE ?auto_47241 ?auto_47242 ?auto_47243 ?auto_47244 ?auto_47245 ?auto_47246 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47248 - BLOCK
      ?auto_47249 - BLOCK
      ?auto_47250 - BLOCK
      ?auto_47251 - BLOCK
      ?auto_47252 - BLOCK
      ?auto_47253 - BLOCK
    )
    :vars
    (
      ?auto_47254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47248 ?auto_47249 ) ) ( not ( = ?auto_47248 ?auto_47250 ) ) ( not ( = ?auto_47248 ?auto_47251 ) ) ( not ( = ?auto_47248 ?auto_47252 ) ) ( not ( = ?auto_47248 ?auto_47253 ) ) ( not ( = ?auto_47249 ?auto_47250 ) ) ( not ( = ?auto_47249 ?auto_47251 ) ) ( not ( = ?auto_47249 ?auto_47252 ) ) ( not ( = ?auto_47249 ?auto_47253 ) ) ( not ( = ?auto_47250 ?auto_47251 ) ) ( not ( = ?auto_47250 ?auto_47252 ) ) ( not ( = ?auto_47250 ?auto_47253 ) ) ( not ( = ?auto_47251 ?auto_47252 ) ) ( not ( = ?auto_47251 ?auto_47253 ) ) ( not ( = ?auto_47252 ?auto_47253 ) ) ( ON-TABLE ?auto_47253 ) ( ON ?auto_47248 ?auto_47254 ) ( not ( = ?auto_47248 ?auto_47254 ) ) ( not ( = ?auto_47249 ?auto_47254 ) ) ( not ( = ?auto_47250 ?auto_47254 ) ) ( not ( = ?auto_47251 ?auto_47254 ) ) ( not ( = ?auto_47252 ?auto_47254 ) ) ( not ( = ?auto_47253 ?auto_47254 ) ) ( ON ?auto_47249 ?auto_47248 ) ( ON-TABLE ?auto_47254 ) ( ON ?auto_47250 ?auto_47249 ) ( ON ?auto_47251 ?auto_47250 ) ( CLEAR ?auto_47251 ) ( HOLDING ?auto_47252 ) ( CLEAR ?auto_47253 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47253 ?auto_47252 )
      ( MAKE-6PILE ?auto_47248 ?auto_47249 ?auto_47250 ?auto_47251 ?auto_47252 ?auto_47253 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47255 - BLOCK
      ?auto_47256 - BLOCK
      ?auto_47257 - BLOCK
      ?auto_47258 - BLOCK
      ?auto_47259 - BLOCK
      ?auto_47260 - BLOCK
    )
    :vars
    (
      ?auto_47261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47255 ?auto_47256 ) ) ( not ( = ?auto_47255 ?auto_47257 ) ) ( not ( = ?auto_47255 ?auto_47258 ) ) ( not ( = ?auto_47255 ?auto_47259 ) ) ( not ( = ?auto_47255 ?auto_47260 ) ) ( not ( = ?auto_47256 ?auto_47257 ) ) ( not ( = ?auto_47256 ?auto_47258 ) ) ( not ( = ?auto_47256 ?auto_47259 ) ) ( not ( = ?auto_47256 ?auto_47260 ) ) ( not ( = ?auto_47257 ?auto_47258 ) ) ( not ( = ?auto_47257 ?auto_47259 ) ) ( not ( = ?auto_47257 ?auto_47260 ) ) ( not ( = ?auto_47258 ?auto_47259 ) ) ( not ( = ?auto_47258 ?auto_47260 ) ) ( not ( = ?auto_47259 ?auto_47260 ) ) ( ON-TABLE ?auto_47260 ) ( ON ?auto_47255 ?auto_47261 ) ( not ( = ?auto_47255 ?auto_47261 ) ) ( not ( = ?auto_47256 ?auto_47261 ) ) ( not ( = ?auto_47257 ?auto_47261 ) ) ( not ( = ?auto_47258 ?auto_47261 ) ) ( not ( = ?auto_47259 ?auto_47261 ) ) ( not ( = ?auto_47260 ?auto_47261 ) ) ( ON ?auto_47256 ?auto_47255 ) ( ON-TABLE ?auto_47261 ) ( ON ?auto_47257 ?auto_47256 ) ( ON ?auto_47258 ?auto_47257 ) ( CLEAR ?auto_47260 ) ( ON ?auto_47259 ?auto_47258 ) ( CLEAR ?auto_47259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47261 ?auto_47255 ?auto_47256 ?auto_47257 ?auto_47258 )
      ( MAKE-6PILE ?auto_47255 ?auto_47256 ?auto_47257 ?auto_47258 ?auto_47259 ?auto_47260 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47262 - BLOCK
      ?auto_47263 - BLOCK
      ?auto_47264 - BLOCK
      ?auto_47265 - BLOCK
      ?auto_47266 - BLOCK
      ?auto_47267 - BLOCK
    )
    :vars
    (
      ?auto_47268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47262 ?auto_47263 ) ) ( not ( = ?auto_47262 ?auto_47264 ) ) ( not ( = ?auto_47262 ?auto_47265 ) ) ( not ( = ?auto_47262 ?auto_47266 ) ) ( not ( = ?auto_47262 ?auto_47267 ) ) ( not ( = ?auto_47263 ?auto_47264 ) ) ( not ( = ?auto_47263 ?auto_47265 ) ) ( not ( = ?auto_47263 ?auto_47266 ) ) ( not ( = ?auto_47263 ?auto_47267 ) ) ( not ( = ?auto_47264 ?auto_47265 ) ) ( not ( = ?auto_47264 ?auto_47266 ) ) ( not ( = ?auto_47264 ?auto_47267 ) ) ( not ( = ?auto_47265 ?auto_47266 ) ) ( not ( = ?auto_47265 ?auto_47267 ) ) ( not ( = ?auto_47266 ?auto_47267 ) ) ( ON ?auto_47262 ?auto_47268 ) ( not ( = ?auto_47262 ?auto_47268 ) ) ( not ( = ?auto_47263 ?auto_47268 ) ) ( not ( = ?auto_47264 ?auto_47268 ) ) ( not ( = ?auto_47265 ?auto_47268 ) ) ( not ( = ?auto_47266 ?auto_47268 ) ) ( not ( = ?auto_47267 ?auto_47268 ) ) ( ON ?auto_47263 ?auto_47262 ) ( ON-TABLE ?auto_47268 ) ( ON ?auto_47264 ?auto_47263 ) ( ON ?auto_47265 ?auto_47264 ) ( ON ?auto_47266 ?auto_47265 ) ( CLEAR ?auto_47266 ) ( HOLDING ?auto_47267 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47267 )
      ( MAKE-6PILE ?auto_47262 ?auto_47263 ?auto_47264 ?auto_47265 ?auto_47266 ?auto_47267 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47269 - BLOCK
      ?auto_47270 - BLOCK
      ?auto_47271 - BLOCK
      ?auto_47272 - BLOCK
      ?auto_47273 - BLOCK
      ?auto_47274 - BLOCK
    )
    :vars
    (
      ?auto_47275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47269 ?auto_47270 ) ) ( not ( = ?auto_47269 ?auto_47271 ) ) ( not ( = ?auto_47269 ?auto_47272 ) ) ( not ( = ?auto_47269 ?auto_47273 ) ) ( not ( = ?auto_47269 ?auto_47274 ) ) ( not ( = ?auto_47270 ?auto_47271 ) ) ( not ( = ?auto_47270 ?auto_47272 ) ) ( not ( = ?auto_47270 ?auto_47273 ) ) ( not ( = ?auto_47270 ?auto_47274 ) ) ( not ( = ?auto_47271 ?auto_47272 ) ) ( not ( = ?auto_47271 ?auto_47273 ) ) ( not ( = ?auto_47271 ?auto_47274 ) ) ( not ( = ?auto_47272 ?auto_47273 ) ) ( not ( = ?auto_47272 ?auto_47274 ) ) ( not ( = ?auto_47273 ?auto_47274 ) ) ( ON ?auto_47269 ?auto_47275 ) ( not ( = ?auto_47269 ?auto_47275 ) ) ( not ( = ?auto_47270 ?auto_47275 ) ) ( not ( = ?auto_47271 ?auto_47275 ) ) ( not ( = ?auto_47272 ?auto_47275 ) ) ( not ( = ?auto_47273 ?auto_47275 ) ) ( not ( = ?auto_47274 ?auto_47275 ) ) ( ON ?auto_47270 ?auto_47269 ) ( ON-TABLE ?auto_47275 ) ( ON ?auto_47271 ?auto_47270 ) ( ON ?auto_47272 ?auto_47271 ) ( ON ?auto_47273 ?auto_47272 ) ( ON ?auto_47274 ?auto_47273 ) ( CLEAR ?auto_47274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47275 ?auto_47269 ?auto_47270 ?auto_47271 ?auto_47272 ?auto_47273 )
      ( MAKE-6PILE ?auto_47269 ?auto_47270 ?auto_47271 ?auto_47272 ?auto_47273 ?auto_47274 ) )
  )

)

