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
      ?auto_24541 - BLOCK
    )
    :vars
    (
      ?auto_24542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24541 ?auto_24542 ) ( CLEAR ?auto_24541 ) ( HAND-EMPTY ) ( not ( = ?auto_24541 ?auto_24542 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24541 ?auto_24542 )
      ( !PUTDOWN ?auto_24541 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24548 - BLOCK
      ?auto_24549 - BLOCK
    )
    :vars
    (
      ?auto_24550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24548 ) ( ON ?auto_24549 ?auto_24550 ) ( CLEAR ?auto_24549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24548 ) ( not ( = ?auto_24548 ?auto_24549 ) ) ( not ( = ?auto_24548 ?auto_24550 ) ) ( not ( = ?auto_24549 ?auto_24550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24549 ?auto_24550 )
      ( !STACK ?auto_24549 ?auto_24548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24558 - BLOCK
      ?auto_24559 - BLOCK
    )
    :vars
    (
      ?auto_24560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24559 ?auto_24560 ) ( not ( = ?auto_24558 ?auto_24559 ) ) ( not ( = ?auto_24558 ?auto_24560 ) ) ( not ( = ?auto_24559 ?auto_24560 ) ) ( ON ?auto_24558 ?auto_24559 ) ( CLEAR ?auto_24558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24558 )
      ( MAKE-2PILE ?auto_24558 ?auto_24559 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24569 - BLOCK
      ?auto_24570 - BLOCK
      ?auto_24571 - BLOCK
    )
    :vars
    (
      ?auto_24572 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24570 ) ( ON ?auto_24571 ?auto_24572 ) ( CLEAR ?auto_24571 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24569 ) ( ON ?auto_24570 ?auto_24569 ) ( not ( = ?auto_24569 ?auto_24570 ) ) ( not ( = ?auto_24569 ?auto_24571 ) ) ( not ( = ?auto_24569 ?auto_24572 ) ) ( not ( = ?auto_24570 ?auto_24571 ) ) ( not ( = ?auto_24570 ?auto_24572 ) ) ( not ( = ?auto_24571 ?auto_24572 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24571 ?auto_24572 )
      ( !STACK ?auto_24571 ?auto_24570 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24583 - BLOCK
      ?auto_24584 - BLOCK
      ?auto_24585 - BLOCK
    )
    :vars
    (
      ?auto_24586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24585 ?auto_24586 ) ( ON-TABLE ?auto_24583 ) ( not ( = ?auto_24583 ?auto_24584 ) ) ( not ( = ?auto_24583 ?auto_24585 ) ) ( not ( = ?auto_24583 ?auto_24586 ) ) ( not ( = ?auto_24584 ?auto_24585 ) ) ( not ( = ?auto_24584 ?auto_24586 ) ) ( not ( = ?auto_24585 ?auto_24586 ) ) ( CLEAR ?auto_24583 ) ( ON ?auto_24584 ?auto_24585 ) ( CLEAR ?auto_24584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24583 ?auto_24584 )
      ( MAKE-3PILE ?auto_24583 ?auto_24584 ?auto_24585 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24597 - BLOCK
      ?auto_24598 - BLOCK
      ?auto_24599 - BLOCK
    )
    :vars
    (
      ?auto_24600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24599 ?auto_24600 ) ( not ( = ?auto_24597 ?auto_24598 ) ) ( not ( = ?auto_24597 ?auto_24599 ) ) ( not ( = ?auto_24597 ?auto_24600 ) ) ( not ( = ?auto_24598 ?auto_24599 ) ) ( not ( = ?auto_24598 ?auto_24600 ) ) ( not ( = ?auto_24599 ?auto_24600 ) ) ( ON ?auto_24598 ?auto_24599 ) ( ON ?auto_24597 ?auto_24598 ) ( CLEAR ?auto_24597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24597 )
      ( MAKE-3PILE ?auto_24597 ?auto_24598 ?auto_24599 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24612 - BLOCK
      ?auto_24613 - BLOCK
      ?auto_24614 - BLOCK
      ?auto_24615 - BLOCK
    )
    :vars
    (
      ?auto_24616 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24614 ) ( ON ?auto_24615 ?auto_24616 ) ( CLEAR ?auto_24615 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24612 ) ( ON ?auto_24613 ?auto_24612 ) ( ON ?auto_24614 ?auto_24613 ) ( not ( = ?auto_24612 ?auto_24613 ) ) ( not ( = ?auto_24612 ?auto_24614 ) ) ( not ( = ?auto_24612 ?auto_24615 ) ) ( not ( = ?auto_24612 ?auto_24616 ) ) ( not ( = ?auto_24613 ?auto_24614 ) ) ( not ( = ?auto_24613 ?auto_24615 ) ) ( not ( = ?auto_24613 ?auto_24616 ) ) ( not ( = ?auto_24614 ?auto_24615 ) ) ( not ( = ?auto_24614 ?auto_24616 ) ) ( not ( = ?auto_24615 ?auto_24616 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24615 ?auto_24616 )
      ( !STACK ?auto_24615 ?auto_24614 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24630 - BLOCK
      ?auto_24631 - BLOCK
      ?auto_24632 - BLOCK
      ?auto_24633 - BLOCK
    )
    :vars
    (
      ?auto_24634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24633 ?auto_24634 ) ( ON-TABLE ?auto_24630 ) ( ON ?auto_24631 ?auto_24630 ) ( not ( = ?auto_24630 ?auto_24631 ) ) ( not ( = ?auto_24630 ?auto_24632 ) ) ( not ( = ?auto_24630 ?auto_24633 ) ) ( not ( = ?auto_24630 ?auto_24634 ) ) ( not ( = ?auto_24631 ?auto_24632 ) ) ( not ( = ?auto_24631 ?auto_24633 ) ) ( not ( = ?auto_24631 ?auto_24634 ) ) ( not ( = ?auto_24632 ?auto_24633 ) ) ( not ( = ?auto_24632 ?auto_24634 ) ) ( not ( = ?auto_24633 ?auto_24634 ) ) ( CLEAR ?auto_24631 ) ( ON ?auto_24632 ?auto_24633 ) ( CLEAR ?auto_24632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24630 ?auto_24631 ?auto_24632 )
      ( MAKE-4PILE ?auto_24630 ?auto_24631 ?auto_24632 ?auto_24633 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24648 - BLOCK
      ?auto_24649 - BLOCK
      ?auto_24650 - BLOCK
      ?auto_24651 - BLOCK
    )
    :vars
    (
      ?auto_24652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24651 ?auto_24652 ) ( ON-TABLE ?auto_24648 ) ( not ( = ?auto_24648 ?auto_24649 ) ) ( not ( = ?auto_24648 ?auto_24650 ) ) ( not ( = ?auto_24648 ?auto_24651 ) ) ( not ( = ?auto_24648 ?auto_24652 ) ) ( not ( = ?auto_24649 ?auto_24650 ) ) ( not ( = ?auto_24649 ?auto_24651 ) ) ( not ( = ?auto_24649 ?auto_24652 ) ) ( not ( = ?auto_24650 ?auto_24651 ) ) ( not ( = ?auto_24650 ?auto_24652 ) ) ( not ( = ?auto_24651 ?auto_24652 ) ) ( ON ?auto_24650 ?auto_24651 ) ( CLEAR ?auto_24648 ) ( ON ?auto_24649 ?auto_24650 ) ( CLEAR ?auto_24649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24648 ?auto_24649 )
      ( MAKE-4PILE ?auto_24648 ?auto_24649 ?auto_24650 ?auto_24651 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24666 - BLOCK
      ?auto_24667 - BLOCK
      ?auto_24668 - BLOCK
      ?auto_24669 - BLOCK
    )
    :vars
    (
      ?auto_24670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24669 ?auto_24670 ) ( not ( = ?auto_24666 ?auto_24667 ) ) ( not ( = ?auto_24666 ?auto_24668 ) ) ( not ( = ?auto_24666 ?auto_24669 ) ) ( not ( = ?auto_24666 ?auto_24670 ) ) ( not ( = ?auto_24667 ?auto_24668 ) ) ( not ( = ?auto_24667 ?auto_24669 ) ) ( not ( = ?auto_24667 ?auto_24670 ) ) ( not ( = ?auto_24668 ?auto_24669 ) ) ( not ( = ?auto_24668 ?auto_24670 ) ) ( not ( = ?auto_24669 ?auto_24670 ) ) ( ON ?auto_24668 ?auto_24669 ) ( ON ?auto_24667 ?auto_24668 ) ( ON ?auto_24666 ?auto_24667 ) ( CLEAR ?auto_24666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24666 )
      ( MAKE-4PILE ?auto_24666 ?auto_24667 ?auto_24668 ?auto_24669 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24685 - BLOCK
      ?auto_24686 - BLOCK
      ?auto_24687 - BLOCK
      ?auto_24688 - BLOCK
      ?auto_24689 - BLOCK
    )
    :vars
    (
      ?auto_24690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24688 ) ( ON ?auto_24689 ?auto_24690 ) ( CLEAR ?auto_24689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24685 ) ( ON ?auto_24686 ?auto_24685 ) ( ON ?auto_24687 ?auto_24686 ) ( ON ?auto_24688 ?auto_24687 ) ( not ( = ?auto_24685 ?auto_24686 ) ) ( not ( = ?auto_24685 ?auto_24687 ) ) ( not ( = ?auto_24685 ?auto_24688 ) ) ( not ( = ?auto_24685 ?auto_24689 ) ) ( not ( = ?auto_24685 ?auto_24690 ) ) ( not ( = ?auto_24686 ?auto_24687 ) ) ( not ( = ?auto_24686 ?auto_24688 ) ) ( not ( = ?auto_24686 ?auto_24689 ) ) ( not ( = ?auto_24686 ?auto_24690 ) ) ( not ( = ?auto_24687 ?auto_24688 ) ) ( not ( = ?auto_24687 ?auto_24689 ) ) ( not ( = ?auto_24687 ?auto_24690 ) ) ( not ( = ?auto_24688 ?auto_24689 ) ) ( not ( = ?auto_24688 ?auto_24690 ) ) ( not ( = ?auto_24689 ?auto_24690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24689 ?auto_24690 )
      ( !STACK ?auto_24689 ?auto_24688 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24707 - BLOCK
      ?auto_24708 - BLOCK
      ?auto_24709 - BLOCK
      ?auto_24710 - BLOCK
      ?auto_24711 - BLOCK
    )
    :vars
    (
      ?auto_24712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24711 ?auto_24712 ) ( ON-TABLE ?auto_24707 ) ( ON ?auto_24708 ?auto_24707 ) ( ON ?auto_24709 ?auto_24708 ) ( not ( = ?auto_24707 ?auto_24708 ) ) ( not ( = ?auto_24707 ?auto_24709 ) ) ( not ( = ?auto_24707 ?auto_24710 ) ) ( not ( = ?auto_24707 ?auto_24711 ) ) ( not ( = ?auto_24707 ?auto_24712 ) ) ( not ( = ?auto_24708 ?auto_24709 ) ) ( not ( = ?auto_24708 ?auto_24710 ) ) ( not ( = ?auto_24708 ?auto_24711 ) ) ( not ( = ?auto_24708 ?auto_24712 ) ) ( not ( = ?auto_24709 ?auto_24710 ) ) ( not ( = ?auto_24709 ?auto_24711 ) ) ( not ( = ?auto_24709 ?auto_24712 ) ) ( not ( = ?auto_24710 ?auto_24711 ) ) ( not ( = ?auto_24710 ?auto_24712 ) ) ( not ( = ?auto_24711 ?auto_24712 ) ) ( CLEAR ?auto_24709 ) ( ON ?auto_24710 ?auto_24711 ) ( CLEAR ?auto_24710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24707 ?auto_24708 ?auto_24709 ?auto_24710 )
      ( MAKE-5PILE ?auto_24707 ?auto_24708 ?auto_24709 ?auto_24710 ?auto_24711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24729 - BLOCK
      ?auto_24730 - BLOCK
      ?auto_24731 - BLOCK
      ?auto_24732 - BLOCK
      ?auto_24733 - BLOCK
    )
    :vars
    (
      ?auto_24734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24733 ?auto_24734 ) ( ON-TABLE ?auto_24729 ) ( ON ?auto_24730 ?auto_24729 ) ( not ( = ?auto_24729 ?auto_24730 ) ) ( not ( = ?auto_24729 ?auto_24731 ) ) ( not ( = ?auto_24729 ?auto_24732 ) ) ( not ( = ?auto_24729 ?auto_24733 ) ) ( not ( = ?auto_24729 ?auto_24734 ) ) ( not ( = ?auto_24730 ?auto_24731 ) ) ( not ( = ?auto_24730 ?auto_24732 ) ) ( not ( = ?auto_24730 ?auto_24733 ) ) ( not ( = ?auto_24730 ?auto_24734 ) ) ( not ( = ?auto_24731 ?auto_24732 ) ) ( not ( = ?auto_24731 ?auto_24733 ) ) ( not ( = ?auto_24731 ?auto_24734 ) ) ( not ( = ?auto_24732 ?auto_24733 ) ) ( not ( = ?auto_24732 ?auto_24734 ) ) ( not ( = ?auto_24733 ?auto_24734 ) ) ( ON ?auto_24732 ?auto_24733 ) ( CLEAR ?auto_24730 ) ( ON ?auto_24731 ?auto_24732 ) ( CLEAR ?auto_24731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24729 ?auto_24730 ?auto_24731 )
      ( MAKE-5PILE ?auto_24729 ?auto_24730 ?auto_24731 ?auto_24732 ?auto_24733 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24751 - BLOCK
      ?auto_24752 - BLOCK
      ?auto_24753 - BLOCK
      ?auto_24754 - BLOCK
      ?auto_24755 - BLOCK
    )
    :vars
    (
      ?auto_24756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24755 ?auto_24756 ) ( ON-TABLE ?auto_24751 ) ( not ( = ?auto_24751 ?auto_24752 ) ) ( not ( = ?auto_24751 ?auto_24753 ) ) ( not ( = ?auto_24751 ?auto_24754 ) ) ( not ( = ?auto_24751 ?auto_24755 ) ) ( not ( = ?auto_24751 ?auto_24756 ) ) ( not ( = ?auto_24752 ?auto_24753 ) ) ( not ( = ?auto_24752 ?auto_24754 ) ) ( not ( = ?auto_24752 ?auto_24755 ) ) ( not ( = ?auto_24752 ?auto_24756 ) ) ( not ( = ?auto_24753 ?auto_24754 ) ) ( not ( = ?auto_24753 ?auto_24755 ) ) ( not ( = ?auto_24753 ?auto_24756 ) ) ( not ( = ?auto_24754 ?auto_24755 ) ) ( not ( = ?auto_24754 ?auto_24756 ) ) ( not ( = ?auto_24755 ?auto_24756 ) ) ( ON ?auto_24754 ?auto_24755 ) ( ON ?auto_24753 ?auto_24754 ) ( CLEAR ?auto_24751 ) ( ON ?auto_24752 ?auto_24753 ) ( CLEAR ?auto_24752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24751 ?auto_24752 )
      ( MAKE-5PILE ?auto_24751 ?auto_24752 ?auto_24753 ?auto_24754 ?auto_24755 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24773 - BLOCK
      ?auto_24774 - BLOCK
      ?auto_24775 - BLOCK
      ?auto_24776 - BLOCK
      ?auto_24777 - BLOCK
    )
    :vars
    (
      ?auto_24778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24777 ?auto_24778 ) ( not ( = ?auto_24773 ?auto_24774 ) ) ( not ( = ?auto_24773 ?auto_24775 ) ) ( not ( = ?auto_24773 ?auto_24776 ) ) ( not ( = ?auto_24773 ?auto_24777 ) ) ( not ( = ?auto_24773 ?auto_24778 ) ) ( not ( = ?auto_24774 ?auto_24775 ) ) ( not ( = ?auto_24774 ?auto_24776 ) ) ( not ( = ?auto_24774 ?auto_24777 ) ) ( not ( = ?auto_24774 ?auto_24778 ) ) ( not ( = ?auto_24775 ?auto_24776 ) ) ( not ( = ?auto_24775 ?auto_24777 ) ) ( not ( = ?auto_24775 ?auto_24778 ) ) ( not ( = ?auto_24776 ?auto_24777 ) ) ( not ( = ?auto_24776 ?auto_24778 ) ) ( not ( = ?auto_24777 ?auto_24778 ) ) ( ON ?auto_24776 ?auto_24777 ) ( ON ?auto_24775 ?auto_24776 ) ( ON ?auto_24774 ?auto_24775 ) ( ON ?auto_24773 ?auto_24774 ) ( CLEAR ?auto_24773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24773 )
      ( MAKE-5PILE ?auto_24773 ?auto_24774 ?auto_24775 ?auto_24776 ?auto_24777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24796 - BLOCK
      ?auto_24797 - BLOCK
      ?auto_24798 - BLOCK
      ?auto_24799 - BLOCK
      ?auto_24800 - BLOCK
      ?auto_24801 - BLOCK
    )
    :vars
    (
      ?auto_24802 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24800 ) ( ON ?auto_24801 ?auto_24802 ) ( CLEAR ?auto_24801 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24796 ) ( ON ?auto_24797 ?auto_24796 ) ( ON ?auto_24798 ?auto_24797 ) ( ON ?auto_24799 ?auto_24798 ) ( ON ?auto_24800 ?auto_24799 ) ( not ( = ?auto_24796 ?auto_24797 ) ) ( not ( = ?auto_24796 ?auto_24798 ) ) ( not ( = ?auto_24796 ?auto_24799 ) ) ( not ( = ?auto_24796 ?auto_24800 ) ) ( not ( = ?auto_24796 ?auto_24801 ) ) ( not ( = ?auto_24796 ?auto_24802 ) ) ( not ( = ?auto_24797 ?auto_24798 ) ) ( not ( = ?auto_24797 ?auto_24799 ) ) ( not ( = ?auto_24797 ?auto_24800 ) ) ( not ( = ?auto_24797 ?auto_24801 ) ) ( not ( = ?auto_24797 ?auto_24802 ) ) ( not ( = ?auto_24798 ?auto_24799 ) ) ( not ( = ?auto_24798 ?auto_24800 ) ) ( not ( = ?auto_24798 ?auto_24801 ) ) ( not ( = ?auto_24798 ?auto_24802 ) ) ( not ( = ?auto_24799 ?auto_24800 ) ) ( not ( = ?auto_24799 ?auto_24801 ) ) ( not ( = ?auto_24799 ?auto_24802 ) ) ( not ( = ?auto_24800 ?auto_24801 ) ) ( not ( = ?auto_24800 ?auto_24802 ) ) ( not ( = ?auto_24801 ?auto_24802 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24801 ?auto_24802 )
      ( !STACK ?auto_24801 ?auto_24800 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24822 - BLOCK
      ?auto_24823 - BLOCK
      ?auto_24824 - BLOCK
      ?auto_24825 - BLOCK
      ?auto_24826 - BLOCK
      ?auto_24827 - BLOCK
    )
    :vars
    (
      ?auto_24828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24827 ?auto_24828 ) ( ON-TABLE ?auto_24822 ) ( ON ?auto_24823 ?auto_24822 ) ( ON ?auto_24824 ?auto_24823 ) ( ON ?auto_24825 ?auto_24824 ) ( not ( = ?auto_24822 ?auto_24823 ) ) ( not ( = ?auto_24822 ?auto_24824 ) ) ( not ( = ?auto_24822 ?auto_24825 ) ) ( not ( = ?auto_24822 ?auto_24826 ) ) ( not ( = ?auto_24822 ?auto_24827 ) ) ( not ( = ?auto_24822 ?auto_24828 ) ) ( not ( = ?auto_24823 ?auto_24824 ) ) ( not ( = ?auto_24823 ?auto_24825 ) ) ( not ( = ?auto_24823 ?auto_24826 ) ) ( not ( = ?auto_24823 ?auto_24827 ) ) ( not ( = ?auto_24823 ?auto_24828 ) ) ( not ( = ?auto_24824 ?auto_24825 ) ) ( not ( = ?auto_24824 ?auto_24826 ) ) ( not ( = ?auto_24824 ?auto_24827 ) ) ( not ( = ?auto_24824 ?auto_24828 ) ) ( not ( = ?auto_24825 ?auto_24826 ) ) ( not ( = ?auto_24825 ?auto_24827 ) ) ( not ( = ?auto_24825 ?auto_24828 ) ) ( not ( = ?auto_24826 ?auto_24827 ) ) ( not ( = ?auto_24826 ?auto_24828 ) ) ( not ( = ?auto_24827 ?auto_24828 ) ) ( CLEAR ?auto_24825 ) ( ON ?auto_24826 ?auto_24827 ) ( CLEAR ?auto_24826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24822 ?auto_24823 ?auto_24824 ?auto_24825 ?auto_24826 )
      ( MAKE-6PILE ?auto_24822 ?auto_24823 ?auto_24824 ?auto_24825 ?auto_24826 ?auto_24827 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24848 - BLOCK
      ?auto_24849 - BLOCK
      ?auto_24850 - BLOCK
      ?auto_24851 - BLOCK
      ?auto_24852 - BLOCK
      ?auto_24853 - BLOCK
    )
    :vars
    (
      ?auto_24854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24853 ?auto_24854 ) ( ON-TABLE ?auto_24848 ) ( ON ?auto_24849 ?auto_24848 ) ( ON ?auto_24850 ?auto_24849 ) ( not ( = ?auto_24848 ?auto_24849 ) ) ( not ( = ?auto_24848 ?auto_24850 ) ) ( not ( = ?auto_24848 ?auto_24851 ) ) ( not ( = ?auto_24848 ?auto_24852 ) ) ( not ( = ?auto_24848 ?auto_24853 ) ) ( not ( = ?auto_24848 ?auto_24854 ) ) ( not ( = ?auto_24849 ?auto_24850 ) ) ( not ( = ?auto_24849 ?auto_24851 ) ) ( not ( = ?auto_24849 ?auto_24852 ) ) ( not ( = ?auto_24849 ?auto_24853 ) ) ( not ( = ?auto_24849 ?auto_24854 ) ) ( not ( = ?auto_24850 ?auto_24851 ) ) ( not ( = ?auto_24850 ?auto_24852 ) ) ( not ( = ?auto_24850 ?auto_24853 ) ) ( not ( = ?auto_24850 ?auto_24854 ) ) ( not ( = ?auto_24851 ?auto_24852 ) ) ( not ( = ?auto_24851 ?auto_24853 ) ) ( not ( = ?auto_24851 ?auto_24854 ) ) ( not ( = ?auto_24852 ?auto_24853 ) ) ( not ( = ?auto_24852 ?auto_24854 ) ) ( not ( = ?auto_24853 ?auto_24854 ) ) ( ON ?auto_24852 ?auto_24853 ) ( CLEAR ?auto_24850 ) ( ON ?auto_24851 ?auto_24852 ) ( CLEAR ?auto_24851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24848 ?auto_24849 ?auto_24850 ?auto_24851 )
      ( MAKE-6PILE ?auto_24848 ?auto_24849 ?auto_24850 ?auto_24851 ?auto_24852 ?auto_24853 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24874 - BLOCK
      ?auto_24875 - BLOCK
      ?auto_24876 - BLOCK
      ?auto_24877 - BLOCK
      ?auto_24878 - BLOCK
      ?auto_24879 - BLOCK
    )
    :vars
    (
      ?auto_24880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24879 ?auto_24880 ) ( ON-TABLE ?auto_24874 ) ( ON ?auto_24875 ?auto_24874 ) ( not ( = ?auto_24874 ?auto_24875 ) ) ( not ( = ?auto_24874 ?auto_24876 ) ) ( not ( = ?auto_24874 ?auto_24877 ) ) ( not ( = ?auto_24874 ?auto_24878 ) ) ( not ( = ?auto_24874 ?auto_24879 ) ) ( not ( = ?auto_24874 ?auto_24880 ) ) ( not ( = ?auto_24875 ?auto_24876 ) ) ( not ( = ?auto_24875 ?auto_24877 ) ) ( not ( = ?auto_24875 ?auto_24878 ) ) ( not ( = ?auto_24875 ?auto_24879 ) ) ( not ( = ?auto_24875 ?auto_24880 ) ) ( not ( = ?auto_24876 ?auto_24877 ) ) ( not ( = ?auto_24876 ?auto_24878 ) ) ( not ( = ?auto_24876 ?auto_24879 ) ) ( not ( = ?auto_24876 ?auto_24880 ) ) ( not ( = ?auto_24877 ?auto_24878 ) ) ( not ( = ?auto_24877 ?auto_24879 ) ) ( not ( = ?auto_24877 ?auto_24880 ) ) ( not ( = ?auto_24878 ?auto_24879 ) ) ( not ( = ?auto_24878 ?auto_24880 ) ) ( not ( = ?auto_24879 ?auto_24880 ) ) ( ON ?auto_24878 ?auto_24879 ) ( ON ?auto_24877 ?auto_24878 ) ( CLEAR ?auto_24875 ) ( ON ?auto_24876 ?auto_24877 ) ( CLEAR ?auto_24876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24874 ?auto_24875 ?auto_24876 )
      ( MAKE-6PILE ?auto_24874 ?auto_24875 ?auto_24876 ?auto_24877 ?auto_24878 ?auto_24879 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24900 - BLOCK
      ?auto_24901 - BLOCK
      ?auto_24902 - BLOCK
      ?auto_24903 - BLOCK
      ?auto_24904 - BLOCK
      ?auto_24905 - BLOCK
    )
    :vars
    (
      ?auto_24906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24905 ?auto_24906 ) ( ON-TABLE ?auto_24900 ) ( not ( = ?auto_24900 ?auto_24901 ) ) ( not ( = ?auto_24900 ?auto_24902 ) ) ( not ( = ?auto_24900 ?auto_24903 ) ) ( not ( = ?auto_24900 ?auto_24904 ) ) ( not ( = ?auto_24900 ?auto_24905 ) ) ( not ( = ?auto_24900 ?auto_24906 ) ) ( not ( = ?auto_24901 ?auto_24902 ) ) ( not ( = ?auto_24901 ?auto_24903 ) ) ( not ( = ?auto_24901 ?auto_24904 ) ) ( not ( = ?auto_24901 ?auto_24905 ) ) ( not ( = ?auto_24901 ?auto_24906 ) ) ( not ( = ?auto_24902 ?auto_24903 ) ) ( not ( = ?auto_24902 ?auto_24904 ) ) ( not ( = ?auto_24902 ?auto_24905 ) ) ( not ( = ?auto_24902 ?auto_24906 ) ) ( not ( = ?auto_24903 ?auto_24904 ) ) ( not ( = ?auto_24903 ?auto_24905 ) ) ( not ( = ?auto_24903 ?auto_24906 ) ) ( not ( = ?auto_24904 ?auto_24905 ) ) ( not ( = ?auto_24904 ?auto_24906 ) ) ( not ( = ?auto_24905 ?auto_24906 ) ) ( ON ?auto_24904 ?auto_24905 ) ( ON ?auto_24903 ?auto_24904 ) ( ON ?auto_24902 ?auto_24903 ) ( CLEAR ?auto_24900 ) ( ON ?auto_24901 ?auto_24902 ) ( CLEAR ?auto_24901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24900 ?auto_24901 )
      ( MAKE-6PILE ?auto_24900 ?auto_24901 ?auto_24902 ?auto_24903 ?auto_24904 ?auto_24905 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24926 - BLOCK
      ?auto_24927 - BLOCK
      ?auto_24928 - BLOCK
      ?auto_24929 - BLOCK
      ?auto_24930 - BLOCK
      ?auto_24931 - BLOCK
    )
    :vars
    (
      ?auto_24932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24931 ?auto_24932 ) ( not ( = ?auto_24926 ?auto_24927 ) ) ( not ( = ?auto_24926 ?auto_24928 ) ) ( not ( = ?auto_24926 ?auto_24929 ) ) ( not ( = ?auto_24926 ?auto_24930 ) ) ( not ( = ?auto_24926 ?auto_24931 ) ) ( not ( = ?auto_24926 ?auto_24932 ) ) ( not ( = ?auto_24927 ?auto_24928 ) ) ( not ( = ?auto_24927 ?auto_24929 ) ) ( not ( = ?auto_24927 ?auto_24930 ) ) ( not ( = ?auto_24927 ?auto_24931 ) ) ( not ( = ?auto_24927 ?auto_24932 ) ) ( not ( = ?auto_24928 ?auto_24929 ) ) ( not ( = ?auto_24928 ?auto_24930 ) ) ( not ( = ?auto_24928 ?auto_24931 ) ) ( not ( = ?auto_24928 ?auto_24932 ) ) ( not ( = ?auto_24929 ?auto_24930 ) ) ( not ( = ?auto_24929 ?auto_24931 ) ) ( not ( = ?auto_24929 ?auto_24932 ) ) ( not ( = ?auto_24930 ?auto_24931 ) ) ( not ( = ?auto_24930 ?auto_24932 ) ) ( not ( = ?auto_24931 ?auto_24932 ) ) ( ON ?auto_24930 ?auto_24931 ) ( ON ?auto_24929 ?auto_24930 ) ( ON ?auto_24928 ?auto_24929 ) ( ON ?auto_24927 ?auto_24928 ) ( ON ?auto_24926 ?auto_24927 ) ( CLEAR ?auto_24926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24926 )
      ( MAKE-6PILE ?auto_24926 ?auto_24927 ?auto_24928 ?auto_24929 ?auto_24930 ?auto_24931 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24953 - BLOCK
      ?auto_24954 - BLOCK
      ?auto_24955 - BLOCK
      ?auto_24956 - BLOCK
      ?auto_24957 - BLOCK
      ?auto_24958 - BLOCK
      ?auto_24959 - BLOCK
    )
    :vars
    (
      ?auto_24960 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24958 ) ( ON ?auto_24959 ?auto_24960 ) ( CLEAR ?auto_24959 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24953 ) ( ON ?auto_24954 ?auto_24953 ) ( ON ?auto_24955 ?auto_24954 ) ( ON ?auto_24956 ?auto_24955 ) ( ON ?auto_24957 ?auto_24956 ) ( ON ?auto_24958 ?auto_24957 ) ( not ( = ?auto_24953 ?auto_24954 ) ) ( not ( = ?auto_24953 ?auto_24955 ) ) ( not ( = ?auto_24953 ?auto_24956 ) ) ( not ( = ?auto_24953 ?auto_24957 ) ) ( not ( = ?auto_24953 ?auto_24958 ) ) ( not ( = ?auto_24953 ?auto_24959 ) ) ( not ( = ?auto_24953 ?auto_24960 ) ) ( not ( = ?auto_24954 ?auto_24955 ) ) ( not ( = ?auto_24954 ?auto_24956 ) ) ( not ( = ?auto_24954 ?auto_24957 ) ) ( not ( = ?auto_24954 ?auto_24958 ) ) ( not ( = ?auto_24954 ?auto_24959 ) ) ( not ( = ?auto_24954 ?auto_24960 ) ) ( not ( = ?auto_24955 ?auto_24956 ) ) ( not ( = ?auto_24955 ?auto_24957 ) ) ( not ( = ?auto_24955 ?auto_24958 ) ) ( not ( = ?auto_24955 ?auto_24959 ) ) ( not ( = ?auto_24955 ?auto_24960 ) ) ( not ( = ?auto_24956 ?auto_24957 ) ) ( not ( = ?auto_24956 ?auto_24958 ) ) ( not ( = ?auto_24956 ?auto_24959 ) ) ( not ( = ?auto_24956 ?auto_24960 ) ) ( not ( = ?auto_24957 ?auto_24958 ) ) ( not ( = ?auto_24957 ?auto_24959 ) ) ( not ( = ?auto_24957 ?auto_24960 ) ) ( not ( = ?auto_24958 ?auto_24959 ) ) ( not ( = ?auto_24958 ?auto_24960 ) ) ( not ( = ?auto_24959 ?auto_24960 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24959 ?auto_24960 )
      ( !STACK ?auto_24959 ?auto_24958 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24968 - BLOCK
      ?auto_24969 - BLOCK
      ?auto_24970 - BLOCK
      ?auto_24971 - BLOCK
      ?auto_24972 - BLOCK
      ?auto_24973 - BLOCK
      ?auto_24974 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24973 ) ( ON-TABLE ?auto_24974 ) ( CLEAR ?auto_24974 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24968 ) ( ON ?auto_24969 ?auto_24968 ) ( ON ?auto_24970 ?auto_24969 ) ( ON ?auto_24971 ?auto_24970 ) ( ON ?auto_24972 ?auto_24971 ) ( ON ?auto_24973 ?auto_24972 ) ( not ( = ?auto_24968 ?auto_24969 ) ) ( not ( = ?auto_24968 ?auto_24970 ) ) ( not ( = ?auto_24968 ?auto_24971 ) ) ( not ( = ?auto_24968 ?auto_24972 ) ) ( not ( = ?auto_24968 ?auto_24973 ) ) ( not ( = ?auto_24968 ?auto_24974 ) ) ( not ( = ?auto_24969 ?auto_24970 ) ) ( not ( = ?auto_24969 ?auto_24971 ) ) ( not ( = ?auto_24969 ?auto_24972 ) ) ( not ( = ?auto_24969 ?auto_24973 ) ) ( not ( = ?auto_24969 ?auto_24974 ) ) ( not ( = ?auto_24970 ?auto_24971 ) ) ( not ( = ?auto_24970 ?auto_24972 ) ) ( not ( = ?auto_24970 ?auto_24973 ) ) ( not ( = ?auto_24970 ?auto_24974 ) ) ( not ( = ?auto_24971 ?auto_24972 ) ) ( not ( = ?auto_24971 ?auto_24973 ) ) ( not ( = ?auto_24971 ?auto_24974 ) ) ( not ( = ?auto_24972 ?auto_24973 ) ) ( not ( = ?auto_24972 ?auto_24974 ) ) ( not ( = ?auto_24973 ?auto_24974 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_24974 )
      ( !STACK ?auto_24974 ?auto_24973 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24982 - BLOCK
      ?auto_24983 - BLOCK
      ?auto_24984 - BLOCK
      ?auto_24985 - BLOCK
      ?auto_24986 - BLOCK
      ?auto_24987 - BLOCK
      ?auto_24988 - BLOCK
    )
    :vars
    (
      ?auto_24989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24988 ?auto_24989 ) ( ON-TABLE ?auto_24982 ) ( ON ?auto_24983 ?auto_24982 ) ( ON ?auto_24984 ?auto_24983 ) ( ON ?auto_24985 ?auto_24984 ) ( ON ?auto_24986 ?auto_24985 ) ( not ( = ?auto_24982 ?auto_24983 ) ) ( not ( = ?auto_24982 ?auto_24984 ) ) ( not ( = ?auto_24982 ?auto_24985 ) ) ( not ( = ?auto_24982 ?auto_24986 ) ) ( not ( = ?auto_24982 ?auto_24987 ) ) ( not ( = ?auto_24982 ?auto_24988 ) ) ( not ( = ?auto_24982 ?auto_24989 ) ) ( not ( = ?auto_24983 ?auto_24984 ) ) ( not ( = ?auto_24983 ?auto_24985 ) ) ( not ( = ?auto_24983 ?auto_24986 ) ) ( not ( = ?auto_24983 ?auto_24987 ) ) ( not ( = ?auto_24983 ?auto_24988 ) ) ( not ( = ?auto_24983 ?auto_24989 ) ) ( not ( = ?auto_24984 ?auto_24985 ) ) ( not ( = ?auto_24984 ?auto_24986 ) ) ( not ( = ?auto_24984 ?auto_24987 ) ) ( not ( = ?auto_24984 ?auto_24988 ) ) ( not ( = ?auto_24984 ?auto_24989 ) ) ( not ( = ?auto_24985 ?auto_24986 ) ) ( not ( = ?auto_24985 ?auto_24987 ) ) ( not ( = ?auto_24985 ?auto_24988 ) ) ( not ( = ?auto_24985 ?auto_24989 ) ) ( not ( = ?auto_24986 ?auto_24987 ) ) ( not ( = ?auto_24986 ?auto_24988 ) ) ( not ( = ?auto_24986 ?auto_24989 ) ) ( not ( = ?auto_24987 ?auto_24988 ) ) ( not ( = ?auto_24987 ?auto_24989 ) ) ( not ( = ?auto_24988 ?auto_24989 ) ) ( CLEAR ?auto_24986 ) ( ON ?auto_24987 ?auto_24988 ) ( CLEAR ?auto_24987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_24982 ?auto_24983 ?auto_24984 ?auto_24985 ?auto_24986 ?auto_24987 )
      ( MAKE-7PILE ?auto_24982 ?auto_24983 ?auto_24984 ?auto_24985 ?auto_24986 ?auto_24987 ?auto_24988 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24997 - BLOCK
      ?auto_24998 - BLOCK
      ?auto_24999 - BLOCK
      ?auto_25000 - BLOCK
      ?auto_25001 - BLOCK
      ?auto_25002 - BLOCK
      ?auto_25003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25003 ) ( ON-TABLE ?auto_24997 ) ( ON ?auto_24998 ?auto_24997 ) ( ON ?auto_24999 ?auto_24998 ) ( ON ?auto_25000 ?auto_24999 ) ( ON ?auto_25001 ?auto_25000 ) ( not ( = ?auto_24997 ?auto_24998 ) ) ( not ( = ?auto_24997 ?auto_24999 ) ) ( not ( = ?auto_24997 ?auto_25000 ) ) ( not ( = ?auto_24997 ?auto_25001 ) ) ( not ( = ?auto_24997 ?auto_25002 ) ) ( not ( = ?auto_24997 ?auto_25003 ) ) ( not ( = ?auto_24998 ?auto_24999 ) ) ( not ( = ?auto_24998 ?auto_25000 ) ) ( not ( = ?auto_24998 ?auto_25001 ) ) ( not ( = ?auto_24998 ?auto_25002 ) ) ( not ( = ?auto_24998 ?auto_25003 ) ) ( not ( = ?auto_24999 ?auto_25000 ) ) ( not ( = ?auto_24999 ?auto_25001 ) ) ( not ( = ?auto_24999 ?auto_25002 ) ) ( not ( = ?auto_24999 ?auto_25003 ) ) ( not ( = ?auto_25000 ?auto_25001 ) ) ( not ( = ?auto_25000 ?auto_25002 ) ) ( not ( = ?auto_25000 ?auto_25003 ) ) ( not ( = ?auto_25001 ?auto_25002 ) ) ( not ( = ?auto_25001 ?auto_25003 ) ) ( not ( = ?auto_25002 ?auto_25003 ) ) ( CLEAR ?auto_25001 ) ( ON ?auto_25002 ?auto_25003 ) ( CLEAR ?auto_25002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_24997 ?auto_24998 ?auto_24999 ?auto_25000 ?auto_25001 ?auto_25002 )
      ( MAKE-7PILE ?auto_24997 ?auto_24998 ?auto_24999 ?auto_25000 ?auto_25001 ?auto_25002 ?auto_25003 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25011 - BLOCK
      ?auto_25012 - BLOCK
      ?auto_25013 - BLOCK
      ?auto_25014 - BLOCK
      ?auto_25015 - BLOCK
      ?auto_25016 - BLOCK
      ?auto_25017 - BLOCK
    )
    :vars
    (
      ?auto_25018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25017 ?auto_25018 ) ( ON-TABLE ?auto_25011 ) ( ON ?auto_25012 ?auto_25011 ) ( ON ?auto_25013 ?auto_25012 ) ( ON ?auto_25014 ?auto_25013 ) ( not ( = ?auto_25011 ?auto_25012 ) ) ( not ( = ?auto_25011 ?auto_25013 ) ) ( not ( = ?auto_25011 ?auto_25014 ) ) ( not ( = ?auto_25011 ?auto_25015 ) ) ( not ( = ?auto_25011 ?auto_25016 ) ) ( not ( = ?auto_25011 ?auto_25017 ) ) ( not ( = ?auto_25011 ?auto_25018 ) ) ( not ( = ?auto_25012 ?auto_25013 ) ) ( not ( = ?auto_25012 ?auto_25014 ) ) ( not ( = ?auto_25012 ?auto_25015 ) ) ( not ( = ?auto_25012 ?auto_25016 ) ) ( not ( = ?auto_25012 ?auto_25017 ) ) ( not ( = ?auto_25012 ?auto_25018 ) ) ( not ( = ?auto_25013 ?auto_25014 ) ) ( not ( = ?auto_25013 ?auto_25015 ) ) ( not ( = ?auto_25013 ?auto_25016 ) ) ( not ( = ?auto_25013 ?auto_25017 ) ) ( not ( = ?auto_25013 ?auto_25018 ) ) ( not ( = ?auto_25014 ?auto_25015 ) ) ( not ( = ?auto_25014 ?auto_25016 ) ) ( not ( = ?auto_25014 ?auto_25017 ) ) ( not ( = ?auto_25014 ?auto_25018 ) ) ( not ( = ?auto_25015 ?auto_25016 ) ) ( not ( = ?auto_25015 ?auto_25017 ) ) ( not ( = ?auto_25015 ?auto_25018 ) ) ( not ( = ?auto_25016 ?auto_25017 ) ) ( not ( = ?auto_25016 ?auto_25018 ) ) ( not ( = ?auto_25017 ?auto_25018 ) ) ( ON ?auto_25016 ?auto_25017 ) ( CLEAR ?auto_25014 ) ( ON ?auto_25015 ?auto_25016 ) ( CLEAR ?auto_25015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25011 ?auto_25012 ?auto_25013 ?auto_25014 ?auto_25015 )
      ( MAKE-7PILE ?auto_25011 ?auto_25012 ?auto_25013 ?auto_25014 ?auto_25015 ?auto_25016 ?auto_25017 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25026 - BLOCK
      ?auto_25027 - BLOCK
      ?auto_25028 - BLOCK
      ?auto_25029 - BLOCK
      ?auto_25030 - BLOCK
      ?auto_25031 - BLOCK
      ?auto_25032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25032 ) ( ON-TABLE ?auto_25026 ) ( ON ?auto_25027 ?auto_25026 ) ( ON ?auto_25028 ?auto_25027 ) ( ON ?auto_25029 ?auto_25028 ) ( not ( = ?auto_25026 ?auto_25027 ) ) ( not ( = ?auto_25026 ?auto_25028 ) ) ( not ( = ?auto_25026 ?auto_25029 ) ) ( not ( = ?auto_25026 ?auto_25030 ) ) ( not ( = ?auto_25026 ?auto_25031 ) ) ( not ( = ?auto_25026 ?auto_25032 ) ) ( not ( = ?auto_25027 ?auto_25028 ) ) ( not ( = ?auto_25027 ?auto_25029 ) ) ( not ( = ?auto_25027 ?auto_25030 ) ) ( not ( = ?auto_25027 ?auto_25031 ) ) ( not ( = ?auto_25027 ?auto_25032 ) ) ( not ( = ?auto_25028 ?auto_25029 ) ) ( not ( = ?auto_25028 ?auto_25030 ) ) ( not ( = ?auto_25028 ?auto_25031 ) ) ( not ( = ?auto_25028 ?auto_25032 ) ) ( not ( = ?auto_25029 ?auto_25030 ) ) ( not ( = ?auto_25029 ?auto_25031 ) ) ( not ( = ?auto_25029 ?auto_25032 ) ) ( not ( = ?auto_25030 ?auto_25031 ) ) ( not ( = ?auto_25030 ?auto_25032 ) ) ( not ( = ?auto_25031 ?auto_25032 ) ) ( ON ?auto_25031 ?auto_25032 ) ( CLEAR ?auto_25029 ) ( ON ?auto_25030 ?auto_25031 ) ( CLEAR ?auto_25030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25026 ?auto_25027 ?auto_25028 ?auto_25029 ?auto_25030 )
      ( MAKE-7PILE ?auto_25026 ?auto_25027 ?auto_25028 ?auto_25029 ?auto_25030 ?auto_25031 ?auto_25032 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25040 - BLOCK
      ?auto_25041 - BLOCK
      ?auto_25042 - BLOCK
      ?auto_25043 - BLOCK
      ?auto_25044 - BLOCK
      ?auto_25045 - BLOCK
      ?auto_25046 - BLOCK
    )
    :vars
    (
      ?auto_25047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25046 ?auto_25047 ) ( ON-TABLE ?auto_25040 ) ( ON ?auto_25041 ?auto_25040 ) ( ON ?auto_25042 ?auto_25041 ) ( not ( = ?auto_25040 ?auto_25041 ) ) ( not ( = ?auto_25040 ?auto_25042 ) ) ( not ( = ?auto_25040 ?auto_25043 ) ) ( not ( = ?auto_25040 ?auto_25044 ) ) ( not ( = ?auto_25040 ?auto_25045 ) ) ( not ( = ?auto_25040 ?auto_25046 ) ) ( not ( = ?auto_25040 ?auto_25047 ) ) ( not ( = ?auto_25041 ?auto_25042 ) ) ( not ( = ?auto_25041 ?auto_25043 ) ) ( not ( = ?auto_25041 ?auto_25044 ) ) ( not ( = ?auto_25041 ?auto_25045 ) ) ( not ( = ?auto_25041 ?auto_25046 ) ) ( not ( = ?auto_25041 ?auto_25047 ) ) ( not ( = ?auto_25042 ?auto_25043 ) ) ( not ( = ?auto_25042 ?auto_25044 ) ) ( not ( = ?auto_25042 ?auto_25045 ) ) ( not ( = ?auto_25042 ?auto_25046 ) ) ( not ( = ?auto_25042 ?auto_25047 ) ) ( not ( = ?auto_25043 ?auto_25044 ) ) ( not ( = ?auto_25043 ?auto_25045 ) ) ( not ( = ?auto_25043 ?auto_25046 ) ) ( not ( = ?auto_25043 ?auto_25047 ) ) ( not ( = ?auto_25044 ?auto_25045 ) ) ( not ( = ?auto_25044 ?auto_25046 ) ) ( not ( = ?auto_25044 ?auto_25047 ) ) ( not ( = ?auto_25045 ?auto_25046 ) ) ( not ( = ?auto_25045 ?auto_25047 ) ) ( not ( = ?auto_25046 ?auto_25047 ) ) ( ON ?auto_25045 ?auto_25046 ) ( ON ?auto_25044 ?auto_25045 ) ( CLEAR ?auto_25042 ) ( ON ?auto_25043 ?auto_25044 ) ( CLEAR ?auto_25043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25040 ?auto_25041 ?auto_25042 ?auto_25043 )
      ( MAKE-7PILE ?auto_25040 ?auto_25041 ?auto_25042 ?auto_25043 ?auto_25044 ?auto_25045 ?auto_25046 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25055 - BLOCK
      ?auto_25056 - BLOCK
      ?auto_25057 - BLOCK
      ?auto_25058 - BLOCK
      ?auto_25059 - BLOCK
      ?auto_25060 - BLOCK
      ?auto_25061 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25061 ) ( ON-TABLE ?auto_25055 ) ( ON ?auto_25056 ?auto_25055 ) ( ON ?auto_25057 ?auto_25056 ) ( not ( = ?auto_25055 ?auto_25056 ) ) ( not ( = ?auto_25055 ?auto_25057 ) ) ( not ( = ?auto_25055 ?auto_25058 ) ) ( not ( = ?auto_25055 ?auto_25059 ) ) ( not ( = ?auto_25055 ?auto_25060 ) ) ( not ( = ?auto_25055 ?auto_25061 ) ) ( not ( = ?auto_25056 ?auto_25057 ) ) ( not ( = ?auto_25056 ?auto_25058 ) ) ( not ( = ?auto_25056 ?auto_25059 ) ) ( not ( = ?auto_25056 ?auto_25060 ) ) ( not ( = ?auto_25056 ?auto_25061 ) ) ( not ( = ?auto_25057 ?auto_25058 ) ) ( not ( = ?auto_25057 ?auto_25059 ) ) ( not ( = ?auto_25057 ?auto_25060 ) ) ( not ( = ?auto_25057 ?auto_25061 ) ) ( not ( = ?auto_25058 ?auto_25059 ) ) ( not ( = ?auto_25058 ?auto_25060 ) ) ( not ( = ?auto_25058 ?auto_25061 ) ) ( not ( = ?auto_25059 ?auto_25060 ) ) ( not ( = ?auto_25059 ?auto_25061 ) ) ( not ( = ?auto_25060 ?auto_25061 ) ) ( ON ?auto_25060 ?auto_25061 ) ( ON ?auto_25059 ?auto_25060 ) ( CLEAR ?auto_25057 ) ( ON ?auto_25058 ?auto_25059 ) ( CLEAR ?auto_25058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25055 ?auto_25056 ?auto_25057 ?auto_25058 )
      ( MAKE-7PILE ?auto_25055 ?auto_25056 ?auto_25057 ?auto_25058 ?auto_25059 ?auto_25060 ?auto_25061 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25069 - BLOCK
      ?auto_25070 - BLOCK
      ?auto_25071 - BLOCK
      ?auto_25072 - BLOCK
      ?auto_25073 - BLOCK
      ?auto_25074 - BLOCK
      ?auto_25075 - BLOCK
    )
    :vars
    (
      ?auto_25076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25075 ?auto_25076 ) ( ON-TABLE ?auto_25069 ) ( ON ?auto_25070 ?auto_25069 ) ( not ( = ?auto_25069 ?auto_25070 ) ) ( not ( = ?auto_25069 ?auto_25071 ) ) ( not ( = ?auto_25069 ?auto_25072 ) ) ( not ( = ?auto_25069 ?auto_25073 ) ) ( not ( = ?auto_25069 ?auto_25074 ) ) ( not ( = ?auto_25069 ?auto_25075 ) ) ( not ( = ?auto_25069 ?auto_25076 ) ) ( not ( = ?auto_25070 ?auto_25071 ) ) ( not ( = ?auto_25070 ?auto_25072 ) ) ( not ( = ?auto_25070 ?auto_25073 ) ) ( not ( = ?auto_25070 ?auto_25074 ) ) ( not ( = ?auto_25070 ?auto_25075 ) ) ( not ( = ?auto_25070 ?auto_25076 ) ) ( not ( = ?auto_25071 ?auto_25072 ) ) ( not ( = ?auto_25071 ?auto_25073 ) ) ( not ( = ?auto_25071 ?auto_25074 ) ) ( not ( = ?auto_25071 ?auto_25075 ) ) ( not ( = ?auto_25071 ?auto_25076 ) ) ( not ( = ?auto_25072 ?auto_25073 ) ) ( not ( = ?auto_25072 ?auto_25074 ) ) ( not ( = ?auto_25072 ?auto_25075 ) ) ( not ( = ?auto_25072 ?auto_25076 ) ) ( not ( = ?auto_25073 ?auto_25074 ) ) ( not ( = ?auto_25073 ?auto_25075 ) ) ( not ( = ?auto_25073 ?auto_25076 ) ) ( not ( = ?auto_25074 ?auto_25075 ) ) ( not ( = ?auto_25074 ?auto_25076 ) ) ( not ( = ?auto_25075 ?auto_25076 ) ) ( ON ?auto_25074 ?auto_25075 ) ( ON ?auto_25073 ?auto_25074 ) ( ON ?auto_25072 ?auto_25073 ) ( CLEAR ?auto_25070 ) ( ON ?auto_25071 ?auto_25072 ) ( CLEAR ?auto_25071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25069 ?auto_25070 ?auto_25071 )
      ( MAKE-7PILE ?auto_25069 ?auto_25070 ?auto_25071 ?auto_25072 ?auto_25073 ?auto_25074 ?auto_25075 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25084 - BLOCK
      ?auto_25085 - BLOCK
      ?auto_25086 - BLOCK
      ?auto_25087 - BLOCK
      ?auto_25088 - BLOCK
      ?auto_25089 - BLOCK
      ?auto_25090 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25090 ) ( ON-TABLE ?auto_25084 ) ( ON ?auto_25085 ?auto_25084 ) ( not ( = ?auto_25084 ?auto_25085 ) ) ( not ( = ?auto_25084 ?auto_25086 ) ) ( not ( = ?auto_25084 ?auto_25087 ) ) ( not ( = ?auto_25084 ?auto_25088 ) ) ( not ( = ?auto_25084 ?auto_25089 ) ) ( not ( = ?auto_25084 ?auto_25090 ) ) ( not ( = ?auto_25085 ?auto_25086 ) ) ( not ( = ?auto_25085 ?auto_25087 ) ) ( not ( = ?auto_25085 ?auto_25088 ) ) ( not ( = ?auto_25085 ?auto_25089 ) ) ( not ( = ?auto_25085 ?auto_25090 ) ) ( not ( = ?auto_25086 ?auto_25087 ) ) ( not ( = ?auto_25086 ?auto_25088 ) ) ( not ( = ?auto_25086 ?auto_25089 ) ) ( not ( = ?auto_25086 ?auto_25090 ) ) ( not ( = ?auto_25087 ?auto_25088 ) ) ( not ( = ?auto_25087 ?auto_25089 ) ) ( not ( = ?auto_25087 ?auto_25090 ) ) ( not ( = ?auto_25088 ?auto_25089 ) ) ( not ( = ?auto_25088 ?auto_25090 ) ) ( not ( = ?auto_25089 ?auto_25090 ) ) ( ON ?auto_25089 ?auto_25090 ) ( ON ?auto_25088 ?auto_25089 ) ( ON ?auto_25087 ?auto_25088 ) ( CLEAR ?auto_25085 ) ( ON ?auto_25086 ?auto_25087 ) ( CLEAR ?auto_25086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25084 ?auto_25085 ?auto_25086 )
      ( MAKE-7PILE ?auto_25084 ?auto_25085 ?auto_25086 ?auto_25087 ?auto_25088 ?auto_25089 ?auto_25090 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25098 - BLOCK
      ?auto_25099 - BLOCK
      ?auto_25100 - BLOCK
      ?auto_25101 - BLOCK
      ?auto_25102 - BLOCK
      ?auto_25103 - BLOCK
      ?auto_25104 - BLOCK
    )
    :vars
    (
      ?auto_25105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25104 ?auto_25105 ) ( ON-TABLE ?auto_25098 ) ( not ( = ?auto_25098 ?auto_25099 ) ) ( not ( = ?auto_25098 ?auto_25100 ) ) ( not ( = ?auto_25098 ?auto_25101 ) ) ( not ( = ?auto_25098 ?auto_25102 ) ) ( not ( = ?auto_25098 ?auto_25103 ) ) ( not ( = ?auto_25098 ?auto_25104 ) ) ( not ( = ?auto_25098 ?auto_25105 ) ) ( not ( = ?auto_25099 ?auto_25100 ) ) ( not ( = ?auto_25099 ?auto_25101 ) ) ( not ( = ?auto_25099 ?auto_25102 ) ) ( not ( = ?auto_25099 ?auto_25103 ) ) ( not ( = ?auto_25099 ?auto_25104 ) ) ( not ( = ?auto_25099 ?auto_25105 ) ) ( not ( = ?auto_25100 ?auto_25101 ) ) ( not ( = ?auto_25100 ?auto_25102 ) ) ( not ( = ?auto_25100 ?auto_25103 ) ) ( not ( = ?auto_25100 ?auto_25104 ) ) ( not ( = ?auto_25100 ?auto_25105 ) ) ( not ( = ?auto_25101 ?auto_25102 ) ) ( not ( = ?auto_25101 ?auto_25103 ) ) ( not ( = ?auto_25101 ?auto_25104 ) ) ( not ( = ?auto_25101 ?auto_25105 ) ) ( not ( = ?auto_25102 ?auto_25103 ) ) ( not ( = ?auto_25102 ?auto_25104 ) ) ( not ( = ?auto_25102 ?auto_25105 ) ) ( not ( = ?auto_25103 ?auto_25104 ) ) ( not ( = ?auto_25103 ?auto_25105 ) ) ( not ( = ?auto_25104 ?auto_25105 ) ) ( ON ?auto_25103 ?auto_25104 ) ( ON ?auto_25102 ?auto_25103 ) ( ON ?auto_25101 ?auto_25102 ) ( ON ?auto_25100 ?auto_25101 ) ( CLEAR ?auto_25098 ) ( ON ?auto_25099 ?auto_25100 ) ( CLEAR ?auto_25099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25098 ?auto_25099 )
      ( MAKE-7PILE ?auto_25098 ?auto_25099 ?auto_25100 ?auto_25101 ?auto_25102 ?auto_25103 ?auto_25104 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25113 - BLOCK
      ?auto_25114 - BLOCK
      ?auto_25115 - BLOCK
      ?auto_25116 - BLOCK
      ?auto_25117 - BLOCK
      ?auto_25118 - BLOCK
      ?auto_25119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25119 ) ( ON-TABLE ?auto_25113 ) ( not ( = ?auto_25113 ?auto_25114 ) ) ( not ( = ?auto_25113 ?auto_25115 ) ) ( not ( = ?auto_25113 ?auto_25116 ) ) ( not ( = ?auto_25113 ?auto_25117 ) ) ( not ( = ?auto_25113 ?auto_25118 ) ) ( not ( = ?auto_25113 ?auto_25119 ) ) ( not ( = ?auto_25114 ?auto_25115 ) ) ( not ( = ?auto_25114 ?auto_25116 ) ) ( not ( = ?auto_25114 ?auto_25117 ) ) ( not ( = ?auto_25114 ?auto_25118 ) ) ( not ( = ?auto_25114 ?auto_25119 ) ) ( not ( = ?auto_25115 ?auto_25116 ) ) ( not ( = ?auto_25115 ?auto_25117 ) ) ( not ( = ?auto_25115 ?auto_25118 ) ) ( not ( = ?auto_25115 ?auto_25119 ) ) ( not ( = ?auto_25116 ?auto_25117 ) ) ( not ( = ?auto_25116 ?auto_25118 ) ) ( not ( = ?auto_25116 ?auto_25119 ) ) ( not ( = ?auto_25117 ?auto_25118 ) ) ( not ( = ?auto_25117 ?auto_25119 ) ) ( not ( = ?auto_25118 ?auto_25119 ) ) ( ON ?auto_25118 ?auto_25119 ) ( ON ?auto_25117 ?auto_25118 ) ( ON ?auto_25116 ?auto_25117 ) ( ON ?auto_25115 ?auto_25116 ) ( CLEAR ?auto_25113 ) ( ON ?auto_25114 ?auto_25115 ) ( CLEAR ?auto_25114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25113 ?auto_25114 )
      ( MAKE-7PILE ?auto_25113 ?auto_25114 ?auto_25115 ?auto_25116 ?auto_25117 ?auto_25118 ?auto_25119 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25127 - BLOCK
      ?auto_25128 - BLOCK
      ?auto_25129 - BLOCK
      ?auto_25130 - BLOCK
      ?auto_25131 - BLOCK
      ?auto_25132 - BLOCK
      ?auto_25133 - BLOCK
    )
    :vars
    (
      ?auto_25134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25133 ?auto_25134 ) ( not ( = ?auto_25127 ?auto_25128 ) ) ( not ( = ?auto_25127 ?auto_25129 ) ) ( not ( = ?auto_25127 ?auto_25130 ) ) ( not ( = ?auto_25127 ?auto_25131 ) ) ( not ( = ?auto_25127 ?auto_25132 ) ) ( not ( = ?auto_25127 ?auto_25133 ) ) ( not ( = ?auto_25127 ?auto_25134 ) ) ( not ( = ?auto_25128 ?auto_25129 ) ) ( not ( = ?auto_25128 ?auto_25130 ) ) ( not ( = ?auto_25128 ?auto_25131 ) ) ( not ( = ?auto_25128 ?auto_25132 ) ) ( not ( = ?auto_25128 ?auto_25133 ) ) ( not ( = ?auto_25128 ?auto_25134 ) ) ( not ( = ?auto_25129 ?auto_25130 ) ) ( not ( = ?auto_25129 ?auto_25131 ) ) ( not ( = ?auto_25129 ?auto_25132 ) ) ( not ( = ?auto_25129 ?auto_25133 ) ) ( not ( = ?auto_25129 ?auto_25134 ) ) ( not ( = ?auto_25130 ?auto_25131 ) ) ( not ( = ?auto_25130 ?auto_25132 ) ) ( not ( = ?auto_25130 ?auto_25133 ) ) ( not ( = ?auto_25130 ?auto_25134 ) ) ( not ( = ?auto_25131 ?auto_25132 ) ) ( not ( = ?auto_25131 ?auto_25133 ) ) ( not ( = ?auto_25131 ?auto_25134 ) ) ( not ( = ?auto_25132 ?auto_25133 ) ) ( not ( = ?auto_25132 ?auto_25134 ) ) ( not ( = ?auto_25133 ?auto_25134 ) ) ( ON ?auto_25132 ?auto_25133 ) ( ON ?auto_25131 ?auto_25132 ) ( ON ?auto_25130 ?auto_25131 ) ( ON ?auto_25129 ?auto_25130 ) ( ON ?auto_25128 ?auto_25129 ) ( ON ?auto_25127 ?auto_25128 ) ( CLEAR ?auto_25127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25127 )
      ( MAKE-7PILE ?auto_25127 ?auto_25128 ?auto_25129 ?auto_25130 ?auto_25131 ?auto_25132 ?auto_25133 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25142 - BLOCK
      ?auto_25143 - BLOCK
      ?auto_25144 - BLOCK
      ?auto_25145 - BLOCK
      ?auto_25146 - BLOCK
      ?auto_25147 - BLOCK
      ?auto_25148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25148 ) ( not ( = ?auto_25142 ?auto_25143 ) ) ( not ( = ?auto_25142 ?auto_25144 ) ) ( not ( = ?auto_25142 ?auto_25145 ) ) ( not ( = ?auto_25142 ?auto_25146 ) ) ( not ( = ?auto_25142 ?auto_25147 ) ) ( not ( = ?auto_25142 ?auto_25148 ) ) ( not ( = ?auto_25143 ?auto_25144 ) ) ( not ( = ?auto_25143 ?auto_25145 ) ) ( not ( = ?auto_25143 ?auto_25146 ) ) ( not ( = ?auto_25143 ?auto_25147 ) ) ( not ( = ?auto_25143 ?auto_25148 ) ) ( not ( = ?auto_25144 ?auto_25145 ) ) ( not ( = ?auto_25144 ?auto_25146 ) ) ( not ( = ?auto_25144 ?auto_25147 ) ) ( not ( = ?auto_25144 ?auto_25148 ) ) ( not ( = ?auto_25145 ?auto_25146 ) ) ( not ( = ?auto_25145 ?auto_25147 ) ) ( not ( = ?auto_25145 ?auto_25148 ) ) ( not ( = ?auto_25146 ?auto_25147 ) ) ( not ( = ?auto_25146 ?auto_25148 ) ) ( not ( = ?auto_25147 ?auto_25148 ) ) ( ON ?auto_25147 ?auto_25148 ) ( ON ?auto_25146 ?auto_25147 ) ( ON ?auto_25145 ?auto_25146 ) ( ON ?auto_25144 ?auto_25145 ) ( ON ?auto_25143 ?auto_25144 ) ( ON ?auto_25142 ?auto_25143 ) ( CLEAR ?auto_25142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25142 )
      ( MAKE-7PILE ?auto_25142 ?auto_25143 ?auto_25144 ?auto_25145 ?auto_25146 ?auto_25147 ?auto_25148 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25156 - BLOCK
      ?auto_25157 - BLOCK
      ?auto_25158 - BLOCK
      ?auto_25159 - BLOCK
      ?auto_25160 - BLOCK
      ?auto_25161 - BLOCK
      ?auto_25162 - BLOCK
    )
    :vars
    (
      ?auto_25163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25156 ?auto_25157 ) ) ( not ( = ?auto_25156 ?auto_25158 ) ) ( not ( = ?auto_25156 ?auto_25159 ) ) ( not ( = ?auto_25156 ?auto_25160 ) ) ( not ( = ?auto_25156 ?auto_25161 ) ) ( not ( = ?auto_25156 ?auto_25162 ) ) ( not ( = ?auto_25157 ?auto_25158 ) ) ( not ( = ?auto_25157 ?auto_25159 ) ) ( not ( = ?auto_25157 ?auto_25160 ) ) ( not ( = ?auto_25157 ?auto_25161 ) ) ( not ( = ?auto_25157 ?auto_25162 ) ) ( not ( = ?auto_25158 ?auto_25159 ) ) ( not ( = ?auto_25158 ?auto_25160 ) ) ( not ( = ?auto_25158 ?auto_25161 ) ) ( not ( = ?auto_25158 ?auto_25162 ) ) ( not ( = ?auto_25159 ?auto_25160 ) ) ( not ( = ?auto_25159 ?auto_25161 ) ) ( not ( = ?auto_25159 ?auto_25162 ) ) ( not ( = ?auto_25160 ?auto_25161 ) ) ( not ( = ?auto_25160 ?auto_25162 ) ) ( not ( = ?auto_25161 ?auto_25162 ) ) ( ON ?auto_25156 ?auto_25163 ) ( not ( = ?auto_25162 ?auto_25163 ) ) ( not ( = ?auto_25161 ?auto_25163 ) ) ( not ( = ?auto_25160 ?auto_25163 ) ) ( not ( = ?auto_25159 ?auto_25163 ) ) ( not ( = ?auto_25158 ?auto_25163 ) ) ( not ( = ?auto_25157 ?auto_25163 ) ) ( not ( = ?auto_25156 ?auto_25163 ) ) ( ON ?auto_25157 ?auto_25156 ) ( ON ?auto_25158 ?auto_25157 ) ( ON ?auto_25159 ?auto_25158 ) ( ON ?auto_25160 ?auto_25159 ) ( ON ?auto_25161 ?auto_25160 ) ( ON ?auto_25162 ?auto_25161 ) ( CLEAR ?auto_25162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_25162 ?auto_25161 ?auto_25160 ?auto_25159 ?auto_25158 ?auto_25157 ?auto_25156 )
      ( MAKE-7PILE ?auto_25156 ?auto_25157 ?auto_25158 ?auto_25159 ?auto_25160 ?auto_25161 ?auto_25162 ) )
  )

)

