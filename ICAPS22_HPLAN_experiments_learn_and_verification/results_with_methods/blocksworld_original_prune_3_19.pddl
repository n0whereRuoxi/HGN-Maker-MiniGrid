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
      ?auto_5701 - BLOCK
      ?auto_5702 - BLOCK
      ?auto_5703 - BLOCK
    )
    :vars
    (
      ?auto_5704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5704 ?auto_5703 ) ( CLEAR ?auto_5704 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5701 ) ( ON ?auto_5702 ?auto_5701 ) ( ON ?auto_5703 ?auto_5702 ) ( not ( = ?auto_5701 ?auto_5702 ) ) ( not ( = ?auto_5701 ?auto_5703 ) ) ( not ( = ?auto_5701 ?auto_5704 ) ) ( not ( = ?auto_5702 ?auto_5703 ) ) ( not ( = ?auto_5702 ?auto_5704 ) ) ( not ( = ?auto_5703 ?auto_5704 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5704 ?auto_5703 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5706 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5706 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5706 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5707 - BLOCK
    )
    :vars
    (
      ?auto_5708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5707 ?auto_5708 ) ( CLEAR ?auto_5707 ) ( HAND-EMPTY ) ( not ( = ?auto_5707 ?auto_5708 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5707 ?auto_5708 )
      ( MAKE-1PILE ?auto_5707 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5711 - BLOCK
      ?auto_5712 - BLOCK
    )
    :vars
    (
      ?auto_5713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5713 ?auto_5712 ) ( CLEAR ?auto_5713 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5711 ) ( ON ?auto_5712 ?auto_5711 ) ( not ( = ?auto_5711 ?auto_5712 ) ) ( not ( = ?auto_5711 ?auto_5713 ) ) ( not ( = ?auto_5712 ?auto_5713 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5713 ?auto_5712 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5714 - BLOCK
      ?auto_5715 - BLOCK
    )
    :vars
    (
      ?auto_5716 - BLOCK
      ?auto_5717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5716 ?auto_5715 ) ( CLEAR ?auto_5716 ) ( ON-TABLE ?auto_5714 ) ( ON ?auto_5715 ?auto_5714 ) ( not ( = ?auto_5714 ?auto_5715 ) ) ( not ( = ?auto_5714 ?auto_5716 ) ) ( not ( = ?auto_5715 ?auto_5716 ) ) ( HOLDING ?auto_5717 ) ( not ( = ?auto_5714 ?auto_5717 ) ) ( not ( = ?auto_5715 ?auto_5717 ) ) ( not ( = ?auto_5716 ?auto_5717 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5717 )
      ( MAKE-2PILE ?auto_5714 ?auto_5715 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5718 - BLOCK
      ?auto_5719 - BLOCK
    )
    :vars
    (
      ?auto_5720 - BLOCK
      ?auto_5721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5720 ?auto_5719 ) ( ON-TABLE ?auto_5718 ) ( ON ?auto_5719 ?auto_5718 ) ( not ( = ?auto_5718 ?auto_5719 ) ) ( not ( = ?auto_5718 ?auto_5720 ) ) ( not ( = ?auto_5719 ?auto_5720 ) ) ( not ( = ?auto_5718 ?auto_5721 ) ) ( not ( = ?auto_5719 ?auto_5721 ) ) ( not ( = ?auto_5720 ?auto_5721 ) ) ( ON ?auto_5721 ?auto_5720 ) ( CLEAR ?auto_5721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5718 ?auto_5719 ?auto_5720 )
      ( MAKE-2PILE ?auto_5718 ?auto_5719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5724 - BLOCK
      ?auto_5725 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5725 ) ( CLEAR ?auto_5724 ) ( ON-TABLE ?auto_5724 ) ( not ( = ?auto_5724 ?auto_5725 ) ) )
    :subtasks
    ( ( !STACK ?auto_5725 ?auto_5724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5726 - BLOCK
      ?auto_5727 - BLOCK
    )
    :vars
    (
      ?auto_5728 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5726 ) ( ON-TABLE ?auto_5726 ) ( not ( = ?auto_5726 ?auto_5727 ) ) ( ON ?auto_5727 ?auto_5728 ) ( CLEAR ?auto_5727 ) ( HAND-EMPTY ) ( not ( = ?auto_5726 ?auto_5728 ) ) ( not ( = ?auto_5727 ?auto_5728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5727 ?auto_5728 )
      ( MAKE-2PILE ?auto_5726 ?auto_5727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5729 - BLOCK
      ?auto_5730 - BLOCK
    )
    :vars
    (
      ?auto_5731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5729 ?auto_5730 ) ) ( ON ?auto_5730 ?auto_5731 ) ( CLEAR ?auto_5730 ) ( not ( = ?auto_5729 ?auto_5731 ) ) ( not ( = ?auto_5730 ?auto_5731 ) ) ( HOLDING ?auto_5729 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5729 )
      ( MAKE-2PILE ?auto_5729 ?auto_5730 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5732 - BLOCK
      ?auto_5733 - BLOCK
    )
    :vars
    (
      ?auto_5734 - BLOCK
      ?auto_5735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5732 ?auto_5733 ) ) ( ON ?auto_5733 ?auto_5734 ) ( not ( = ?auto_5732 ?auto_5734 ) ) ( not ( = ?auto_5733 ?auto_5734 ) ) ( ON ?auto_5732 ?auto_5733 ) ( CLEAR ?auto_5732 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5735 ) ( ON ?auto_5734 ?auto_5735 ) ( not ( = ?auto_5735 ?auto_5734 ) ) ( not ( = ?auto_5735 ?auto_5733 ) ) ( not ( = ?auto_5735 ?auto_5732 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5735 ?auto_5734 ?auto_5733 )
      ( MAKE-2PILE ?auto_5732 ?auto_5733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5737 - BLOCK
    )
    :vars
    (
      ?auto_5738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5738 ?auto_5737 ) ( CLEAR ?auto_5738 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5737 ) ( not ( = ?auto_5737 ?auto_5738 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5738 ?auto_5737 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5739 - BLOCK
    )
    :vars
    (
      ?auto_5740 - BLOCK
      ?auto_5741 - BLOCK
      ?auto_5742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5740 ?auto_5739 ) ( CLEAR ?auto_5740 ) ( ON-TABLE ?auto_5739 ) ( not ( = ?auto_5739 ?auto_5740 ) ) ( HOLDING ?auto_5741 ) ( CLEAR ?auto_5742 ) ( not ( = ?auto_5739 ?auto_5741 ) ) ( not ( = ?auto_5739 ?auto_5742 ) ) ( not ( = ?auto_5740 ?auto_5741 ) ) ( not ( = ?auto_5740 ?auto_5742 ) ) ( not ( = ?auto_5741 ?auto_5742 ) ) )
    :subtasks
    ( ( !STACK ?auto_5741 ?auto_5742 )
      ( MAKE-1PILE ?auto_5739 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5829 - BLOCK
    )
    :vars
    (
      ?auto_5831 - BLOCK
      ?auto_5830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5831 ?auto_5829 ) ( ON-TABLE ?auto_5829 ) ( not ( = ?auto_5829 ?auto_5831 ) ) ( not ( = ?auto_5829 ?auto_5830 ) ) ( not ( = ?auto_5831 ?auto_5830 ) ) ( ON ?auto_5830 ?auto_5831 ) ( CLEAR ?auto_5830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5829 ?auto_5831 )
      ( MAKE-1PILE ?auto_5829 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5747 - BLOCK
    )
    :vars
    (
      ?auto_5750 - BLOCK
      ?auto_5748 - BLOCK
      ?auto_5749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5750 ?auto_5747 ) ( ON-TABLE ?auto_5747 ) ( not ( = ?auto_5747 ?auto_5750 ) ) ( not ( = ?auto_5747 ?auto_5748 ) ) ( not ( = ?auto_5747 ?auto_5749 ) ) ( not ( = ?auto_5750 ?auto_5748 ) ) ( not ( = ?auto_5750 ?auto_5749 ) ) ( not ( = ?auto_5748 ?auto_5749 ) ) ( ON ?auto_5748 ?auto_5750 ) ( CLEAR ?auto_5748 ) ( HOLDING ?auto_5749 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5749 )
      ( MAKE-1PILE ?auto_5747 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5751 - BLOCK
    )
    :vars
    (
      ?auto_5753 - BLOCK
      ?auto_5754 - BLOCK
      ?auto_5752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5753 ?auto_5751 ) ( ON-TABLE ?auto_5751 ) ( not ( = ?auto_5751 ?auto_5753 ) ) ( not ( = ?auto_5751 ?auto_5754 ) ) ( not ( = ?auto_5751 ?auto_5752 ) ) ( not ( = ?auto_5753 ?auto_5754 ) ) ( not ( = ?auto_5753 ?auto_5752 ) ) ( not ( = ?auto_5754 ?auto_5752 ) ) ( ON ?auto_5754 ?auto_5753 ) ( ON ?auto_5752 ?auto_5754 ) ( CLEAR ?auto_5752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5751 ?auto_5753 ?auto_5754 )
      ( MAKE-1PILE ?auto_5751 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5758 - BLOCK
      ?auto_5759 - BLOCK
      ?auto_5760 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5760 ) ( CLEAR ?auto_5759 ) ( ON-TABLE ?auto_5758 ) ( ON ?auto_5759 ?auto_5758 ) ( not ( = ?auto_5758 ?auto_5759 ) ) ( not ( = ?auto_5758 ?auto_5760 ) ) ( not ( = ?auto_5759 ?auto_5760 ) ) )
    :subtasks
    ( ( !STACK ?auto_5760 ?auto_5759 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5761 - BLOCK
      ?auto_5762 - BLOCK
      ?auto_5763 - BLOCK
    )
    :vars
    (
      ?auto_5764 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5762 ) ( ON-TABLE ?auto_5761 ) ( ON ?auto_5762 ?auto_5761 ) ( not ( = ?auto_5761 ?auto_5762 ) ) ( not ( = ?auto_5761 ?auto_5763 ) ) ( not ( = ?auto_5762 ?auto_5763 ) ) ( ON ?auto_5763 ?auto_5764 ) ( CLEAR ?auto_5763 ) ( HAND-EMPTY ) ( not ( = ?auto_5761 ?auto_5764 ) ) ( not ( = ?auto_5762 ?auto_5764 ) ) ( not ( = ?auto_5763 ?auto_5764 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5763 ?auto_5764 )
      ( MAKE-3PILE ?auto_5761 ?auto_5762 ?auto_5763 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5765 - BLOCK
      ?auto_5766 - BLOCK
      ?auto_5767 - BLOCK
    )
    :vars
    (
      ?auto_5768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5765 ) ( not ( = ?auto_5765 ?auto_5766 ) ) ( not ( = ?auto_5765 ?auto_5767 ) ) ( not ( = ?auto_5766 ?auto_5767 ) ) ( ON ?auto_5767 ?auto_5768 ) ( CLEAR ?auto_5767 ) ( not ( = ?auto_5765 ?auto_5768 ) ) ( not ( = ?auto_5766 ?auto_5768 ) ) ( not ( = ?auto_5767 ?auto_5768 ) ) ( HOLDING ?auto_5766 ) ( CLEAR ?auto_5765 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5765 ?auto_5766 )
      ( MAKE-3PILE ?auto_5765 ?auto_5766 ?auto_5767 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5769 - BLOCK
      ?auto_5770 - BLOCK
      ?auto_5771 - BLOCK
    )
    :vars
    (
      ?auto_5772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5769 ) ( not ( = ?auto_5769 ?auto_5770 ) ) ( not ( = ?auto_5769 ?auto_5771 ) ) ( not ( = ?auto_5770 ?auto_5771 ) ) ( ON ?auto_5771 ?auto_5772 ) ( not ( = ?auto_5769 ?auto_5772 ) ) ( not ( = ?auto_5770 ?auto_5772 ) ) ( not ( = ?auto_5771 ?auto_5772 ) ) ( CLEAR ?auto_5769 ) ( ON ?auto_5770 ?auto_5771 ) ( CLEAR ?auto_5770 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5772 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5772 ?auto_5771 )
      ( MAKE-3PILE ?auto_5769 ?auto_5770 ?auto_5771 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5773 - BLOCK
      ?auto_5774 - BLOCK
      ?auto_5775 - BLOCK
    )
    :vars
    (
      ?auto_5776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5773 ?auto_5774 ) ) ( not ( = ?auto_5773 ?auto_5775 ) ) ( not ( = ?auto_5774 ?auto_5775 ) ) ( ON ?auto_5775 ?auto_5776 ) ( not ( = ?auto_5773 ?auto_5776 ) ) ( not ( = ?auto_5774 ?auto_5776 ) ) ( not ( = ?auto_5775 ?auto_5776 ) ) ( ON ?auto_5774 ?auto_5775 ) ( CLEAR ?auto_5774 ) ( ON-TABLE ?auto_5776 ) ( HOLDING ?auto_5773 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5773 )
      ( MAKE-3PILE ?auto_5773 ?auto_5774 ?auto_5775 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5777 - BLOCK
      ?auto_5778 - BLOCK
      ?auto_5779 - BLOCK
    )
    :vars
    (
      ?auto_5780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5777 ?auto_5778 ) ) ( not ( = ?auto_5777 ?auto_5779 ) ) ( not ( = ?auto_5778 ?auto_5779 ) ) ( ON ?auto_5779 ?auto_5780 ) ( not ( = ?auto_5777 ?auto_5780 ) ) ( not ( = ?auto_5778 ?auto_5780 ) ) ( not ( = ?auto_5779 ?auto_5780 ) ) ( ON ?auto_5778 ?auto_5779 ) ( ON-TABLE ?auto_5780 ) ( ON ?auto_5777 ?auto_5778 ) ( CLEAR ?auto_5777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5780 ?auto_5779 ?auto_5778 )
      ( MAKE-3PILE ?auto_5777 ?auto_5778 ?auto_5779 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5807 - BLOCK
    )
    :vars
    (
      ?auto_5808 - BLOCK
      ?auto_5809 - BLOCK
      ?auto_5810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5807 ?auto_5808 ) ( CLEAR ?auto_5807 ) ( not ( = ?auto_5807 ?auto_5808 ) ) ( HOLDING ?auto_5809 ) ( CLEAR ?auto_5810 ) ( not ( = ?auto_5807 ?auto_5809 ) ) ( not ( = ?auto_5807 ?auto_5810 ) ) ( not ( = ?auto_5808 ?auto_5809 ) ) ( not ( = ?auto_5808 ?auto_5810 ) ) ( not ( = ?auto_5809 ?auto_5810 ) ) )
    :subtasks
    ( ( !STACK ?auto_5809 ?auto_5810 )
      ( MAKE-1PILE ?auto_5807 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5811 - BLOCK
    )
    :vars
    (
      ?auto_5814 - BLOCK
      ?auto_5813 - BLOCK
      ?auto_5812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5811 ?auto_5814 ) ( not ( = ?auto_5811 ?auto_5814 ) ) ( CLEAR ?auto_5813 ) ( not ( = ?auto_5811 ?auto_5812 ) ) ( not ( = ?auto_5811 ?auto_5813 ) ) ( not ( = ?auto_5814 ?auto_5812 ) ) ( not ( = ?auto_5814 ?auto_5813 ) ) ( not ( = ?auto_5812 ?auto_5813 ) ) ( ON ?auto_5812 ?auto_5811 ) ( CLEAR ?auto_5812 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5814 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5814 ?auto_5811 )
      ( MAKE-1PILE ?auto_5811 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5815 - BLOCK
    )
    :vars
    (
      ?auto_5816 - BLOCK
      ?auto_5817 - BLOCK
      ?auto_5818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5815 ?auto_5816 ) ( not ( = ?auto_5815 ?auto_5816 ) ) ( not ( = ?auto_5815 ?auto_5817 ) ) ( not ( = ?auto_5815 ?auto_5818 ) ) ( not ( = ?auto_5816 ?auto_5817 ) ) ( not ( = ?auto_5816 ?auto_5818 ) ) ( not ( = ?auto_5817 ?auto_5818 ) ) ( ON ?auto_5817 ?auto_5815 ) ( CLEAR ?auto_5817 ) ( ON-TABLE ?auto_5816 ) ( HOLDING ?auto_5818 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5818 )
      ( MAKE-1PILE ?auto_5815 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5819 - BLOCK
    )
    :vars
    (
      ?auto_5822 - BLOCK
      ?auto_5820 - BLOCK
      ?auto_5821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5819 ?auto_5822 ) ( not ( = ?auto_5819 ?auto_5822 ) ) ( not ( = ?auto_5819 ?auto_5820 ) ) ( not ( = ?auto_5819 ?auto_5821 ) ) ( not ( = ?auto_5822 ?auto_5820 ) ) ( not ( = ?auto_5822 ?auto_5821 ) ) ( not ( = ?auto_5820 ?auto_5821 ) ) ( ON ?auto_5820 ?auto_5819 ) ( ON-TABLE ?auto_5822 ) ( ON ?auto_5821 ?auto_5820 ) ( CLEAR ?auto_5821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5822 ?auto_5819 ?auto_5820 )
      ( MAKE-1PILE ?auto_5819 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5826 - BLOCK
    )
    :vars
    (
      ?auto_5827 - BLOCK
      ?auto_5828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5827 ?auto_5826 ) ( CLEAR ?auto_5827 ) ( ON-TABLE ?auto_5826 ) ( not ( = ?auto_5826 ?auto_5827 ) ) ( HOLDING ?auto_5828 ) ( not ( = ?auto_5826 ?auto_5828 ) ) ( not ( = ?auto_5827 ?auto_5828 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5828 )
      ( MAKE-1PILE ?auto_5826 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5851 - BLOCK
      ?auto_5852 - BLOCK
    )
    :vars
    (
      ?auto_5853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5851 ?auto_5852 ) ) ( ON ?auto_5852 ?auto_5853 ) ( not ( = ?auto_5851 ?auto_5853 ) ) ( not ( = ?auto_5852 ?auto_5853 ) ) ( ON ?auto_5851 ?auto_5852 ) ( CLEAR ?auto_5851 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5853 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5853 ?auto_5852 )
      ( MAKE-2PILE ?auto_5851 ?auto_5852 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5856 - BLOCK
      ?auto_5857 - BLOCK
    )
    :vars
    (
      ?auto_5858 - BLOCK
      ?auto_5859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5856 ?auto_5857 ) ) ( ON ?auto_5857 ?auto_5858 ) ( CLEAR ?auto_5857 ) ( not ( = ?auto_5856 ?auto_5858 ) ) ( not ( = ?auto_5857 ?auto_5858 ) ) ( ON ?auto_5856 ?auto_5859 ) ( CLEAR ?auto_5856 ) ( HAND-EMPTY ) ( not ( = ?auto_5856 ?auto_5859 ) ) ( not ( = ?auto_5857 ?auto_5859 ) ) ( not ( = ?auto_5858 ?auto_5859 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5856 ?auto_5859 )
      ( MAKE-2PILE ?auto_5856 ?auto_5857 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5860 - BLOCK
      ?auto_5861 - BLOCK
    )
    :vars
    (
      ?auto_5863 - BLOCK
      ?auto_5862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5860 ?auto_5861 ) ) ( not ( = ?auto_5860 ?auto_5863 ) ) ( not ( = ?auto_5861 ?auto_5863 ) ) ( ON ?auto_5860 ?auto_5862 ) ( CLEAR ?auto_5860 ) ( not ( = ?auto_5860 ?auto_5862 ) ) ( not ( = ?auto_5861 ?auto_5862 ) ) ( not ( = ?auto_5863 ?auto_5862 ) ) ( HOLDING ?auto_5861 ) ( CLEAR ?auto_5863 ) ( ON-TABLE ?auto_5863 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5863 ?auto_5861 )
      ( MAKE-2PILE ?auto_5860 ?auto_5861 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5864 - BLOCK
      ?auto_5865 - BLOCK
    )
    :vars
    (
      ?auto_5866 - BLOCK
      ?auto_5867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5864 ?auto_5865 ) ) ( not ( = ?auto_5864 ?auto_5866 ) ) ( not ( = ?auto_5865 ?auto_5866 ) ) ( ON ?auto_5864 ?auto_5867 ) ( not ( = ?auto_5864 ?auto_5867 ) ) ( not ( = ?auto_5865 ?auto_5867 ) ) ( not ( = ?auto_5866 ?auto_5867 ) ) ( CLEAR ?auto_5866 ) ( ON-TABLE ?auto_5866 ) ( ON ?auto_5865 ?auto_5864 ) ( CLEAR ?auto_5865 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5867 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5867 ?auto_5864 )
      ( MAKE-2PILE ?auto_5864 ?auto_5865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5868 - BLOCK
      ?auto_5869 - BLOCK
    )
    :vars
    (
      ?auto_5871 - BLOCK
      ?auto_5870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5868 ?auto_5869 ) ) ( not ( = ?auto_5868 ?auto_5871 ) ) ( not ( = ?auto_5869 ?auto_5871 ) ) ( ON ?auto_5868 ?auto_5870 ) ( not ( = ?auto_5868 ?auto_5870 ) ) ( not ( = ?auto_5869 ?auto_5870 ) ) ( not ( = ?auto_5871 ?auto_5870 ) ) ( ON ?auto_5869 ?auto_5868 ) ( CLEAR ?auto_5869 ) ( ON-TABLE ?auto_5870 ) ( HOLDING ?auto_5871 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5871 )
      ( MAKE-2PILE ?auto_5868 ?auto_5869 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5872 - BLOCK
      ?auto_5873 - BLOCK
    )
    :vars
    (
      ?auto_5875 - BLOCK
      ?auto_5874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5872 ?auto_5873 ) ) ( not ( = ?auto_5872 ?auto_5875 ) ) ( not ( = ?auto_5873 ?auto_5875 ) ) ( ON ?auto_5872 ?auto_5874 ) ( not ( = ?auto_5872 ?auto_5874 ) ) ( not ( = ?auto_5873 ?auto_5874 ) ) ( not ( = ?auto_5875 ?auto_5874 ) ) ( ON ?auto_5873 ?auto_5872 ) ( ON-TABLE ?auto_5874 ) ( ON ?auto_5875 ?auto_5873 ) ( CLEAR ?auto_5875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5874 ?auto_5872 ?auto_5873 )
      ( MAKE-2PILE ?auto_5872 ?auto_5873 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5882 - BLOCK
      ?auto_5883 - BLOCK
      ?auto_5884 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5883 ) ( ON-TABLE ?auto_5882 ) ( ON ?auto_5883 ?auto_5882 ) ( not ( = ?auto_5882 ?auto_5883 ) ) ( not ( = ?auto_5882 ?auto_5884 ) ) ( not ( = ?auto_5883 ?auto_5884 ) ) ( ON-TABLE ?auto_5884 ) ( CLEAR ?auto_5884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_5884 )
      ( MAKE-3PILE ?auto_5882 ?auto_5883 ?auto_5884 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5885 - BLOCK
      ?auto_5886 - BLOCK
      ?auto_5887 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5885 ) ( not ( = ?auto_5885 ?auto_5886 ) ) ( not ( = ?auto_5885 ?auto_5887 ) ) ( not ( = ?auto_5886 ?auto_5887 ) ) ( ON-TABLE ?auto_5887 ) ( CLEAR ?auto_5887 ) ( HOLDING ?auto_5886 ) ( CLEAR ?auto_5885 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5885 ?auto_5886 )
      ( MAKE-3PILE ?auto_5885 ?auto_5886 ?auto_5887 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5888 - BLOCK
      ?auto_5889 - BLOCK
      ?auto_5890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5888 ) ( not ( = ?auto_5888 ?auto_5889 ) ) ( not ( = ?auto_5888 ?auto_5890 ) ) ( not ( = ?auto_5889 ?auto_5890 ) ) ( ON-TABLE ?auto_5890 ) ( CLEAR ?auto_5888 ) ( ON ?auto_5889 ?auto_5890 ) ( CLEAR ?auto_5889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5890 )
      ( MAKE-3PILE ?auto_5888 ?auto_5889 ?auto_5890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5891 - BLOCK
      ?auto_5892 - BLOCK
      ?auto_5893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5891 ?auto_5892 ) ) ( not ( = ?auto_5891 ?auto_5893 ) ) ( not ( = ?auto_5892 ?auto_5893 ) ) ( ON-TABLE ?auto_5893 ) ( ON ?auto_5892 ?auto_5893 ) ( CLEAR ?auto_5892 ) ( HOLDING ?auto_5891 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5891 )
      ( MAKE-3PILE ?auto_5891 ?auto_5892 ?auto_5893 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5894 - BLOCK
      ?auto_5895 - BLOCK
      ?auto_5896 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5894 ?auto_5895 ) ) ( not ( = ?auto_5894 ?auto_5896 ) ) ( not ( = ?auto_5895 ?auto_5896 ) ) ( ON-TABLE ?auto_5896 ) ( ON ?auto_5895 ?auto_5896 ) ( ON ?auto_5894 ?auto_5895 ) ( CLEAR ?auto_5894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5896 ?auto_5895 )
      ( MAKE-3PILE ?auto_5894 ?auto_5895 ?auto_5896 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5900 - BLOCK
      ?auto_5901 - BLOCK
      ?auto_5902 - BLOCK
    )
    :vars
    (
      ?auto_5903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5900 ?auto_5901 ) ) ( not ( = ?auto_5900 ?auto_5902 ) ) ( not ( = ?auto_5901 ?auto_5902 ) ) ( ON-TABLE ?auto_5902 ) ( ON ?auto_5901 ?auto_5902 ) ( CLEAR ?auto_5901 ) ( ON ?auto_5900 ?auto_5903 ) ( CLEAR ?auto_5900 ) ( HAND-EMPTY ) ( not ( = ?auto_5900 ?auto_5903 ) ) ( not ( = ?auto_5901 ?auto_5903 ) ) ( not ( = ?auto_5902 ?auto_5903 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5900 ?auto_5903 )
      ( MAKE-3PILE ?auto_5900 ?auto_5901 ?auto_5902 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5904 - BLOCK
      ?auto_5905 - BLOCK
      ?auto_5906 - BLOCK
    )
    :vars
    (
      ?auto_5907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5904 ?auto_5905 ) ) ( not ( = ?auto_5904 ?auto_5906 ) ) ( not ( = ?auto_5905 ?auto_5906 ) ) ( ON-TABLE ?auto_5906 ) ( ON ?auto_5904 ?auto_5907 ) ( CLEAR ?auto_5904 ) ( not ( = ?auto_5904 ?auto_5907 ) ) ( not ( = ?auto_5905 ?auto_5907 ) ) ( not ( = ?auto_5906 ?auto_5907 ) ) ( HOLDING ?auto_5905 ) ( CLEAR ?auto_5906 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5906 ?auto_5905 )
      ( MAKE-3PILE ?auto_5904 ?auto_5905 ?auto_5906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5908 - BLOCK
      ?auto_5909 - BLOCK
      ?auto_5910 - BLOCK
    )
    :vars
    (
      ?auto_5911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5908 ?auto_5909 ) ) ( not ( = ?auto_5908 ?auto_5910 ) ) ( not ( = ?auto_5909 ?auto_5910 ) ) ( ON-TABLE ?auto_5910 ) ( ON ?auto_5908 ?auto_5911 ) ( not ( = ?auto_5908 ?auto_5911 ) ) ( not ( = ?auto_5909 ?auto_5911 ) ) ( not ( = ?auto_5910 ?auto_5911 ) ) ( CLEAR ?auto_5910 ) ( ON ?auto_5909 ?auto_5908 ) ( CLEAR ?auto_5909 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5911 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5911 ?auto_5908 )
      ( MAKE-3PILE ?auto_5908 ?auto_5909 ?auto_5910 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5912 - BLOCK
      ?auto_5913 - BLOCK
      ?auto_5914 - BLOCK
    )
    :vars
    (
      ?auto_5915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5912 ?auto_5913 ) ) ( not ( = ?auto_5912 ?auto_5914 ) ) ( not ( = ?auto_5913 ?auto_5914 ) ) ( ON ?auto_5912 ?auto_5915 ) ( not ( = ?auto_5912 ?auto_5915 ) ) ( not ( = ?auto_5913 ?auto_5915 ) ) ( not ( = ?auto_5914 ?auto_5915 ) ) ( ON ?auto_5913 ?auto_5912 ) ( CLEAR ?auto_5913 ) ( ON-TABLE ?auto_5915 ) ( HOLDING ?auto_5914 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5914 )
      ( MAKE-3PILE ?auto_5912 ?auto_5913 ?auto_5914 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5916 - BLOCK
      ?auto_5917 - BLOCK
      ?auto_5918 - BLOCK
    )
    :vars
    (
      ?auto_5919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5916 ?auto_5917 ) ) ( not ( = ?auto_5916 ?auto_5918 ) ) ( not ( = ?auto_5917 ?auto_5918 ) ) ( ON ?auto_5916 ?auto_5919 ) ( not ( = ?auto_5916 ?auto_5919 ) ) ( not ( = ?auto_5917 ?auto_5919 ) ) ( not ( = ?auto_5918 ?auto_5919 ) ) ( ON ?auto_5917 ?auto_5916 ) ( ON-TABLE ?auto_5919 ) ( ON ?auto_5918 ?auto_5917 ) ( CLEAR ?auto_5918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5919 ?auto_5916 ?auto_5917 )
      ( MAKE-3PILE ?auto_5916 ?auto_5917 ?auto_5918 ) )
  )

)

