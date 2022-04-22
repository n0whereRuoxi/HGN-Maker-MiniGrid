( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b298 - block
    b757 - block
    b555 - block
    b179 - block
    b594 - block
    b598 - block
    b590 - block
    b175 - block
    b252 - block
    b801 - block
    b245 - block
    b593 - block
    b772 - block
    b980 - block
    b725 - block
    b797 - block
    b814 - block
    b695 - block
    b130 - block
    b576 - block
    b840 - block
    b516 - block
    b907 - block
    b631 - block
    b240 - block
    b441 - block
    b20 - block
    b761 - block
    b302 - block
    b678 - block
    b574 - block
    b365 - block
    b260 - block
    b851 - block
    b451 - block
    b839 - block
    b500 - block
    b657 - block
    b419 - block
    b856 - block
    b526 - block
    b832 - block
    b424 - block
    b893 - block
    b187 - block
    b675 - block
    b51 - block
    b899 - block
    b2 - block
    b850 - block
    b36 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b298 )
    ( on b757 b298 )
    ( on b555 b757 )
    ( on b179 b555 )
    ( on b594 b179 )
    ( on b598 b594 )
    ( on b590 b598 )
    ( on b175 b590 )
    ( on b252 b175 )
    ( on b801 b252 )
    ( on b245 b801 )
    ( on b593 b245 )
    ( on b772 b593 )
    ( on b980 b772 )
    ( on b725 b980 )
    ( on b797 b725 )
    ( on b814 b797 )
    ( on b695 b814 )
    ( on b130 b695 )
    ( on b576 b130 )
    ( on b840 b576 )
    ( on b516 b840 )
    ( on b907 b516 )
    ( on b631 b907 )
    ( on b240 b631 )
    ( on b441 b240 )
    ( on b20 b441 )
    ( on b761 b20 )
    ( on b302 b761 )
    ( on b678 b302 )
    ( on b574 b678 )
    ( on b365 b574 )
    ( on b260 b365 )
    ( on b851 b260 )
    ( on b451 b851 )
    ( on b839 b451 )
    ( on b500 b839 )
    ( on b657 b500 )
    ( on b419 b657 )
    ( on b856 b419 )
    ( on b526 b856 )
    ( on b832 b526 )
    ( on b424 b832 )
    ( on b893 b424 )
    ( on b187 b893 )
    ( on b675 b187 )
    ( on b51 b675 )
    ( on b899 b51 )
    ( on b2 b899 )
    ( on b850 b2 )
    ( on b36 b850 )
    ( clear b36 )
  )
  ( :goal
    ( and
      ( clear b298 )
    )
  )
)
