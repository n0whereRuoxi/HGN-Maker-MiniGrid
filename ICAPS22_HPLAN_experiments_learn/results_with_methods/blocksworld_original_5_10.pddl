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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28645 - BLOCK
      ?auto_28646 - BLOCK
      ?auto_28647 - BLOCK
      ?auto_28648 - BLOCK
      ?auto_28649 - BLOCK
    )
    :vars
    (
      ?auto_28650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28650 ?auto_28649 ) ( CLEAR ?auto_28650 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28645 ) ( ON ?auto_28646 ?auto_28645 ) ( ON ?auto_28647 ?auto_28646 ) ( ON ?auto_28648 ?auto_28647 ) ( ON ?auto_28649 ?auto_28648 ) ( not ( = ?auto_28645 ?auto_28646 ) ) ( not ( = ?auto_28645 ?auto_28647 ) ) ( not ( = ?auto_28645 ?auto_28648 ) ) ( not ( = ?auto_28645 ?auto_28649 ) ) ( not ( = ?auto_28645 ?auto_28650 ) ) ( not ( = ?auto_28646 ?auto_28647 ) ) ( not ( = ?auto_28646 ?auto_28648 ) ) ( not ( = ?auto_28646 ?auto_28649 ) ) ( not ( = ?auto_28646 ?auto_28650 ) ) ( not ( = ?auto_28647 ?auto_28648 ) ) ( not ( = ?auto_28647 ?auto_28649 ) ) ( not ( = ?auto_28647 ?auto_28650 ) ) ( not ( = ?auto_28648 ?auto_28649 ) ) ( not ( = ?auto_28648 ?auto_28650 ) ) ( not ( = ?auto_28649 ?auto_28650 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28650 ?auto_28649 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28652 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28652 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_28652 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28653 - BLOCK
    )
    :vars
    (
      ?auto_28654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28653 ?auto_28654 ) ( CLEAR ?auto_28653 ) ( HAND-EMPTY ) ( not ( = ?auto_28653 ?auto_28654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28653 ?auto_28654 )
      ( MAKE-1PILE ?auto_28653 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28659 - BLOCK
      ?auto_28660 - BLOCK
      ?auto_28661 - BLOCK
      ?auto_28662 - BLOCK
    )
    :vars
    (
      ?auto_28663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28663 ?auto_28662 ) ( CLEAR ?auto_28663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28659 ) ( ON ?auto_28660 ?auto_28659 ) ( ON ?auto_28661 ?auto_28660 ) ( ON ?auto_28662 ?auto_28661 ) ( not ( = ?auto_28659 ?auto_28660 ) ) ( not ( = ?auto_28659 ?auto_28661 ) ) ( not ( = ?auto_28659 ?auto_28662 ) ) ( not ( = ?auto_28659 ?auto_28663 ) ) ( not ( = ?auto_28660 ?auto_28661 ) ) ( not ( = ?auto_28660 ?auto_28662 ) ) ( not ( = ?auto_28660 ?auto_28663 ) ) ( not ( = ?auto_28661 ?auto_28662 ) ) ( not ( = ?auto_28661 ?auto_28663 ) ) ( not ( = ?auto_28662 ?auto_28663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28663 ?auto_28662 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28664 - BLOCK
      ?auto_28665 - BLOCK
      ?auto_28666 - BLOCK
      ?auto_28667 - BLOCK
    )
    :vars
    (
      ?auto_28668 - BLOCK
      ?auto_28669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28668 ?auto_28667 ) ( CLEAR ?auto_28668 ) ( ON-TABLE ?auto_28664 ) ( ON ?auto_28665 ?auto_28664 ) ( ON ?auto_28666 ?auto_28665 ) ( ON ?auto_28667 ?auto_28666 ) ( not ( = ?auto_28664 ?auto_28665 ) ) ( not ( = ?auto_28664 ?auto_28666 ) ) ( not ( = ?auto_28664 ?auto_28667 ) ) ( not ( = ?auto_28664 ?auto_28668 ) ) ( not ( = ?auto_28665 ?auto_28666 ) ) ( not ( = ?auto_28665 ?auto_28667 ) ) ( not ( = ?auto_28665 ?auto_28668 ) ) ( not ( = ?auto_28666 ?auto_28667 ) ) ( not ( = ?auto_28666 ?auto_28668 ) ) ( not ( = ?auto_28667 ?auto_28668 ) ) ( HOLDING ?auto_28669 ) ( not ( = ?auto_28664 ?auto_28669 ) ) ( not ( = ?auto_28665 ?auto_28669 ) ) ( not ( = ?auto_28666 ?auto_28669 ) ) ( not ( = ?auto_28667 ?auto_28669 ) ) ( not ( = ?auto_28668 ?auto_28669 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_28669 )
      ( MAKE-4PILE ?auto_28664 ?auto_28665 ?auto_28666 ?auto_28667 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28670 - BLOCK
      ?auto_28671 - BLOCK
      ?auto_28672 - BLOCK
      ?auto_28673 - BLOCK
    )
    :vars
    (
      ?auto_28675 - BLOCK
      ?auto_28674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28675 ?auto_28673 ) ( ON-TABLE ?auto_28670 ) ( ON ?auto_28671 ?auto_28670 ) ( ON ?auto_28672 ?auto_28671 ) ( ON ?auto_28673 ?auto_28672 ) ( not ( = ?auto_28670 ?auto_28671 ) ) ( not ( = ?auto_28670 ?auto_28672 ) ) ( not ( = ?auto_28670 ?auto_28673 ) ) ( not ( = ?auto_28670 ?auto_28675 ) ) ( not ( = ?auto_28671 ?auto_28672 ) ) ( not ( = ?auto_28671 ?auto_28673 ) ) ( not ( = ?auto_28671 ?auto_28675 ) ) ( not ( = ?auto_28672 ?auto_28673 ) ) ( not ( = ?auto_28672 ?auto_28675 ) ) ( not ( = ?auto_28673 ?auto_28675 ) ) ( not ( = ?auto_28670 ?auto_28674 ) ) ( not ( = ?auto_28671 ?auto_28674 ) ) ( not ( = ?auto_28672 ?auto_28674 ) ) ( not ( = ?auto_28673 ?auto_28674 ) ) ( not ( = ?auto_28675 ?auto_28674 ) ) ( ON ?auto_28674 ?auto_28675 ) ( CLEAR ?auto_28674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28670 ?auto_28671 ?auto_28672 ?auto_28673 ?auto_28675 )
      ( MAKE-4PILE ?auto_28670 ?auto_28671 ?auto_28672 ?auto_28673 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28678 - BLOCK
      ?auto_28679 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28679 ) ( CLEAR ?auto_28678 ) ( ON-TABLE ?auto_28678 ) ( not ( = ?auto_28678 ?auto_28679 ) ) )
    :subtasks
    ( ( !STACK ?auto_28679 ?auto_28678 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28680 - BLOCK
      ?auto_28681 - BLOCK
    )
    :vars
    (
      ?auto_28682 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28680 ) ( ON-TABLE ?auto_28680 ) ( not ( = ?auto_28680 ?auto_28681 ) ) ( ON ?auto_28681 ?auto_28682 ) ( CLEAR ?auto_28681 ) ( HAND-EMPTY ) ( not ( = ?auto_28680 ?auto_28682 ) ) ( not ( = ?auto_28681 ?auto_28682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28681 ?auto_28682 )
      ( MAKE-2PILE ?auto_28680 ?auto_28681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28683 - BLOCK
      ?auto_28684 - BLOCK
    )
    :vars
    (
      ?auto_28685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28683 ?auto_28684 ) ) ( ON ?auto_28684 ?auto_28685 ) ( CLEAR ?auto_28684 ) ( not ( = ?auto_28683 ?auto_28685 ) ) ( not ( = ?auto_28684 ?auto_28685 ) ) ( HOLDING ?auto_28683 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28683 )
      ( MAKE-2PILE ?auto_28683 ?auto_28684 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28686 - BLOCK
      ?auto_28687 - BLOCK
    )
    :vars
    (
      ?auto_28688 - BLOCK
      ?auto_28690 - BLOCK
      ?auto_28689 - BLOCK
      ?auto_28691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28686 ?auto_28687 ) ) ( ON ?auto_28687 ?auto_28688 ) ( not ( = ?auto_28686 ?auto_28688 ) ) ( not ( = ?auto_28687 ?auto_28688 ) ) ( ON ?auto_28686 ?auto_28687 ) ( CLEAR ?auto_28686 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28690 ) ( ON ?auto_28689 ?auto_28690 ) ( ON ?auto_28691 ?auto_28689 ) ( ON ?auto_28688 ?auto_28691 ) ( not ( = ?auto_28690 ?auto_28689 ) ) ( not ( = ?auto_28690 ?auto_28691 ) ) ( not ( = ?auto_28690 ?auto_28688 ) ) ( not ( = ?auto_28690 ?auto_28687 ) ) ( not ( = ?auto_28690 ?auto_28686 ) ) ( not ( = ?auto_28689 ?auto_28691 ) ) ( not ( = ?auto_28689 ?auto_28688 ) ) ( not ( = ?auto_28689 ?auto_28687 ) ) ( not ( = ?auto_28689 ?auto_28686 ) ) ( not ( = ?auto_28691 ?auto_28688 ) ) ( not ( = ?auto_28691 ?auto_28687 ) ) ( not ( = ?auto_28691 ?auto_28686 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28690 ?auto_28689 ?auto_28691 ?auto_28688 ?auto_28687 )
      ( MAKE-2PILE ?auto_28686 ?auto_28687 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28695 - BLOCK
      ?auto_28696 - BLOCK
      ?auto_28697 - BLOCK
    )
    :vars
    (
      ?auto_28698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28698 ?auto_28697 ) ( CLEAR ?auto_28698 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28695 ) ( ON ?auto_28696 ?auto_28695 ) ( ON ?auto_28697 ?auto_28696 ) ( not ( = ?auto_28695 ?auto_28696 ) ) ( not ( = ?auto_28695 ?auto_28697 ) ) ( not ( = ?auto_28695 ?auto_28698 ) ) ( not ( = ?auto_28696 ?auto_28697 ) ) ( not ( = ?auto_28696 ?auto_28698 ) ) ( not ( = ?auto_28697 ?auto_28698 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28698 ?auto_28697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28699 - BLOCK
      ?auto_28700 - BLOCK
      ?auto_28701 - BLOCK
    )
    :vars
    (
      ?auto_28702 - BLOCK
      ?auto_28703 - BLOCK
      ?auto_28704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28702 ?auto_28701 ) ( CLEAR ?auto_28702 ) ( ON-TABLE ?auto_28699 ) ( ON ?auto_28700 ?auto_28699 ) ( ON ?auto_28701 ?auto_28700 ) ( not ( = ?auto_28699 ?auto_28700 ) ) ( not ( = ?auto_28699 ?auto_28701 ) ) ( not ( = ?auto_28699 ?auto_28702 ) ) ( not ( = ?auto_28700 ?auto_28701 ) ) ( not ( = ?auto_28700 ?auto_28702 ) ) ( not ( = ?auto_28701 ?auto_28702 ) ) ( HOLDING ?auto_28703 ) ( CLEAR ?auto_28704 ) ( not ( = ?auto_28699 ?auto_28703 ) ) ( not ( = ?auto_28699 ?auto_28704 ) ) ( not ( = ?auto_28700 ?auto_28703 ) ) ( not ( = ?auto_28700 ?auto_28704 ) ) ( not ( = ?auto_28701 ?auto_28703 ) ) ( not ( = ?auto_28701 ?auto_28704 ) ) ( not ( = ?auto_28702 ?auto_28703 ) ) ( not ( = ?auto_28702 ?auto_28704 ) ) ( not ( = ?auto_28703 ?auto_28704 ) ) )
    :subtasks
    ( ( !STACK ?auto_28703 ?auto_28704 )
      ( MAKE-3PILE ?auto_28699 ?auto_28700 ?auto_28701 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28705 - BLOCK
      ?auto_28706 - BLOCK
      ?auto_28707 - BLOCK
    )
    :vars
    (
      ?auto_28708 - BLOCK
      ?auto_28710 - BLOCK
      ?auto_28709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28708 ?auto_28707 ) ( ON-TABLE ?auto_28705 ) ( ON ?auto_28706 ?auto_28705 ) ( ON ?auto_28707 ?auto_28706 ) ( not ( = ?auto_28705 ?auto_28706 ) ) ( not ( = ?auto_28705 ?auto_28707 ) ) ( not ( = ?auto_28705 ?auto_28708 ) ) ( not ( = ?auto_28706 ?auto_28707 ) ) ( not ( = ?auto_28706 ?auto_28708 ) ) ( not ( = ?auto_28707 ?auto_28708 ) ) ( CLEAR ?auto_28710 ) ( not ( = ?auto_28705 ?auto_28709 ) ) ( not ( = ?auto_28705 ?auto_28710 ) ) ( not ( = ?auto_28706 ?auto_28709 ) ) ( not ( = ?auto_28706 ?auto_28710 ) ) ( not ( = ?auto_28707 ?auto_28709 ) ) ( not ( = ?auto_28707 ?auto_28710 ) ) ( not ( = ?auto_28708 ?auto_28709 ) ) ( not ( = ?auto_28708 ?auto_28710 ) ) ( not ( = ?auto_28709 ?auto_28710 ) ) ( ON ?auto_28709 ?auto_28708 ) ( CLEAR ?auto_28709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28705 ?auto_28706 ?auto_28707 ?auto_28708 )
      ( MAKE-3PILE ?auto_28705 ?auto_28706 ?auto_28707 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28711 - BLOCK
      ?auto_28712 - BLOCK
      ?auto_28713 - BLOCK
    )
    :vars
    (
      ?auto_28715 - BLOCK
      ?auto_28716 - BLOCK
      ?auto_28714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28715 ?auto_28713 ) ( ON-TABLE ?auto_28711 ) ( ON ?auto_28712 ?auto_28711 ) ( ON ?auto_28713 ?auto_28712 ) ( not ( = ?auto_28711 ?auto_28712 ) ) ( not ( = ?auto_28711 ?auto_28713 ) ) ( not ( = ?auto_28711 ?auto_28715 ) ) ( not ( = ?auto_28712 ?auto_28713 ) ) ( not ( = ?auto_28712 ?auto_28715 ) ) ( not ( = ?auto_28713 ?auto_28715 ) ) ( not ( = ?auto_28711 ?auto_28716 ) ) ( not ( = ?auto_28711 ?auto_28714 ) ) ( not ( = ?auto_28712 ?auto_28716 ) ) ( not ( = ?auto_28712 ?auto_28714 ) ) ( not ( = ?auto_28713 ?auto_28716 ) ) ( not ( = ?auto_28713 ?auto_28714 ) ) ( not ( = ?auto_28715 ?auto_28716 ) ) ( not ( = ?auto_28715 ?auto_28714 ) ) ( not ( = ?auto_28716 ?auto_28714 ) ) ( ON ?auto_28716 ?auto_28715 ) ( CLEAR ?auto_28716 ) ( HOLDING ?auto_28714 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28714 )
      ( MAKE-3PILE ?auto_28711 ?auto_28712 ?auto_28713 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28717 - BLOCK
      ?auto_28718 - BLOCK
      ?auto_28719 - BLOCK
    )
    :vars
    (
      ?auto_28722 - BLOCK
      ?auto_28721 - BLOCK
      ?auto_28720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28722 ?auto_28719 ) ( ON-TABLE ?auto_28717 ) ( ON ?auto_28718 ?auto_28717 ) ( ON ?auto_28719 ?auto_28718 ) ( not ( = ?auto_28717 ?auto_28718 ) ) ( not ( = ?auto_28717 ?auto_28719 ) ) ( not ( = ?auto_28717 ?auto_28722 ) ) ( not ( = ?auto_28718 ?auto_28719 ) ) ( not ( = ?auto_28718 ?auto_28722 ) ) ( not ( = ?auto_28719 ?auto_28722 ) ) ( not ( = ?auto_28717 ?auto_28721 ) ) ( not ( = ?auto_28717 ?auto_28720 ) ) ( not ( = ?auto_28718 ?auto_28721 ) ) ( not ( = ?auto_28718 ?auto_28720 ) ) ( not ( = ?auto_28719 ?auto_28721 ) ) ( not ( = ?auto_28719 ?auto_28720 ) ) ( not ( = ?auto_28722 ?auto_28721 ) ) ( not ( = ?auto_28722 ?auto_28720 ) ) ( not ( = ?auto_28721 ?auto_28720 ) ) ( ON ?auto_28721 ?auto_28722 ) ( ON ?auto_28720 ?auto_28721 ) ( CLEAR ?auto_28720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28717 ?auto_28718 ?auto_28719 ?auto_28722 ?auto_28721 )
      ( MAKE-3PILE ?auto_28717 ?auto_28718 ?auto_28719 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28726 - BLOCK
      ?auto_28727 - BLOCK
      ?auto_28728 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28728 ) ( CLEAR ?auto_28727 ) ( ON-TABLE ?auto_28726 ) ( ON ?auto_28727 ?auto_28726 ) ( not ( = ?auto_28726 ?auto_28727 ) ) ( not ( = ?auto_28726 ?auto_28728 ) ) ( not ( = ?auto_28727 ?auto_28728 ) ) )
    :subtasks
    ( ( !STACK ?auto_28728 ?auto_28727 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28729 - BLOCK
      ?auto_28730 - BLOCK
      ?auto_28731 - BLOCK
    )
    :vars
    (
      ?auto_28732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28730 ) ( ON-TABLE ?auto_28729 ) ( ON ?auto_28730 ?auto_28729 ) ( not ( = ?auto_28729 ?auto_28730 ) ) ( not ( = ?auto_28729 ?auto_28731 ) ) ( not ( = ?auto_28730 ?auto_28731 ) ) ( ON ?auto_28731 ?auto_28732 ) ( CLEAR ?auto_28731 ) ( HAND-EMPTY ) ( not ( = ?auto_28729 ?auto_28732 ) ) ( not ( = ?auto_28730 ?auto_28732 ) ) ( not ( = ?auto_28731 ?auto_28732 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28731 ?auto_28732 )
      ( MAKE-3PILE ?auto_28729 ?auto_28730 ?auto_28731 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28733 - BLOCK
      ?auto_28734 - BLOCK
      ?auto_28735 - BLOCK
    )
    :vars
    (
      ?auto_28736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28733 ) ( not ( = ?auto_28733 ?auto_28734 ) ) ( not ( = ?auto_28733 ?auto_28735 ) ) ( not ( = ?auto_28734 ?auto_28735 ) ) ( ON ?auto_28735 ?auto_28736 ) ( CLEAR ?auto_28735 ) ( not ( = ?auto_28733 ?auto_28736 ) ) ( not ( = ?auto_28734 ?auto_28736 ) ) ( not ( = ?auto_28735 ?auto_28736 ) ) ( HOLDING ?auto_28734 ) ( CLEAR ?auto_28733 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28733 ?auto_28734 )
      ( MAKE-3PILE ?auto_28733 ?auto_28734 ?auto_28735 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28737 - BLOCK
      ?auto_28738 - BLOCK
      ?auto_28739 - BLOCK
    )
    :vars
    (
      ?auto_28740 - BLOCK
      ?auto_28741 - BLOCK
      ?auto_28742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28737 ) ( not ( = ?auto_28737 ?auto_28738 ) ) ( not ( = ?auto_28737 ?auto_28739 ) ) ( not ( = ?auto_28738 ?auto_28739 ) ) ( ON ?auto_28739 ?auto_28740 ) ( not ( = ?auto_28737 ?auto_28740 ) ) ( not ( = ?auto_28738 ?auto_28740 ) ) ( not ( = ?auto_28739 ?auto_28740 ) ) ( CLEAR ?auto_28737 ) ( ON ?auto_28738 ?auto_28739 ) ( CLEAR ?auto_28738 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28741 ) ( ON ?auto_28742 ?auto_28741 ) ( ON ?auto_28740 ?auto_28742 ) ( not ( = ?auto_28741 ?auto_28742 ) ) ( not ( = ?auto_28741 ?auto_28740 ) ) ( not ( = ?auto_28741 ?auto_28739 ) ) ( not ( = ?auto_28741 ?auto_28738 ) ) ( not ( = ?auto_28742 ?auto_28740 ) ) ( not ( = ?auto_28742 ?auto_28739 ) ) ( not ( = ?auto_28742 ?auto_28738 ) ) ( not ( = ?auto_28737 ?auto_28741 ) ) ( not ( = ?auto_28737 ?auto_28742 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28741 ?auto_28742 ?auto_28740 ?auto_28739 )
      ( MAKE-3PILE ?auto_28737 ?auto_28738 ?auto_28739 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28743 - BLOCK
      ?auto_28744 - BLOCK
      ?auto_28745 - BLOCK
    )
    :vars
    (
      ?auto_28748 - BLOCK
      ?auto_28746 - BLOCK
      ?auto_28747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28743 ?auto_28744 ) ) ( not ( = ?auto_28743 ?auto_28745 ) ) ( not ( = ?auto_28744 ?auto_28745 ) ) ( ON ?auto_28745 ?auto_28748 ) ( not ( = ?auto_28743 ?auto_28748 ) ) ( not ( = ?auto_28744 ?auto_28748 ) ) ( not ( = ?auto_28745 ?auto_28748 ) ) ( ON ?auto_28744 ?auto_28745 ) ( CLEAR ?auto_28744 ) ( ON-TABLE ?auto_28746 ) ( ON ?auto_28747 ?auto_28746 ) ( ON ?auto_28748 ?auto_28747 ) ( not ( = ?auto_28746 ?auto_28747 ) ) ( not ( = ?auto_28746 ?auto_28748 ) ) ( not ( = ?auto_28746 ?auto_28745 ) ) ( not ( = ?auto_28746 ?auto_28744 ) ) ( not ( = ?auto_28747 ?auto_28748 ) ) ( not ( = ?auto_28747 ?auto_28745 ) ) ( not ( = ?auto_28747 ?auto_28744 ) ) ( not ( = ?auto_28743 ?auto_28746 ) ) ( not ( = ?auto_28743 ?auto_28747 ) ) ( HOLDING ?auto_28743 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28743 )
      ( MAKE-3PILE ?auto_28743 ?auto_28744 ?auto_28745 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28749 - BLOCK
      ?auto_28750 - BLOCK
      ?auto_28751 - BLOCK
    )
    :vars
    (
      ?auto_28754 - BLOCK
      ?auto_28752 - BLOCK
      ?auto_28753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28749 ?auto_28750 ) ) ( not ( = ?auto_28749 ?auto_28751 ) ) ( not ( = ?auto_28750 ?auto_28751 ) ) ( ON ?auto_28751 ?auto_28754 ) ( not ( = ?auto_28749 ?auto_28754 ) ) ( not ( = ?auto_28750 ?auto_28754 ) ) ( not ( = ?auto_28751 ?auto_28754 ) ) ( ON ?auto_28750 ?auto_28751 ) ( ON-TABLE ?auto_28752 ) ( ON ?auto_28753 ?auto_28752 ) ( ON ?auto_28754 ?auto_28753 ) ( not ( = ?auto_28752 ?auto_28753 ) ) ( not ( = ?auto_28752 ?auto_28754 ) ) ( not ( = ?auto_28752 ?auto_28751 ) ) ( not ( = ?auto_28752 ?auto_28750 ) ) ( not ( = ?auto_28753 ?auto_28754 ) ) ( not ( = ?auto_28753 ?auto_28751 ) ) ( not ( = ?auto_28753 ?auto_28750 ) ) ( not ( = ?auto_28749 ?auto_28752 ) ) ( not ( = ?auto_28749 ?auto_28753 ) ) ( ON ?auto_28749 ?auto_28750 ) ( CLEAR ?auto_28749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28752 ?auto_28753 ?auto_28754 ?auto_28751 ?auto_28750 )
      ( MAKE-3PILE ?auto_28749 ?auto_28750 ?auto_28751 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28757 - BLOCK
      ?auto_28758 - BLOCK
    )
    :vars
    (
      ?auto_28759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28759 ?auto_28758 ) ( CLEAR ?auto_28759 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28757 ) ( ON ?auto_28758 ?auto_28757 ) ( not ( = ?auto_28757 ?auto_28758 ) ) ( not ( = ?auto_28757 ?auto_28759 ) ) ( not ( = ?auto_28758 ?auto_28759 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28759 ?auto_28758 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28760 - BLOCK
      ?auto_28761 - BLOCK
    )
    :vars
    (
      ?auto_28762 - BLOCK
      ?auto_28763 - BLOCK
      ?auto_28764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28762 ?auto_28761 ) ( CLEAR ?auto_28762 ) ( ON-TABLE ?auto_28760 ) ( ON ?auto_28761 ?auto_28760 ) ( not ( = ?auto_28760 ?auto_28761 ) ) ( not ( = ?auto_28760 ?auto_28762 ) ) ( not ( = ?auto_28761 ?auto_28762 ) ) ( HOLDING ?auto_28763 ) ( CLEAR ?auto_28764 ) ( not ( = ?auto_28760 ?auto_28763 ) ) ( not ( = ?auto_28760 ?auto_28764 ) ) ( not ( = ?auto_28761 ?auto_28763 ) ) ( not ( = ?auto_28761 ?auto_28764 ) ) ( not ( = ?auto_28762 ?auto_28763 ) ) ( not ( = ?auto_28762 ?auto_28764 ) ) ( not ( = ?auto_28763 ?auto_28764 ) ) )
    :subtasks
    ( ( !STACK ?auto_28763 ?auto_28764 )
      ( MAKE-2PILE ?auto_28760 ?auto_28761 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28765 - BLOCK
      ?auto_28766 - BLOCK
    )
    :vars
    (
      ?auto_28767 - BLOCK
      ?auto_28768 - BLOCK
      ?auto_28769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28767 ?auto_28766 ) ( ON-TABLE ?auto_28765 ) ( ON ?auto_28766 ?auto_28765 ) ( not ( = ?auto_28765 ?auto_28766 ) ) ( not ( = ?auto_28765 ?auto_28767 ) ) ( not ( = ?auto_28766 ?auto_28767 ) ) ( CLEAR ?auto_28768 ) ( not ( = ?auto_28765 ?auto_28769 ) ) ( not ( = ?auto_28765 ?auto_28768 ) ) ( not ( = ?auto_28766 ?auto_28769 ) ) ( not ( = ?auto_28766 ?auto_28768 ) ) ( not ( = ?auto_28767 ?auto_28769 ) ) ( not ( = ?auto_28767 ?auto_28768 ) ) ( not ( = ?auto_28769 ?auto_28768 ) ) ( ON ?auto_28769 ?auto_28767 ) ( CLEAR ?auto_28769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28765 ?auto_28766 ?auto_28767 )
      ( MAKE-2PILE ?auto_28765 ?auto_28766 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28770 - BLOCK
      ?auto_28771 - BLOCK
    )
    :vars
    (
      ?auto_28773 - BLOCK
      ?auto_28772 - BLOCK
      ?auto_28774 - BLOCK
      ?auto_28775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28773 ?auto_28771 ) ( ON-TABLE ?auto_28770 ) ( ON ?auto_28771 ?auto_28770 ) ( not ( = ?auto_28770 ?auto_28771 ) ) ( not ( = ?auto_28770 ?auto_28773 ) ) ( not ( = ?auto_28771 ?auto_28773 ) ) ( not ( = ?auto_28770 ?auto_28772 ) ) ( not ( = ?auto_28770 ?auto_28774 ) ) ( not ( = ?auto_28771 ?auto_28772 ) ) ( not ( = ?auto_28771 ?auto_28774 ) ) ( not ( = ?auto_28773 ?auto_28772 ) ) ( not ( = ?auto_28773 ?auto_28774 ) ) ( not ( = ?auto_28772 ?auto_28774 ) ) ( ON ?auto_28772 ?auto_28773 ) ( CLEAR ?auto_28772 ) ( HOLDING ?auto_28774 ) ( CLEAR ?auto_28775 ) ( ON-TABLE ?auto_28775 ) ( not ( = ?auto_28775 ?auto_28774 ) ) ( not ( = ?auto_28770 ?auto_28775 ) ) ( not ( = ?auto_28771 ?auto_28775 ) ) ( not ( = ?auto_28773 ?auto_28775 ) ) ( not ( = ?auto_28772 ?auto_28775 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28775 ?auto_28774 )
      ( MAKE-2PILE ?auto_28770 ?auto_28771 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28776 - BLOCK
      ?auto_28777 - BLOCK
    )
    :vars
    (
      ?auto_28779 - BLOCK
      ?auto_28780 - BLOCK
      ?auto_28781 - BLOCK
      ?auto_28778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28779 ?auto_28777 ) ( ON-TABLE ?auto_28776 ) ( ON ?auto_28777 ?auto_28776 ) ( not ( = ?auto_28776 ?auto_28777 ) ) ( not ( = ?auto_28776 ?auto_28779 ) ) ( not ( = ?auto_28777 ?auto_28779 ) ) ( not ( = ?auto_28776 ?auto_28780 ) ) ( not ( = ?auto_28776 ?auto_28781 ) ) ( not ( = ?auto_28777 ?auto_28780 ) ) ( not ( = ?auto_28777 ?auto_28781 ) ) ( not ( = ?auto_28779 ?auto_28780 ) ) ( not ( = ?auto_28779 ?auto_28781 ) ) ( not ( = ?auto_28780 ?auto_28781 ) ) ( ON ?auto_28780 ?auto_28779 ) ( CLEAR ?auto_28778 ) ( ON-TABLE ?auto_28778 ) ( not ( = ?auto_28778 ?auto_28781 ) ) ( not ( = ?auto_28776 ?auto_28778 ) ) ( not ( = ?auto_28777 ?auto_28778 ) ) ( not ( = ?auto_28779 ?auto_28778 ) ) ( not ( = ?auto_28780 ?auto_28778 ) ) ( ON ?auto_28781 ?auto_28780 ) ( CLEAR ?auto_28781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28776 ?auto_28777 ?auto_28779 ?auto_28780 )
      ( MAKE-2PILE ?auto_28776 ?auto_28777 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28782 - BLOCK
      ?auto_28783 - BLOCK
    )
    :vars
    (
      ?auto_28784 - BLOCK
      ?auto_28787 - BLOCK
      ?auto_28785 - BLOCK
      ?auto_28786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28784 ?auto_28783 ) ( ON-TABLE ?auto_28782 ) ( ON ?auto_28783 ?auto_28782 ) ( not ( = ?auto_28782 ?auto_28783 ) ) ( not ( = ?auto_28782 ?auto_28784 ) ) ( not ( = ?auto_28783 ?auto_28784 ) ) ( not ( = ?auto_28782 ?auto_28787 ) ) ( not ( = ?auto_28782 ?auto_28785 ) ) ( not ( = ?auto_28783 ?auto_28787 ) ) ( not ( = ?auto_28783 ?auto_28785 ) ) ( not ( = ?auto_28784 ?auto_28787 ) ) ( not ( = ?auto_28784 ?auto_28785 ) ) ( not ( = ?auto_28787 ?auto_28785 ) ) ( ON ?auto_28787 ?auto_28784 ) ( not ( = ?auto_28786 ?auto_28785 ) ) ( not ( = ?auto_28782 ?auto_28786 ) ) ( not ( = ?auto_28783 ?auto_28786 ) ) ( not ( = ?auto_28784 ?auto_28786 ) ) ( not ( = ?auto_28787 ?auto_28786 ) ) ( ON ?auto_28785 ?auto_28787 ) ( CLEAR ?auto_28785 ) ( HOLDING ?auto_28786 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28786 )
      ( MAKE-2PILE ?auto_28782 ?auto_28783 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28788 - BLOCK
      ?auto_28789 - BLOCK
    )
    :vars
    (
      ?auto_28792 - BLOCK
      ?auto_28791 - BLOCK
      ?auto_28790 - BLOCK
      ?auto_28793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28792 ?auto_28789 ) ( ON-TABLE ?auto_28788 ) ( ON ?auto_28789 ?auto_28788 ) ( not ( = ?auto_28788 ?auto_28789 ) ) ( not ( = ?auto_28788 ?auto_28792 ) ) ( not ( = ?auto_28789 ?auto_28792 ) ) ( not ( = ?auto_28788 ?auto_28791 ) ) ( not ( = ?auto_28788 ?auto_28790 ) ) ( not ( = ?auto_28789 ?auto_28791 ) ) ( not ( = ?auto_28789 ?auto_28790 ) ) ( not ( = ?auto_28792 ?auto_28791 ) ) ( not ( = ?auto_28792 ?auto_28790 ) ) ( not ( = ?auto_28791 ?auto_28790 ) ) ( ON ?auto_28791 ?auto_28792 ) ( not ( = ?auto_28793 ?auto_28790 ) ) ( not ( = ?auto_28788 ?auto_28793 ) ) ( not ( = ?auto_28789 ?auto_28793 ) ) ( not ( = ?auto_28792 ?auto_28793 ) ) ( not ( = ?auto_28791 ?auto_28793 ) ) ( ON ?auto_28790 ?auto_28791 ) ( ON ?auto_28793 ?auto_28790 ) ( CLEAR ?auto_28793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28788 ?auto_28789 ?auto_28792 ?auto_28791 ?auto_28790 )
      ( MAKE-2PILE ?auto_28788 ?auto_28789 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28798 - BLOCK
      ?auto_28799 - BLOCK
      ?auto_28800 - BLOCK
      ?auto_28801 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28801 ) ( CLEAR ?auto_28800 ) ( ON-TABLE ?auto_28798 ) ( ON ?auto_28799 ?auto_28798 ) ( ON ?auto_28800 ?auto_28799 ) ( not ( = ?auto_28798 ?auto_28799 ) ) ( not ( = ?auto_28798 ?auto_28800 ) ) ( not ( = ?auto_28798 ?auto_28801 ) ) ( not ( = ?auto_28799 ?auto_28800 ) ) ( not ( = ?auto_28799 ?auto_28801 ) ) ( not ( = ?auto_28800 ?auto_28801 ) ) )
    :subtasks
    ( ( !STACK ?auto_28801 ?auto_28800 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28802 - BLOCK
      ?auto_28803 - BLOCK
      ?auto_28804 - BLOCK
      ?auto_28805 - BLOCK
    )
    :vars
    (
      ?auto_28806 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28804 ) ( ON-TABLE ?auto_28802 ) ( ON ?auto_28803 ?auto_28802 ) ( ON ?auto_28804 ?auto_28803 ) ( not ( = ?auto_28802 ?auto_28803 ) ) ( not ( = ?auto_28802 ?auto_28804 ) ) ( not ( = ?auto_28802 ?auto_28805 ) ) ( not ( = ?auto_28803 ?auto_28804 ) ) ( not ( = ?auto_28803 ?auto_28805 ) ) ( not ( = ?auto_28804 ?auto_28805 ) ) ( ON ?auto_28805 ?auto_28806 ) ( CLEAR ?auto_28805 ) ( HAND-EMPTY ) ( not ( = ?auto_28802 ?auto_28806 ) ) ( not ( = ?auto_28803 ?auto_28806 ) ) ( not ( = ?auto_28804 ?auto_28806 ) ) ( not ( = ?auto_28805 ?auto_28806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28805 ?auto_28806 )
      ( MAKE-4PILE ?auto_28802 ?auto_28803 ?auto_28804 ?auto_28805 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28807 - BLOCK
      ?auto_28808 - BLOCK
      ?auto_28809 - BLOCK
      ?auto_28810 - BLOCK
    )
    :vars
    (
      ?auto_28811 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28807 ) ( ON ?auto_28808 ?auto_28807 ) ( not ( = ?auto_28807 ?auto_28808 ) ) ( not ( = ?auto_28807 ?auto_28809 ) ) ( not ( = ?auto_28807 ?auto_28810 ) ) ( not ( = ?auto_28808 ?auto_28809 ) ) ( not ( = ?auto_28808 ?auto_28810 ) ) ( not ( = ?auto_28809 ?auto_28810 ) ) ( ON ?auto_28810 ?auto_28811 ) ( CLEAR ?auto_28810 ) ( not ( = ?auto_28807 ?auto_28811 ) ) ( not ( = ?auto_28808 ?auto_28811 ) ) ( not ( = ?auto_28809 ?auto_28811 ) ) ( not ( = ?auto_28810 ?auto_28811 ) ) ( HOLDING ?auto_28809 ) ( CLEAR ?auto_28808 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28807 ?auto_28808 ?auto_28809 )
      ( MAKE-4PILE ?auto_28807 ?auto_28808 ?auto_28809 ?auto_28810 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28812 - BLOCK
      ?auto_28813 - BLOCK
      ?auto_28814 - BLOCK
      ?auto_28815 - BLOCK
    )
    :vars
    (
      ?auto_28816 - BLOCK
      ?auto_28817 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28812 ) ( ON ?auto_28813 ?auto_28812 ) ( not ( = ?auto_28812 ?auto_28813 ) ) ( not ( = ?auto_28812 ?auto_28814 ) ) ( not ( = ?auto_28812 ?auto_28815 ) ) ( not ( = ?auto_28813 ?auto_28814 ) ) ( not ( = ?auto_28813 ?auto_28815 ) ) ( not ( = ?auto_28814 ?auto_28815 ) ) ( ON ?auto_28815 ?auto_28816 ) ( not ( = ?auto_28812 ?auto_28816 ) ) ( not ( = ?auto_28813 ?auto_28816 ) ) ( not ( = ?auto_28814 ?auto_28816 ) ) ( not ( = ?auto_28815 ?auto_28816 ) ) ( CLEAR ?auto_28813 ) ( ON ?auto_28814 ?auto_28815 ) ( CLEAR ?auto_28814 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28817 ) ( ON ?auto_28816 ?auto_28817 ) ( not ( = ?auto_28817 ?auto_28816 ) ) ( not ( = ?auto_28817 ?auto_28815 ) ) ( not ( = ?auto_28817 ?auto_28814 ) ) ( not ( = ?auto_28812 ?auto_28817 ) ) ( not ( = ?auto_28813 ?auto_28817 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28817 ?auto_28816 ?auto_28815 )
      ( MAKE-4PILE ?auto_28812 ?auto_28813 ?auto_28814 ?auto_28815 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28818 - BLOCK
      ?auto_28819 - BLOCK
      ?auto_28820 - BLOCK
      ?auto_28821 - BLOCK
    )
    :vars
    (
      ?auto_28823 - BLOCK
      ?auto_28822 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28818 ) ( not ( = ?auto_28818 ?auto_28819 ) ) ( not ( = ?auto_28818 ?auto_28820 ) ) ( not ( = ?auto_28818 ?auto_28821 ) ) ( not ( = ?auto_28819 ?auto_28820 ) ) ( not ( = ?auto_28819 ?auto_28821 ) ) ( not ( = ?auto_28820 ?auto_28821 ) ) ( ON ?auto_28821 ?auto_28823 ) ( not ( = ?auto_28818 ?auto_28823 ) ) ( not ( = ?auto_28819 ?auto_28823 ) ) ( not ( = ?auto_28820 ?auto_28823 ) ) ( not ( = ?auto_28821 ?auto_28823 ) ) ( ON ?auto_28820 ?auto_28821 ) ( CLEAR ?auto_28820 ) ( ON-TABLE ?auto_28822 ) ( ON ?auto_28823 ?auto_28822 ) ( not ( = ?auto_28822 ?auto_28823 ) ) ( not ( = ?auto_28822 ?auto_28821 ) ) ( not ( = ?auto_28822 ?auto_28820 ) ) ( not ( = ?auto_28818 ?auto_28822 ) ) ( not ( = ?auto_28819 ?auto_28822 ) ) ( HOLDING ?auto_28819 ) ( CLEAR ?auto_28818 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28818 ?auto_28819 )
      ( MAKE-4PILE ?auto_28818 ?auto_28819 ?auto_28820 ?auto_28821 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28824 - BLOCK
      ?auto_28825 - BLOCK
      ?auto_28826 - BLOCK
      ?auto_28827 - BLOCK
    )
    :vars
    (
      ?auto_28829 - BLOCK
      ?auto_28828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28824 ) ( not ( = ?auto_28824 ?auto_28825 ) ) ( not ( = ?auto_28824 ?auto_28826 ) ) ( not ( = ?auto_28824 ?auto_28827 ) ) ( not ( = ?auto_28825 ?auto_28826 ) ) ( not ( = ?auto_28825 ?auto_28827 ) ) ( not ( = ?auto_28826 ?auto_28827 ) ) ( ON ?auto_28827 ?auto_28829 ) ( not ( = ?auto_28824 ?auto_28829 ) ) ( not ( = ?auto_28825 ?auto_28829 ) ) ( not ( = ?auto_28826 ?auto_28829 ) ) ( not ( = ?auto_28827 ?auto_28829 ) ) ( ON ?auto_28826 ?auto_28827 ) ( ON-TABLE ?auto_28828 ) ( ON ?auto_28829 ?auto_28828 ) ( not ( = ?auto_28828 ?auto_28829 ) ) ( not ( = ?auto_28828 ?auto_28827 ) ) ( not ( = ?auto_28828 ?auto_28826 ) ) ( not ( = ?auto_28824 ?auto_28828 ) ) ( not ( = ?auto_28825 ?auto_28828 ) ) ( CLEAR ?auto_28824 ) ( ON ?auto_28825 ?auto_28826 ) ( CLEAR ?auto_28825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28828 ?auto_28829 ?auto_28827 ?auto_28826 )
      ( MAKE-4PILE ?auto_28824 ?auto_28825 ?auto_28826 ?auto_28827 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28830 - BLOCK
      ?auto_28831 - BLOCK
      ?auto_28832 - BLOCK
      ?auto_28833 - BLOCK
    )
    :vars
    (
      ?auto_28834 - BLOCK
      ?auto_28835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28830 ?auto_28831 ) ) ( not ( = ?auto_28830 ?auto_28832 ) ) ( not ( = ?auto_28830 ?auto_28833 ) ) ( not ( = ?auto_28831 ?auto_28832 ) ) ( not ( = ?auto_28831 ?auto_28833 ) ) ( not ( = ?auto_28832 ?auto_28833 ) ) ( ON ?auto_28833 ?auto_28834 ) ( not ( = ?auto_28830 ?auto_28834 ) ) ( not ( = ?auto_28831 ?auto_28834 ) ) ( not ( = ?auto_28832 ?auto_28834 ) ) ( not ( = ?auto_28833 ?auto_28834 ) ) ( ON ?auto_28832 ?auto_28833 ) ( ON-TABLE ?auto_28835 ) ( ON ?auto_28834 ?auto_28835 ) ( not ( = ?auto_28835 ?auto_28834 ) ) ( not ( = ?auto_28835 ?auto_28833 ) ) ( not ( = ?auto_28835 ?auto_28832 ) ) ( not ( = ?auto_28830 ?auto_28835 ) ) ( not ( = ?auto_28831 ?auto_28835 ) ) ( ON ?auto_28831 ?auto_28832 ) ( CLEAR ?auto_28831 ) ( HOLDING ?auto_28830 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28830 )
      ( MAKE-4PILE ?auto_28830 ?auto_28831 ?auto_28832 ?auto_28833 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28836 - BLOCK
      ?auto_28837 - BLOCK
      ?auto_28838 - BLOCK
      ?auto_28839 - BLOCK
    )
    :vars
    (
      ?auto_28841 - BLOCK
      ?auto_28840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28836 ?auto_28837 ) ) ( not ( = ?auto_28836 ?auto_28838 ) ) ( not ( = ?auto_28836 ?auto_28839 ) ) ( not ( = ?auto_28837 ?auto_28838 ) ) ( not ( = ?auto_28837 ?auto_28839 ) ) ( not ( = ?auto_28838 ?auto_28839 ) ) ( ON ?auto_28839 ?auto_28841 ) ( not ( = ?auto_28836 ?auto_28841 ) ) ( not ( = ?auto_28837 ?auto_28841 ) ) ( not ( = ?auto_28838 ?auto_28841 ) ) ( not ( = ?auto_28839 ?auto_28841 ) ) ( ON ?auto_28838 ?auto_28839 ) ( ON-TABLE ?auto_28840 ) ( ON ?auto_28841 ?auto_28840 ) ( not ( = ?auto_28840 ?auto_28841 ) ) ( not ( = ?auto_28840 ?auto_28839 ) ) ( not ( = ?auto_28840 ?auto_28838 ) ) ( not ( = ?auto_28836 ?auto_28840 ) ) ( not ( = ?auto_28837 ?auto_28840 ) ) ( ON ?auto_28837 ?auto_28838 ) ( ON ?auto_28836 ?auto_28837 ) ( CLEAR ?auto_28836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28840 ?auto_28841 ?auto_28839 ?auto_28838 ?auto_28837 )
      ( MAKE-4PILE ?auto_28836 ?auto_28837 ?auto_28838 ?auto_28839 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28843 - BLOCK
    )
    :vars
    (
      ?auto_28844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28844 ?auto_28843 ) ( CLEAR ?auto_28844 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28843 ) ( not ( = ?auto_28843 ?auto_28844 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28844 ?auto_28843 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28845 - BLOCK
    )
    :vars
    (
      ?auto_28846 - BLOCK
      ?auto_28847 - BLOCK
      ?auto_28848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28846 ?auto_28845 ) ( CLEAR ?auto_28846 ) ( ON-TABLE ?auto_28845 ) ( not ( = ?auto_28845 ?auto_28846 ) ) ( HOLDING ?auto_28847 ) ( CLEAR ?auto_28848 ) ( not ( = ?auto_28845 ?auto_28847 ) ) ( not ( = ?auto_28845 ?auto_28848 ) ) ( not ( = ?auto_28846 ?auto_28847 ) ) ( not ( = ?auto_28846 ?auto_28848 ) ) ( not ( = ?auto_28847 ?auto_28848 ) ) )
    :subtasks
    ( ( !STACK ?auto_28847 ?auto_28848 )
      ( MAKE-1PILE ?auto_28845 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28849 - BLOCK
    )
    :vars
    (
      ?auto_28852 - BLOCK
      ?auto_28850 - BLOCK
      ?auto_28851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28852 ?auto_28849 ) ( ON-TABLE ?auto_28849 ) ( not ( = ?auto_28849 ?auto_28852 ) ) ( CLEAR ?auto_28850 ) ( not ( = ?auto_28849 ?auto_28851 ) ) ( not ( = ?auto_28849 ?auto_28850 ) ) ( not ( = ?auto_28852 ?auto_28851 ) ) ( not ( = ?auto_28852 ?auto_28850 ) ) ( not ( = ?auto_28851 ?auto_28850 ) ) ( ON ?auto_28851 ?auto_28852 ) ( CLEAR ?auto_28851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28849 ?auto_28852 )
      ( MAKE-1PILE ?auto_28849 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28853 - BLOCK
    )
    :vars
    (
      ?auto_28854 - BLOCK
      ?auto_28855 - BLOCK
      ?auto_28856 - BLOCK
      ?auto_28858 - BLOCK
      ?auto_28857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28854 ?auto_28853 ) ( ON-TABLE ?auto_28853 ) ( not ( = ?auto_28853 ?auto_28854 ) ) ( not ( = ?auto_28853 ?auto_28855 ) ) ( not ( = ?auto_28853 ?auto_28856 ) ) ( not ( = ?auto_28854 ?auto_28855 ) ) ( not ( = ?auto_28854 ?auto_28856 ) ) ( not ( = ?auto_28855 ?auto_28856 ) ) ( ON ?auto_28855 ?auto_28854 ) ( CLEAR ?auto_28855 ) ( HOLDING ?auto_28856 ) ( CLEAR ?auto_28858 ) ( ON-TABLE ?auto_28857 ) ( ON ?auto_28858 ?auto_28857 ) ( not ( = ?auto_28857 ?auto_28858 ) ) ( not ( = ?auto_28857 ?auto_28856 ) ) ( not ( = ?auto_28858 ?auto_28856 ) ) ( not ( = ?auto_28853 ?auto_28858 ) ) ( not ( = ?auto_28853 ?auto_28857 ) ) ( not ( = ?auto_28854 ?auto_28858 ) ) ( not ( = ?auto_28854 ?auto_28857 ) ) ( not ( = ?auto_28855 ?auto_28858 ) ) ( not ( = ?auto_28855 ?auto_28857 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28857 ?auto_28858 ?auto_28856 )
      ( MAKE-1PILE ?auto_28853 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28859 - BLOCK
    )
    :vars
    (
      ?auto_28864 - BLOCK
      ?auto_28863 - BLOCK
      ?auto_28861 - BLOCK
      ?auto_28860 - BLOCK
      ?auto_28862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28864 ?auto_28859 ) ( ON-TABLE ?auto_28859 ) ( not ( = ?auto_28859 ?auto_28864 ) ) ( not ( = ?auto_28859 ?auto_28863 ) ) ( not ( = ?auto_28859 ?auto_28861 ) ) ( not ( = ?auto_28864 ?auto_28863 ) ) ( not ( = ?auto_28864 ?auto_28861 ) ) ( not ( = ?auto_28863 ?auto_28861 ) ) ( ON ?auto_28863 ?auto_28864 ) ( CLEAR ?auto_28860 ) ( ON-TABLE ?auto_28862 ) ( ON ?auto_28860 ?auto_28862 ) ( not ( = ?auto_28862 ?auto_28860 ) ) ( not ( = ?auto_28862 ?auto_28861 ) ) ( not ( = ?auto_28860 ?auto_28861 ) ) ( not ( = ?auto_28859 ?auto_28860 ) ) ( not ( = ?auto_28859 ?auto_28862 ) ) ( not ( = ?auto_28864 ?auto_28860 ) ) ( not ( = ?auto_28864 ?auto_28862 ) ) ( not ( = ?auto_28863 ?auto_28860 ) ) ( not ( = ?auto_28863 ?auto_28862 ) ) ( ON ?auto_28861 ?auto_28863 ) ( CLEAR ?auto_28861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28859 ?auto_28864 ?auto_28863 )
      ( MAKE-1PILE ?auto_28859 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28865 - BLOCK
    )
    :vars
    (
      ?auto_28869 - BLOCK
      ?auto_28866 - BLOCK
      ?auto_28868 - BLOCK
      ?auto_28870 - BLOCK
      ?auto_28867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28869 ?auto_28865 ) ( ON-TABLE ?auto_28865 ) ( not ( = ?auto_28865 ?auto_28869 ) ) ( not ( = ?auto_28865 ?auto_28866 ) ) ( not ( = ?auto_28865 ?auto_28868 ) ) ( not ( = ?auto_28869 ?auto_28866 ) ) ( not ( = ?auto_28869 ?auto_28868 ) ) ( not ( = ?auto_28866 ?auto_28868 ) ) ( ON ?auto_28866 ?auto_28869 ) ( ON-TABLE ?auto_28870 ) ( not ( = ?auto_28870 ?auto_28867 ) ) ( not ( = ?auto_28870 ?auto_28868 ) ) ( not ( = ?auto_28867 ?auto_28868 ) ) ( not ( = ?auto_28865 ?auto_28867 ) ) ( not ( = ?auto_28865 ?auto_28870 ) ) ( not ( = ?auto_28869 ?auto_28867 ) ) ( not ( = ?auto_28869 ?auto_28870 ) ) ( not ( = ?auto_28866 ?auto_28867 ) ) ( not ( = ?auto_28866 ?auto_28870 ) ) ( ON ?auto_28868 ?auto_28866 ) ( CLEAR ?auto_28868 ) ( HOLDING ?auto_28867 ) ( CLEAR ?auto_28870 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28870 ?auto_28867 )
      ( MAKE-1PILE ?auto_28865 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28871 - BLOCK
    )
    :vars
    (
      ?auto_28873 - BLOCK
      ?auto_28872 - BLOCK
      ?auto_28875 - BLOCK
      ?auto_28874 - BLOCK
      ?auto_28876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28873 ?auto_28871 ) ( ON-TABLE ?auto_28871 ) ( not ( = ?auto_28871 ?auto_28873 ) ) ( not ( = ?auto_28871 ?auto_28872 ) ) ( not ( = ?auto_28871 ?auto_28875 ) ) ( not ( = ?auto_28873 ?auto_28872 ) ) ( not ( = ?auto_28873 ?auto_28875 ) ) ( not ( = ?auto_28872 ?auto_28875 ) ) ( ON ?auto_28872 ?auto_28873 ) ( ON-TABLE ?auto_28874 ) ( not ( = ?auto_28874 ?auto_28876 ) ) ( not ( = ?auto_28874 ?auto_28875 ) ) ( not ( = ?auto_28876 ?auto_28875 ) ) ( not ( = ?auto_28871 ?auto_28876 ) ) ( not ( = ?auto_28871 ?auto_28874 ) ) ( not ( = ?auto_28873 ?auto_28876 ) ) ( not ( = ?auto_28873 ?auto_28874 ) ) ( not ( = ?auto_28872 ?auto_28876 ) ) ( not ( = ?auto_28872 ?auto_28874 ) ) ( ON ?auto_28875 ?auto_28872 ) ( CLEAR ?auto_28874 ) ( ON ?auto_28876 ?auto_28875 ) ( CLEAR ?auto_28876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28871 ?auto_28873 ?auto_28872 ?auto_28875 )
      ( MAKE-1PILE ?auto_28871 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28877 - BLOCK
    )
    :vars
    (
      ?auto_28880 - BLOCK
      ?auto_28879 - BLOCK
      ?auto_28882 - BLOCK
      ?auto_28881 - BLOCK
      ?auto_28878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28880 ?auto_28877 ) ( ON-TABLE ?auto_28877 ) ( not ( = ?auto_28877 ?auto_28880 ) ) ( not ( = ?auto_28877 ?auto_28879 ) ) ( not ( = ?auto_28877 ?auto_28882 ) ) ( not ( = ?auto_28880 ?auto_28879 ) ) ( not ( = ?auto_28880 ?auto_28882 ) ) ( not ( = ?auto_28879 ?auto_28882 ) ) ( ON ?auto_28879 ?auto_28880 ) ( not ( = ?auto_28881 ?auto_28878 ) ) ( not ( = ?auto_28881 ?auto_28882 ) ) ( not ( = ?auto_28878 ?auto_28882 ) ) ( not ( = ?auto_28877 ?auto_28878 ) ) ( not ( = ?auto_28877 ?auto_28881 ) ) ( not ( = ?auto_28880 ?auto_28878 ) ) ( not ( = ?auto_28880 ?auto_28881 ) ) ( not ( = ?auto_28879 ?auto_28878 ) ) ( not ( = ?auto_28879 ?auto_28881 ) ) ( ON ?auto_28882 ?auto_28879 ) ( ON ?auto_28878 ?auto_28882 ) ( CLEAR ?auto_28878 ) ( HOLDING ?auto_28881 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28881 )
      ( MAKE-1PILE ?auto_28877 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28883 - BLOCK
    )
    :vars
    (
      ?auto_28884 - BLOCK
      ?auto_28888 - BLOCK
      ?auto_28885 - BLOCK
      ?auto_28887 - BLOCK
      ?auto_28886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28884 ?auto_28883 ) ( ON-TABLE ?auto_28883 ) ( not ( = ?auto_28883 ?auto_28884 ) ) ( not ( = ?auto_28883 ?auto_28888 ) ) ( not ( = ?auto_28883 ?auto_28885 ) ) ( not ( = ?auto_28884 ?auto_28888 ) ) ( not ( = ?auto_28884 ?auto_28885 ) ) ( not ( = ?auto_28888 ?auto_28885 ) ) ( ON ?auto_28888 ?auto_28884 ) ( not ( = ?auto_28887 ?auto_28886 ) ) ( not ( = ?auto_28887 ?auto_28885 ) ) ( not ( = ?auto_28886 ?auto_28885 ) ) ( not ( = ?auto_28883 ?auto_28886 ) ) ( not ( = ?auto_28883 ?auto_28887 ) ) ( not ( = ?auto_28884 ?auto_28886 ) ) ( not ( = ?auto_28884 ?auto_28887 ) ) ( not ( = ?auto_28888 ?auto_28886 ) ) ( not ( = ?auto_28888 ?auto_28887 ) ) ( ON ?auto_28885 ?auto_28888 ) ( ON ?auto_28886 ?auto_28885 ) ( ON ?auto_28887 ?auto_28886 ) ( CLEAR ?auto_28887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28883 ?auto_28884 ?auto_28888 ?auto_28885 ?auto_28886 )
      ( MAKE-1PILE ?auto_28883 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28894 - BLOCK
      ?auto_28895 - BLOCK
      ?auto_28896 - BLOCK
      ?auto_28897 - BLOCK
      ?auto_28898 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28898 ) ( CLEAR ?auto_28897 ) ( ON-TABLE ?auto_28894 ) ( ON ?auto_28895 ?auto_28894 ) ( ON ?auto_28896 ?auto_28895 ) ( ON ?auto_28897 ?auto_28896 ) ( not ( = ?auto_28894 ?auto_28895 ) ) ( not ( = ?auto_28894 ?auto_28896 ) ) ( not ( = ?auto_28894 ?auto_28897 ) ) ( not ( = ?auto_28894 ?auto_28898 ) ) ( not ( = ?auto_28895 ?auto_28896 ) ) ( not ( = ?auto_28895 ?auto_28897 ) ) ( not ( = ?auto_28895 ?auto_28898 ) ) ( not ( = ?auto_28896 ?auto_28897 ) ) ( not ( = ?auto_28896 ?auto_28898 ) ) ( not ( = ?auto_28897 ?auto_28898 ) ) )
    :subtasks
    ( ( !STACK ?auto_28898 ?auto_28897 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28899 - BLOCK
      ?auto_28900 - BLOCK
      ?auto_28901 - BLOCK
      ?auto_28902 - BLOCK
      ?auto_28903 - BLOCK
    )
    :vars
    (
      ?auto_28904 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28902 ) ( ON-TABLE ?auto_28899 ) ( ON ?auto_28900 ?auto_28899 ) ( ON ?auto_28901 ?auto_28900 ) ( ON ?auto_28902 ?auto_28901 ) ( not ( = ?auto_28899 ?auto_28900 ) ) ( not ( = ?auto_28899 ?auto_28901 ) ) ( not ( = ?auto_28899 ?auto_28902 ) ) ( not ( = ?auto_28899 ?auto_28903 ) ) ( not ( = ?auto_28900 ?auto_28901 ) ) ( not ( = ?auto_28900 ?auto_28902 ) ) ( not ( = ?auto_28900 ?auto_28903 ) ) ( not ( = ?auto_28901 ?auto_28902 ) ) ( not ( = ?auto_28901 ?auto_28903 ) ) ( not ( = ?auto_28902 ?auto_28903 ) ) ( ON ?auto_28903 ?auto_28904 ) ( CLEAR ?auto_28903 ) ( HAND-EMPTY ) ( not ( = ?auto_28899 ?auto_28904 ) ) ( not ( = ?auto_28900 ?auto_28904 ) ) ( not ( = ?auto_28901 ?auto_28904 ) ) ( not ( = ?auto_28902 ?auto_28904 ) ) ( not ( = ?auto_28903 ?auto_28904 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28903 ?auto_28904 )
      ( MAKE-5PILE ?auto_28899 ?auto_28900 ?auto_28901 ?auto_28902 ?auto_28903 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28905 - BLOCK
      ?auto_28906 - BLOCK
      ?auto_28907 - BLOCK
      ?auto_28908 - BLOCK
      ?auto_28909 - BLOCK
    )
    :vars
    (
      ?auto_28910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28905 ) ( ON ?auto_28906 ?auto_28905 ) ( ON ?auto_28907 ?auto_28906 ) ( not ( = ?auto_28905 ?auto_28906 ) ) ( not ( = ?auto_28905 ?auto_28907 ) ) ( not ( = ?auto_28905 ?auto_28908 ) ) ( not ( = ?auto_28905 ?auto_28909 ) ) ( not ( = ?auto_28906 ?auto_28907 ) ) ( not ( = ?auto_28906 ?auto_28908 ) ) ( not ( = ?auto_28906 ?auto_28909 ) ) ( not ( = ?auto_28907 ?auto_28908 ) ) ( not ( = ?auto_28907 ?auto_28909 ) ) ( not ( = ?auto_28908 ?auto_28909 ) ) ( ON ?auto_28909 ?auto_28910 ) ( CLEAR ?auto_28909 ) ( not ( = ?auto_28905 ?auto_28910 ) ) ( not ( = ?auto_28906 ?auto_28910 ) ) ( not ( = ?auto_28907 ?auto_28910 ) ) ( not ( = ?auto_28908 ?auto_28910 ) ) ( not ( = ?auto_28909 ?auto_28910 ) ) ( HOLDING ?auto_28908 ) ( CLEAR ?auto_28907 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28905 ?auto_28906 ?auto_28907 ?auto_28908 )
      ( MAKE-5PILE ?auto_28905 ?auto_28906 ?auto_28907 ?auto_28908 ?auto_28909 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28911 - BLOCK
      ?auto_28912 - BLOCK
      ?auto_28913 - BLOCK
      ?auto_28914 - BLOCK
      ?auto_28915 - BLOCK
    )
    :vars
    (
      ?auto_28916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28911 ) ( ON ?auto_28912 ?auto_28911 ) ( ON ?auto_28913 ?auto_28912 ) ( not ( = ?auto_28911 ?auto_28912 ) ) ( not ( = ?auto_28911 ?auto_28913 ) ) ( not ( = ?auto_28911 ?auto_28914 ) ) ( not ( = ?auto_28911 ?auto_28915 ) ) ( not ( = ?auto_28912 ?auto_28913 ) ) ( not ( = ?auto_28912 ?auto_28914 ) ) ( not ( = ?auto_28912 ?auto_28915 ) ) ( not ( = ?auto_28913 ?auto_28914 ) ) ( not ( = ?auto_28913 ?auto_28915 ) ) ( not ( = ?auto_28914 ?auto_28915 ) ) ( ON ?auto_28915 ?auto_28916 ) ( not ( = ?auto_28911 ?auto_28916 ) ) ( not ( = ?auto_28912 ?auto_28916 ) ) ( not ( = ?auto_28913 ?auto_28916 ) ) ( not ( = ?auto_28914 ?auto_28916 ) ) ( not ( = ?auto_28915 ?auto_28916 ) ) ( CLEAR ?auto_28913 ) ( ON ?auto_28914 ?auto_28915 ) ( CLEAR ?auto_28914 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28916 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28916 ?auto_28915 )
      ( MAKE-5PILE ?auto_28911 ?auto_28912 ?auto_28913 ?auto_28914 ?auto_28915 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28917 - BLOCK
      ?auto_28918 - BLOCK
      ?auto_28919 - BLOCK
      ?auto_28920 - BLOCK
      ?auto_28921 - BLOCK
    )
    :vars
    (
      ?auto_28922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28917 ) ( ON ?auto_28918 ?auto_28917 ) ( not ( = ?auto_28917 ?auto_28918 ) ) ( not ( = ?auto_28917 ?auto_28919 ) ) ( not ( = ?auto_28917 ?auto_28920 ) ) ( not ( = ?auto_28917 ?auto_28921 ) ) ( not ( = ?auto_28918 ?auto_28919 ) ) ( not ( = ?auto_28918 ?auto_28920 ) ) ( not ( = ?auto_28918 ?auto_28921 ) ) ( not ( = ?auto_28919 ?auto_28920 ) ) ( not ( = ?auto_28919 ?auto_28921 ) ) ( not ( = ?auto_28920 ?auto_28921 ) ) ( ON ?auto_28921 ?auto_28922 ) ( not ( = ?auto_28917 ?auto_28922 ) ) ( not ( = ?auto_28918 ?auto_28922 ) ) ( not ( = ?auto_28919 ?auto_28922 ) ) ( not ( = ?auto_28920 ?auto_28922 ) ) ( not ( = ?auto_28921 ?auto_28922 ) ) ( ON ?auto_28920 ?auto_28921 ) ( CLEAR ?auto_28920 ) ( ON-TABLE ?auto_28922 ) ( HOLDING ?auto_28919 ) ( CLEAR ?auto_28918 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28917 ?auto_28918 ?auto_28919 )
      ( MAKE-5PILE ?auto_28917 ?auto_28918 ?auto_28919 ?auto_28920 ?auto_28921 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28923 - BLOCK
      ?auto_28924 - BLOCK
      ?auto_28925 - BLOCK
      ?auto_28926 - BLOCK
      ?auto_28927 - BLOCK
    )
    :vars
    (
      ?auto_28928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28923 ) ( ON ?auto_28924 ?auto_28923 ) ( not ( = ?auto_28923 ?auto_28924 ) ) ( not ( = ?auto_28923 ?auto_28925 ) ) ( not ( = ?auto_28923 ?auto_28926 ) ) ( not ( = ?auto_28923 ?auto_28927 ) ) ( not ( = ?auto_28924 ?auto_28925 ) ) ( not ( = ?auto_28924 ?auto_28926 ) ) ( not ( = ?auto_28924 ?auto_28927 ) ) ( not ( = ?auto_28925 ?auto_28926 ) ) ( not ( = ?auto_28925 ?auto_28927 ) ) ( not ( = ?auto_28926 ?auto_28927 ) ) ( ON ?auto_28927 ?auto_28928 ) ( not ( = ?auto_28923 ?auto_28928 ) ) ( not ( = ?auto_28924 ?auto_28928 ) ) ( not ( = ?auto_28925 ?auto_28928 ) ) ( not ( = ?auto_28926 ?auto_28928 ) ) ( not ( = ?auto_28927 ?auto_28928 ) ) ( ON ?auto_28926 ?auto_28927 ) ( ON-TABLE ?auto_28928 ) ( CLEAR ?auto_28924 ) ( ON ?auto_28925 ?auto_28926 ) ( CLEAR ?auto_28925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28928 ?auto_28927 ?auto_28926 )
      ( MAKE-5PILE ?auto_28923 ?auto_28924 ?auto_28925 ?auto_28926 ?auto_28927 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28929 - BLOCK
      ?auto_28930 - BLOCK
      ?auto_28931 - BLOCK
      ?auto_28932 - BLOCK
      ?auto_28933 - BLOCK
    )
    :vars
    (
      ?auto_28934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28929 ) ( not ( = ?auto_28929 ?auto_28930 ) ) ( not ( = ?auto_28929 ?auto_28931 ) ) ( not ( = ?auto_28929 ?auto_28932 ) ) ( not ( = ?auto_28929 ?auto_28933 ) ) ( not ( = ?auto_28930 ?auto_28931 ) ) ( not ( = ?auto_28930 ?auto_28932 ) ) ( not ( = ?auto_28930 ?auto_28933 ) ) ( not ( = ?auto_28931 ?auto_28932 ) ) ( not ( = ?auto_28931 ?auto_28933 ) ) ( not ( = ?auto_28932 ?auto_28933 ) ) ( ON ?auto_28933 ?auto_28934 ) ( not ( = ?auto_28929 ?auto_28934 ) ) ( not ( = ?auto_28930 ?auto_28934 ) ) ( not ( = ?auto_28931 ?auto_28934 ) ) ( not ( = ?auto_28932 ?auto_28934 ) ) ( not ( = ?auto_28933 ?auto_28934 ) ) ( ON ?auto_28932 ?auto_28933 ) ( ON-TABLE ?auto_28934 ) ( ON ?auto_28931 ?auto_28932 ) ( CLEAR ?auto_28931 ) ( HOLDING ?auto_28930 ) ( CLEAR ?auto_28929 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28929 ?auto_28930 )
      ( MAKE-5PILE ?auto_28929 ?auto_28930 ?auto_28931 ?auto_28932 ?auto_28933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28935 - BLOCK
      ?auto_28936 - BLOCK
      ?auto_28937 - BLOCK
      ?auto_28938 - BLOCK
      ?auto_28939 - BLOCK
    )
    :vars
    (
      ?auto_28940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28935 ) ( not ( = ?auto_28935 ?auto_28936 ) ) ( not ( = ?auto_28935 ?auto_28937 ) ) ( not ( = ?auto_28935 ?auto_28938 ) ) ( not ( = ?auto_28935 ?auto_28939 ) ) ( not ( = ?auto_28936 ?auto_28937 ) ) ( not ( = ?auto_28936 ?auto_28938 ) ) ( not ( = ?auto_28936 ?auto_28939 ) ) ( not ( = ?auto_28937 ?auto_28938 ) ) ( not ( = ?auto_28937 ?auto_28939 ) ) ( not ( = ?auto_28938 ?auto_28939 ) ) ( ON ?auto_28939 ?auto_28940 ) ( not ( = ?auto_28935 ?auto_28940 ) ) ( not ( = ?auto_28936 ?auto_28940 ) ) ( not ( = ?auto_28937 ?auto_28940 ) ) ( not ( = ?auto_28938 ?auto_28940 ) ) ( not ( = ?auto_28939 ?auto_28940 ) ) ( ON ?auto_28938 ?auto_28939 ) ( ON-TABLE ?auto_28940 ) ( ON ?auto_28937 ?auto_28938 ) ( CLEAR ?auto_28935 ) ( ON ?auto_28936 ?auto_28937 ) ( CLEAR ?auto_28936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28940 ?auto_28939 ?auto_28938 ?auto_28937 )
      ( MAKE-5PILE ?auto_28935 ?auto_28936 ?auto_28937 ?auto_28938 ?auto_28939 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28941 - BLOCK
      ?auto_28942 - BLOCK
      ?auto_28943 - BLOCK
      ?auto_28944 - BLOCK
      ?auto_28945 - BLOCK
    )
    :vars
    (
      ?auto_28946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28941 ?auto_28942 ) ) ( not ( = ?auto_28941 ?auto_28943 ) ) ( not ( = ?auto_28941 ?auto_28944 ) ) ( not ( = ?auto_28941 ?auto_28945 ) ) ( not ( = ?auto_28942 ?auto_28943 ) ) ( not ( = ?auto_28942 ?auto_28944 ) ) ( not ( = ?auto_28942 ?auto_28945 ) ) ( not ( = ?auto_28943 ?auto_28944 ) ) ( not ( = ?auto_28943 ?auto_28945 ) ) ( not ( = ?auto_28944 ?auto_28945 ) ) ( ON ?auto_28945 ?auto_28946 ) ( not ( = ?auto_28941 ?auto_28946 ) ) ( not ( = ?auto_28942 ?auto_28946 ) ) ( not ( = ?auto_28943 ?auto_28946 ) ) ( not ( = ?auto_28944 ?auto_28946 ) ) ( not ( = ?auto_28945 ?auto_28946 ) ) ( ON ?auto_28944 ?auto_28945 ) ( ON-TABLE ?auto_28946 ) ( ON ?auto_28943 ?auto_28944 ) ( ON ?auto_28942 ?auto_28943 ) ( CLEAR ?auto_28942 ) ( HOLDING ?auto_28941 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28941 )
      ( MAKE-5PILE ?auto_28941 ?auto_28942 ?auto_28943 ?auto_28944 ?auto_28945 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28947 - BLOCK
      ?auto_28948 - BLOCK
      ?auto_28949 - BLOCK
      ?auto_28950 - BLOCK
      ?auto_28951 - BLOCK
    )
    :vars
    (
      ?auto_28952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28947 ?auto_28948 ) ) ( not ( = ?auto_28947 ?auto_28949 ) ) ( not ( = ?auto_28947 ?auto_28950 ) ) ( not ( = ?auto_28947 ?auto_28951 ) ) ( not ( = ?auto_28948 ?auto_28949 ) ) ( not ( = ?auto_28948 ?auto_28950 ) ) ( not ( = ?auto_28948 ?auto_28951 ) ) ( not ( = ?auto_28949 ?auto_28950 ) ) ( not ( = ?auto_28949 ?auto_28951 ) ) ( not ( = ?auto_28950 ?auto_28951 ) ) ( ON ?auto_28951 ?auto_28952 ) ( not ( = ?auto_28947 ?auto_28952 ) ) ( not ( = ?auto_28948 ?auto_28952 ) ) ( not ( = ?auto_28949 ?auto_28952 ) ) ( not ( = ?auto_28950 ?auto_28952 ) ) ( not ( = ?auto_28951 ?auto_28952 ) ) ( ON ?auto_28950 ?auto_28951 ) ( ON-TABLE ?auto_28952 ) ( ON ?auto_28949 ?auto_28950 ) ( ON ?auto_28948 ?auto_28949 ) ( ON ?auto_28947 ?auto_28948 ) ( CLEAR ?auto_28947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28952 ?auto_28951 ?auto_28950 ?auto_28949 ?auto_28948 )
      ( MAKE-5PILE ?auto_28947 ?auto_28948 ?auto_28949 ?auto_28950 ?auto_28951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28957 - BLOCK
      ?auto_28958 - BLOCK
      ?auto_28959 - BLOCK
      ?auto_28960 - BLOCK
    )
    :vars
    (
      ?auto_28961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28961 ?auto_28960 ) ( CLEAR ?auto_28961 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28957 ) ( ON ?auto_28958 ?auto_28957 ) ( ON ?auto_28959 ?auto_28958 ) ( ON ?auto_28960 ?auto_28959 ) ( not ( = ?auto_28957 ?auto_28958 ) ) ( not ( = ?auto_28957 ?auto_28959 ) ) ( not ( = ?auto_28957 ?auto_28960 ) ) ( not ( = ?auto_28957 ?auto_28961 ) ) ( not ( = ?auto_28958 ?auto_28959 ) ) ( not ( = ?auto_28958 ?auto_28960 ) ) ( not ( = ?auto_28958 ?auto_28961 ) ) ( not ( = ?auto_28959 ?auto_28960 ) ) ( not ( = ?auto_28959 ?auto_28961 ) ) ( not ( = ?auto_28960 ?auto_28961 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28961 ?auto_28960 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28973 - BLOCK
      ?auto_28974 - BLOCK
      ?auto_28975 - BLOCK
      ?auto_28976 - BLOCK
    )
    :vars
    (
      ?auto_28977 - BLOCK
      ?auto_28978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28973 ) ( ON ?auto_28974 ?auto_28973 ) ( ON ?auto_28975 ?auto_28974 ) ( not ( = ?auto_28973 ?auto_28974 ) ) ( not ( = ?auto_28973 ?auto_28975 ) ) ( not ( = ?auto_28973 ?auto_28976 ) ) ( not ( = ?auto_28973 ?auto_28977 ) ) ( not ( = ?auto_28974 ?auto_28975 ) ) ( not ( = ?auto_28974 ?auto_28976 ) ) ( not ( = ?auto_28974 ?auto_28977 ) ) ( not ( = ?auto_28975 ?auto_28976 ) ) ( not ( = ?auto_28975 ?auto_28977 ) ) ( not ( = ?auto_28976 ?auto_28977 ) ) ( ON ?auto_28977 ?auto_28978 ) ( CLEAR ?auto_28977 ) ( not ( = ?auto_28973 ?auto_28978 ) ) ( not ( = ?auto_28974 ?auto_28978 ) ) ( not ( = ?auto_28975 ?auto_28978 ) ) ( not ( = ?auto_28976 ?auto_28978 ) ) ( not ( = ?auto_28977 ?auto_28978 ) ) ( HOLDING ?auto_28976 ) ( CLEAR ?auto_28975 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28973 ?auto_28974 ?auto_28975 ?auto_28976 ?auto_28977 )
      ( MAKE-4PILE ?auto_28973 ?auto_28974 ?auto_28975 ?auto_28976 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28979 - BLOCK
      ?auto_28980 - BLOCK
      ?auto_28981 - BLOCK
      ?auto_28982 - BLOCK
    )
    :vars
    (
      ?auto_28983 - BLOCK
      ?auto_28984 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28979 ) ( ON ?auto_28980 ?auto_28979 ) ( ON ?auto_28981 ?auto_28980 ) ( not ( = ?auto_28979 ?auto_28980 ) ) ( not ( = ?auto_28979 ?auto_28981 ) ) ( not ( = ?auto_28979 ?auto_28982 ) ) ( not ( = ?auto_28979 ?auto_28983 ) ) ( not ( = ?auto_28980 ?auto_28981 ) ) ( not ( = ?auto_28980 ?auto_28982 ) ) ( not ( = ?auto_28980 ?auto_28983 ) ) ( not ( = ?auto_28981 ?auto_28982 ) ) ( not ( = ?auto_28981 ?auto_28983 ) ) ( not ( = ?auto_28982 ?auto_28983 ) ) ( ON ?auto_28983 ?auto_28984 ) ( not ( = ?auto_28979 ?auto_28984 ) ) ( not ( = ?auto_28980 ?auto_28984 ) ) ( not ( = ?auto_28981 ?auto_28984 ) ) ( not ( = ?auto_28982 ?auto_28984 ) ) ( not ( = ?auto_28983 ?auto_28984 ) ) ( CLEAR ?auto_28981 ) ( ON ?auto_28982 ?auto_28983 ) ( CLEAR ?auto_28982 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28984 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28984 ?auto_28983 )
      ( MAKE-4PILE ?auto_28979 ?auto_28980 ?auto_28981 ?auto_28982 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28985 - BLOCK
      ?auto_28986 - BLOCK
      ?auto_28987 - BLOCK
      ?auto_28988 - BLOCK
    )
    :vars
    (
      ?auto_28989 - BLOCK
      ?auto_28990 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28985 ) ( ON ?auto_28986 ?auto_28985 ) ( not ( = ?auto_28985 ?auto_28986 ) ) ( not ( = ?auto_28985 ?auto_28987 ) ) ( not ( = ?auto_28985 ?auto_28988 ) ) ( not ( = ?auto_28985 ?auto_28989 ) ) ( not ( = ?auto_28986 ?auto_28987 ) ) ( not ( = ?auto_28986 ?auto_28988 ) ) ( not ( = ?auto_28986 ?auto_28989 ) ) ( not ( = ?auto_28987 ?auto_28988 ) ) ( not ( = ?auto_28987 ?auto_28989 ) ) ( not ( = ?auto_28988 ?auto_28989 ) ) ( ON ?auto_28989 ?auto_28990 ) ( not ( = ?auto_28985 ?auto_28990 ) ) ( not ( = ?auto_28986 ?auto_28990 ) ) ( not ( = ?auto_28987 ?auto_28990 ) ) ( not ( = ?auto_28988 ?auto_28990 ) ) ( not ( = ?auto_28989 ?auto_28990 ) ) ( ON ?auto_28988 ?auto_28989 ) ( CLEAR ?auto_28988 ) ( ON-TABLE ?auto_28990 ) ( HOLDING ?auto_28987 ) ( CLEAR ?auto_28986 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28985 ?auto_28986 ?auto_28987 )
      ( MAKE-4PILE ?auto_28985 ?auto_28986 ?auto_28987 ?auto_28988 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28991 - BLOCK
      ?auto_28992 - BLOCK
      ?auto_28993 - BLOCK
      ?auto_28994 - BLOCK
    )
    :vars
    (
      ?auto_28996 - BLOCK
      ?auto_28995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28991 ) ( ON ?auto_28992 ?auto_28991 ) ( not ( = ?auto_28991 ?auto_28992 ) ) ( not ( = ?auto_28991 ?auto_28993 ) ) ( not ( = ?auto_28991 ?auto_28994 ) ) ( not ( = ?auto_28991 ?auto_28996 ) ) ( not ( = ?auto_28992 ?auto_28993 ) ) ( not ( = ?auto_28992 ?auto_28994 ) ) ( not ( = ?auto_28992 ?auto_28996 ) ) ( not ( = ?auto_28993 ?auto_28994 ) ) ( not ( = ?auto_28993 ?auto_28996 ) ) ( not ( = ?auto_28994 ?auto_28996 ) ) ( ON ?auto_28996 ?auto_28995 ) ( not ( = ?auto_28991 ?auto_28995 ) ) ( not ( = ?auto_28992 ?auto_28995 ) ) ( not ( = ?auto_28993 ?auto_28995 ) ) ( not ( = ?auto_28994 ?auto_28995 ) ) ( not ( = ?auto_28996 ?auto_28995 ) ) ( ON ?auto_28994 ?auto_28996 ) ( ON-TABLE ?auto_28995 ) ( CLEAR ?auto_28992 ) ( ON ?auto_28993 ?auto_28994 ) ( CLEAR ?auto_28993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28995 ?auto_28996 ?auto_28994 )
      ( MAKE-4PILE ?auto_28991 ?auto_28992 ?auto_28993 ?auto_28994 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28997 - BLOCK
      ?auto_28998 - BLOCK
      ?auto_28999 - BLOCK
      ?auto_29000 - BLOCK
    )
    :vars
    (
      ?auto_29001 - BLOCK
      ?auto_29002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28997 ) ( not ( = ?auto_28997 ?auto_28998 ) ) ( not ( = ?auto_28997 ?auto_28999 ) ) ( not ( = ?auto_28997 ?auto_29000 ) ) ( not ( = ?auto_28997 ?auto_29001 ) ) ( not ( = ?auto_28998 ?auto_28999 ) ) ( not ( = ?auto_28998 ?auto_29000 ) ) ( not ( = ?auto_28998 ?auto_29001 ) ) ( not ( = ?auto_28999 ?auto_29000 ) ) ( not ( = ?auto_28999 ?auto_29001 ) ) ( not ( = ?auto_29000 ?auto_29001 ) ) ( ON ?auto_29001 ?auto_29002 ) ( not ( = ?auto_28997 ?auto_29002 ) ) ( not ( = ?auto_28998 ?auto_29002 ) ) ( not ( = ?auto_28999 ?auto_29002 ) ) ( not ( = ?auto_29000 ?auto_29002 ) ) ( not ( = ?auto_29001 ?auto_29002 ) ) ( ON ?auto_29000 ?auto_29001 ) ( ON-TABLE ?auto_29002 ) ( ON ?auto_28999 ?auto_29000 ) ( CLEAR ?auto_28999 ) ( HOLDING ?auto_28998 ) ( CLEAR ?auto_28997 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28997 ?auto_28998 )
      ( MAKE-4PILE ?auto_28997 ?auto_28998 ?auto_28999 ?auto_29000 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29003 - BLOCK
      ?auto_29004 - BLOCK
      ?auto_29005 - BLOCK
      ?auto_29006 - BLOCK
    )
    :vars
    (
      ?auto_29008 - BLOCK
      ?auto_29007 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29003 ) ( not ( = ?auto_29003 ?auto_29004 ) ) ( not ( = ?auto_29003 ?auto_29005 ) ) ( not ( = ?auto_29003 ?auto_29006 ) ) ( not ( = ?auto_29003 ?auto_29008 ) ) ( not ( = ?auto_29004 ?auto_29005 ) ) ( not ( = ?auto_29004 ?auto_29006 ) ) ( not ( = ?auto_29004 ?auto_29008 ) ) ( not ( = ?auto_29005 ?auto_29006 ) ) ( not ( = ?auto_29005 ?auto_29008 ) ) ( not ( = ?auto_29006 ?auto_29008 ) ) ( ON ?auto_29008 ?auto_29007 ) ( not ( = ?auto_29003 ?auto_29007 ) ) ( not ( = ?auto_29004 ?auto_29007 ) ) ( not ( = ?auto_29005 ?auto_29007 ) ) ( not ( = ?auto_29006 ?auto_29007 ) ) ( not ( = ?auto_29008 ?auto_29007 ) ) ( ON ?auto_29006 ?auto_29008 ) ( ON-TABLE ?auto_29007 ) ( ON ?auto_29005 ?auto_29006 ) ( CLEAR ?auto_29003 ) ( ON ?auto_29004 ?auto_29005 ) ( CLEAR ?auto_29004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29007 ?auto_29008 ?auto_29006 ?auto_29005 )
      ( MAKE-4PILE ?auto_29003 ?auto_29004 ?auto_29005 ?auto_29006 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29009 - BLOCK
      ?auto_29010 - BLOCK
      ?auto_29011 - BLOCK
      ?auto_29012 - BLOCK
    )
    :vars
    (
      ?auto_29014 - BLOCK
      ?auto_29013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29009 ?auto_29010 ) ) ( not ( = ?auto_29009 ?auto_29011 ) ) ( not ( = ?auto_29009 ?auto_29012 ) ) ( not ( = ?auto_29009 ?auto_29014 ) ) ( not ( = ?auto_29010 ?auto_29011 ) ) ( not ( = ?auto_29010 ?auto_29012 ) ) ( not ( = ?auto_29010 ?auto_29014 ) ) ( not ( = ?auto_29011 ?auto_29012 ) ) ( not ( = ?auto_29011 ?auto_29014 ) ) ( not ( = ?auto_29012 ?auto_29014 ) ) ( ON ?auto_29014 ?auto_29013 ) ( not ( = ?auto_29009 ?auto_29013 ) ) ( not ( = ?auto_29010 ?auto_29013 ) ) ( not ( = ?auto_29011 ?auto_29013 ) ) ( not ( = ?auto_29012 ?auto_29013 ) ) ( not ( = ?auto_29014 ?auto_29013 ) ) ( ON ?auto_29012 ?auto_29014 ) ( ON-TABLE ?auto_29013 ) ( ON ?auto_29011 ?auto_29012 ) ( ON ?auto_29010 ?auto_29011 ) ( CLEAR ?auto_29010 ) ( HOLDING ?auto_29009 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29009 )
      ( MAKE-4PILE ?auto_29009 ?auto_29010 ?auto_29011 ?auto_29012 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29015 - BLOCK
      ?auto_29016 - BLOCK
      ?auto_29017 - BLOCK
      ?auto_29018 - BLOCK
    )
    :vars
    (
      ?auto_29020 - BLOCK
      ?auto_29019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29015 ?auto_29016 ) ) ( not ( = ?auto_29015 ?auto_29017 ) ) ( not ( = ?auto_29015 ?auto_29018 ) ) ( not ( = ?auto_29015 ?auto_29020 ) ) ( not ( = ?auto_29016 ?auto_29017 ) ) ( not ( = ?auto_29016 ?auto_29018 ) ) ( not ( = ?auto_29016 ?auto_29020 ) ) ( not ( = ?auto_29017 ?auto_29018 ) ) ( not ( = ?auto_29017 ?auto_29020 ) ) ( not ( = ?auto_29018 ?auto_29020 ) ) ( ON ?auto_29020 ?auto_29019 ) ( not ( = ?auto_29015 ?auto_29019 ) ) ( not ( = ?auto_29016 ?auto_29019 ) ) ( not ( = ?auto_29017 ?auto_29019 ) ) ( not ( = ?auto_29018 ?auto_29019 ) ) ( not ( = ?auto_29020 ?auto_29019 ) ) ( ON ?auto_29018 ?auto_29020 ) ( ON-TABLE ?auto_29019 ) ( ON ?auto_29017 ?auto_29018 ) ( ON ?auto_29016 ?auto_29017 ) ( ON ?auto_29015 ?auto_29016 ) ( CLEAR ?auto_29015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29019 ?auto_29020 ?auto_29018 ?auto_29017 ?auto_29016 )
      ( MAKE-4PILE ?auto_29015 ?auto_29016 ?auto_29017 ?auto_29018 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29022 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29022 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_29022 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29023 - BLOCK
    )
    :vars
    (
      ?auto_29024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29023 ?auto_29024 ) ( CLEAR ?auto_29023 ) ( HAND-EMPTY ) ( not ( = ?auto_29023 ?auto_29024 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29023 ?auto_29024 )
      ( MAKE-1PILE ?auto_29023 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29025 - BLOCK
    )
    :vars
    (
      ?auto_29026 - BLOCK
      ?auto_29027 - BLOCK
      ?auto_29028 - BLOCK
      ?auto_29029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29025 ?auto_29026 ) ) ( HOLDING ?auto_29025 ) ( CLEAR ?auto_29026 ) ( ON-TABLE ?auto_29027 ) ( ON ?auto_29028 ?auto_29027 ) ( ON ?auto_29029 ?auto_29028 ) ( ON ?auto_29026 ?auto_29029 ) ( not ( = ?auto_29027 ?auto_29028 ) ) ( not ( = ?auto_29027 ?auto_29029 ) ) ( not ( = ?auto_29027 ?auto_29026 ) ) ( not ( = ?auto_29027 ?auto_29025 ) ) ( not ( = ?auto_29028 ?auto_29029 ) ) ( not ( = ?auto_29028 ?auto_29026 ) ) ( not ( = ?auto_29028 ?auto_29025 ) ) ( not ( = ?auto_29029 ?auto_29026 ) ) ( not ( = ?auto_29029 ?auto_29025 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29027 ?auto_29028 ?auto_29029 ?auto_29026 ?auto_29025 )
      ( MAKE-1PILE ?auto_29025 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29030 - BLOCK
    )
    :vars
    (
      ?auto_29031 - BLOCK
      ?auto_29034 - BLOCK
      ?auto_29032 - BLOCK
      ?auto_29033 - BLOCK
      ?auto_29035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29030 ?auto_29031 ) ) ( CLEAR ?auto_29031 ) ( ON-TABLE ?auto_29034 ) ( ON ?auto_29032 ?auto_29034 ) ( ON ?auto_29033 ?auto_29032 ) ( ON ?auto_29031 ?auto_29033 ) ( not ( = ?auto_29034 ?auto_29032 ) ) ( not ( = ?auto_29034 ?auto_29033 ) ) ( not ( = ?auto_29034 ?auto_29031 ) ) ( not ( = ?auto_29034 ?auto_29030 ) ) ( not ( = ?auto_29032 ?auto_29033 ) ) ( not ( = ?auto_29032 ?auto_29031 ) ) ( not ( = ?auto_29032 ?auto_29030 ) ) ( not ( = ?auto_29033 ?auto_29031 ) ) ( not ( = ?auto_29033 ?auto_29030 ) ) ( ON ?auto_29030 ?auto_29035 ) ( CLEAR ?auto_29030 ) ( HAND-EMPTY ) ( not ( = ?auto_29030 ?auto_29035 ) ) ( not ( = ?auto_29031 ?auto_29035 ) ) ( not ( = ?auto_29034 ?auto_29035 ) ) ( not ( = ?auto_29032 ?auto_29035 ) ) ( not ( = ?auto_29033 ?auto_29035 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29030 ?auto_29035 )
      ( MAKE-1PILE ?auto_29030 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29036 - BLOCK
    )
    :vars
    (
      ?auto_29037 - BLOCK
      ?auto_29041 - BLOCK
      ?auto_29038 - BLOCK
      ?auto_29040 - BLOCK
      ?auto_29039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29036 ?auto_29037 ) ) ( ON-TABLE ?auto_29041 ) ( ON ?auto_29038 ?auto_29041 ) ( ON ?auto_29040 ?auto_29038 ) ( not ( = ?auto_29041 ?auto_29038 ) ) ( not ( = ?auto_29041 ?auto_29040 ) ) ( not ( = ?auto_29041 ?auto_29037 ) ) ( not ( = ?auto_29041 ?auto_29036 ) ) ( not ( = ?auto_29038 ?auto_29040 ) ) ( not ( = ?auto_29038 ?auto_29037 ) ) ( not ( = ?auto_29038 ?auto_29036 ) ) ( not ( = ?auto_29040 ?auto_29037 ) ) ( not ( = ?auto_29040 ?auto_29036 ) ) ( ON ?auto_29036 ?auto_29039 ) ( CLEAR ?auto_29036 ) ( not ( = ?auto_29036 ?auto_29039 ) ) ( not ( = ?auto_29037 ?auto_29039 ) ) ( not ( = ?auto_29041 ?auto_29039 ) ) ( not ( = ?auto_29038 ?auto_29039 ) ) ( not ( = ?auto_29040 ?auto_29039 ) ) ( HOLDING ?auto_29037 ) ( CLEAR ?auto_29040 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29041 ?auto_29038 ?auto_29040 ?auto_29037 )
      ( MAKE-1PILE ?auto_29036 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29042 - BLOCK
    )
    :vars
    (
      ?auto_29043 - BLOCK
      ?auto_29045 - BLOCK
      ?auto_29046 - BLOCK
      ?auto_29047 - BLOCK
      ?auto_29044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29042 ?auto_29043 ) ) ( ON-TABLE ?auto_29045 ) ( ON ?auto_29046 ?auto_29045 ) ( ON ?auto_29047 ?auto_29046 ) ( not ( = ?auto_29045 ?auto_29046 ) ) ( not ( = ?auto_29045 ?auto_29047 ) ) ( not ( = ?auto_29045 ?auto_29043 ) ) ( not ( = ?auto_29045 ?auto_29042 ) ) ( not ( = ?auto_29046 ?auto_29047 ) ) ( not ( = ?auto_29046 ?auto_29043 ) ) ( not ( = ?auto_29046 ?auto_29042 ) ) ( not ( = ?auto_29047 ?auto_29043 ) ) ( not ( = ?auto_29047 ?auto_29042 ) ) ( ON ?auto_29042 ?auto_29044 ) ( not ( = ?auto_29042 ?auto_29044 ) ) ( not ( = ?auto_29043 ?auto_29044 ) ) ( not ( = ?auto_29045 ?auto_29044 ) ) ( not ( = ?auto_29046 ?auto_29044 ) ) ( not ( = ?auto_29047 ?auto_29044 ) ) ( CLEAR ?auto_29047 ) ( ON ?auto_29043 ?auto_29042 ) ( CLEAR ?auto_29043 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29044 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29044 ?auto_29042 )
      ( MAKE-1PILE ?auto_29042 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29048 - BLOCK
    )
    :vars
    (
      ?auto_29053 - BLOCK
      ?auto_29051 - BLOCK
      ?auto_29050 - BLOCK
      ?auto_29052 - BLOCK
      ?auto_29049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29048 ?auto_29053 ) ) ( ON-TABLE ?auto_29051 ) ( ON ?auto_29050 ?auto_29051 ) ( not ( = ?auto_29051 ?auto_29050 ) ) ( not ( = ?auto_29051 ?auto_29052 ) ) ( not ( = ?auto_29051 ?auto_29053 ) ) ( not ( = ?auto_29051 ?auto_29048 ) ) ( not ( = ?auto_29050 ?auto_29052 ) ) ( not ( = ?auto_29050 ?auto_29053 ) ) ( not ( = ?auto_29050 ?auto_29048 ) ) ( not ( = ?auto_29052 ?auto_29053 ) ) ( not ( = ?auto_29052 ?auto_29048 ) ) ( ON ?auto_29048 ?auto_29049 ) ( not ( = ?auto_29048 ?auto_29049 ) ) ( not ( = ?auto_29053 ?auto_29049 ) ) ( not ( = ?auto_29051 ?auto_29049 ) ) ( not ( = ?auto_29050 ?auto_29049 ) ) ( not ( = ?auto_29052 ?auto_29049 ) ) ( ON ?auto_29053 ?auto_29048 ) ( CLEAR ?auto_29053 ) ( ON-TABLE ?auto_29049 ) ( HOLDING ?auto_29052 ) ( CLEAR ?auto_29050 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29051 ?auto_29050 ?auto_29052 )
      ( MAKE-1PILE ?auto_29048 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29054 - BLOCK
    )
    :vars
    (
      ?auto_29059 - BLOCK
      ?auto_29058 - BLOCK
      ?auto_29056 - BLOCK
      ?auto_29057 - BLOCK
      ?auto_29055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29054 ?auto_29059 ) ) ( ON-TABLE ?auto_29058 ) ( ON ?auto_29056 ?auto_29058 ) ( not ( = ?auto_29058 ?auto_29056 ) ) ( not ( = ?auto_29058 ?auto_29057 ) ) ( not ( = ?auto_29058 ?auto_29059 ) ) ( not ( = ?auto_29058 ?auto_29054 ) ) ( not ( = ?auto_29056 ?auto_29057 ) ) ( not ( = ?auto_29056 ?auto_29059 ) ) ( not ( = ?auto_29056 ?auto_29054 ) ) ( not ( = ?auto_29057 ?auto_29059 ) ) ( not ( = ?auto_29057 ?auto_29054 ) ) ( ON ?auto_29054 ?auto_29055 ) ( not ( = ?auto_29054 ?auto_29055 ) ) ( not ( = ?auto_29059 ?auto_29055 ) ) ( not ( = ?auto_29058 ?auto_29055 ) ) ( not ( = ?auto_29056 ?auto_29055 ) ) ( not ( = ?auto_29057 ?auto_29055 ) ) ( ON ?auto_29059 ?auto_29054 ) ( ON-TABLE ?auto_29055 ) ( CLEAR ?auto_29056 ) ( ON ?auto_29057 ?auto_29059 ) ( CLEAR ?auto_29057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29055 ?auto_29054 ?auto_29059 )
      ( MAKE-1PILE ?auto_29054 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29060 - BLOCK
    )
    :vars
    (
      ?auto_29062 - BLOCK
      ?auto_29064 - BLOCK
      ?auto_29061 - BLOCK
      ?auto_29063 - BLOCK
      ?auto_29065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29060 ?auto_29062 ) ) ( ON-TABLE ?auto_29064 ) ( not ( = ?auto_29064 ?auto_29061 ) ) ( not ( = ?auto_29064 ?auto_29063 ) ) ( not ( = ?auto_29064 ?auto_29062 ) ) ( not ( = ?auto_29064 ?auto_29060 ) ) ( not ( = ?auto_29061 ?auto_29063 ) ) ( not ( = ?auto_29061 ?auto_29062 ) ) ( not ( = ?auto_29061 ?auto_29060 ) ) ( not ( = ?auto_29063 ?auto_29062 ) ) ( not ( = ?auto_29063 ?auto_29060 ) ) ( ON ?auto_29060 ?auto_29065 ) ( not ( = ?auto_29060 ?auto_29065 ) ) ( not ( = ?auto_29062 ?auto_29065 ) ) ( not ( = ?auto_29064 ?auto_29065 ) ) ( not ( = ?auto_29061 ?auto_29065 ) ) ( not ( = ?auto_29063 ?auto_29065 ) ) ( ON ?auto_29062 ?auto_29060 ) ( ON-TABLE ?auto_29065 ) ( ON ?auto_29063 ?auto_29062 ) ( CLEAR ?auto_29063 ) ( HOLDING ?auto_29061 ) ( CLEAR ?auto_29064 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29064 ?auto_29061 )
      ( MAKE-1PILE ?auto_29060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29066 - BLOCK
    )
    :vars
    (
      ?auto_29070 - BLOCK
      ?auto_29067 - BLOCK
      ?auto_29069 - BLOCK
      ?auto_29071 - BLOCK
      ?auto_29068 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29066 ?auto_29070 ) ) ( ON-TABLE ?auto_29067 ) ( not ( = ?auto_29067 ?auto_29069 ) ) ( not ( = ?auto_29067 ?auto_29071 ) ) ( not ( = ?auto_29067 ?auto_29070 ) ) ( not ( = ?auto_29067 ?auto_29066 ) ) ( not ( = ?auto_29069 ?auto_29071 ) ) ( not ( = ?auto_29069 ?auto_29070 ) ) ( not ( = ?auto_29069 ?auto_29066 ) ) ( not ( = ?auto_29071 ?auto_29070 ) ) ( not ( = ?auto_29071 ?auto_29066 ) ) ( ON ?auto_29066 ?auto_29068 ) ( not ( = ?auto_29066 ?auto_29068 ) ) ( not ( = ?auto_29070 ?auto_29068 ) ) ( not ( = ?auto_29067 ?auto_29068 ) ) ( not ( = ?auto_29069 ?auto_29068 ) ) ( not ( = ?auto_29071 ?auto_29068 ) ) ( ON ?auto_29070 ?auto_29066 ) ( ON-TABLE ?auto_29068 ) ( ON ?auto_29071 ?auto_29070 ) ( CLEAR ?auto_29067 ) ( ON ?auto_29069 ?auto_29071 ) ( CLEAR ?auto_29069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29068 ?auto_29066 ?auto_29070 ?auto_29071 )
      ( MAKE-1PILE ?auto_29066 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29072 - BLOCK
    )
    :vars
    (
      ?auto_29073 - BLOCK
      ?auto_29074 - BLOCK
      ?auto_29077 - BLOCK
      ?auto_29075 - BLOCK
      ?auto_29076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29072 ?auto_29073 ) ) ( not ( = ?auto_29074 ?auto_29077 ) ) ( not ( = ?auto_29074 ?auto_29075 ) ) ( not ( = ?auto_29074 ?auto_29073 ) ) ( not ( = ?auto_29074 ?auto_29072 ) ) ( not ( = ?auto_29077 ?auto_29075 ) ) ( not ( = ?auto_29077 ?auto_29073 ) ) ( not ( = ?auto_29077 ?auto_29072 ) ) ( not ( = ?auto_29075 ?auto_29073 ) ) ( not ( = ?auto_29075 ?auto_29072 ) ) ( ON ?auto_29072 ?auto_29076 ) ( not ( = ?auto_29072 ?auto_29076 ) ) ( not ( = ?auto_29073 ?auto_29076 ) ) ( not ( = ?auto_29074 ?auto_29076 ) ) ( not ( = ?auto_29077 ?auto_29076 ) ) ( not ( = ?auto_29075 ?auto_29076 ) ) ( ON ?auto_29073 ?auto_29072 ) ( ON-TABLE ?auto_29076 ) ( ON ?auto_29075 ?auto_29073 ) ( ON ?auto_29077 ?auto_29075 ) ( CLEAR ?auto_29077 ) ( HOLDING ?auto_29074 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29074 )
      ( MAKE-1PILE ?auto_29072 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29078 - BLOCK
    )
    :vars
    (
      ?auto_29082 - BLOCK
      ?auto_29083 - BLOCK
      ?auto_29080 - BLOCK
      ?auto_29079 - BLOCK
      ?auto_29081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29078 ?auto_29082 ) ) ( not ( = ?auto_29083 ?auto_29080 ) ) ( not ( = ?auto_29083 ?auto_29079 ) ) ( not ( = ?auto_29083 ?auto_29082 ) ) ( not ( = ?auto_29083 ?auto_29078 ) ) ( not ( = ?auto_29080 ?auto_29079 ) ) ( not ( = ?auto_29080 ?auto_29082 ) ) ( not ( = ?auto_29080 ?auto_29078 ) ) ( not ( = ?auto_29079 ?auto_29082 ) ) ( not ( = ?auto_29079 ?auto_29078 ) ) ( ON ?auto_29078 ?auto_29081 ) ( not ( = ?auto_29078 ?auto_29081 ) ) ( not ( = ?auto_29082 ?auto_29081 ) ) ( not ( = ?auto_29083 ?auto_29081 ) ) ( not ( = ?auto_29080 ?auto_29081 ) ) ( not ( = ?auto_29079 ?auto_29081 ) ) ( ON ?auto_29082 ?auto_29078 ) ( ON-TABLE ?auto_29081 ) ( ON ?auto_29079 ?auto_29082 ) ( ON ?auto_29080 ?auto_29079 ) ( ON ?auto_29083 ?auto_29080 ) ( CLEAR ?auto_29083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29081 ?auto_29078 ?auto_29082 ?auto_29079 ?auto_29080 )
      ( MAKE-1PILE ?auto_29078 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29087 - BLOCK
      ?auto_29088 - BLOCK
      ?auto_29089 - BLOCK
    )
    :vars
    (
      ?auto_29090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29090 ?auto_29089 ) ( CLEAR ?auto_29090 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29087 ) ( ON ?auto_29088 ?auto_29087 ) ( ON ?auto_29089 ?auto_29088 ) ( not ( = ?auto_29087 ?auto_29088 ) ) ( not ( = ?auto_29087 ?auto_29089 ) ) ( not ( = ?auto_29087 ?auto_29090 ) ) ( not ( = ?auto_29088 ?auto_29089 ) ) ( not ( = ?auto_29088 ?auto_29090 ) ) ( not ( = ?auto_29089 ?auto_29090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29090 ?auto_29089 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29091 - BLOCK
      ?auto_29092 - BLOCK
      ?auto_29093 - BLOCK
    )
    :vars
    (
      ?auto_29094 - BLOCK
      ?auto_29095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29094 ?auto_29093 ) ( CLEAR ?auto_29094 ) ( ON-TABLE ?auto_29091 ) ( ON ?auto_29092 ?auto_29091 ) ( ON ?auto_29093 ?auto_29092 ) ( not ( = ?auto_29091 ?auto_29092 ) ) ( not ( = ?auto_29091 ?auto_29093 ) ) ( not ( = ?auto_29091 ?auto_29094 ) ) ( not ( = ?auto_29092 ?auto_29093 ) ) ( not ( = ?auto_29092 ?auto_29094 ) ) ( not ( = ?auto_29093 ?auto_29094 ) ) ( HOLDING ?auto_29095 ) ( not ( = ?auto_29091 ?auto_29095 ) ) ( not ( = ?auto_29092 ?auto_29095 ) ) ( not ( = ?auto_29093 ?auto_29095 ) ) ( not ( = ?auto_29094 ?auto_29095 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_29095 )
      ( MAKE-3PILE ?auto_29091 ?auto_29092 ?auto_29093 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29096 - BLOCK
      ?auto_29097 - BLOCK
      ?auto_29098 - BLOCK
    )
    :vars
    (
      ?auto_29099 - BLOCK
      ?auto_29100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29099 ?auto_29098 ) ( ON-TABLE ?auto_29096 ) ( ON ?auto_29097 ?auto_29096 ) ( ON ?auto_29098 ?auto_29097 ) ( not ( = ?auto_29096 ?auto_29097 ) ) ( not ( = ?auto_29096 ?auto_29098 ) ) ( not ( = ?auto_29096 ?auto_29099 ) ) ( not ( = ?auto_29097 ?auto_29098 ) ) ( not ( = ?auto_29097 ?auto_29099 ) ) ( not ( = ?auto_29098 ?auto_29099 ) ) ( not ( = ?auto_29096 ?auto_29100 ) ) ( not ( = ?auto_29097 ?auto_29100 ) ) ( not ( = ?auto_29098 ?auto_29100 ) ) ( not ( = ?auto_29099 ?auto_29100 ) ) ( ON ?auto_29100 ?auto_29099 ) ( CLEAR ?auto_29100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29096 ?auto_29097 ?auto_29098 ?auto_29099 )
      ( MAKE-3PILE ?auto_29096 ?auto_29097 ?auto_29098 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29101 - BLOCK
      ?auto_29102 - BLOCK
      ?auto_29103 - BLOCK
    )
    :vars
    (
      ?auto_29104 - BLOCK
      ?auto_29105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29104 ?auto_29103 ) ( ON-TABLE ?auto_29101 ) ( ON ?auto_29102 ?auto_29101 ) ( ON ?auto_29103 ?auto_29102 ) ( not ( = ?auto_29101 ?auto_29102 ) ) ( not ( = ?auto_29101 ?auto_29103 ) ) ( not ( = ?auto_29101 ?auto_29104 ) ) ( not ( = ?auto_29102 ?auto_29103 ) ) ( not ( = ?auto_29102 ?auto_29104 ) ) ( not ( = ?auto_29103 ?auto_29104 ) ) ( not ( = ?auto_29101 ?auto_29105 ) ) ( not ( = ?auto_29102 ?auto_29105 ) ) ( not ( = ?auto_29103 ?auto_29105 ) ) ( not ( = ?auto_29104 ?auto_29105 ) ) ( HOLDING ?auto_29105 ) ( CLEAR ?auto_29104 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29101 ?auto_29102 ?auto_29103 ?auto_29104 ?auto_29105 )
      ( MAKE-3PILE ?auto_29101 ?auto_29102 ?auto_29103 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29106 - BLOCK
      ?auto_29107 - BLOCK
      ?auto_29108 - BLOCK
    )
    :vars
    (
      ?auto_29110 - BLOCK
      ?auto_29109 - BLOCK
      ?auto_29111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29110 ?auto_29108 ) ( ON-TABLE ?auto_29106 ) ( ON ?auto_29107 ?auto_29106 ) ( ON ?auto_29108 ?auto_29107 ) ( not ( = ?auto_29106 ?auto_29107 ) ) ( not ( = ?auto_29106 ?auto_29108 ) ) ( not ( = ?auto_29106 ?auto_29110 ) ) ( not ( = ?auto_29107 ?auto_29108 ) ) ( not ( = ?auto_29107 ?auto_29110 ) ) ( not ( = ?auto_29108 ?auto_29110 ) ) ( not ( = ?auto_29106 ?auto_29109 ) ) ( not ( = ?auto_29107 ?auto_29109 ) ) ( not ( = ?auto_29108 ?auto_29109 ) ) ( not ( = ?auto_29110 ?auto_29109 ) ) ( CLEAR ?auto_29110 ) ( ON ?auto_29109 ?auto_29111 ) ( CLEAR ?auto_29109 ) ( HAND-EMPTY ) ( not ( = ?auto_29106 ?auto_29111 ) ) ( not ( = ?auto_29107 ?auto_29111 ) ) ( not ( = ?auto_29108 ?auto_29111 ) ) ( not ( = ?auto_29110 ?auto_29111 ) ) ( not ( = ?auto_29109 ?auto_29111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29109 ?auto_29111 )
      ( MAKE-3PILE ?auto_29106 ?auto_29107 ?auto_29108 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29124 - BLOCK
      ?auto_29125 - BLOCK
      ?auto_29126 - BLOCK
    )
    :vars
    (
      ?auto_29127 - BLOCK
      ?auto_29129 - BLOCK
      ?auto_29128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29124 ) ( ON ?auto_29125 ?auto_29124 ) ( not ( = ?auto_29124 ?auto_29125 ) ) ( not ( = ?auto_29124 ?auto_29126 ) ) ( not ( = ?auto_29124 ?auto_29127 ) ) ( not ( = ?auto_29125 ?auto_29126 ) ) ( not ( = ?auto_29125 ?auto_29127 ) ) ( not ( = ?auto_29126 ?auto_29127 ) ) ( not ( = ?auto_29124 ?auto_29129 ) ) ( not ( = ?auto_29125 ?auto_29129 ) ) ( not ( = ?auto_29126 ?auto_29129 ) ) ( not ( = ?auto_29127 ?auto_29129 ) ) ( ON ?auto_29129 ?auto_29128 ) ( not ( = ?auto_29124 ?auto_29128 ) ) ( not ( = ?auto_29125 ?auto_29128 ) ) ( not ( = ?auto_29126 ?auto_29128 ) ) ( not ( = ?auto_29127 ?auto_29128 ) ) ( not ( = ?auto_29129 ?auto_29128 ) ) ( ON ?auto_29127 ?auto_29129 ) ( CLEAR ?auto_29127 ) ( HOLDING ?auto_29126 ) ( CLEAR ?auto_29125 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29124 ?auto_29125 ?auto_29126 ?auto_29127 )
      ( MAKE-3PILE ?auto_29124 ?auto_29125 ?auto_29126 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29130 - BLOCK
      ?auto_29131 - BLOCK
      ?auto_29132 - BLOCK
    )
    :vars
    (
      ?auto_29135 - BLOCK
      ?auto_29133 - BLOCK
      ?auto_29134 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29130 ) ( ON ?auto_29131 ?auto_29130 ) ( not ( = ?auto_29130 ?auto_29131 ) ) ( not ( = ?auto_29130 ?auto_29132 ) ) ( not ( = ?auto_29130 ?auto_29135 ) ) ( not ( = ?auto_29131 ?auto_29132 ) ) ( not ( = ?auto_29131 ?auto_29135 ) ) ( not ( = ?auto_29132 ?auto_29135 ) ) ( not ( = ?auto_29130 ?auto_29133 ) ) ( not ( = ?auto_29131 ?auto_29133 ) ) ( not ( = ?auto_29132 ?auto_29133 ) ) ( not ( = ?auto_29135 ?auto_29133 ) ) ( ON ?auto_29133 ?auto_29134 ) ( not ( = ?auto_29130 ?auto_29134 ) ) ( not ( = ?auto_29131 ?auto_29134 ) ) ( not ( = ?auto_29132 ?auto_29134 ) ) ( not ( = ?auto_29135 ?auto_29134 ) ) ( not ( = ?auto_29133 ?auto_29134 ) ) ( ON ?auto_29135 ?auto_29133 ) ( CLEAR ?auto_29131 ) ( ON ?auto_29132 ?auto_29135 ) ( CLEAR ?auto_29132 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29134 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29134 ?auto_29133 ?auto_29135 )
      ( MAKE-3PILE ?auto_29130 ?auto_29131 ?auto_29132 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29136 - BLOCK
      ?auto_29137 - BLOCK
      ?auto_29138 - BLOCK
    )
    :vars
    (
      ?auto_29140 - BLOCK
      ?auto_29141 - BLOCK
      ?auto_29139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29136 ) ( not ( = ?auto_29136 ?auto_29137 ) ) ( not ( = ?auto_29136 ?auto_29138 ) ) ( not ( = ?auto_29136 ?auto_29140 ) ) ( not ( = ?auto_29137 ?auto_29138 ) ) ( not ( = ?auto_29137 ?auto_29140 ) ) ( not ( = ?auto_29138 ?auto_29140 ) ) ( not ( = ?auto_29136 ?auto_29141 ) ) ( not ( = ?auto_29137 ?auto_29141 ) ) ( not ( = ?auto_29138 ?auto_29141 ) ) ( not ( = ?auto_29140 ?auto_29141 ) ) ( ON ?auto_29141 ?auto_29139 ) ( not ( = ?auto_29136 ?auto_29139 ) ) ( not ( = ?auto_29137 ?auto_29139 ) ) ( not ( = ?auto_29138 ?auto_29139 ) ) ( not ( = ?auto_29140 ?auto_29139 ) ) ( not ( = ?auto_29141 ?auto_29139 ) ) ( ON ?auto_29140 ?auto_29141 ) ( ON ?auto_29138 ?auto_29140 ) ( CLEAR ?auto_29138 ) ( ON-TABLE ?auto_29139 ) ( HOLDING ?auto_29137 ) ( CLEAR ?auto_29136 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29136 ?auto_29137 )
      ( MAKE-3PILE ?auto_29136 ?auto_29137 ?auto_29138 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29142 - BLOCK
      ?auto_29143 - BLOCK
      ?auto_29144 - BLOCK
    )
    :vars
    (
      ?auto_29146 - BLOCK
      ?auto_29145 - BLOCK
      ?auto_29147 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29142 ) ( not ( = ?auto_29142 ?auto_29143 ) ) ( not ( = ?auto_29142 ?auto_29144 ) ) ( not ( = ?auto_29142 ?auto_29146 ) ) ( not ( = ?auto_29143 ?auto_29144 ) ) ( not ( = ?auto_29143 ?auto_29146 ) ) ( not ( = ?auto_29144 ?auto_29146 ) ) ( not ( = ?auto_29142 ?auto_29145 ) ) ( not ( = ?auto_29143 ?auto_29145 ) ) ( not ( = ?auto_29144 ?auto_29145 ) ) ( not ( = ?auto_29146 ?auto_29145 ) ) ( ON ?auto_29145 ?auto_29147 ) ( not ( = ?auto_29142 ?auto_29147 ) ) ( not ( = ?auto_29143 ?auto_29147 ) ) ( not ( = ?auto_29144 ?auto_29147 ) ) ( not ( = ?auto_29146 ?auto_29147 ) ) ( not ( = ?auto_29145 ?auto_29147 ) ) ( ON ?auto_29146 ?auto_29145 ) ( ON ?auto_29144 ?auto_29146 ) ( ON-TABLE ?auto_29147 ) ( CLEAR ?auto_29142 ) ( ON ?auto_29143 ?auto_29144 ) ( CLEAR ?auto_29143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29147 ?auto_29145 ?auto_29146 ?auto_29144 )
      ( MAKE-3PILE ?auto_29142 ?auto_29143 ?auto_29144 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29148 - BLOCK
      ?auto_29149 - BLOCK
      ?auto_29150 - BLOCK
    )
    :vars
    (
      ?auto_29151 - BLOCK
      ?auto_29152 - BLOCK
      ?auto_29153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29148 ?auto_29149 ) ) ( not ( = ?auto_29148 ?auto_29150 ) ) ( not ( = ?auto_29148 ?auto_29151 ) ) ( not ( = ?auto_29149 ?auto_29150 ) ) ( not ( = ?auto_29149 ?auto_29151 ) ) ( not ( = ?auto_29150 ?auto_29151 ) ) ( not ( = ?auto_29148 ?auto_29152 ) ) ( not ( = ?auto_29149 ?auto_29152 ) ) ( not ( = ?auto_29150 ?auto_29152 ) ) ( not ( = ?auto_29151 ?auto_29152 ) ) ( ON ?auto_29152 ?auto_29153 ) ( not ( = ?auto_29148 ?auto_29153 ) ) ( not ( = ?auto_29149 ?auto_29153 ) ) ( not ( = ?auto_29150 ?auto_29153 ) ) ( not ( = ?auto_29151 ?auto_29153 ) ) ( not ( = ?auto_29152 ?auto_29153 ) ) ( ON ?auto_29151 ?auto_29152 ) ( ON ?auto_29150 ?auto_29151 ) ( ON-TABLE ?auto_29153 ) ( ON ?auto_29149 ?auto_29150 ) ( CLEAR ?auto_29149 ) ( HOLDING ?auto_29148 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29148 )
      ( MAKE-3PILE ?auto_29148 ?auto_29149 ?auto_29150 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29154 - BLOCK
      ?auto_29155 - BLOCK
      ?auto_29156 - BLOCK
    )
    :vars
    (
      ?auto_29158 - BLOCK
      ?auto_29159 - BLOCK
      ?auto_29157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29154 ?auto_29155 ) ) ( not ( = ?auto_29154 ?auto_29156 ) ) ( not ( = ?auto_29154 ?auto_29158 ) ) ( not ( = ?auto_29155 ?auto_29156 ) ) ( not ( = ?auto_29155 ?auto_29158 ) ) ( not ( = ?auto_29156 ?auto_29158 ) ) ( not ( = ?auto_29154 ?auto_29159 ) ) ( not ( = ?auto_29155 ?auto_29159 ) ) ( not ( = ?auto_29156 ?auto_29159 ) ) ( not ( = ?auto_29158 ?auto_29159 ) ) ( ON ?auto_29159 ?auto_29157 ) ( not ( = ?auto_29154 ?auto_29157 ) ) ( not ( = ?auto_29155 ?auto_29157 ) ) ( not ( = ?auto_29156 ?auto_29157 ) ) ( not ( = ?auto_29158 ?auto_29157 ) ) ( not ( = ?auto_29159 ?auto_29157 ) ) ( ON ?auto_29158 ?auto_29159 ) ( ON ?auto_29156 ?auto_29158 ) ( ON-TABLE ?auto_29157 ) ( ON ?auto_29155 ?auto_29156 ) ( ON ?auto_29154 ?auto_29155 ) ( CLEAR ?auto_29154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29157 ?auto_29159 ?auto_29158 ?auto_29156 ?auto_29155 )
      ( MAKE-3PILE ?auto_29154 ?auto_29155 ?auto_29156 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29162 - BLOCK
      ?auto_29163 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29163 ) ( CLEAR ?auto_29162 ) ( ON-TABLE ?auto_29162 ) ( not ( = ?auto_29162 ?auto_29163 ) ) )
    :subtasks
    ( ( !STACK ?auto_29163 ?auto_29162 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29164 - BLOCK
      ?auto_29165 - BLOCK
    )
    :vars
    (
      ?auto_29166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29164 ) ( ON-TABLE ?auto_29164 ) ( not ( = ?auto_29164 ?auto_29165 ) ) ( ON ?auto_29165 ?auto_29166 ) ( CLEAR ?auto_29165 ) ( HAND-EMPTY ) ( not ( = ?auto_29164 ?auto_29166 ) ) ( not ( = ?auto_29165 ?auto_29166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29165 ?auto_29166 )
      ( MAKE-2PILE ?auto_29164 ?auto_29165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29167 - BLOCK
      ?auto_29168 - BLOCK
    )
    :vars
    (
      ?auto_29169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29167 ?auto_29168 ) ) ( ON ?auto_29168 ?auto_29169 ) ( CLEAR ?auto_29168 ) ( not ( = ?auto_29167 ?auto_29169 ) ) ( not ( = ?auto_29168 ?auto_29169 ) ) ( HOLDING ?auto_29167 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29167 )
      ( MAKE-2PILE ?auto_29167 ?auto_29168 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29170 - BLOCK
      ?auto_29171 - BLOCK
    )
    :vars
    (
      ?auto_29172 - BLOCK
      ?auto_29173 - BLOCK
      ?auto_29174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29170 ?auto_29171 ) ) ( ON ?auto_29171 ?auto_29172 ) ( not ( = ?auto_29170 ?auto_29172 ) ) ( not ( = ?auto_29171 ?auto_29172 ) ) ( ON ?auto_29170 ?auto_29171 ) ( CLEAR ?auto_29170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29173 ) ( ON ?auto_29174 ?auto_29173 ) ( ON ?auto_29172 ?auto_29174 ) ( not ( = ?auto_29173 ?auto_29174 ) ) ( not ( = ?auto_29173 ?auto_29172 ) ) ( not ( = ?auto_29173 ?auto_29171 ) ) ( not ( = ?auto_29173 ?auto_29170 ) ) ( not ( = ?auto_29174 ?auto_29172 ) ) ( not ( = ?auto_29174 ?auto_29171 ) ) ( not ( = ?auto_29174 ?auto_29170 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29173 ?auto_29174 ?auto_29172 ?auto_29171 )
      ( MAKE-2PILE ?auto_29170 ?auto_29171 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29175 - BLOCK
      ?auto_29176 - BLOCK
    )
    :vars
    (
      ?auto_29177 - BLOCK
      ?auto_29179 - BLOCK
      ?auto_29178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29175 ?auto_29176 ) ) ( ON ?auto_29176 ?auto_29177 ) ( not ( = ?auto_29175 ?auto_29177 ) ) ( not ( = ?auto_29176 ?auto_29177 ) ) ( ON-TABLE ?auto_29179 ) ( ON ?auto_29178 ?auto_29179 ) ( ON ?auto_29177 ?auto_29178 ) ( not ( = ?auto_29179 ?auto_29178 ) ) ( not ( = ?auto_29179 ?auto_29177 ) ) ( not ( = ?auto_29179 ?auto_29176 ) ) ( not ( = ?auto_29179 ?auto_29175 ) ) ( not ( = ?auto_29178 ?auto_29177 ) ) ( not ( = ?auto_29178 ?auto_29176 ) ) ( not ( = ?auto_29178 ?auto_29175 ) ) ( HOLDING ?auto_29175 ) ( CLEAR ?auto_29176 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29179 ?auto_29178 ?auto_29177 ?auto_29176 ?auto_29175 )
      ( MAKE-2PILE ?auto_29175 ?auto_29176 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29180 - BLOCK
      ?auto_29181 - BLOCK
    )
    :vars
    (
      ?auto_29182 - BLOCK
      ?auto_29184 - BLOCK
      ?auto_29183 - BLOCK
      ?auto_29185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29180 ?auto_29181 ) ) ( ON ?auto_29181 ?auto_29182 ) ( not ( = ?auto_29180 ?auto_29182 ) ) ( not ( = ?auto_29181 ?auto_29182 ) ) ( ON-TABLE ?auto_29184 ) ( ON ?auto_29183 ?auto_29184 ) ( ON ?auto_29182 ?auto_29183 ) ( not ( = ?auto_29184 ?auto_29183 ) ) ( not ( = ?auto_29184 ?auto_29182 ) ) ( not ( = ?auto_29184 ?auto_29181 ) ) ( not ( = ?auto_29184 ?auto_29180 ) ) ( not ( = ?auto_29183 ?auto_29182 ) ) ( not ( = ?auto_29183 ?auto_29181 ) ) ( not ( = ?auto_29183 ?auto_29180 ) ) ( CLEAR ?auto_29181 ) ( ON ?auto_29180 ?auto_29185 ) ( CLEAR ?auto_29180 ) ( HAND-EMPTY ) ( not ( = ?auto_29180 ?auto_29185 ) ) ( not ( = ?auto_29181 ?auto_29185 ) ) ( not ( = ?auto_29182 ?auto_29185 ) ) ( not ( = ?auto_29184 ?auto_29185 ) ) ( not ( = ?auto_29183 ?auto_29185 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29180 ?auto_29185 )
      ( MAKE-2PILE ?auto_29180 ?auto_29181 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29186 - BLOCK
      ?auto_29187 - BLOCK
    )
    :vars
    (
      ?auto_29188 - BLOCK
      ?auto_29190 - BLOCK
      ?auto_29191 - BLOCK
      ?auto_29189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29186 ?auto_29187 ) ) ( not ( = ?auto_29186 ?auto_29188 ) ) ( not ( = ?auto_29187 ?auto_29188 ) ) ( ON-TABLE ?auto_29190 ) ( ON ?auto_29191 ?auto_29190 ) ( ON ?auto_29188 ?auto_29191 ) ( not ( = ?auto_29190 ?auto_29191 ) ) ( not ( = ?auto_29190 ?auto_29188 ) ) ( not ( = ?auto_29190 ?auto_29187 ) ) ( not ( = ?auto_29190 ?auto_29186 ) ) ( not ( = ?auto_29191 ?auto_29188 ) ) ( not ( = ?auto_29191 ?auto_29187 ) ) ( not ( = ?auto_29191 ?auto_29186 ) ) ( ON ?auto_29186 ?auto_29189 ) ( CLEAR ?auto_29186 ) ( not ( = ?auto_29186 ?auto_29189 ) ) ( not ( = ?auto_29187 ?auto_29189 ) ) ( not ( = ?auto_29188 ?auto_29189 ) ) ( not ( = ?auto_29190 ?auto_29189 ) ) ( not ( = ?auto_29191 ?auto_29189 ) ) ( HOLDING ?auto_29187 ) ( CLEAR ?auto_29188 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29190 ?auto_29191 ?auto_29188 ?auto_29187 )
      ( MAKE-2PILE ?auto_29186 ?auto_29187 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29192 - BLOCK
      ?auto_29193 - BLOCK
    )
    :vars
    (
      ?auto_29197 - BLOCK
      ?auto_29194 - BLOCK
      ?auto_29195 - BLOCK
      ?auto_29196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29192 ?auto_29193 ) ) ( not ( = ?auto_29192 ?auto_29197 ) ) ( not ( = ?auto_29193 ?auto_29197 ) ) ( ON-TABLE ?auto_29194 ) ( ON ?auto_29195 ?auto_29194 ) ( ON ?auto_29197 ?auto_29195 ) ( not ( = ?auto_29194 ?auto_29195 ) ) ( not ( = ?auto_29194 ?auto_29197 ) ) ( not ( = ?auto_29194 ?auto_29193 ) ) ( not ( = ?auto_29194 ?auto_29192 ) ) ( not ( = ?auto_29195 ?auto_29197 ) ) ( not ( = ?auto_29195 ?auto_29193 ) ) ( not ( = ?auto_29195 ?auto_29192 ) ) ( ON ?auto_29192 ?auto_29196 ) ( not ( = ?auto_29192 ?auto_29196 ) ) ( not ( = ?auto_29193 ?auto_29196 ) ) ( not ( = ?auto_29197 ?auto_29196 ) ) ( not ( = ?auto_29194 ?auto_29196 ) ) ( not ( = ?auto_29195 ?auto_29196 ) ) ( CLEAR ?auto_29197 ) ( ON ?auto_29193 ?auto_29192 ) ( CLEAR ?auto_29193 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29196 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29196 ?auto_29192 )
      ( MAKE-2PILE ?auto_29192 ?auto_29193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29198 - BLOCK
      ?auto_29199 - BLOCK
    )
    :vars
    (
      ?auto_29202 - BLOCK
      ?auto_29200 - BLOCK
      ?auto_29201 - BLOCK
      ?auto_29203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29198 ?auto_29199 ) ) ( not ( = ?auto_29198 ?auto_29202 ) ) ( not ( = ?auto_29199 ?auto_29202 ) ) ( ON-TABLE ?auto_29200 ) ( ON ?auto_29201 ?auto_29200 ) ( not ( = ?auto_29200 ?auto_29201 ) ) ( not ( = ?auto_29200 ?auto_29202 ) ) ( not ( = ?auto_29200 ?auto_29199 ) ) ( not ( = ?auto_29200 ?auto_29198 ) ) ( not ( = ?auto_29201 ?auto_29202 ) ) ( not ( = ?auto_29201 ?auto_29199 ) ) ( not ( = ?auto_29201 ?auto_29198 ) ) ( ON ?auto_29198 ?auto_29203 ) ( not ( = ?auto_29198 ?auto_29203 ) ) ( not ( = ?auto_29199 ?auto_29203 ) ) ( not ( = ?auto_29202 ?auto_29203 ) ) ( not ( = ?auto_29200 ?auto_29203 ) ) ( not ( = ?auto_29201 ?auto_29203 ) ) ( ON ?auto_29199 ?auto_29198 ) ( CLEAR ?auto_29199 ) ( ON-TABLE ?auto_29203 ) ( HOLDING ?auto_29202 ) ( CLEAR ?auto_29201 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29200 ?auto_29201 ?auto_29202 )
      ( MAKE-2PILE ?auto_29198 ?auto_29199 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29204 - BLOCK
      ?auto_29205 - BLOCK
    )
    :vars
    (
      ?auto_29208 - BLOCK
      ?auto_29206 - BLOCK
      ?auto_29207 - BLOCK
      ?auto_29209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29204 ?auto_29205 ) ) ( not ( = ?auto_29204 ?auto_29208 ) ) ( not ( = ?auto_29205 ?auto_29208 ) ) ( ON-TABLE ?auto_29206 ) ( ON ?auto_29207 ?auto_29206 ) ( not ( = ?auto_29206 ?auto_29207 ) ) ( not ( = ?auto_29206 ?auto_29208 ) ) ( not ( = ?auto_29206 ?auto_29205 ) ) ( not ( = ?auto_29206 ?auto_29204 ) ) ( not ( = ?auto_29207 ?auto_29208 ) ) ( not ( = ?auto_29207 ?auto_29205 ) ) ( not ( = ?auto_29207 ?auto_29204 ) ) ( ON ?auto_29204 ?auto_29209 ) ( not ( = ?auto_29204 ?auto_29209 ) ) ( not ( = ?auto_29205 ?auto_29209 ) ) ( not ( = ?auto_29208 ?auto_29209 ) ) ( not ( = ?auto_29206 ?auto_29209 ) ) ( not ( = ?auto_29207 ?auto_29209 ) ) ( ON ?auto_29205 ?auto_29204 ) ( ON-TABLE ?auto_29209 ) ( CLEAR ?auto_29207 ) ( ON ?auto_29208 ?auto_29205 ) ( CLEAR ?auto_29208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29209 ?auto_29204 ?auto_29205 )
      ( MAKE-2PILE ?auto_29204 ?auto_29205 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29210 - BLOCK
      ?auto_29211 - BLOCK
    )
    :vars
    (
      ?auto_29214 - BLOCK
      ?auto_29213 - BLOCK
      ?auto_29215 - BLOCK
      ?auto_29212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29210 ?auto_29211 ) ) ( not ( = ?auto_29210 ?auto_29214 ) ) ( not ( = ?auto_29211 ?auto_29214 ) ) ( ON-TABLE ?auto_29213 ) ( not ( = ?auto_29213 ?auto_29215 ) ) ( not ( = ?auto_29213 ?auto_29214 ) ) ( not ( = ?auto_29213 ?auto_29211 ) ) ( not ( = ?auto_29213 ?auto_29210 ) ) ( not ( = ?auto_29215 ?auto_29214 ) ) ( not ( = ?auto_29215 ?auto_29211 ) ) ( not ( = ?auto_29215 ?auto_29210 ) ) ( ON ?auto_29210 ?auto_29212 ) ( not ( = ?auto_29210 ?auto_29212 ) ) ( not ( = ?auto_29211 ?auto_29212 ) ) ( not ( = ?auto_29214 ?auto_29212 ) ) ( not ( = ?auto_29213 ?auto_29212 ) ) ( not ( = ?auto_29215 ?auto_29212 ) ) ( ON ?auto_29211 ?auto_29210 ) ( ON-TABLE ?auto_29212 ) ( ON ?auto_29214 ?auto_29211 ) ( CLEAR ?auto_29214 ) ( HOLDING ?auto_29215 ) ( CLEAR ?auto_29213 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29213 ?auto_29215 )
      ( MAKE-2PILE ?auto_29210 ?auto_29211 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29216 - BLOCK
      ?auto_29217 - BLOCK
    )
    :vars
    (
      ?auto_29218 - BLOCK
      ?auto_29220 - BLOCK
      ?auto_29221 - BLOCK
      ?auto_29219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29216 ?auto_29217 ) ) ( not ( = ?auto_29216 ?auto_29218 ) ) ( not ( = ?auto_29217 ?auto_29218 ) ) ( ON-TABLE ?auto_29220 ) ( not ( = ?auto_29220 ?auto_29221 ) ) ( not ( = ?auto_29220 ?auto_29218 ) ) ( not ( = ?auto_29220 ?auto_29217 ) ) ( not ( = ?auto_29220 ?auto_29216 ) ) ( not ( = ?auto_29221 ?auto_29218 ) ) ( not ( = ?auto_29221 ?auto_29217 ) ) ( not ( = ?auto_29221 ?auto_29216 ) ) ( ON ?auto_29216 ?auto_29219 ) ( not ( = ?auto_29216 ?auto_29219 ) ) ( not ( = ?auto_29217 ?auto_29219 ) ) ( not ( = ?auto_29218 ?auto_29219 ) ) ( not ( = ?auto_29220 ?auto_29219 ) ) ( not ( = ?auto_29221 ?auto_29219 ) ) ( ON ?auto_29217 ?auto_29216 ) ( ON-TABLE ?auto_29219 ) ( ON ?auto_29218 ?auto_29217 ) ( CLEAR ?auto_29220 ) ( ON ?auto_29221 ?auto_29218 ) ( CLEAR ?auto_29221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29219 ?auto_29216 ?auto_29217 ?auto_29218 )
      ( MAKE-2PILE ?auto_29216 ?auto_29217 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29222 - BLOCK
      ?auto_29223 - BLOCK
    )
    :vars
    (
      ?auto_29227 - BLOCK
      ?auto_29225 - BLOCK
      ?auto_29226 - BLOCK
      ?auto_29224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29222 ?auto_29223 ) ) ( not ( = ?auto_29222 ?auto_29227 ) ) ( not ( = ?auto_29223 ?auto_29227 ) ) ( not ( = ?auto_29225 ?auto_29226 ) ) ( not ( = ?auto_29225 ?auto_29227 ) ) ( not ( = ?auto_29225 ?auto_29223 ) ) ( not ( = ?auto_29225 ?auto_29222 ) ) ( not ( = ?auto_29226 ?auto_29227 ) ) ( not ( = ?auto_29226 ?auto_29223 ) ) ( not ( = ?auto_29226 ?auto_29222 ) ) ( ON ?auto_29222 ?auto_29224 ) ( not ( = ?auto_29222 ?auto_29224 ) ) ( not ( = ?auto_29223 ?auto_29224 ) ) ( not ( = ?auto_29227 ?auto_29224 ) ) ( not ( = ?auto_29225 ?auto_29224 ) ) ( not ( = ?auto_29226 ?auto_29224 ) ) ( ON ?auto_29223 ?auto_29222 ) ( ON-TABLE ?auto_29224 ) ( ON ?auto_29227 ?auto_29223 ) ( ON ?auto_29226 ?auto_29227 ) ( CLEAR ?auto_29226 ) ( HOLDING ?auto_29225 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29225 )
      ( MAKE-2PILE ?auto_29222 ?auto_29223 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29228 - BLOCK
      ?auto_29229 - BLOCK
    )
    :vars
    (
      ?auto_29233 - BLOCK
      ?auto_29231 - BLOCK
      ?auto_29230 - BLOCK
      ?auto_29232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29228 ?auto_29229 ) ) ( not ( = ?auto_29228 ?auto_29233 ) ) ( not ( = ?auto_29229 ?auto_29233 ) ) ( not ( = ?auto_29231 ?auto_29230 ) ) ( not ( = ?auto_29231 ?auto_29233 ) ) ( not ( = ?auto_29231 ?auto_29229 ) ) ( not ( = ?auto_29231 ?auto_29228 ) ) ( not ( = ?auto_29230 ?auto_29233 ) ) ( not ( = ?auto_29230 ?auto_29229 ) ) ( not ( = ?auto_29230 ?auto_29228 ) ) ( ON ?auto_29228 ?auto_29232 ) ( not ( = ?auto_29228 ?auto_29232 ) ) ( not ( = ?auto_29229 ?auto_29232 ) ) ( not ( = ?auto_29233 ?auto_29232 ) ) ( not ( = ?auto_29231 ?auto_29232 ) ) ( not ( = ?auto_29230 ?auto_29232 ) ) ( ON ?auto_29229 ?auto_29228 ) ( ON-TABLE ?auto_29232 ) ( ON ?auto_29233 ?auto_29229 ) ( ON ?auto_29230 ?auto_29233 ) ( ON ?auto_29231 ?auto_29230 ) ( CLEAR ?auto_29231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29232 ?auto_29228 ?auto_29229 ?auto_29233 ?auto_29230 )
      ( MAKE-2PILE ?auto_29228 ?auto_29229 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29236 - BLOCK
      ?auto_29237 - BLOCK
    )
    :vars
    (
      ?auto_29238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29238 ?auto_29237 ) ( CLEAR ?auto_29238 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29236 ) ( ON ?auto_29237 ?auto_29236 ) ( not ( = ?auto_29236 ?auto_29237 ) ) ( not ( = ?auto_29236 ?auto_29238 ) ) ( not ( = ?auto_29237 ?auto_29238 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29238 ?auto_29237 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29239 - BLOCK
      ?auto_29240 - BLOCK
    )
    :vars
    (
      ?auto_29241 - BLOCK
      ?auto_29242 - BLOCK
      ?auto_29243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29241 ?auto_29240 ) ( CLEAR ?auto_29241 ) ( ON-TABLE ?auto_29239 ) ( ON ?auto_29240 ?auto_29239 ) ( not ( = ?auto_29239 ?auto_29240 ) ) ( not ( = ?auto_29239 ?auto_29241 ) ) ( not ( = ?auto_29240 ?auto_29241 ) ) ( HOLDING ?auto_29242 ) ( CLEAR ?auto_29243 ) ( not ( = ?auto_29239 ?auto_29242 ) ) ( not ( = ?auto_29239 ?auto_29243 ) ) ( not ( = ?auto_29240 ?auto_29242 ) ) ( not ( = ?auto_29240 ?auto_29243 ) ) ( not ( = ?auto_29241 ?auto_29242 ) ) ( not ( = ?auto_29241 ?auto_29243 ) ) ( not ( = ?auto_29242 ?auto_29243 ) ) )
    :subtasks
    ( ( !STACK ?auto_29242 ?auto_29243 )
      ( MAKE-2PILE ?auto_29239 ?auto_29240 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29244 - BLOCK
      ?auto_29245 - BLOCK
    )
    :vars
    (
      ?auto_29246 - BLOCK
      ?auto_29247 - BLOCK
      ?auto_29248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29246 ?auto_29245 ) ( ON-TABLE ?auto_29244 ) ( ON ?auto_29245 ?auto_29244 ) ( not ( = ?auto_29244 ?auto_29245 ) ) ( not ( = ?auto_29244 ?auto_29246 ) ) ( not ( = ?auto_29245 ?auto_29246 ) ) ( CLEAR ?auto_29247 ) ( not ( = ?auto_29244 ?auto_29248 ) ) ( not ( = ?auto_29244 ?auto_29247 ) ) ( not ( = ?auto_29245 ?auto_29248 ) ) ( not ( = ?auto_29245 ?auto_29247 ) ) ( not ( = ?auto_29246 ?auto_29248 ) ) ( not ( = ?auto_29246 ?auto_29247 ) ) ( not ( = ?auto_29248 ?auto_29247 ) ) ( ON ?auto_29248 ?auto_29246 ) ( CLEAR ?auto_29248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29244 ?auto_29245 ?auto_29246 )
      ( MAKE-2PILE ?auto_29244 ?auto_29245 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29249 - BLOCK
      ?auto_29250 - BLOCK
    )
    :vars
    (
      ?auto_29252 - BLOCK
      ?auto_29253 - BLOCK
      ?auto_29251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29252 ?auto_29250 ) ( ON-TABLE ?auto_29249 ) ( ON ?auto_29250 ?auto_29249 ) ( not ( = ?auto_29249 ?auto_29250 ) ) ( not ( = ?auto_29249 ?auto_29252 ) ) ( not ( = ?auto_29250 ?auto_29252 ) ) ( not ( = ?auto_29249 ?auto_29253 ) ) ( not ( = ?auto_29249 ?auto_29251 ) ) ( not ( = ?auto_29250 ?auto_29253 ) ) ( not ( = ?auto_29250 ?auto_29251 ) ) ( not ( = ?auto_29252 ?auto_29253 ) ) ( not ( = ?auto_29252 ?auto_29251 ) ) ( not ( = ?auto_29253 ?auto_29251 ) ) ( ON ?auto_29253 ?auto_29252 ) ( CLEAR ?auto_29253 ) ( HOLDING ?auto_29251 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29251 )
      ( MAKE-2PILE ?auto_29249 ?auto_29250 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29254 - BLOCK
      ?auto_29255 - BLOCK
    )
    :vars
    (
      ?auto_29256 - BLOCK
      ?auto_29257 - BLOCK
      ?auto_29258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29256 ?auto_29255 ) ( ON-TABLE ?auto_29254 ) ( ON ?auto_29255 ?auto_29254 ) ( not ( = ?auto_29254 ?auto_29255 ) ) ( not ( = ?auto_29254 ?auto_29256 ) ) ( not ( = ?auto_29255 ?auto_29256 ) ) ( not ( = ?auto_29254 ?auto_29257 ) ) ( not ( = ?auto_29254 ?auto_29258 ) ) ( not ( = ?auto_29255 ?auto_29257 ) ) ( not ( = ?auto_29255 ?auto_29258 ) ) ( not ( = ?auto_29256 ?auto_29257 ) ) ( not ( = ?auto_29256 ?auto_29258 ) ) ( not ( = ?auto_29257 ?auto_29258 ) ) ( ON ?auto_29257 ?auto_29256 ) ( ON ?auto_29258 ?auto_29257 ) ( CLEAR ?auto_29258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29254 ?auto_29255 ?auto_29256 ?auto_29257 )
      ( MAKE-2PILE ?auto_29254 ?auto_29255 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29259 - BLOCK
      ?auto_29260 - BLOCK
    )
    :vars
    (
      ?auto_29261 - BLOCK
      ?auto_29262 - BLOCK
      ?auto_29263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29261 ?auto_29260 ) ( ON-TABLE ?auto_29259 ) ( ON ?auto_29260 ?auto_29259 ) ( not ( = ?auto_29259 ?auto_29260 ) ) ( not ( = ?auto_29259 ?auto_29261 ) ) ( not ( = ?auto_29260 ?auto_29261 ) ) ( not ( = ?auto_29259 ?auto_29262 ) ) ( not ( = ?auto_29259 ?auto_29263 ) ) ( not ( = ?auto_29260 ?auto_29262 ) ) ( not ( = ?auto_29260 ?auto_29263 ) ) ( not ( = ?auto_29261 ?auto_29262 ) ) ( not ( = ?auto_29261 ?auto_29263 ) ) ( not ( = ?auto_29262 ?auto_29263 ) ) ( ON ?auto_29262 ?auto_29261 ) ( HOLDING ?auto_29263 ) ( CLEAR ?auto_29262 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29259 ?auto_29260 ?auto_29261 ?auto_29262 ?auto_29263 )
      ( MAKE-2PILE ?auto_29259 ?auto_29260 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29264 - BLOCK
      ?auto_29265 - BLOCK
    )
    :vars
    (
      ?auto_29266 - BLOCK
      ?auto_29267 - BLOCK
      ?auto_29268 - BLOCK
      ?auto_29269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29266 ?auto_29265 ) ( ON-TABLE ?auto_29264 ) ( ON ?auto_29265 ?auto_29264 ) ( not ( = ?auto_29264 ?auto_29265 ) ) ( not ( = ?auto_29264 ?auto_29266 ) ) ( not ( = ?auto_29265 ?auto_29266 ) ) ( not ( = ?auto_29264 ?auto_29267 ) ) ( not ( = ?auto_29264 ?auto_29268 ) ) ( not ( = ?auto_29265 ?auto_29267 ) ) ( not ( = ?auto_29265 ?auto_29268 ) ) ( not ( = ?auto_29266 ?auto_29267 ) ) ( not ( = ?auto_29266 ?auto_29268 ) ) ( not ( = ?auto_29267 ?auto_29268 ) ) ( ON ?auto_29267 ?auto_29266 ) ( CLEAR ?auto_29267 ) ( ON ?auto_29268 ?auto_29269 ) ( CLEAR ?auto_29268 ) ( HAND-EMPTY ) ( not ( = ?auto_29264 ?auto_29269 ) ) ( not ( = ?auto_29265 ?auto_29269 ) ) ( not ( = ?auto_29266 ?auto_29269 ) ) ( not ( = ?auto_29267 ?auto_29269 ) ) ( not ( = ?auto_29268 ?auto_29269 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29268 ?auto_29269 )
      ( MAKE-2PILE ?auto_29264 ?auto_29265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29270 - BLOCK
      ?auto_29271 - BLOCK
    )
    :vars
    (
      ?auto_29274 - BLOCK
      ?auto_29273 - BLOCK
      ?auto_29275 - BLOCK
      ?auto_29272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29274 ?auto_29271 ) ( ON-TABLE ?auto_29270 ) ( ON ?auto_29271 ?auto_29270 ) ( not ( = ?auto_29270 ?auto_29271 ) ) ( not ( = ?auto_29270 ?auto_29274 ) ) ( not ( = ?auto_29271 ?auto_29274 ) ) ( not ( = ?auto_29270 ?auto_29273 ) ) ( not ( = ?auto_29270 ?auto_29275 ) ) ( not ( = ?auto_29271 ?auto_29273 ) ) ( not ( = ?auto_29271 ?auto_29275 ) ) ( not ( = ?auto_29274 ?auto_29273 ) ) ( not ( = ?auto_29274 ?auto_29275 ) ) ( not ( = ?auto_29273 ?auto_29275 ) ) ( ON ?auto_29275 ?auto_29272 ) ( CLEAR ?auto_29275 ) ( not ( = ?auto_29270 ?auto_29272 ) ) ( not ( = ?auto_29271 ?auto_29272 ) ) ( not ( = ?auto_29274 ?auto_29272 ) ) ( not ( = ?auto_29273 ?auto_29272 ) ) ( not ( = ?auto_29275 ?auto_29272 ) ) ( HOLDING ?auto_29273 ) ( CLEAR ?auto_29274 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29270 ?auto_29271 ?auto_29274 ?auto_29273 )
      ( MAKE-2PILE ?auto_29270 ?auto_29271 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29276 - BLOCK
      ?auto_29277 - BLOCK
    )
    :vars
    (
      ?auto_29281 - BLOCK
      ?auto_29278 - BLOCK
      ?auto_29280 - BLOCK
      ?auto_29279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29281 ?auto_29277 ) ( ON-TABLE ?auto_29276 ) ( ON ?auto_29277 ?auto_29276 ) ( not ( = ?auto_29276 ?auto_29277 ) ) ( not ( = ?auto_29276 ?auto_29281 ) ) ( not ( = ?auto_29277 ?auto_29281 ) ) ( not ( = ?auto_29276 ?auto_29278 ) ) ( not ( = ?auto_29276 ?auto_29280 ) ) ( not ( = ?auto_29277 ?auto_29278 ) ) ( not ( = ?auto_29277 ?auto_29280 ) ) ( not ( = ?auto_29281 ?auto_29278 ) ) ( not ( = ?auto_29281 ?auto_29280 ) ) ( not ( = ?auto_29278 ?auto_29280 ) ) ( ON ?auto_29280 ?auto_29279 ) ( not ( = ?auto_29276 ?auto_29279 ) ) ( not ( = ?auto_29277 ?auto_29279 ) ) ( not ( = ?auto_29281 ?auto_29279 ) ) ( not ( = ?auto_29278 ?auto_29279 ) ) ( not ( = ?auto_29280 ?auto_29279 ) ) ( CLEAR ?auto_29281 ) ( ON ?auto_29278 ?auto_29280 ) ( CLEAR ?auto_29278 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29279 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29279 ?auto_29280 )
      ( MAKE-2PILE ?auto_29276 ?auto_29277 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29294 - BLOCK
      ?auto_29295 - BLOCK
    )
    :vars
    (
      ?auto_29297 - BLOCK
      ?auto_29298 - BLOCK
      ?auto_29299 - BLOCK
      ?auto_29296 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29294 ) ( not ( = ?auto_29294 ?auto_29295 ) ) ( not ( = ?auto_29294 ?auto_29297 ) ) ( not ( = ?auto_29295 ?auto_29297 ) ) ( not ( = ?auto_29294 ?auto_29298 ) ) ( not ( = ?auto_29294 ?auto_29299 ) ) ( not ( = ?auto_29295 ?auto_29298 ) ) ( not ( = ?auto_29295 ?auto_29299 ) ) ( not ( = ?auto_29297 ?auto_29298 ) ) ( not ( = ?auto_29297 ?auto_29299 ) ) ( not ( = ?auto_29298 ?auto_29299 ) ) ( ON ?auto_29299 ?auto_29296 ) ( not ( = ?auto_29294 ?auto_29296 ) ) ( not ( = ?auto_29295 ?auto_29296 ) ) ( not ( = ?auto_29297 ?auto_29296 ) ) ( not ( = ?auto_29298 ?auto_29296 ) ) ( not ( = ?auto_29299 ?auto_29296 ) ) ( ON ?auto_29298 ?auto_29299 ) ( ON-TABLE ?auto_29296 ) ( ON ?auto_29297 ?auto_29298 ) ( CLEAR ?auto_29297 ) ( HOLDING ?auto_29295 ) ( CLEAR ?auto_29294 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29294 ?auto_29295 ?auto_29297 )
      ( MAKE-2PILE ?auto_29294 ?auto_29295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29300 - BLOCK
      ?auto_29301 - BLOCK
    )
    :vars
    (
      ?auto_29305 - BLOCK
      ?auto_29302 - BLOCK
      ?auto_29303 - BLOCK
      ?auto_29304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29300 ) ( not ( = ?auto_29300 ?auto_29301 ) ) ( not ( = ?auto_29300 ?auto_29305 ) ) ( not ( = ?auto_29301 ?auto_29305 ) ) ( not ( = ?auto_29300 ?auto_29302 ) ) ( not ( = ?auto_29300 ?auto_29303 ) ) ( not ( = ?auto_29301 ?auto_29302 ) ) ( not ( = ?auto_29301 ?auto_29303 ) ) ( not ( = ?auto_29305 ?auto_29302 ) ) ( not ( = ?auto_29305 ?auto_29303 ) ) ( not ( = ?auto_29302 ?auto_29303 ) ) ( ON ?auto_29303 ?auto_29304 ) ( not ( = ?auto_29300 ?auto_29304 ) ) ( not ( = ?auto_29301 ?auto_29304 ) ) ( not ( = ?auto_29305 ?auto_29304 ) ) ( not ( = ?auto_29302 ?auto_29304 ) ) ( not ( = ?auto_29303 ?auto_29304 ) ) ( ON ?auto_29302 ?auto_29303 ) ( ON-TABLE ?auto_29304 ) ( ON ?auto_29305 ?auto_29302 ) ( CLEAR ?auto_29300 ) ( ON ?auto_29301 ?auto_29305 ) ( CLEAR ?auto_29301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29304 ?auto_29303 ?auto_29302 ?auto_29305 )
      ( MAKE-2PILE ?auto_29300 ?auto_29301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29306 - BLOCK
      ?auto_29307 - BLOCK
    )
    :vars
    (
      ?auto_29309 - BLOCK
      ?auto_29308 - BLOCK
      ?auto_29310 - BLOCK
      ?auto_29311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29306 ?auto_29307 ) ) ( not ( = ?auto_29306 ?auto_29309 ) ) ( not ( = ?auto_29307 ?auto_29309 ) ) ( not ( = ?auto_29306 ?auto_29308 ) ) ( not ( = ?auto_29306 ?auto_29310 ) ) ( not ( = ?auto_29307 ?auto_29308 ) ) ( not ( = ?auto_29307 ?auto_29310 ) ) ( not ( = ?auto_29309 ?auto_29308 ) ) ( not ( = ?auto_29309 ?auto_29310 ) ) ( not ( = ?auto_29308 ?auto_29310 ) ) ( ON ?auto_29310 ?auto_29311 ) ( not ( = ?auto_29306 ?auto_29311 ) ) ( not ( = ?auto_29307 ?auto_29311 ) ) ( not ( = ?auto_29309 ?auto_29311 ) ) ( not ( = ?auto_29308 ?auto_29311 ) ) ( not ( = ?auto_29310 ?auto_29311 ) ) ( ON ?auto_29308 ?auto_29310 ) ( ON-TABLE ?auto_29311 ) ( ON ?auto_29309 ?auto_29308 ) ( ON ?auto_29307 ?auto_29309 ) ( CLEAR ?auto_29307 ) ( HOLDING ?auto_29306 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29306 )
      ( MAKE-2PILE ?auto_29306 ?auto_29307 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29312 - BLOCK
      ?auto_29313 - BLOCK
    )
    :vars
    (
      ?auto_29314 - BLOCK
      ?auto_29316 - BLOCK
      ?auto_29315 - BLOCK
      ?auto_29317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29312 ?auto_29313 ) ) ( not ( = ?auto_29312 ?auto_29314 ) ) ( not ( = ?auto_29313 ?auto_29314 ) ) ( not ( = ?auto_29312 ?auto_29316 ) ) ( not ( = ?auto_29312 ?auto_29315 ) ) ( not ( = ?auto_29313 ?auto_29316 ) ) ( not ( = ?auto_29313 ?auto_29315 ) ) ( not ( = ?auto_29314 ?auto_29316 ) ) ( not ( = ?auto_29314 ?auto_29315 ) ) ( not ( = ?auto_29316 ?auto_29315 ) ) ( ON ?auto_29315 ?auto_29317 ) ( not ( = ?auto_29312 ?auto_29317 ) ) ( not ( = ?auto_29313 ?auto_29317 ) ) ( not ( = ?auto_29314 ?auto_29317 ) ) ( not ( = ?auto_29316 ?auto_29317 ) ) ( not ( = ?auto_29315 ?auto_29317 ) ) ( ON ?auto_29316 ?auto_29315 ) ( ON-TABLE ?auto_29317 ) ( ON ?auto_29314 ?auto_29316 ) ( ON ?auto_29313 ?auto_29314 ) ( ON ?auto_29312 ?auto_29313 ) ( CLEAR ?auto_29312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29317 ?auto_29315 ?auto_29316 ?auto_29314 ?auto_29313 )
      ( MAKE-2PILE ?auto_29312 ?auto_29313 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29321 - BLOCK
      ?auto_29322 - BLOCK
      ?auto_29323 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29323 ) ( CLEAR ?auto_29322 ) ( ON-TABLE ?auto_29321 ) ( ON ?auto_29322 ?auto_29321 ) ( not ( = ?auto_29321 ?auto_29322 ) ) ( not ( = ?auto_29321 ?auto_29323 ) ) ( not ( = ?auto_29322 ?auto_29323 ) ) )
    :subtasks
    ( ( !STACK ?auto_29323 ?auto_29322 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29324 - BLOCK
      ?auto_29325 - BLOCK
      ?auto_29326 - BLOCK
    )
    :vars
    (
      ?auto_29327 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29325 ) ( ON-TABLE ?auto_29324 ) ( ON ?auto_29325 ?auto_29324 ) ( not ( = ?auto_29324 ?auto_29325 ) ) ( not ( = ?auto_29324 ?auto_29326 ) ) ( not ( = ?auto_29325 ?auto_29326 ) ) ( ON ?auto_29326 ?auto_29327 ) ( CLEAR ?auto_29326 ) ( HAND-EMPTY ) ( not ( = ?auto_29324 ?auto_29327 ) ) ( not ( = ?auto_29325 ?auto_29327 ) ) ( not ( = ?auto_29326 ?auto_29327 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29326 ?auto_29327 )
      ( MAKE-3PILE ?auto_29324 ?auto_29325 ?auto_29326 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29328 - BLOCK
      ?auto_29329 - BLOCK
      ?auto_29330 - BLOCK
    )
    :vars
    (
      ?auto_29331 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29328 ) ( not ( = ?auto_29328 ?auto_29329 ) ) ( not ( = ?auto_29328 ?auto_29330 ) ) ( not ( = ?auto_29329 ?auto_29330 ) ) ( ON ?auto_29330 ?auto_29331 ) ( CLEAR ?auto_29330 ) ( not ( = ?auto_29328 ?auto_29331 ) ) ( not ( = ?auto_29329 ?auto_29331 ) ) ( not ( = ?auto_29330 ?auto_29331 ) ) ( HOLDING ?auto_29329 ) ( CLEAR ?auto_29328 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29328 ?auto_29329 )
      ( MAKE-3PILE ?auto_29328 ?auto_29329 ?auto_29330 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29332 - BLOCK
      ?auto_29333 - BLOCK
      ?auto_29334 - BLOCK
    )
    :vars
    (
      ?auto_29335 - BLOCK
      ?auto_29336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29332 ) ( not ( = ?auto_29332 ?auto_29333 ) ) ( not ( = ?auto_29332 ?auto_29334 ) ) ( not ( = ?auto_29333 ?auto_29334 ) ) ( ON ?auto_29334 ?auto_29335 ) ( not ( = ?auto_29332 ?auto_29335 ) ) ( not ( = ?auto_29333 ?auto_29335 ) ) ( not ( = ?auto_29334 ?auto_29335 ) ) ( CLEAR ?auto_29332 ) ( ON ?auto_29333 ?auto_29334 ) ( CLEAR ?auto_29333 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29336 ) ( ON ?auto_29335 ?auto_29336 ) ( not ( = ?auto_29336 ?auto_29335 ) ) ( not ( = ?auto_29336 ?auto_29334 ) ) ( not ( = ?auto_29336 ?auto_29333 ) ) ( not ( = ?auto_29332 ?auto_29336 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29336 ?auto_29335 ?auto_29334 )
      ( MAKE-3PILE ?auto_29332 ?auto_29333 ?auto_29334 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29337 - BLOCK
      ?auto_29338 - BLOCK
      ?auto_29339 - BLOCK
    )
    :vars
    (
      ?auto_29340 - BLOCK
      ?auto_29341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29337 ?auto_29338 ) ) ( not ( = ?auto_29337 ?auto_29339 ) ) ( not ( = ?auto_29338 ?auto_29339 ) ) ( ON ?auto_29339 ?auto_29340 ) ( not ( = ?auto_29337 ?auto_29340 ) ) ( not ( = ?auto_29338 ?auto_29340 ) ) ( not ( = ?auto_29339 ?auto_29340 ) ) ( ON ?auto_29338 ?auto_29339 ) ( CLEAR ?auto_29338 ) ( ON-TABLE ?auto_29341 ) ( ON ?auto_29340 ?auto_29341 ) ( not ( = ?auto_29341 ?auto_29340 ) ) ( not ( = ?auto_29341 ?auto_29339 ) ) ( not ( = ?auto_29341 ?auto_29338 ) ) ( not ( = ?auto_29337 ?auto_29341 ) ) ( HOLDING ?auto_29337 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29337 )
      ( MAKE-3PILE ?auto_29337 ?auto_29338 ?auto_29339 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29342 - BLOCK
      ?auto_29343 - BLOCK
      ?auto_29344 - BLOCK
    )
    :vars
    (
      ?auto_29346 - BLOCK
      ?auto_29345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29342 ?auto_29343 ) ) ( not ( = ?auto_29342 ?auto_29344 ) ) ( not ( = ?auto_29343 ?auto_29344 ) ) ( ON ?auto_29344 ?auto_29346 ) ( not ( = ?auto_29342 ?auto_29346 ) ) ( not ( = ?auto_29343 ?auto_29346 ) ) ( not ( = ?auto_29344 ?auto_29346 ) ) ( ON ?auto_29343 ?auto_29344 ) ( ON-TABLE ?auto_29345 ) ( ON ?auto_29346 ?auto_29345 ) ( not ( = ?auto_29345 ?auto_29346 ) ) ( not ( = ?auto_29345 ?auto_29344 ) ) ( not ( = ?auto_29345 ?auto_29343 ) ) ( not ( = ?auto_29342 ?auto_29345 ) ) ( ON ?auto_29342 ?auto_29343 ) ( CLEAR ?auto_29342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29345 ?auto_29346 ?auto_29344 ?auto_29343 )
      ( MAKE-3PILE ?auto_29342 ?auto_29343 ?auto_29344 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29347 - BLOCK
      ?auto_29348 - BLOCK
      ?auto_29349 - BLOCK
    )
    :vars
    (
      ?auto_29350 - BLOCK
      ?auto_29351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29347 ?auto_29348 ) ) ( not ( = ?auto_29347 ?auto_29349 ) ) ( not ( = ?auto_29348 ?auto_29349 ) ) ( ON ?auto_29349 ?auto_29350 ) ( not ( = ?auto_29347 ?auto_29350 ) ) ( not ( = ?auto_29348 ?auto_29350 ) ) ( not ( = ?auto_29349 ?auto_29350 ) ) ( ON ?auto_29348 ?auto_29349 ) ( ON-TABLE ?auto_29351 ) ( ON ?auto_29350 ?auto_29351 ) ( not ( = ?auto_29351 ?auto_29350 ) ) ( not ( = ?auto_29351 ?auto_29349 ) ) ( not ( = ?auto_29351 ?auto_29348 ) ) ( not ( = ?auto_29347 ?auto_29351 ) ) ( HOLDING ?auto_29347 ) ( CLEAR ?auto_29348 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29351 ?auto_29350 ?auto_29349 ?auto_29348 ?auto_29347 )
      ( MAKE-3PILE ?auto_29347 ?auto_29348 ?auto_29349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29352 - BLOCK
      ?auto_29353 - BLOCK
      ?auto_29354 - BLOCK
    )
    :vars
    (
      ?auto_29356 - BLOCK
      ?auto_29355 - BLOCK
      ?auto_29357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29352 ?auto_29353 ) ) ( not ( = ?auto_29352 ?auto_29354 ) ) ( not ( = ?auto_29353 ?auto_29354 ) ) ( ON ?auto_29354 ?auto_29356 ) ( not ( = ?auto_29352 ?auto_29356 ) ) ( not ( = ?auto_29353 ?auto_29356 ) ) ( not ( = ?auto_29354 ?auto_29356 ) ) ( ON ?auto_29353 ?auto_29354 ) ( ON-TABLE ?auto_29355 ) ( ON ?auto_29356 ?auto_29355 ) ( not ( = ?auto_29355 ?auto_29356 ) ) ( not ( = ?auto_29355 ?auto_29354 ) ) ( not ( = ?auto_29355 ?auto_29353 ) ) ( not ( = ?auto_29352 ?auto_29355 ) ) ( CLEAR ?auto_29353 ) ( ON ?auto_29352 ?auto_29357 ) ( CLEAR ?auto_29352 ) ( HAND-EMPTY ) ( not ( = ?auto_29352 ?auto_29357 ) ) ( not ( = ?auto_29353 ?auto_29357 ) ) ( not ( = ?auto_29354 ?auto_29357 ) ) ( not ( = ?auto_29356 ?auto_29357 ) ) ( not ( = ?auto_29355 ?auto_29357 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29352 ?auto_29357 )
      ( MAKE-3PILE ?auto_29352 ?auto_29353 ?auto_29354 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29358 - BLOCK
      ?auto_29359 - BLOCK
      ?auto_29360 - BLOCK
    )
    :vars
    (
      ?auto_29363 - BLOCK
      ?auto_29362 - BLOCK
      ?auto_29361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29358 ?auto_29359 ) ) ( not ( = ?auto_29358 ?auto_29360 ) ) ( not ( = ?auto_29359 ?auto_29360 ) ) ( ON ?auto_29360 ?auto_29363 ) ( not ( = ?auto_29358 ?auto_29363 ) ) ( not ( = ?auto_29359 ?auto_29363 ) ) ( not ( = ?auto_29360 ?auto_29363 ) ) ( ON-TABLE ?auto_29362 ) ( ON ?auto_29363 ?auto_29362 ) ( not ( = ?auto_29362 ?auto_29363 ) ) ( not ( = ?auto_29362 ?auto_29360 ) ) ( not ( = ?auto_29362 ?auto_29359 ) ) ( not ( = ?auto_29358 ?auto_29362 ) ) ( ON ?auto_29358 ?auto_29361 ) ( CLEAR ?auto_29358 ) ( not ( = ?auto_29358 ?auto_29361 ) ) ( not ( = ?auto_29359 ?auto_29361 ) ) ( not ( = ?auto_29360 ?auto_29361 ) ) ( not ( = ?auto_29363 ?auto_29361 ) ) ( not ( = ?auto_29362 ?auto_29361 ) ) ( HOLDING ?auto_29359 ) ( CLEAR ?auto_29360 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29362 ?auto_29363 ?auto_29360 ?auto_29359 )
      ( MAKE-3PILE ?auto_29358 ?auto_29359 ?auto_29360 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29364 - BLOCK
      ?auto_29365 - BLOCK
      ?auto_29366 - BLOCK
    )
    :vars
    (
      ?auto_29368 - BLOCK
      ?auto_29367 - BLOCK
      ?auto_29369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29364 ?auto_29365 ) ) ( not ( = ?auto_29364 ?auto_29366 ) ) ( not ( = ?auto_29365 ?auto_29366 ) ) ( ON ?auto_29366 ?auto_29368 ) ( not ( = ?auto_29364 ?auto_29368 ) ) ( not ( = ?auto_29365 ?auto_29368 ) ) ( not ( = ?auto_29366 ?auto_29368 ) ) ( ON-TABLE ?auto_29367 ) ( ON ?auto_29368 ?auto_29367 ) ( not ( = ?auto_29367 ?auto_29368 ) ) ( not ( = ?auto_29367 ?auto_29366 ) ) ( not ( = ?auto_29367 ?auto_29365 ) ) ( not ( = ?auto_29364 ?auto_29367 ) ) ( ON ?auto_29364 ?auto_29369 ) ( not ( = ?auto_29364 ?auto_29369 ) ) ( not ( = ?auto_29365 ?auto_29369 ) ) ( not ( = ?auto_29366 ?auto_29369 ) ) ( not ( = ?auto_29368 ?auto_29369 ) ) ( not ( = ?auto_29367 ?auto_29369 ) ) ( CLEAR ?auto_29366 ) ( ON ?auto_29365 ?auto_29364 ) ( CLEAR ?auto_29365 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29369 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29369 ?auto_29364 )
      ( MAKE-3PILE ?auto_29364 ?auto_29365 ?auto_29366 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29370 - BLOCK
      ?auto_29371 - BLOCK
      ?auto_29372 - BLOCK
    )
    :vars
    (
      ?auto_29374 - BLOCK
      ?auto_29373 - BLOCK
      ?auto_29375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29370 ?auto_29371 ) ) ( not ( = ?auto_29370 ?auto_29372 ) ) ( not ( = ?auto_29371 ?auto_29372 ) ) ( not ( = ?auto_29370 ?auto_29374 ) ) ( not ( = ?auto_29371 ?auto_29374 ) ) ( not ( = ?auto_29372 ?auto_29374 ) ) ( ON-TABLE ?auto_29373 ) ( ON ?auto_29374 ?auto_29373 ) ( not ( = ?auto_29373 ?auto_29374 ) ) ( not ( = ?auto_29373 ?auto_29372 ) ) ( not ( = ?auto_29373 ?auto_29371 ) ) ( not ( = ?auto_29370 ?auto_29373 ) ) ( ON ?auto_29370 ?auto_29375 ) ( not ( = ?auto_29370 ?auto_29375 ) ) ( not ( = ?auto_29371 ?auto_29375 ) ) ( not ( = ?auto_29372 ?auto_29375 ) ) ( not ( = ?auto_29374 ?auto_29375 ) ) ( not ( = ?auto_29373 ?auto_29375 ) ) ( ON ?auto_29371 ?auto_29370 ) ( CLEAR ?auto_29371 ) ( ON-TABLE ?auto_29375 ) ( HOLDING ?auto_29372 ) ( CLEAR ?auto_29374 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29373 ?auto_29374 ?auto_29372 )
      ( MAKE-3PILE ?auto_29370 ?auto_29371 ?auto_29372 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29376 - BLOCK
      ?auto_29377 - BLOCK
      ?auto_29378 - BLOCK
    )
    :vars
    (
      ?auto_29379 - BLOCK
      ?auto_29381 - BLOCK
      ?auto_29380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29376 ?auto_29377 ) ) ( not ( = ?auto_29376 ?auto_29378 ) ) ( not ( = ?auto_29377 ?auto_29378 ) ) ( not ( = ?auto_29376 ?auto_29379 ) ) ( not ( = ?auto_29377 ?auto_29379 ) ) ( not ( = ?auto_29378 ?auto_29379 ) ) ( ON-TABLE ?auto_29381 ) ( ON ?auto_29379 ?auto_29381 ) ( not ( = ?auto_29381 ?auto_29379 ) ) ( not ( = ?auto_29381 ?auto_29378 ) ) ( not ( = ?auto_29381 ?auto_29377 ) ) ( not ( = ?auto_29376 ?auto_29381 ) ) ( ON ?auto_29376 ?auto_29380 ) ( not ( = ?auto_29376 ?auto_29380 ) ) ( not ( = ?auto_29377 ?auto_29380 ) ) ( not ( = ?auto_29378 ?auto_29380 ) ) ( not ( = ?auto_29379 ?auto_29380 ) ) ( not ( = ?auto_29381 ?auto_29380 ) ) ( ON ?auto_29377 ?auto_29376 ) ( ON-TABLE ?auto_29380 ) ( CLEAR ?auto_29379 ) ( ON ?auto_29378 ?auto_29377 ) ( CLEAR ?auto_29378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29380 ?auto_29376 ?auto_29377 )
      ( MAKE-3PILE ?auto_29376 ?auto_29377 ?auto_29378 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29382 - BLOCK
      ?auto_29383 - BLOCK
      ?auto_29384 - BLOCK
    )
    :vars
    (
      ?auto_29387 - BLOCK
      ?auto_29385 - BLOCK
      ?auto_29386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29382 ?auto_29383 ) ) ( not ( = ?auto_29382 ?auto_29384 ) ) ( not ( = ?auto_29383 ?auto_29384 ) ) ( not ( = ?auto_29382 ?auto_29387 ) ) ( not ( = ?auto_29383 ?auto_29387 ) ) ( not ( = ?auto_29384 ?auto_29387 ) ) ( ON-TABLE ?auto_29385 ) ( not ( = ?auto_29385 ?auto_29387 ) ) ( not ( = ?auto_29385 ?auto_29384 ) ) ( not ( = ?auto_29385 ?auto_29383 ) ) ( not ( = ?auto_29382 ?auto_29385 ) ) ( ON ?auto_29382 ?auto_29386 ) ( not ( = ?auto_29382 ?auto_29386 ) ) ( not ( = ?auto_29383 ?auto_29386 ) ) ( not ( = ?auto_29384 ?auto_29386 ) ) ( not ( = ?auto_29387 ?auto_29386 ) ) ( not ( = ?auto_29385 ?auto_29386 ) ) ( ON ?auto_29383 ?auto_29382 ) ( ON-TABLE ?auto_29386 ) ( ON ?auto_29384 ?auto_29383 ) ( CLEAR ?auto_29384 ) ( HOLDING ?auto_29387 ) ( CLEAR ?auto_29385 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29385 ?auto_29387 )
      ( MAKE-3PILE ?auto_29382 ?auto_29383 ?auto_29384 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29388 - BLOCK
      ?auto_29389 - BLOCK
      ?auto_29390 - BLOCK
    )
    :vars
    (
      ?auto_29391 - BLOCK
      ?auto_29393 - BLOCK
      ?auto_29392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29388 ?auto_29389 ) ) ( not ( = ?auto_29388 ?auto_29390 ) ) ( not ( = ?auto_29389 ?auto_29390 ) ) ( not ( = ?auto_29388 ?auto_29391 ) ) ( not ( = ?auto_29389 ?auto_29391 ) ) ( not ( = ?auto_29390 ?auto_29391 ) ) ( ON-TABLE ?auto_29393 ) ( not ( = ?auto_29393 ?auto_29391 ) ) ( not ( = ?auto_29393 ?auto_29390 ) ) ( not ( = ?auto_29393 ?auto_29389 ) ) ( not ( = ?auto_29388 ?auto_29393 ) ) ( ON ?auto_29388 ?auto_29392 ) ( not ( = ?auto_29388 ?auto_29392 ) ) ( not ( = ?auto_29389 ?auto_29392 ) ) ( not ( = ?auto_29390 ?auto_29392 ) ) ( not ( = ?auto_29391 ?auto_29392 ) ) ( not ( = ?auto_29393 ?auto_29392 ) ) ( ON ?auto_29389 ?auto_29388 ) ( ON-TABLE ?auto_29392 ) ( ON ?auto_29390 ?auto_29389 ) ( CLEAR ?auto_29393 ) ( ON ?auto_29391 ?auto_29390 ) ( CLEAR ?auto_29391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29392 ?auto_29388 ?auto_29389 ?auto_29390 )
      ( MAKE-3PILE ?auto_29388 ?auto_29389 ?auto_29390 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29394 - BLOCK
      ?auto_29395 - BLOCK
      ?auto_29396 - BLOCK
    )
    :vars
    (
      ?auto_29398 - BLOCK
      ?auto_29397 - BLOCK
      ?auto_29399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29394 ?auto_29395 ) ) ( not ( = ?auto_29394 ?auto_29396 ) ) ( not ( = ?auto_29395 ?auto_29396 ) ) ( not ( = ?auto_29394 ?auto_29398 ) ) ( not ( = ?auto_29395 ?auto_29398 ) ) ( not ( = ?auto_29396 ?auto_29398 ) ) ( not ( = ?auto_29397 ?auto_29398 ) ) ( not ( = ?auto_29397 ?auto_29396 ) ) ( not ( = ?auto_29397 ?auto_29395 ) ) ( not ( = ?auto_29394 ?auto_29397 ) ) ( ON ?auto_29394 ?auto_29399 ) ( not ( = ?auto_29394 ?auto_29399 ) ) ( not ( = ?auto_29395 ?auto_29399 ) ) ( not ( = ?auto_29396 ?auto_29399 ) ) ( not ( = ?auto_29398 ?auto_29399 ) ) ( not ( = ?auto_29397 ?auto_29399 ) ) ( ON ?auto_29395 ?auto_29394 ) ( ON-TABLE ?auto_29399 ) ( ON ?auto_29396 ?auto_29395 ) ( ON ?auto_29398 ?auto_29396 ) ( CLEAR ?auto_29398 ) ( HOLDING ?auto_29397 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29397 )
      ( MAKE-3PILE ?auto_29394 ?auto_29395 ?auto_29396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29400 - BLOCK
      ?auto_29401 - BLOCK
      ?auto_29402 - BLOCK
    )
    :vars
    (
      ?auto_29403 - BLOCK
      ?auto_29404 - BLOCK
      ?auto_29405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29400 ?auto_29401 ) ) ( not ( = ?auto_29400 ?auto_29402 ) ) ( not ( = ?auto_29401 ?auto_29402 ) ) ( not ( = ?auto_29400 ?auto_29403 ) ) ( not ( = ?auto_29401 ?auto_29403 ) ) ( not ( = ?auto_29402 ?auto_29403 ) ) ( not ( = ?auto_29404 ?auto_29403 ) ) ( not ( = ?auto_29404 ?auto_29402 ) ) ( not ( = ?auto_29404 ?auto_29401 ) ) ( not ( = ?auto_29400 ?auto_29404 ) ) ( ON ?auto_29400 ?auto_29405 ) ( not ( = ?auto_29400 ?auto_29405 ) ) ( not ( = ?auto_29401 ?auto_29405 ) ) ( not ( = ?auto_29402 ?auto_29405 ) ) ( not ( = ?auto_29403 ?auto_29405 ) ) ( not ( = ?auto_29404 ?auto_29405 ) ) ( ON ?auto_29401 ?auto_29400 ) ( ON-TABLE ?auto_29405 ) ( ON ?auto_29402 ?auto_29401 ) ( ON ?auto_29403 ?auto_29402 ) ( ON ?auto_29404 ?auto_29403 ) ( CLEAR ?auto_29404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29405 ?auto_29400 ?auto_29401 ?auto_29402 ?auto_29403 )
      ( MAKE-3PILE ?auto_29400 ?auto_29401 ?auto_29402 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29407 - BLOCK
    )
    :vars
    (
      ?auto_29408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29408 ?auto_29407 ) ( CLEAR ?auto_29408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29407 ) ( not ( = ?auto_29407 ?auto_29408 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29408 ?auto_29407 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29409 - BLOCK
    )
    :vars
    (
      ?auto_29410 - BLOCK
      ?auto_29411 - BLOCK
      ?auto_29412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29410 ?auto_29409 ) ( CLEAR ?auto_29410 ) ( ON-TABLE ?auto_29409 ) ( not ( = ?auto_29409 ?auto_29410 ) ) ( HOLDING ?auto_29411 ) ( CLEAR ?auto_29412 ) ( not ( = ?auto_29409 ?auto_29411 ) ) ( not ( = ?auto_29409 ?auto_29412 ) ) ( not ( = ?auto_29410 ?auto_29411 ) ) ( not ( = ?auto_29410 ?auto_29412 ) ) ( not ( = ?auto_29411 ?auto_29412 ) ) )
    :subtasks
    ( ( !STACK ?auto_29411 ?auto_29412 )
      ( MAKE-1PILE ?auto_29409 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29413 - BLOCK
    )
    :vars
    (
      ?auto_29416 - BLOCK
      ?auto_29414 - BLOCK
      ?auto_29415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29416 ?auto_29413 ) ( ON-TABLE ?auto_29413 ) ( not ( = ?auto_29413 ?auto_29416 ) ) ( CLEAR ?auto_29414 ) ( not ( = ?auto_29413 ?auto_29415 ) ) ( not ( = ?auto_29413 ?auto_29414 ) ) ( not ( = ?auto_29416 ?auto_29415 ) ) ( not ( = ?auto_29416 ?auto_29414 ) ) ( not ( = ?auto_29415 ?auto_29414 ) ) ( ON ?auto_29415 ?auto_29416 ) ( CLEAR ?auto_29415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29413 ?auto_29416 )
      ( MAKE-1PILE ?auto_29413 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29417 - BLOCK
    )
    :vars
    (
      ?auto_29419 - BLOCK
      ?auto_29420 - BLOCK
      ?auto_29418 - BLOCK
      ?auto_29421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29419 ?auto_29417 ) ( ON-TABLE ?auto_29417 ) ( not ( = ?auto_29417 ?auto_29419 ) ) ( not ( = ?auto_29417 ?auto_29420 ) ) ( not ( = ?auto_29417 ?auto_29418 ) ) ( not ( = ?auto_29419 ?auto_29420 ) ) ( not ( = ?auto_29419 ?auto_29418 ) ) ( not ( = ?auto_29420 ?auto_29418 ) ) ( ON ?auto_29420 ?auto_29419 ) ( CLEAR ?auto_29420 ) ( HOLDING ?auto_29418 ) ( CLEAR ?auto_29421 ) ( ON-TABLE ?auto_29421 ) ( not ( = ?auto_29421 ?auto_29418 ) ) ( not ( = ?auto_29417 ?auto_29421 ) ) ( not ( = ?auto_29419 ?auto_29421 ) ) ( not ( = ?auto_29420 ?auto_29421 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29421 ?auto_29418 )
      ( MAKE-1PILE ?auto_29417 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29422 - BLOCK
    )
    :vars
    (
      ?auto_29423 - BLOCK
      ?auto_29424 - BLOCK
      ?auto_29425 - BLOCK
      ?auto_29426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29423 ?auto_29422 ) ( ON-TABLE ?auto_29422 ) ( not ( = ?auto_29422 ?auto_29423 ) ) ( not ( = ?auto_29422 ?auto_29424 ) ) ( not ( = ?auto_29422 ?auto_29425 ) ) ( not ( = ?auto_29423 ?auto_29424 ) ) ( not ( = ?auto_29423 ?auto_29425 ) ) ( not ( = ?auto_29424 ?auto_29425 ) ) ( ON ?auto_29424 ?auto_29423 ) ( CLEAR ?auto_29426 ) ( ON-TABLE ?auto_29426 ) ( not ( = ?auto_29426 ?auto_29425 ) ) ( not ( = ?auto_29422 ?auto_29426 ) ) ( not ( = ?auto_29423 ?auto_29426 ) ) ( not ( = ?auto_29424 ?auto_29426 ) ) ( ON ?auto_29425 ?auto_29424 ) ( CLEAR ?auto_29425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29422 ?auto_29423 ?auto_29424 )
      ( MAKE-1PILE ?auto_29422 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29427 - BLOCK
    )
    :vars
    (
      ?auto_29428 - BLOCK
      ?auto_29429 - BLOCK
      ?auto_29431 - BLOCK
      ?auto_29430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29428 ?auto_29427 ) ( ON-TABLE ?auto_29427 ) ( not ( = ?auto_29427 ?auto_29428 ) ) ( not ( = ?auto_29427 ?auto_29429 ) ) ( not ( = ?auto_29427 ?auto_29431 ) ) ( not ( = ?auto_29428 ?auto_29429 ) ) ( not ( = ?auto_29428 ?auto_29431 ) ) ( not ( = ?auto_29429 ?auto_29431 ) ) ( ON ?auto_29429 ?auto_29428 ) ( not ( = ?auto_29430 ?auto_29431 ) ) ( not ( = ?auto_29427 ?auto_29430 ) ) ( not ( = ?auto_29428 ?auto_29430 ) ) ( not ( = ?auto_29429 ?auto_29430 ) ) ( ON ?auto_29431 ?auto_29429 ) ( CLEAR ?auto_29431 ) ( HOLDING ?auto_29430 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29430 )
      ( MAKE-1PILE ?auto_29427 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29432 - BLOCK
    )
    :vars
    (
      ?auto_29436 - BLOCK
      ?auto_29435 - BLOCK
      ?auto_29434 - BLOCK
      ?auto_29433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29436 ?auto_29432 ) ( ON-TABLE ?auto_29432 ) ( not ( = ?auto_29432 ?auto_29436 ) ) ( not ( = ?auto_29432 ?auto_29435 ) ) ( not ( = ?auto_29432 ?auto_29434 ) ) ( not ( = ?auto_29436 ?auto_29435 ) ) ( not ( = ?auto_29436 ?auto_29434 ) ) ( not ( = ?auto_29435 ?auto_29434 ) ) ( ON ?auto_29435 ?auto_29436 ) ( not ( = ?auto_29433 ?auto_29434 ) ) ( not ( = ?auto_29432 ?auto_29433 ) ) ( not ( = ?auto_29436 ?auto_29433 ) ) ( not ( = ?auto_29435 ?auto_29433 ) ) ( ON ?auto_29434 ?auto_29435 ) ( ON ?auto_29433 ?auto_29434 ) ( CLEAR ?auto_29433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29432 ?auto_29436 ?auto_29435 ?auto_29434 )
      ( MAKE-1PILE ?auto_29432 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29437 - BLOCK
    )
    :vars
    (
      ?auto_29439 - BLOCK
      ?auto_29438 - BLOCK
      ?auto_29441 - BLOCK
      ?auto_29440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29439 ?auto_29437 ) ( ON-TABLE ?auto_29437 ) ( not ( = ?auto_29437 ?auto_29439 ) ) ( not ( = ?auto_29437 ?auto_29438 ) ) ( not ( = ?auto_29437 ?auto_29441 ) ) ( not ( = ?auto_29439 ?auto_29438 ) ) ( not ( = ?auto_29439 ?auto_29441 ) ) ( not ( = ?auto_29438 ?auto_29441 ) ) ( ON ?auto_29438 ?auto_29439 ) ( not ( = ?auto_29440 ?auto_29441 ) ) ( not ( = ?auto_29437 ?auto_29440 ) ) ( not ( = ?auto_29439 ?auto_29440 ) ) ( not ( = ?auto_29438 ?auto_29440 ) ) ( ON ?auto_29441 ?auto_29438 ) ( HOLDING ?auto_29440 ) ( CLEAR ?auto_29441 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29437 ?auto_29439 ?auto_29438 ?auto_29441 ?auto_29440 )
      ( MAKE-1PILE ?auto_29437 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29442 - BLOCK
    )
    :vars
    (
      ?auto_29445 - BLOCK
      ?auto_29443 - BLOCK
      ?auto_29446 - BLOCK
      ?auto_29444 - BLOCK
      ?auto_29447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29445 ?auto_29442 ) ( ON-TABLE ?auto_29442 ) ( not ( = ?auto_29442 ?auto_29445 ) ) ( not ( = ?auto_29442 ?auto_29443 ) ) ( not ( = ?auto_29442 ?auto_29446 ) ) ( not ( = ?auto_29445 ?auto_29443 ) ) ( not ( = ?auto_29445 ?auto_29446 ) ) ( not ( = ?auto_29443 ?auto_29446 ) ) ( ON ?auto_29443 ?auto_29445 ) ( not ( = ?auto_29444 ?auto_29446 ) ) ( not ( = ?auto_29442 ?auto_29444 ) ) ( not ( = ?auto_29445 ?auto_29444 ) ) ( not ( = ?auto_29443 ?auto_29444 ) ) ( ON ?auto_29446 ?auto_29443 ) ( CLEAR ?auto_29446 ) ( ON ?auto_29444 ?auto_29447 ) ( CLEAR ?auto_29444 ) ( HAND-EMPTY ) ( not ( = ?auto_29442 ?auto_29447 ) ) ( not ( = ?auto_29445 ?auto_29447 ) ) ( not ( = ?auto_29443 ?auto_29447 ) ) ( not ( = ?auto_29446 ?auto_29447 ) ) ( not ( = ?auto_29444 ?auto_29447 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29444 ?auto_29447 )
      ( MAKE-1PILE ?auto_29442 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29448 - BLOCK
    )
    :vars
    (
      ?auto_29452 - BLOCK
      ?auto_29449 - BLOCK
      ?auto_29450 - BLOCK
      ?auto_29451 - BLOCK
      ?auto_29453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29452 ?auto_29448 ) ( ON-TABLE ?auto_29448 ) ( not ( = ?auto_29448 ?auto_29452 ) ) ( not ( = ?auto_29448 ?auto_29449 ) ) ( not ( = ?auto_29448 ?auto_29450 ) ) ( not ( = ?auto_29452 ?auto_29449 ) ) ( not ( = ?auto_29452 ?auto_29450 ) ) ( not ( = ?auto_29449 ?auto_29450 ) ) ( ON ?auto_29449 ?auto_29452 ) ( not ( = ?auto_29451 ?auto_29450 ) ) ( not ( = ?auto_29448 ?auto_29451 ) ) ( not ( = ?auto_29452 ?auto_29451 ) ) ( not ( = ?auto_29449 ?auto_29451 ) ) ( ON ?auto_29451 ?auto_29453 ) ( CLEAR ?auto_29451 ) ( not ( = ?auto_29448 ?auto_29453 ) ) ( not ( = ?auto_29452 ?auto_29453 ) ) ( not ( = ?auto_29449 ?auto_29453 ) ) ( not ( = ?auto_29450 ?auto_29453 ) ) ( not ( = ?auto_29451 ?auto_29453 ) ) ( HOLDING ?auto_29450 ) ( CLEAR ?auto_29449 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29448 ?auto_29452 ?auto_29449 ?auto_29450 )
      ( MAKE-1PILE ?auto_29448 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29454 - BLOCK
    )
    :vars
    (
      ?auto_29459 - BLOCK
      ?auto_29457 - BLOCK
      ?auto_29458 - BLOCK
      ?auto_29456 - BLOCK
      ?auto_29455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29459 ?auto_29454 ) ( ON-TABLE ?auto_29454 ) ( not ( = ?auto_29454 ?auto_29459 ) ) ( not ( = ?auto_29454 ?auto_29457 ) ) ( not ( = ?auto_29454 ?auto_29458 ) ) ( not ( = ?auto_29459 ?auto_29457 ) ) ( not ( = ?auto_29459 ?auto_29458 ) ) ( not ( = ?auto_29457 ?auto_29458 ) ) ( ON ?auto_29457 ?auto_29459 ) ( not ( = ?auto_29456 ?auto_29458 ) ) ( not ( = ?auto_29454 ?auto_29456 ) ) ( not ( = ?auto_29459 ?auto_29456 ) ) ( not ( = ?auto_29457 ?auto_29456 ) ) ( ON ?auto_29456 ?auto_29455 ) ( not ( = ?auto_29454 ?auto_29455 ) ) ( not ( = ?auto_29459 ?auto_29455 ) ) ( not ( = ?auto_29457 ?auto_29455 ) ) ( not ( = ?auto_29458 ?auto_29455 ) ) ( not ( = ?auto_29456 ?auto_29455 ) ) ( CLEAR ?auto_29457 ) ( ON ?auto_29458 ?auto_29456 ) ( CLEAR ?auto_29458 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29455 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29455 ?auto_29456 )
      ( MAKE-1PILE ?auto_29454 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29460 - BLOCK
    )
    :vars
    (
      ?auto_29464 - BLOCK
      ?auto_29461 - BLOCK
      ?auto_29465 - BLOCK
      ?auto_29462 - BLOCK
      ?auto_29463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29464 ?auto_29460 ) ( ON-TABLE ?auto_29460 ) ( not ( = ?auto_29460 ?auto_29464 ) ) ( not ( = ?auto_29460 ?auto_29461 ) ) ( not ( = ?auto_29460 ?auto_29465 ) ) ( not ( = ?auto_29464 ?auto_29461 ) ) ( not ( = ?auto_29464 ?auto_29465 ) ) ( not ( = ?auto_29461 ?auto_29465 ) ) ( not ( = ?auto_29462 ?auto_29465 ) ) ( not ( = ?auto_29460 ?auto_29462 ) ) ( not ( = ?auto_29464 ?auto_29462 ) ) ( not ( = ?auto_29461 ?auto_29462 ) ) ( ON ?auto_29462 ?auto_29463 ) ( not ( = ?auto_29460 ?auto_29463 ) ) ( not ( = ?auto_29464 ?auto_29463 ) ) ( not ( = ?auto_29461 ?auto_29463 ) ) ( not ( = ?auto_29465 ?auto_29463 ) ) ( not ( = ?auto_29462 ?auto_29463 ) ) ( ON ?auto_29465 ?auto_29462 ) ( CLEAR ?auto_29465 ) ( ON-TABLE ?auto_29463 ) ( HOLDING ?auto_29461 ) ( CLEAR ?auto_29464 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29460 ?auto_29464 ?auto_29461 )
      ( MAKE-1PILE ?auto_29460 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29466 - BLOCK
    )
    :vars
    (
      ?auto_29470 - BLOCK
      ?auto_29467 - BLOCK
      ?auto_29468 - BLOCK
      ?auto_29469 - BLOCK
      ?auto_29471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29470 ?auto_29466 ) ( ON-TABLE ?auto_29466 ) ( not ( = ?auto_29466 ?auto_29470 ) ) ( not ( = ?auto_29466 ?auto_29467 ) ) ( not ( = ?auto_29466 ?auto_29468 ) ) ( not ( = ?auto_29470 ?auto_29467 ) ) ( not ( = ?auto_29470 ?auto_29468 ) ) ( not ( = ?auto_29467 ?auto_29468 ) ) ( not ( = ?auto_29469 ?auto_29468 ) ) ( not ( = ?auto_29466 ?auto_29469 ) ) ( not ( = ?auto_29470 ?auto_29469 ) ) ( not ( = ?auto_29467 ?auto_29469 ) ) ( ON ?auto_29469 ?auto_29471 ) ( not ( = ?auto_29466 ?auto_29471 ) ) ( not ( = ?auto_29470 ?auto_29471 ) ) ( not ( = ?auto_29467 ?auto_29471 ) ) ( not ( = ?auto_29468 ?auto_29471 ) ) ( not ( = ?auto_29469 ?auto_29471 ) ) ( ON ?auto_29468 ?auto_29469 ) ( ON-TABLE ?auto_29471 ) ( CLEAR ?auto_29470 ) ( ON ?auto_29467 ?auto_29468 ) ( CLEAR ?auto_29467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29471 ?auto_29469 ?auto_29468 )
      ( MAKE-1PILE ?auto_29466 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29484 - BLOCK
    )
    :vars
    (
      ?auto_29488 - BLOCK
      ?auto_29485 - BLOCK
      ?auto_29486 - BLOCK
      ?auto_29489 - BLOCK
      ?auto_29487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29484 ?auto_29488 ) ) ( not ( = ?auto_29484 ?auto_29485 ) ) ( not ( = ?auto_29484 ?auto_29486 ) ) ( not ( = ?auto_29488 ?auto_29485 ) ) ( not ( = ?auto_29488 ?auto_29486 ) ) ( not ( = ?auto_29485 ?auto_29486 ) ) ( not ( = ?auto_29489 ?auto_29486 ) ) ( not ( = ?auto_29484 ?auto_29489 ) ) ( not ( = ?auto_29488 ?auto_29489 ) ) ( not ( = ?auto_29485 ?auto_29489 ) ) ( ON ?auto_29489 ?auto_29487 ) ( not ( = ?auto_29484 ?auto_29487 ) ) ( not ( = ?auto_29488 ?auto_29487 ) ) ( not ( = ?auto_29485 ?auto_29487 ) ) ( not ( = ?auto_29486 ?auto_29487 ) ) ( not ( = ?auto_29489 ?auto_29487 ) ) ( ON ?auto_29486 ?auto_29489 ) ( ON-TABLE ?auto_29487 ) ( ON ?auto_29485 ?auto_29486 ) ( ON ?auto_29488 ?auto_29485 ) ( CLEAR ?auto_29488 ) ( HOLDING ?auto_29484 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29484 ?auto_29488 )
      ( MAKE-1PILE ?auto_29484 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29490 - BLOCK
    )
    :vars
    (
      ?auto_29493 - BLOCK
      ?auto_29495 - BLOCK
      ?auto_29494 - BLOCK
      ?auto_29492 - BLOCK
      ?auto_29491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29490 ?auto_29493 ) ) ( not ( = ?auto_29490 ?auto_29495 ) ) ( not ( = ?auto_29490 ?auto_29494 ) ) ( not ( = ?auto_29493 ?auto_29495 ) ) ( not ( = ?auto_29493 ?auto_29494 ) ) ( not ( = ?auto_29495 ?auto_29494 ) ) ( not ( = ?auto_29492 ?auto_29494 ) ) ( not ( = ?auto_29490 ?auto_29492 ) ) ( not ( = ?auto_29493 ?auto_29492 ) ) ( not ( = ?auto_29495 ?auto_29492 ) ) ( ON ?auto_29492 ?auto_29491 ) ( not ( = ?auto_29490 ?auto_29491 ) ) ( not ( = ?auto_29493 ?auto_29491 ) ) ( not ( = ?auto_29495 ?auto_29491 ) ) ( not ( = ?auto_29494 ?auto_29491 ) ) ( not ( = ?auto_29492 ?auto_29491 ) ) ( ON ?auto_29494 ?auto_29492 ) ( ON-TABLE ?auto_29491 ) ( ON ?auto_29495 ?auto_29494 ) ( ON ?auto_29493 ?auto_29495 ) ( ON ?auto_29490 ?auto_29493 ) ( CLEAR ?auto_29490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29491 ?auto_29492 ?auto_29494 ?auto_29495 ?auto_29493 )
      ( MAKE-1PILE ?auto_29490 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29500 - BLOCK
      ?auto_29501 - BLOCK
      ?auto_29502 - BLOCK
      ?auto_29503 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29503 ) ( CLEAR ?auto_29502 ) ( ON-TABLE ?auto_29500 ) ( ON ?auto_29501 ?auto_29500 ) ( ON ?auto_29502 ?auto_29501 ) ( not ( = ?auto_29500 ?auto_29501 ) ) ( not ( = ?auto_29500 ?auto_29502 ) ) ( not ( = ?auto_29500 ?auto_29503 ) ) ( not ( = ?auto_29501 ?auto_29502 ) ) ( not ( = ?auto_29501 ?auto_29503 ) ) ( not ( = ?auto_29502 ?auto_29503 ) ) )
    :subtasks
    ( ( !STACK ?auto_29503 ?auto_29502 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29504 - BLOCK
      ?auto_29505 - BLOCK
      ?auto_29506 - BLOCK
      ?auto_29507 - BLOCK
    )
    :vars
    (
      ?auto_29508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29506 ) ( ON-TABLE ?auto_29504 ) ( ON ?auto_29505 ?auto_29504 ) ( ON ?auto_29506 ?auto_29505 ) ( not ( = ?auto_29504 ?auto_29505 ) ) ( not ( = ?auto_29504 ?auto_29506 ) ) ( not ( = ?auto_29504 ?auto_29507 ) ) ( not ( = ?auto_29505 ?auto_29506 ) ) ( not ( = ?auto_29505 ?auto_29507 ) ) ( not ( = ?auto_29506 ?auto_29507 ) ) ( ON ?auto_29507 ?auto_29508 ) ( CLEAR ?auto_29507 ) ( HAND-EMPTY ) ( not ( = ?auto_29504 ?auto_29508 ) ) ( not ( = ?auto_29505 ?auto_29508 ) ) ( not ( = ?auto_29506 ?auto_29508 ) ) ( not ( = ?auto_29507 ?auto_29508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29507 ?auto_29508 )
      ( MAKE-4PILE ?auto_29504 ?auto_29505 ?auto_29506 ?auto_29507 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29509 - BLOCK
      ?auto_29510 - BLOCK
      ?auto_29511 - BLOCK
      ?auto_29512 - BLOCK
    )
    :vars
    (
      ?auto_29513 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29509 ) ( ON ?auto_29510 ?auto_29509 ) ( not ( = ?auto_29509 ?auto_29510 ) ) ( not ( = ?auto_29509 ?auto_29511 ) ) ( not ( = ?auto_29509 ?auto_29512 ) ) ( not ( = ?auto_29510 ?auto_29511 ) ) ( not ( = ?auto_29510 ?auto_29512 ) ) ( not ( = ?auto_29511 ?auto_29512 ) ) ( ON ?auto_29512 ?auto_29513 ) ( CLEAR ?auto_29512 ) ( not ( = ?auto_29509 ?auto_29513 ) ) ( not ( = ?auto_29510 ?auto_29513 ) ) ( not ( = ?auto_29511 ?auto_29513 ) ) ( not ( = ?auto_29512 ?auto_29513 ) ) ( HOLDING ?auto_29511 ) ( CLEAR ?auto_29510 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29509 ?auto_29510 ?auto_29511 )
      ( MAKE-4PILE ?auto_29509 ?auto_29510 ?auto_29511 ?auto_29512 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29514 - BLOCK
      ?auto_29515 - BLOCK
      ?auto_29516 - BLOCK
      ?auto_29517 - BLOCK
    )
    :vars
    (
      ?auto_29518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29514 ) ( ON ?auto_29515 ?auto_29514 ) ( not ( = ?auto_29514 ?auto_29515 ) ) ( not ( = ?auto_29514 ?auto_29516 ) ) ( not ( = ?auto_29514 ?auto_29517 ) ) ( not ( = ?auto_29515 ?auto_29516 ) ) ( not ( = ?auto_29515 ?auto_29517 ) ) ( not ( = ?auto_29516 ?auto_29517 ) ) ( ON ?auto_29517 ?auto_29518 ) ( not ( = ?auto_29514 ?auto_29518 ) ) ( not ( = ?auto_29515 ?auto_29518 ) ) ( not ( = ?auto_29516 ?auto_29518 ) ) ( not ( = ?auto_29517 ?auto_29518 ) ) ( CLEAR ?auto_29515 ) ( ON ?auto_29516 ?auto_29517 ) ( CLEAR ?auto_29516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29518 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29518 ?auto_29517 )
      ( MAKE-4PILE ?auto_29514 ?auto_29515 ?auto_29516 ?auto_29517 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29519 - BLOCK
      ?auto_29520 - BLOCK
      ?auto_29521 - BLOCK
      ?auto_29522 - BLOCK
    )
    :vars
    (
      ?auto_29523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29519 ) ( not ( = ?auto_29519 ?auto_29520 ) ) ( not ( = ?auto_29519 ?auto_29521 ) ) ( not ( = ?auto_29519 ?auto_29522 ) ) ( not ( = ?auto_29520 ?auto_29521 ) ) ( not ( = ?auto_29520 ?auto_29522 ) ) ( not ( = ?auto_29521 ?auto_29522 ) ) ( ON ?auto_29522 ?auto_29523 ) ( not ( = ?auto_29519 ?auto_29523 ) ) ( not ( = ?auto_29520 ?auto_29523 ) ) ( not ( = ?auto_29521 ?auto_29523 ) ) ( not ( = ?auto_29522 ?auto_29523 ) ) ( ON ?auto_29521 ?auto_29522 ) ( CLEAR ?auto_29521 ) ( ON-TABLE ?auto_29523 ) ( HOLDING ?auto_29520 ) ( CLEAR ?auto_29519 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29519 ?auto_29520 )
      ( MAKE-4PILE ?auto_29519 ?auto_29520 ?auto_29521 ?auto_29522 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29524 - BLOCK
      ?auto_29525 - BLOCK
      ?auto_29526 - BLOCK
      ?auto_29527 - BLOCK
    )
    :vars
    (
      ?auto_29528 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29524 ) ( not ( = ?auto_29524 ?auto_29525 ) ) ( not ( = ?auto_29524 ?auto_29526 ) ) ( not ( = ?auto_29524 ?auto_29527 ) ) ( not ( = ?auto_29525 ?auto_29526 ) ) ( not ( = ?auto_29525 ?auto_29527 ) ) ( not ( = ?auto_29526 ?auto_29527 ) ) ( ON ?auto_29527 ?auto_29528 ) ( not ( = ?auto_29524 ?auto_29528 ) ) ( not ( = ?auto_29525 ?auto_29528 ) ) ( not ( = ?auto_29526 ?auto_29528 ) ) ( not ( = ?auto_29527 ?auto_29528 ) ) ( ON ?auto_29526 ?auto_29527 ) ( ON-TABLE ?auto_29528 ) ( CLEAR ?auto_29524 ) ( ON ?auto_29525 ?auto_29526 ) ( CLEAR ?auto_29525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29528 ?auto_29527 ?auto_29526 )
      ( MAKE-4PILE ?auto_29524 ?auto_29525 ?auto_29526 ?auto_29527 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29529 - BLOCK
      ?auto_29530 - BLOCK
      ?auto_29531 - BLOCK
      ?auto_29532 - BLOCK
    )
    :vars
    (
      ?auto_29533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29529 ?auto_29530 ) ) ( not ( = ?auto_29529 ?auto_29531 ) ) ( not ( = ?auto_29529 ?auto_29532 ) ) ( not ( = ?auto_29530 ?auto_29531 ) ) ( not ( = ?auto_29530 ?auto_29532 ) ) ( not ( = ?auto_29531 ?auto_29532 ) ) ( ON ?auto_29532 ?auto_29533 ) ( not ( = ?auto_29529 ?auto_29533 ) ) ( not ( = ?auto_29530 ?auto_29533 ) ) ( not ( = ?auto_29531 ?auto_29533 ) ) ( not ( = ?auto_29532 ?auto_29533 ) ) ( ON ?auto_29531 ?auto_29532 ) ( ON-TABLE ?auto_29533 ) ( ON ?auto_29530 ?auto_29531 ) ( CLEAR ?auto_29530 ) ( HOLDING ?auto_29529 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29529 )
      ( MAKE-4PILE ?auto_29529 ?auto_29530 ?auto_29531 ?auto_29532 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29534 - BLOCK
      ?auto_29535 - BLOCK
      ?auto_29536 - BLOCK
      ?auto_29537 - BLOCK
    )
    :vars
    (
      ?auto_29538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29534 ?auto_29535 ) ) ( not ( = ?auto_29534 ?auto_29536 ) ) ( not ( = ?auto_29534 ?auto_29537 ) ) ( not ( = ?auto_29535 ?auto_29536 ) ) ( not ( = ?auto_29535 ?auto_29537 ) ) ( not ( = ?auto_29536 ?auto_29537 ) ) ( ON ?auto_29537 ?auto_29538 ) ( not ( = ?auto_29534 ?auto_29538 ) ) ( not ( = ?auto_29535 ?auto_29538 ) ) ( not ( = ?auto_29536 ?auto_29538 ) ) ( not ( = ?auto_29537 ?auto_29538 ) ) ( ON ?auto_29536 ?auto_29537 ) ( ON-TABLE ?auto_29538 ) ( ON ?auto_29535 ?auto_29536 ) ( ON ?auto_29534 ?auto_29535 ) ( CLEAR ?auto_29534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29538 ?auto_29537 ?auto_29536 ?auto_29535 )
      ( MAKE-4PILE ?auto_29534 ?auto_29535 ?auto_29536 ?auto_29537 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29539 - BLOCK
      ?auto_29540 - BLOCK
      ?auto_29541 - BLOCK
      ?auto_29542 - BLOCK
    )
    :vars
    (
      ?auto_29543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29539 ?auto_29540 ) ) ( not ( = ?auto_29539 ?auto_29541 ) ) ( not ( = ?auto_29539 ?auto_29542 ) ) ( not ( = ?auto_29540 ?auto_29541 ) ) ( not ( = ?auto_29540 ?auto_29542 ) ) ( not ( = ?auto_29541 ?auto_29542 ) ) ( ON ?auto_29542 ?auto_29543 ) ( not ( = ?auto_29539 ?auto_29543 ) ) ( not ( = ?auto_29540 ?auto_29543 ) ) ( not ( = ?auto_29541 ?auto_29543 ) ) ( not ( = ?auto_29542 ?auto_29543 ) ) ( ON ?auto_29541 ?auto_29542 ) ( ON-TABLE ?auto_29543 ) ( ON ?auto_29540 ?auto_29541 ) ( HOLDING ?auto_29539 ) ( CLEAR ?auto_29540 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29543 ?auto_29542 ?auto_29541 ?auto_29540 ?auto_29539 )
      ( MAKE-4PILE ?auto_29539 ?auto_29540 ?auto_29541 ?auto_29542 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29544 - BLOCK
      ?auto_29545 - BLOCK
      ?auto_29546 - BLOCK
      ?auto_29547 - BLOCK
    )
    :vars
    (
      ?auto_29548 - BLOCK
      ?auto_29549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29544 ?auto_29545 ) ) ( not ( = ?auto_29544 ?auto_29546 ) ) ( not ( = ?auto_29544 ?auto_29547 ) ) ( not ( = ?auto_29545 ?auto_29546 ) ) ( not ( = ?auto_29545 ?auto_29547 ) ) ( not ( = ?auto_29546 ?auto_29547 ) ) ( ON ?auto_29547 ?auto_29548 ) ( not ( = ?auto_29544 ?auto_29548 ) ) ( not ( = ?auto_29545 ?auto_29548 ) ) ( not ( = ?auto_29546 ?auto_29548 ) ) ( not ( = ?auto_29547 ?auto_29548 ) ) ( ON ?auto_29546 ?auto_29547 ) ( ON-TABLE ?auto_29548 ) ( ON ?auto_29545 ?auto_29546 ) ( CLEAR ?auto_29545 ) ( ON ?auto_29544 ?auto_29549 ) ( CLEAR ?auto_29544 ) ( HAND-EMPTY ) ( not ( = ?auto_29544 ?auto_29549 ) ) ( not ( = ?auto_29545 ?auto_29549 ) ) ( not ( = ?auto_29546 ?auto_29549 ) ) ( not ( = ?auto_29547 ?auto_29549 ) ) ( not ( = ?auto_29548 ?auto_29549 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29544 ?auto_29549 )
      ( MAKE-4PILE ?auto_29544 ?auto_29545 ?auto_29546 ?auto_29547 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29550 - BLOCK
      ?auto_29551 - BLOCK
      ?auto_29552 - BLOCK
      ?auto_29553 - BLOCK
    )
    :vars
    (
      ?auto_29555 - BLOCK
      ?auto_29554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29550 ?auto_29551 ) ) ( not ( = ?auto_29550 ?auto_29552 ) ) ( not ( = ?auto_29550 ?auto_29553 ) ) ( not ( = ?auto_29551 ?auto_29552 ) ) ( not ( = ?auto_29551 ?auto_29553 ) ) ( not ( = ?auto_29552 ?auto_29553 ) ) ( ON ?auto_29553 ?auto_29555 ) ( not ( = ?auto_29550 ?auto_29555 ) ) ( not ( = ?auto_29551 ?auto_29555 ) ) ( not ( = ?auto_29552 ?auto_29555 ) ) ( not ( = ?auto_29553 ?auto_29555 ) ) ( ON ?auto_29552 ?auto_29553 ) ( ON-TABLE ?auto_29555 ) ( ON ?auto_29550 ?auto_29554 ) ( CLEAR ?auto_29550 ) ( not ( = ?auto_29550 ?auto_29554 ) ) ( not ( = ?auto_29551 ?auto_29554 ) ) ( not ( = ?auto_29552 ?auto_29554 ) ) ( not ( = ?auto_29553 ?auto_29554 ) ) ( not ( = ?auto_29555 ?auto_29554 ) ) ( HOLDING ?auto_29551 ) ( CLEAR ?auto_29552 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29555 ?auto_29553 ?auto_29552 ?auto_29551 )
      ( MAKE-4PILE ?auto_29550 ?auto_29551 ?auto_29552 ?auto_29553 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29556 - BLOCK
      ?auto_29557 - BLOCK
      ?auto_29558 - BLOCK
      ?auto_29559 - BLOCK
    )
    :vars
    (
      ?auto_29561 - BLOCK
      ?auto_29560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29556 ?auto_29557 ) ) ( not ( = ?auto_29556 ?auto_29558 ) ) ( not ( = ?auto_29556 ?auto_29559 ) ) ( not ( = ?auto_29557 ?auto_29558 ) ) ( not ( = ?auto_29557 ?auto_29559 ) ) ( not ( = ?auto_29558 ?auto_29559 ) ) ( ON ?auto_29559 ?auto_29561 ) ( not ( = ?auto_29556 ?auto_29561 ) ) ( not ( = ?auto_29557 ?auto_29561 ) ) ( not ( = ?auto_29558 ?auto_29561 ) ) ( not ( = ?auto_29559 ?auto_29561 ) ) ( ON ?auto_29558 ?auto_29559 ) ( ON-TABLE ?auto_29561 ) ( ON ?auto_29556 ?auto_29560 ) ( not ( = ?auto_29556 ?auto_29560 ) ) ( not ( = ?auto_29557 ?auto_29560 ) ) ( not ( = ?auto_29558 ?auto_29560 ) ) ( not ( = ?auto_29559 ?auto_29560 ) ) ( not ( = ?auto_29561 ?auto_29560 ) ) ( CLEAR ?auto_29558 ) ( ON ?auto_29557 ?auto_29556 ) ( CLEAR ?auto_29557 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29560 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29560 ?auto_29556 )
      ( MAKE-4PILE ?auto_29556 ?auto_29557 ?auto_29558 ?auto_29559 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29562 - BLOCK
      ?auto_29563 - BLOCK
      ?auto_29564 - BLOCK
      ?auto_29565 - BLOCK
    )
    :vars
    (
      ?auto_29567 - BLOCK
      ?auto_29566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29562 ?auto_29563 ) ) ( not ( = ?auto_29562 ?auto_29564 ) ) ( not ( = ?auto_29562 ?auto_29565 ) ) ( not ( = ?auto_29563 ?auto_29564 ) ) ( not ( = ?auto_29563 ?auto_29565 ) ) ( not ( = ?auto_29564 ?auto_29565 ) ) ( ON ?auto_29565 ?auto_29567 ) ( not ( = ?auto_29562 ?auto_29567 ) ) ( not ( = ?auto_29563 ?auto_29567 ) ) ( not ( = ?auto_29564 ?auto_29567 ) ) ( not ( = ?auto_29565 ?auto_29567 ) ) ( ON-TABLE ?auto_29567 ) ( ON ?auto_29562 ?auto_29566 ) ( not ( = ?auto_29562 ?auto_29566 ) ) ( not ( = ?auto_29563 ?auto_29566 ) ) ( not ( = ?auto_29564 ?auto_29566 ) ) ( not ( = ?auto_29565 ?auto_29566 ) ) ( not ( = ?auto_29567 ?auto_29566 ) ) ( ON ?auto_29563 ?auto_29562 ) ( CLEAR ?auto_29563 ) ( ON-TABLE ?auto_29566 ) ( HOLDING ?auto_29564 ) ( CLEAR ?auto_29565 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29567 ?auto_29565 ?auto_29564 )
      ( MAKE-4PILE ?auto_29562 ?auto_29563 ?auto_29564 ?auto_29565 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29568 - BLOCK
      ?auto_29569 - BLOCK
      ?auto_29570 - BLOCK
      ?auto_29571 - BLOCK
    )
    :vars
    (
      ?auto_29573 - BLOCK
      ?auto_29572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29568 ?auto_29569 ) ) ( not ( = ?auto_29568 ?auto_29570 ) ) ( not ( = ?auto_29568 ?auto_29571 ) ) ( not ( = ?auto_29569 ?auto_29570 ) ) ( not ( = ?auto_29569 ?auto_29571 ) ) ( not ( = ?auto_29570 ?auto_29571 ) ) ( ON ?auto_29571 ?auto_29573 ) ( not ( = ?auto_29568 ?auto_29573 ) ) ( not ( = ?auto_29569 ?auto_29573 ) ) ( not ( = ?auto_29570 ?auto_29573 ) ) ( not ( = ?auto_29571 ?auto_29573 ) ) ( ON-TABLE ?auto_29573 ) ( ON ?auto_29568 ?auto_29572 ) ( not ( = ?auto_29568 ?auto_29572 ) ) ( not ( = ?auto_29569 ?auto_29572 ) ) ( not ( = ?auto_29570 ?auto_29572 ) ) ( not ( = ?auto_29571 ?auto_29572 ) ) ( not ( = ?auto_29573 ?auto_29572 ) ) ( ON ?auto_29569 ?auto_29568 ) ( ON-TABLE ?auto_29572 ) ( CLEAR ?auto_29571 ) ( ON ?auto_29570 ?auto_29569 ) ( CLEAR ?auto_29570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29572 ?auto_29568 ?auto_29569 )
      ( MAKE-4PILE ?auto_29568 ?auto_29569 ?auto_29570 ?auto_29571 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29574 - BLOCK
      ?auto_29575 - BLOCK
      ?auto_29576 - BLOCK
      ?auto_29577 - BLOCK
    )
    :vars
    (
      ?auto_29578 - BLOCK
      ?auto_29579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29574 ?auto_29575 ) ) ( not ( = ?auto_29574 ?auto_29576 ) ) ( not ( = ?auto_29574 ?auto_29577 ) ) ( not ( = ?auto_29575 ?auto_29576 ) ) ( not ( = ?auto_29575 ?auto_29577 ) ) ( not ( = ?auto_29576 ?auto_29577 ) ) ( not ( = ?auto_29574 ?auto_29578 ) ) ( not ( = ?auto_29575 ?auto_29578 ) ) ( not ( = ?auto_29576 ?auto_29578 ) ) ( not ( = ?auto_29577 ?auto_29578 ) ) ( ON-TABLE ?auto_29578 ) ( ON ?auto_29574 ?auto_29579 ) ( not ( = ?auto_29574 ?auto_29579 ) ) ( not ( = ?auto_29575 ?auto_29579 ) ) ( not ( = ?auto_29576 ?auto_29579 ) ) ( not ( = ?auto_29577 ?auto_29579 ) ) ( not ( = ?auto_29578 ?auto_29579 ) ) ( ON ?auto_29575 ?auto_29574 ) ( ON-TABLE ?auto_29579 ) ( ON ?auto_29576 ?auto_29575 ) ( CLEAR ?auto_29576 ) ( HOLDING ?auto_29577 ) ( CLEAR ?auto_29578 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29578 ?auto_29577 )
      ( MAKE-4PILE ?auto_29574 ?auto_29575 ?auto_29576 ?auto_29577 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29580 - BLOCK
      ?auto_29581 - BLOCK
      ?auto_29582 - BLOCK
      ?auto_29583 - BLOCK
    )
    :vars
    (
      ?auto_29585 - BLOCK
      ?auto_29584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29580 ?auto_29581 ) ) ( not ( = ?auto_29580 ?auto_29582 ) ) ( not ( = ?auto_29580 ?auto_29583 ) ) ( not ( = ?auto_29581 ?auto_29582 ) ) ( not ( = ?auto_29581 ?auto_29583 ) ) ( not ( = ?auto_29582 ?auto_29583 ) ) ( not ( = ?auto_29580 ?auto_29585 ) ) ( not ( = ?auto_29581 ?auto_29585 ) ) ( not ( = ?auto_29582 ?auto_29585 ) ) ( not ( = ?auto_29583 ?auto_29585 ) ) ( ON-TABLE ?auto_29585 ) ( ON ?auto_29580 ?auto_29584 ) ( not ( = ?auto_29580 ?auto_29584 ) ) ( not ( = ?auto_29581 ?auto_29584 ) ) ( not ( = ?auto_29582 ?auto_29584 ) ) ( not ( = ?auto_29583 ?auto_29584 ) ) ( not ( = ?auto_29585 ?auto_29584 ) ) ( ON ?auto_29581 ?auto_29580 ) ( ON-TABLE ?auto_29584 ) ( ON ?auto_29582 ?auto_29581 ) ( CLEAR ?auto_29585 ) ( ON ?auto_29583 ?auto_29582 ) ( CLEAR ?auto_29583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29584 ?auto_29580 ?auto_29581 ?auto_29582 )
      ( MAKE-4PILE ?auto_29580 ?auto_29581 ?auto_29582 ?auto_29583 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29586 - BLOCK
      ?auto_29587 - BLOCK
      ?auto_29588 - BLOCK
      ?auto_29589 - BLOCK
    )
    :vars
    (
      ?auto_29591 - BLOCK
      ?auto_29590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29586 ?auto_29587 ) ) ( not ( = ?auto_29586 ?auto_29588 ) ) ( not ( = ?auto_29586 ?auto_29589 ) ) ( not ( = ?auto_29587 ?auto_29588 ) ) ( not ( = ?auto_29587 ?auto_29589 ) ) ( not ( = ?auto_29588 ?auto_29589 ) ) ( not ( = ?auto_29586 ?auto_29591 ) ) ( not ( = ?auto_29587 ?auto_29591 ) ) ( not ( = ?auto_29588 ?auto_29591 ) ) ( not ( = ?auto_29589 ?auto_29591 ) ) ( ON ?auto_29586 ?auto_29590 ) ( not ( = ?auto_29586 ?auto_29590 ) ) ( not ( = ?auto_29587 ?auto_29590 ) ) ( not ( = ?auto_29588 ?auto_29590 ) ) ( not ( = ?auto_29589 ?auto_29590 ) ) ( not ( = ?auto_29591 ?auto_29590 ) ) ( ON ?auto_29587 ?auto_29586 ) ( ON-TABLE ?auto_29590 ) ( ON ?auto_29588 ?auto_29587 ) ( ON ?auto_29589 ?auto_29588 ) ( CLEAR ?auto_29589 ) ( HOLDING ?auto_29591 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29591 )
      ( MAKE-4PILE ?auto_29586 ?auto_29587 ?auto_29588 ?auto_29589 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29592 - BLOCK
      ?auto_29593 - BLOCK
      ?auto_29594 - BLOCK
      ?auto_29595 - BLOCK
    )
    :vars
    (
      ?auto_29597 - BLOCK
      ?auto_29596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29592 ?auto_29593 ) ) ( not ( = ?auto_29592 ?auto_29594 ) ) ( not ( = ?auto_29592 ?auto_29595 ) ) ( not ( = ?auto_29593 ?auto_29594 ) ) ( not ( = ?auto_29593 ?auto_29595 ) ) ( not ( = ?auto_29594 ?auto_29595 ) ) ( not ( = ?auto_29592 ?auto_29597 ) ) ( not ( = ?auto_29593 ?auto_29597 ) ) ( not ( = ?auto_29594 ?auto_29597 ) ) ( not ( = ?auto_29595 ?auto_29597 ) ) ( ON ?auto_29592 ?auto_29596 ) ( not ( = ?auto_29592 ?auto_29596 ) ) ( not ( = ?auto_29593 ?auto_29596 ) ) ( not ( = ?auto_29594 ?auto_29596 ) ) ( not ( = ?auto_29595 ?auto_29596 ) ) ( not ( = ?auto_29597 ?auto_29596 ) ) ( ON ?auto_29593 ?auto_29592 ) ( ON-TABLE ?auto_29596 ) ( ON ?auto_29594 ?auto_29593 ) ( ON ?auto_29595 ?auto_29594 ) ( ON ?auto_29597 ?auto_29595 ) ( CLEAR ?auto_29597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29596 ?auto_29592 ?auto_29593 ?auto_29594 ?auto_29595 )
      ( MAKE-4PILE ?auto_29592 ?auto_29593 ?auto_29594 ?auto_29595 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29603 - BLOCK
      ?auto_29604 - BLOCK
      ?auto_29605 - BLOCK
      ?auto_29606 - BLOCK
      ?auto_29607 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29607 ) ( CLEAR ?auto_29606 ) ( ON-TABLE ?auto_29603 ) ( ON ?auto_29604 ?auto_29603 ) ( ON ?auto_29605 ?auto_29604 ) ( ON ?auto_29606 ?auto_29605 ) ( not ( = ?auto_29603 ?auto_29604 ) ) ( not ( = ?auto_29603 ?auto_29605 ) ) ( not ( = ?auto_29603 ?auto_29606 ) ) ( not ( = ?auto_29603 ?auto_29607 ) ) ( not ( = ?auto_29604 ?auto_29605 ) ) ( not ( = ?auto_29604 ?auto_29606 ) ) ( not ( = ?auto_29604 ?auto_29607 ) ) ( not ( = ?auto_29605 ?auto_29606 ) ) ( not ( = ?auto_29605 ?auto_29607 ) ) ( not ( = ?auto_29606 ?auto_29607 ) ) )
    :subtasks
    ( ( !STACK ?auto_29607 ?auto_29606 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29608 - BLOCK
      ?auto_29609 - BLOCK
      ?auto_29610 - BLOCK
      ?auto_29611 - BLOCK
      ?auto_29612 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29611 ) ( ON-TABLE ?auto_29608 ) ( ON ?auto_29609 ?auto_29608 ) ( ON ?auto_29610 ?auto_29609 ) ( ON ?auto_29611 ?auto_29610 ) ( not ( = ?auto_29608 ?auto_29609 ) ) ( not ( = ?auto_29608 ?auto_29610 ) ) ( not ( = ?auto_29608 ?auto_29611 ) ) ( not ( = ?auto_29608 ?auto_29612 ) ) ( not ( = ?auto_29609 ?auto_29610 ) ) ( not ( = ?auto_29609 ?auto_29611 ) ) ( not ( = ?auto_29609 ?auto_29612 ) ) ( not ( = ?auto_29610 ?auto_29611 ) ) ( not ( = ?auto_29610 ?auto_29612 ) ) ( not ( = ?auto_29611 ?auto_29612 ) ) ( ON-TABLE ?auto_29612 ) ( CLEAR ?auto_29612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_29612 )
      ( MAKE-5PILE ?auto_29608 ?auto_29609 ?auto_29610 ?auto_29611 ?auto_29612 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29613 - BLOCK
      ?auto_29614 - BLOCK
      ?auto_29615 - BLOCK
      ?auto_29616 - BLOCK
      ?auto_29617 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29613 ) ( ON ?auto_29614 ?auto_29613 ) ( ON ?auto_29615 ?auto_29614 ) ( not ( = ?auto_29613 ?auto_29614 ) ) ( not ( = ?auto_29613 ?auto_29615 ) ) ( not ( = ?auto_29613 ?auto_29616 ) ) ( not ( = ?auto_29613 ?auto_29617 ) ) ( not ( = ?auto_29614 ?auto_29615 ) ) ( not ( = ?auto_29614 ?auto_29616 ) ) ( not ( = ?auto_29614 ?auto_29617 ) ) ( not ( = ?auto_29615 ?auto_29616 ) ) ( not ( = ?auto_29615 ?auto_29617 ) ) ( not ( = ?auto_29616 ?auto_29617 ) ) ( ON-TABLE ?auto_29617 ) ( CLEAR ?auto_29617 ) ( HOLDING ?auto_29616 ) ( CLEAR ?auto_29615 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29613 ?auto_29614 ?auto_29615 ?auto_29616 )
      ( MAKE-5PILE ?auto_29613 ?auto_29614 ?auto_29615 ?auto_29616 ?auto_29617 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29618 - BLOCK
      ?auto_29619 - BLOCK
      ?auto_29620 - BLOCK
      ?auto_29621 - BLOCK
      ?auto_29622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29618 ) ( ON ?auto_29619 ?auto_29618 ) ( ON ?auto_29620 ?auto_29619 ) ( not ( = ?auto_29618 ?auto_29619 ) ) ( not ( = ?auto_29618 ?auto_29620 ) ) ( not ( = ?auto_29618 ?auto_29621 ) ) ( not ( = ?auto_29618 ?auto_29622 ) ) ( not ( = ?auto_29619 ?auto_29620 ) ) ( not ( = ?auto_29619 ?auto_29621 ) ) ( not ( = ?auto_29619 ?auto_29622 ) ) ( not ( = ?auto_29620 ?auto_29621 ) ) ( not ( = ?auto_29620 ?auto_29622 ) ) ( not ( = ?auto_29621 ?auto_29622 ) ) ( ON-TABLE ?auto_29622 ) ( CLEAR ?auto_29620 ) ( ON ?auto_29621 ?auto_29622 ) ( CLEAR ?auto_29621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29622 )
      ( MAKE-5PILE ?auto_29618 ?auto_29619 ?auto_29620 ?auto_29621 ?auto_29622 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29623 - BLOCK
      ?auto_29624 - BLOCK
      ?auto_29625 - BLOCK
      ?auto_29626 - BLOCK
      ?auto_29627 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29623 ) ( ON ?auto_29624 ?auto_29623 ) ( not ( = ?auto_29623 ?auto_29624 ) ) ( not ( = ?auto_29623 ?auto_29625 ) ) ( not ( = ?auto_29623 ?auto_29626 ) ) ( not ( = ?auto_29623 ?auto_29627 ) ) ( not ( = ?auto_29624 ?auto_29625 ) ) ( not ( = ?auto_29624 ?auto_29626 ) ) ( not ( = ?auto_29624 ?auto_29627 ) ) ( not ( = ?auto_29625 ?auto_29626 ) ) ( not ( = ?auto_29625 ?auto_29627 ) ) ( not ( = ?auto_29626 ?auto_29627 ) ) ( ON-TABLE ?auto_29627 ) ( ON ?auto_29626 ?auto_29627 ) ( CLEAR ?auto_29626 ) ( HOLDING ?auto_29625 ) ( CLEAR ?auto_29624 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29623 ?auto_29624 ?auto_29625 )
      ( MAKE-5PILE ?auto_29623 ?auto_29624 ?auto_29625 ?auto_29626 ?auto_29627 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29628 - BLOCK
      ?auto_29629 - BLOCK
      ?auto_29630 - BLOCK
      ?auto_29631 - BLOCK
      ?auto_29632 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29628 ) ( ON ?auto_29629 ?auto_29628 ) ( not ( = ?auto_29628 ?auto_29629 ) ) ( not ( = ?auto_29628 ?auto_29630 ) ) ( not ( = ?auto_29628 ?auto_29631 ) ) ( not ( = ?auto_29628 ?auto_29632 ) ) ( not ( = ?auto_29629 ?auto_29630 ) ) ( not ( = ?auto_29629 ?auto_29631 ) ) ( not ( = ?auto_29629 ?auto_29632 ) ) ( not ( = ?auto_29630 ?auto_29631 ) ) ( not ( = ?auto_29630 ?auto_29632 ) ) ( not ( = ?auto_29631 ?auto_29632 ) ) ( ON-TABLE ?auto_29632 ) ( ON ?auto_29631 ?auto_29632 ) ( CLEAR ?auto_29629 ) ( ON ?auto_29630 ?auto_29631 ) ( CLEAR ?auto_29630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29632 ?auto_29631 )
      ( MAKE-5PILE ?auto_29628 ?auto_29629 ?auto_29630 ?auto_29631 ?auto_29632 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29633 - BLOCK
      ?auto_29634 - BLOCK
      ?auto_29635 - BLOCK
      ?auto_29636 - BLOCK
      ?auto_29637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29633 ) ( not ( = ?auto_29633 ?auto_29634 ) ) ( not ( = ?auto_29633 ?auto_29635 ) ) ( not ( = ?auto_29633 ?auto_29636 ) ) ( not ( = ?auto_29633 ?auto_29637 ) ) ( not ( = ?auto_29634 ?auto_29635 ) ) ( not ( = ?auto_29634 ?auto_29636 ) ) ( not ( = ?auto_29634 ?auto_29637 ) ) ( not ( = ?auto_29635 ?auto_29636 ) ) ( not ( = ?auto_29635 ?auto_29637 ) ) ( not ( = ?auto_29636 ?auto_29637 ) ) ( ON-TABLE ?auto_29637 ) ( ON ?auto_29636 ?auto_29637 ) ( ON ?auto_29635 ?auto_29636 ) ( CLEAR ?auto_29635 ) ( HOLDING ?auto_29634 ) ( CLEAR ?auto_29633 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29633 ?auto_29634 )
      ( MAKE-5PILE ?auto_29633 ?auto_29634 ?auto_29635 ?auto_29636 ?auto_29637 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29638 - BLOCK
      ?auto_29639 - BLOCK
      ?auto_29640 - BLOCK
      ?auto_29641 - BLOCK
      ?auto_29642 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29638 ) ( not ( = ?auto_29638 ?auto_29639 ) ) ( not ( = ?auto_29638 ?auto_29640 ) ) ( not ( = ?auto_29638 ?auto_29641 ) ) ( not ( = ?auto_29638 ?auto_29642 ) ) ( not ( = ?auto_29639 ?auto_29640 ) ) ( not ( = ?auto_29639 ?auto_29641 ) ) ( not ( = ?auto_29639 ?auto_29642 ) ) ( not ( = ?auto_29640 ?auto_29641 ) ) ( not ( = ?auto_29640 ?auto_29642 ) ) ( not ( = ?auto_29641 ?auto_29642 ) ) ( ON-TABLE ?auto_29642 ) ( ON ?auto_29641 ?auto_29642 ) ( ON ?auto_29640 ?auto_29641 ) ( CLEAR ?auto_29638 ) ( ON ?auto_29639 ?auto_29640 ) ( CLEAR ?auto_29639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29642 ?auto_29641 ?auto_29640 )
      ( MAKE-5PILE ?auto_29638 ?auto_29639 ?auto_29640 ?auto_29641 ?auto_29642 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29643 - BLOCK
      ?auto_29644 - BLOCK
      ?auto_29645 - BLOCK
      ?auto_29646 - BLOCK
      ?auto_29647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29643 ?auto_29644 ) ) ( not ( = ?auto_29643 ?auto_29645 ) ) ( not ( = ?auto_29643 ?auto_29646 ) ) ( not ( = ?auto_29643 ?auto_29647 ) ) ( not ( = ?auto_29644 ?auto_29645 ) ) ( not ( = ?auto_29644 ?auto_29646 ) ) ( not ( = ?auto_29644 ?auto_29647 ) ) ( not ( = ?auto_29645 ?auto_29646 ) ) ( not ( = ?auto_29645 ?auto_29647 ) ) ( not ( = ?auto_29646 ?auto_29647 ) ) ( ON-TABLE ?auto_29647 ) ( ON ?auto_29646 ?auto_29647 ) ( ON ?auto_29645 ?auto_29646 ) ( ON ?auto_29644 ?auto_29645 ) ( CLEAR ?auto_29644 ) ( HOLDING ?auto_29643 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29643 )
      ( MAKE-5PILE ?auto_29643 ?auto_29644 ?auto_29645 ?auto_29646 ?auto_29647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29648 - BLOCK
      ?auto_29649 - BLOCK
      ?auto_29650 - BLOCK
      ?auto_29651 - BLOCK
      ?auto_29652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29648 ?auto_29649 ) ) ( not ( = ?auto_29648 ?auto_29650 ) ) ( not ( = ?auto_29648 ?auto_29651 ) ) ( not ( = ?auto_29648 ?auto_29652 ) ) ( not ( = ?auto_29649 ?auto_29650 ) ) ( not ( = ?auto_29649 ?auto_29651 ) ) ( not ( = ?auto_29649 ?auto_29652 ) ) ( not ( = ?auto_29650 ?auto_29651 ) ) ( not ( = ?auto_29650 ?auto_29652 ) ) ( not ( = ?auto_29651 ?auto_29652 ) ) ( ON-TABLE ?auto_29652 ) ( ON ?auto_29651 ?auto_29652 ) ( ON ?auto_29650 ?auto_29651 ) ( ON ?auto_29649 ?auto_29650 ) ( ON ?auto_29648 ?auto_29649 ) ( CLEAR ?auto_29648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29652 ?auto_29651 ?auto_29650 ?auto_29649 )
      ( MAKE-5PILE ?auto_29648 ?auto_29649 ?auto_29650 ?auto_29651 ?auto_29652 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29653 - BLOCK
      ?auto_29654 - BLOCK
      ?auto_29655 - BLOCK
      ?auto_29656 - BLOCK
      ?auto_29657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29653 ?auto_29654 ) ) ( not ( = ?auto_29653 ?auto_29655 ) ) ( not ( = ?auto_29653 ?auto_29656 ) ) ( not ( = ?auto_29653 ?auto_29657 ) ) ( not ( = ?auto_29654 ?auto_29655 ) ) ( not ( = ?auto_29654 ?auto_29656 ) ) ( not ( = ?auto_29654 ?auto_29657 ) ) ( not ( = ?auto_29655 ?auto_29656 ) ) ( not ( = ?auto_29655 ?auto_29657 ) ) ( not ( = ?auto_29656 ?auto_29657 ) ) ( ON-TABLE ?auto_29657 ) ( ON ?auto_29656 ?auto_29657 ) ( ON ?auto_29655 ?auto_29656 ) ( ON ?auto_29654 ?auto_29655 ) ( HOLDING ?auto_29653 ) ( CLEAR ?auto_29654 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29657 ?auto_29656 ?auto_29655 ?auto_29654 ?auto_29653 )
      ( MAKE-5PILE ?auto_29653 ?auto_29654 ?auto_29655 ?auto_29656 ?auto_29657 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29658 - BLOCK
      ?auto_29659 - BLOCK
      ?auto_29660 - BLOCK
      ?auto_29661 - BLOCK
      ?auto_29662 - BLOCK
    )
    :vars
    (
      ?auto_29663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29658 ?auto_29659 ) ) ( not ( = ?auto_29658 ?auto_29660 ) ) ( not ( = ?auto_29658 ?auto_29661 ) ) ( not ( = ?auto_29658 ?auto_29662 ) ) ( not ( = ?auto_29659 ?auto_29660 ) ) ( not ( = ?auto_29659 ?auto_29661 ) ) ( not ( = ?auto_29659 ?auto_29662 ) ) ( not ( = ?auto_29660 ?auto_29661 ) ) ( not ( = ?auto_29660 ?auto_29662 ) ) ( not ( = ?auto_29661 ?auto_29662 ) ) ( ON-TABLE ?auto_29662 ) ( ON ?auto_29661 ?auto_29662 ) ( ON ?auto_29660 ?auto_29661 ) ( ON ?auto_29659 ?auto_29660 ) ( CLEAR ?auto_29659 ) ( ON ?auto_29658 ?auto_29663 ) ( CLEAR ?auto_29658 ) ( HAND-EMPTY ) ( not ( = ?auto_29658 ?auto_29663 ) ) ( not ( = ?auto_29659 ?auto_29663 ) ) ( not ( = ?auto_29660 ?auto_29663 ) ) ( not ( = ?auto_29661 ?auto_29663 ) ) ( not ( = ?auto_29662 ?auto_29663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29658 ?auto_29663 )
      ( MAKE-5PILE ?auto_29658 ?auto_29659 ?auto_29660 ?auto_29661 ?auto_29662 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29664 - BLOCK
      ?auto_29665 - BLOCK
      ?auto_29666 - BLOCK
      ?auto_29667 - BLOCK
      ?auto_29668 - BLOCK
    )
    :vars
    (
      ?auto_29669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29664 ?auto_29665 ) ) ( not ( = ?auto_29664 ?auto_29666 ) ) ( not ( = ?auto_29664 ?auto_29667 ) ) ( not ( = ?auto_29664 ?auto_29668 ) ) ( not ( = ?auto_29665 ?auto_29666 ) ) ( not ( = ?auto_29665 ?auto_29667 ) ) ( not ( = ?auto_29665 ?auto_29668 ) ) ( not ( = ?auto_29666 ?auto_29667 ) ) ( not ( = ?auto_29666 ?auto_29668 ) ) ( not ( = ?auto_29667 ?auto_29668 ) ) ( ON-TABLE ?auto_29668 ) ( ON ?auto_29667 ?auto_29668 ) ( ON ?auto_29666 ?auto_29667 ) ( ON ?auto_29664 ?auto_29669 ) ( CLEAR ?auto_29664 ) ( not ( = ?auto_29664 ?auto_29669 ) ) ( not ( = ?auto_29665 ?auto_29669 ) ) ( not ( = ?auto_29666 ?auto_29669 ) ) ( not ( = ?auto_29667 ?auto_29669 ) ) ( not ( = ?auto_29668 ?auto_29669 ) ) ( HOLDING ?auto_29665 ) ( CLEAR ?auto_29666 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29668 ?auto_29667 ?auto_29666 ?auto_29665 )
      ( MAKE-5PILE ?auto_29664 ?auto_29665 ?auto_29666 ?auto_29667 ?auto_29668 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29670 - BLOCK
      ?auto_29671 - BLOCK
      ?auto_29672 - BLOCK
      ?auto_29673 - BLOCK
      ?auto_29674 - BLOCK
    )
    :vars
    (
      ?auto_29675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29670 ?auto_29671 ) ) ( not ( = ?auto_29670 ?auto_29672 ) ) ( not ( = ?auto_29670 ?auto_29673 ) ) ( not ( = ?auto_29670 ?auto_29674 ) ) ( not ( = ?auto_29671 ?auto_29672 ) ) ( not ( = ?auto_29671 ?auto_29673 ) ) ( not ( = ?auto_29671 ?auto_29674 ) ) ( not ( = ?auto_29672 ?auto_29673 ) ) ( not ( = ?auto_29672 ?auto_29674 ) ) ( not ( = ?auto_29673 ?auto_29674 ) ) ( ON-TABLE ?auto_29674 ) ( ON ?auto_29673 ?auto_29674 ) ( ON ?auto_29672 ?auto_29673 ) ( ON ?auto_29670 ?auto_29675 ) ( not ( = ?auto_29670 ?auto_29675 ) ) ( not ( = ?auto_29671 ?auto_29675 ) ) ( not ( = ?auto_29672 ?auto_29675 ) ) ( not ( = ?auto_29673 ?auto_29675 ) ) ( not ( = ?auto_29674 ?auto_29675 ) ) ( CLEAR ?auto_29672 ) ( ON ?auto_29671 ?auto_29670 ) ( CLEAR ?auto_29671 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29675 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29675 ?auto_29670 )
      ( MAKE-5PILE ?auto_29670 ?auto_29671 ?auto_29672 ?auto_29673 ?auto_29674 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29676 - BLOCK
      ?auto_29677 - BLOCK
      ?auto_29678 - BLOCK
      ?auto_29679 - BLOCK
      ?auto_29680 - BLOCK
    )
    :vars
    (
      ?auto_29681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29676 ?auto_29677 ) ) ( not ( = ?auto_29676 ?auto_29678 ) ) ( not ( = ?auto_29676 ?auto_29679 ) ) ( not ( = ?auto_29676 ?auto_29680 ) ) ( not ( = ?auto_29677 ?auto_29678 ) ) ( not ( = ?auto_29677 ?auto_29679 ) ) ( not ( = ?auto_29677 ?auto_29680 ) ) ( not ( = ?auto_29678 ?auto_29679 ) ) ( not ( = ?auto_29678 ?auto_29680 ) ) ( not ( = ?auto_29679 ?auto_29680 ) ) ( ON-TABLE ?auto_29680 ) ( ON ?auto_29679 ?auto_29680 ) ( ON ?auto_29676 ?auto_29681 ) ( not ( = ?auto_29676 ?auto_29681 ) ) ( not ( = ?auto_29677 ?auto_29681 ) ) ( not ( = ?auto_29678 ?auto_29681 ) ) ( not ( = ?auto_29679 ?auto_29681 ) ) ( not ( = ?auto_29680 ?auto_29681 ) ) ( ON ?auto_29677 ?auto_29676 ) ( CLEAR ?auto_29677 ) ( ON-TABLE ?auto_29681 ) ( HOLDING ?auto_29678 ) ( CLEAR ?auto_29679 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29680 ?auto_29679 ?auto_29678 )
      ( MAKE-5PILE ?auto_29676 ?auto_29677 ?auto_29678 ?auto_29679 ?auto_29680 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29682 - BLOCK
      ?auto_29683 - BLOCK
      ?auto_29684 - BLOCK
      ?auto_29685 - BLOCK
      ?auto_29686 - BLOCK
    )
    :vars
    (
      ?auto_29687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29682 ?auto_29683 ) ) ( not ( = ?auto_29682 ?auto_29684 ) ) ( not ( = ?auto_29682 ?auto_29685 ) ) ( not ( = ?auto_29682 ?auto_29686 ) ) ( not ( = ?auto_29683 ?auto_29684 ) ) ( not ( = ?auto_29683 ?auto_29685 ) ) ( not ( = ?auto_29683 ?auto_29686 ) ) ( not ( = ?auto_29684 ?auto_29685 ) ) ( not ( = ?auto_29684 ?auto_29686 ) ) ( not ( = ?auto_29685 ?auto_29686 ) ) ( ON-TABLE ?auto_29686 ) ( ON ?auto_29685 ?auto_29686 ) ( ON ?auto_29682 ?auto_29687 ) ( not ( = ?auto_29682 ?auto_29687 ) ) ( not ( = ?auto_29683 ?auto_29687 ) ) ( not ( = ?auto_29684 ?auto_29687 ) ) ( not ( = ?auto_29685 ?auto_29687 ) ) ( not ( = ?auto_29686 ?auto_29687 ) ) ( ON ?auto_29683 ?auto_29682 ) ( ON-TABLE ?auto_29687 ) ( CLEAR ?auto_29685 ) ( ON ?auto_29684 ?auto_29683 ) ( CLEAR ?auto_29684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29687 ?auto_29682 ?auto_29683 )
      ( MAKE-5PILE ?auto_29682 ?auto_29683 ?auto_29684 ?auto_29685 ?auto_29686 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29688 - BLOCK
      ?auto_29689 - BLOCK
      ?auto_29690 - BLOCK
      ?auto_29691 - BLOCK
      ?auto_29692 - BLOCK
    )
    :vars
    (
      ?auto_29693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29688 ?auto_29689 ) ) ( not ( = ?auto_29688 ?auto_29690 ) ) ( not ( = ?auto_29688 ?auto_29691 ) ) ( not ( = ?auto_29688 ?auto_29692 ) ) ( not ( = ?auto_29689 ?auto_29690 ) ) ( not ( = ?auto_29689 ?auto_29691 ) ) ( not ( = ?auto_29689 ?auto_29692 ) ) ( not ( = ?auto_29690 ?auto_29691 ) ) ( not ( = ?auto_29690 ?auto_29692 ) ) ( not ( = ?auto_29691 ?auto_29692 ) ) ( ON-TABLE ?auto_29692 ) ( ON ?auto_29688 ?auto_29693 ) ( not ( = ?auto_29688 ?auto_29693 ) ) ( not ( = ?auto_29689 ?auto_29693 ) ) ( not ( = ?auto_29690 ?auto_29693 ) ) ( not ( = ?auto_29691 ?auto_29693 ) ) ( not ( = ?auto_29692 ?auto_29693 ) ) ( ON ?auto_29689 ?auto_29688 ) ( ON-TABLE ?auto_29693 ) ( ON ?auto_29690 ?auto_29689 ) ( CLEAR ?auto_29690 ) ( HOLDING ?auto_29691 ) ( CLEAR ?auto_29692 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29692 ?auto_29691 )
      ( MAKE-5PILE ?auto_29688 ?auto_29689 ?auto_29690 ?auto_29691 ?auto_29692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29694 - BLOCK
      ?auto_29695 - BLOCK
      ?auto_29696 - BLOCK
      ?auto_29697 - BLOCK
      ?auto_29698 - BLOCK
    )
    :vars
    (
      ?auto_29699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29694 ?auto_29695 ) ) ( not ( = ?auto_29694 ?auto_29696 ) ) ( not ( = ?auto_29694 ?auto_29697 ) ) ( not ( = ?auto_29694 ?auto_29698 ) ) ( not ( = ?auto_29695 ?auto_29696 ) ) ( not ( = ?auto_29695 ?auto_29697 ) ) ( not ( = ?auto_29695 ?auto_29698 ) ) ( not ( = ?auto_29696 ?auto_29697 ) ) ( not ( = ?auto_29696 ?auto_29698 ) ) ( not ( = ?auto_29697 ?auto_29698 ) ) ( ON-TABLE ?auto_29698 ) ( ON ?auto_29694 ?auto_29699 ) ( not ( = ?auto_29694 ?auto_29699 ) ) ( not ( = ?auto_29695 ?auto_29699 ) ) ( not ( = ?auto_29696 ?auto_29699 ) ) ( not ( = ?auto_29697 ?auto_29699 ) ) ( not ( = ?auto_29698 ?auto_29699 ) ) ( ON ?auto_29695 ?auto_29694 ) ( ON-TABLE ?auto_29699 ) ( ON ?auto_29696 ?auto_29695 ) ( CLEAR ?auto_29698 ) ( ON ?auto_29697 ?auto_29696 ) ( CLEAR ?auto_29697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29699 ?auto_29694 ?auto_29695 ?auto_29696 )
      ( MAKE-5PILE ?auto_29694 ?auto_29695 ?auto_29696 ?auto_29697 ?auto_29698 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29700 - BLOCK
      ?auto_29701 - BLOCK
      ?auto_29702 - BLOCK
      ?auto_29703 - BLOCK
      ?auto_29704 - BLOCK
    )
    :vars
    (
      ?auto_29705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29700 ?auto_29701 ) ) ( not ( = ?auto_29700 ?auto_29702 ) ) ( not ( = ?auto_29700 ?auto_29703 ) ) ( not ( = ?auto_29700 ?auto_29704 ) ) ( not ( = ?auto_29701 ?auto_29702 ) ) ( not ( = ?auto_29701 ?auto_29703 ) ) ( not ( = ?auto_29701 ?auto_29704 ) ) ( not ( = ?auto_29702 ?auto_29703 ) ) ( not ( = ?auto_29702 ?auto_29704 ) ) ( not ( = ?auto_29703 ?auto_29704 ) ) ( ON ?auto_29700 ?auto_29705 ) ( not ( = ?auto_29700 ?auto_29705 ) ) ( not ( = ?auto_29701 ?auto_29705 ) ) ( not ( = ?auto_29702 ?auto_29705 ) ) ( not ( = ?auto_29703 ?auto_29705 ) ) ( not ( = ?auto_29704 ?auto_29705 ) ) ( ON ?auto_29701 ?auto_29700 ) ( ON-TABLE ?auto_29705 ) ( ON ?auto_29702 ?auto_29701 ) ( ON ?auto_29703 ?auto_29702 ) ( CLEAR ?auto_29703 ) ( HOLDING ?auto_29704 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29704 )
      ( MAKE-5PILE ?auto_29700 ?auto_29701 ?auto_29702 ?auto_29703 ?auto_29704 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29706 - BLOCK
      ?auto_29707 - BLOCK
      ?auto_29708 - BLOCK
      ?auto_29709 - BLOCK
      ?auto_29710 - BLOCK
    )
    :vars
    (
      ?auto_29711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29706 ?auto_29707 ) ) ( not ( = ?auto_29706 ?auto_29708 ) ) ( not ( = ?auto_29706 ?auto_29709 ) ) ( not ( = ?auto_29706 ?auto_29710 ) ) ( not ( = ?auto_29707 ?auto_29708 ) ) ( not ( = ?auto_29707 ?auto_29709 ) ) ( not ( = ?auto_29707 ?auto_29710 ) ) ( not ( = ?auto_29708 ?auto_29709 ) ) ( not ( = ?auto_29708 ?auto_29710 ) ) ( not ( = ?auto_29709 ?auto_29710 ) ) ( ON ?auto_29706 ?auto_29711 ) ( not ( = ?auto_29706 ?auto_29711 ) ) ( not ( = ?auto_29707 ?auto_29711 ) ) ( not ( = ?auto_29708 ?auto_29711 ) ) ( not ( = ?auto_29709 ?auto_29711 ) ) ( not ( = ?auto_29710 ?auto_29711 ) ) ( ON ?auto_29707 ?auto_29706 ) ( ON-TABLE ?auto_29711 ) ( ON ?auto_29708 ?auto_29707 ) ( ON ?auto_29709 ?auto_29708 ) ( ON ?auto_29710 ?auto_29709 ) ( CLEAR ?auto_29710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29711 ?auto_29706 ?auto_29707 ?auto_29708 ?auto_29709 )
      ( MAKE-5PILE ?auto_29706 ?auto_29707 ?auto_29708 ?auto_29709 ?auto_29710 ) )
  )

)

